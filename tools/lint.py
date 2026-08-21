#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.10"
# dependencies = [
#   "tree-sitter==0.26.0",
#   "tree-sitter-c==0.24.2",
#   "mapfile_parser",
# ]
# ///
"""Run extensible lint checks on C translation units."""

from __future__ import annotations

import argparse
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Callable, Iterable, Iterator

import tree_sitter_c
from mapfile_parser import MapFile
from tree_sitter import Language, Parser

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_MAP = ROOT / "build" / "rom.map"
C_LANGUAGE = Language(tree_sitter_c.language())


@dataclass(frozen=True)
class Declaration:
    path: Path
    line: int
    name: str


@dataclass(frozen=True)
class Finding:
    declaration: Declaration
    defining_file: str


@dataclass(frozen=True)
class Unresolved:
    declaration: Declaration
    reason: str


def relpath(path: Path) -> str:
    """Return a project-relative path when possible."""
    try:
        return str(path.resolve().relative_to(ROOT))
    except ValueError:
        return str(path)


def node_text(source: bytes, node) -> str:
    return source[node.start_byte : node.end_byte].decode("utf-8", errors="replace")


def is_literal_zero(source: bytes, node) -> bool:
    return node is not None and node_text(source, node).strip() == "0"


def same_node(left, right) -> bool:
    return right is not None and left.start_byte == right.start_byte and left.end_byte == right.end_byte


def iter_active_preprocessor_branch(node, source: bytes) -> Iterator:
    """Yield nodes from the selected branch of a definitely-false #if 0."""
    if node.type == "preproc_else":
        for child in node.named_children:
            yield from iter_active_nodes(child, source)
        return
    if node.type == "preproc_elif":
        condition = node.child_by_field_name("condition")
        alternative = node.child_by_field_name("alternative")
        if is_literal_zero(source, condition):
            if alternative is not None:
                yield from iter_active_preprocessor_branch(alternative, source)
            return
        for child in node.named_children:
            if same_node(child, condition) or same_node(child, alternative):
                continue
            yield from iter_active_nodes(child, source)
        return
    yield from iter_active_nodes(node, source)


def iter_active_nodes(node, source: bytes) -> Iterator:
    """Walk syntax nodes, omitting the definitely-disabled side of #if 0."""
    if node.type == "preproc_if":
        condition = node.child_by_field_name("condition")
        alternative = node.child_by_field_name("alternative")
        if is_literal_zero(source, condition):
            if alternative is not None:
                yield from iter_active_preprocessor_branch(alternative, source)
            return
    yield node
    for child in node.named_children:
        yield from iter_active_nodes(child, source)


def is_file_scope(node) -> bool:
    """Return whether a declaration is directly under the translation unit.

    Preprocessor nodes are transparent for this purpose.  Other ancestors,
    such as a compound statement or a parameter declaration, make it local.
    """
    parent = node.parent
    while parent is not None:
        if parent.type == "translation_unit":
            return True
        if parent.type.startswith("preproc_"):
            parent = parent.parent
            continue
        return False
    return False


def direct_function_name(node, source: bytes) -> str | None:
    """Get a function name when this declarator declares a function.

    A pointer declarator immediately below a function declarator means the
    declaration is for a function pointer variable, not for a function.  The
    inner function declarator in a function returning a function pointer is
    still visited separately and is accepted.
    """
    declarator = node.child_by_field_name("declarator")
    while declarator is not None and declarator.type == "parenthesized_declarator":
        declarator = declarator.child_by_field_name("declarator")
    if declarator is None or declarator.type != "identifier":
        return None
    return node_text(source, declarator)


def iter_declarator_function_nodes(node) -> Iterator:
    """Yield function declarators in a declaration, excluding parameters."""
    if node.type == "parameter_list":
        return
    if node.type == "function_declarator":
        yield node
    for child in node.named_children:
        yield from iter_declarator_function_nodes(child)


def iter_declarations(path: Path) -> Iterator[Declaration]:
    source = path.read_bytes()
    tree = Parser(C_LANGUAGE).parse(source)
    for node in iter_active_nodes(tree.root_node, source):
        if node.type != "declaration" or not is_file_scope(node):
            continue
        seen: set[str] = set()
        for function_node in iter_declarator_function_nodes(node):
            name = direct_function_name(function_node, source)
            if name is None or name in seen:
                continue
            seen.add(name)
            yield Declaration(path=path, line=function_node.start_point.row + 1, name=name)


def object_to_c_translation_unit(filepath: Path) -> str | None:
    """Convert a map object path such as src/sprite.c.o to src/sprite.c."""
    object_path = filepath.as_posix()
    if object_path.startswith("./"):
        object_path = object_path[2:]
    if not object_path.startswith("src/") or not object_path.endswith(".c.o"):
        return None
    return object_path[:-2]


def defining_translation_unit(map_file: MapFile, name: str) -> tuple[str | None, str | None]:
    info = map_file.findSymbolByName(name)
    if info is None:
        return None, "not found in map"
    translation_unit = object_to_c_translation_unit(info.section.filepath)
    if translation_unit is None:
        return None, f"defined in {info.section.filepath.as_posix()}"
    return translation_unit, None


def check_foreign_declarations(path: Path, map_file: MapFile) -> tuple[list[Finding], list[Unresolved]]:
    """Find prototypes whose definitions belong to another C translation unit."""
    findings: list[Finding] = []
    unresolved: list[Unresolved] = []
    current_file = relpath(path)
    for declaration in iter_declarations(path):
        defining_file, reason = defining_translation_unit(map_file, declaration.name)
        if defining_file is None:
            unresolved.append(Unresolved(declaration, reason or "unresolved"))
        elif defining_file != current_file:
            findings.append(Finding(declaration, defining_file))
    return findings, unresolved


Check = Callable[[Path, MapFile], tuple[list[Finding], list[Unresolved]]]
CHECKS: list[Check] = [check_foreign_declarations]


def parse_args(argv: Iterable[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Run registered lint checks on C translation units.")
    parser.add_argument("files", nargs="+", type=Path, help="C files to lint")
    parser.add_argument("--map", dest="map_path", type=Path, default=DEFAULT_MAP, help="linker map path")
    parser.add_argument("--verbose", action="store_true", help="show unresolved declarations")
    return parser.parse_args(list(argv))


def print_unresolved(unresolved: list[Unresolved]) -> None:
    if not unresolved:
        return
    print("Unresolved declarations:")
    for item in unresolved:
        declaration = item.declaration
        print(f"  {relpath(declaration.path)}:{declaration.line}: `{declaration.name}` ({item.reason})")


def main(argv: Iterable[str] | None = None) -> int:
    args = parse_args(sys.argv[1:] if argv is None else argv)
    map_path = args.map_path
    if not map_path.is_absolute():
        map_path = Path.cwd() / map_path
    if not map_path.is_file():
        print(f"error: linker map not found: {map_path}", file=sys.stderr)
        return 2

    map_file = MapFile.newFromMapFile(map_path)
    findings: list[Finding] = []
    unresolved: list[Unresolved] = []
    for path in args.files:
        for check in CHECKS:
            findings_for_file, unresolved_for_file = check(path, map_file)
            findings.extend(findings_for_file)
            unresolved.extend(unresolved_for_file)

    findings.sort(key=lambda item: (relpath(item.declaration.path), item.declaration.line, item.declaration.name))
    unresolved.sort(key=lambda item: (relpath(item.declaration.path), item.declaration.line, item.declaration.name))
    try:
        for finding in findings:
            declaration = finding.declaration
            print(
                f"{relpath(declaration.path)}:{declaration.line}: "
                f"extern `{declaration.name}` is defined in {finding.defining_file}"
            )
        if args.verbose:
            print_unresolved(unresolved)
    except BrokenPipeError:
        return 0
    return 1 if findings else 0


if __name__ == "__main__":
    raise SystemExit(main())
