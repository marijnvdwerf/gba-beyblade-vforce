#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.10"
# dependencies = [
#   "tree-sitter==0.26.0",
#   "tree-sitter-c==0.24.2",
# ]
# ///
"""Print a source-oriented call graph for the GBA decompilation."""

from __future__ import annotations

import argparse
import re
import sys
from collections import OrderedDict
from dataclasses import dataclass, field
from pathlib import Path
from typing import Iterable, Iterator

import tree_sitter_c
from tree_sitter import Language, Parser

ROOT = Path(__file__).resolve().parents[1]
SRC_DIR = ROOT / "src"
C_LANGUAGE = Language(tree_sitter_c.language())

# A safety valve for malformed or unexpectedly recursive input.  Repetition is
# normally collapsed before this is reached, so ordinary trees do not truncate.
MAX_RENDER_DEPTH = 64

CONTROL_WORDS = {
    "if",
    "else",
    "for",
    "while",
    "switch",
    "case",
    "do",
    "sizeof",
    "return",
    "typeof",
    "defined",
    "__attribute__",
    "asm",
    "__asm",
    "__asm__",
    "__volatile__",
}


@dataclass
class Function:
    name: str
    file: str
    kind: str  # "c" or "unknown"
    calls: list[str] = field(default_factory=list)

    @property
    def marker(self) -> str:
        return "🟢" if self.kind == "c" else "🔴"


# Keep insertion order stable while indexing C definitions.
Functions = OrderedDict[str, Function]


def relpath(path: Path) -> str:
    try:
        return str(path.relative_to(ROOT))
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
        # The first non-zero/unknown elif is the conservatively active branch.
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


def function_name(node, source: bytes) -> str | None:
    """Find the identifier at the end of a possibly wrapped declarator."""
    if node is None:
        return None
    if node.type == "identifier":
        return node_text(source, node)
    declarator = node.child_by_field_name("declarator")
    if declarator is not None:
        name = function_name(declarator, source)
        if name is not None:
            return name
    for child in node.named_children:
        name = function_name(child, source)
        if name is not None:
            return name
    return None


def extract_c_calls(body, source: bytes, macros: set[str]) -> list[str]:
    calls: list[tuple[int, str]] = []
    for node in iter_active_nodes(body, source):
        if node.type != "call_expression":
            continue
        function = node.child_by_field_name("function")
        if function is None or function.type != "identifier":
            continue
        name = node_text(source, function)
        if name in CONTROL_WORDS or name in macros:
            continue
        calls.append((node.start_byte, name))
    return [name for _, name in sorted(calls)]


def add_function(functions: Functions, function: Function) -> None:
    existing = functions.get(function.name)
    if existing is None or (existing.kind != "c" and function.kind == "c"):
        functions[function.name] = function


def macro_names() -> set[str]:
    macro_files = list(SRC_DIR.rglob("*.c")) + list(SRC_DIR.rglob("*.h")) + list((ROOT / "lib").rglob("*.h"))
    macros: set[str] = set()
    for path in macro_files:
        text = path.read_text(encoding="utf-8", errors="replace")
        macros.update(re.findall(r"(?m)^\s*#\s*define\s+([A-Za-z_]\w*)\s*\(", text))
    return macros


def index_c_sources(functions: Functions) -> None:
    macros = macro_names()
    parser = Parser(C_LANGUAGE)
    for path in sorted(SRC_DIR.rglob("*.c")):
        source = path.read_bytes()
        tree = parser.parse(source)
        for node in iter_active_nodes(tree.root_node, source):
            if node.type != "function_definition":
                continue
            name = function_name(node.child_by_field_name("declarator"), source)
            if name is None:
                continue
            body = node.child_by_field_name("body")
            add_function(
                functions,
                Function(
                    name=name,
                    file=relpath(path),
                    kind="c",
                    calls=extract_c_calls(body, source, macros) if body is not None else [],
                ),
            )


def make_unknown(functions: Functions, name: str) -> None:
    if name and name not in functions:
        functions[name] = Function(name=name, file="", kind="unknown")


def resolve_name(functions: Functions, name: str) -> str:
    if name in functions:
        return name
    # Prefer an unambiguous case-insensitive match for C declarations.
    matches = [candidate for candidate in functions if candidate.lower() == name.lower()]
    if len(matches) == 1:
        return matches[0]
    return name


def resolve_all_edges(functions: Functions) -> None:
    for function in list(functions.values()):
        resolved: list[str] = []
        for target in function.calls:
            target = resolve_name(functions, target)
            make_unknown(functions, target)
            if target not in resolved:
                resolved.append(target)
        function.calls = resolved


def build_index() -> Functions:
    functions: Functions = OrderedDict()
    index_c_sources(functions)
    resolve_all_edges(functions)
    return functions


def resolve_root(functions: Functions, requested: str) -> str:
    if requested in functions:
        return requested
    matches = [name for name in functions if name.lower() == requested.lower()]
    if len(matches) == 1:
        return matches[0]
    # Permit the conventional trailing () used when copying a symbol from a
    # debugger or decompiler listing.
    stripped = requested.removesuffix("()")
    if stripped in functions:
        return stripped
    if len(matches) > 1:
        raise SystemExit(f"ambiguous root symbol {requested!r}: {', '.join(matches)}")
    # A non-C/library/unresolved root is still useful as a red leaf.  Only C
    # definitions are indexed, so there is no body to expand in that case.
    return stripped


def render(functions: Functions, root: str) -> str:
    lines: list[str] = []
    expanded: set[str] = set()
    active: set[str] = set()

    def walk(name: str, prefix: str, is_last: bool, depth: int, is_root: bool) -> None:
        function = functions.get(name)
        if function is None:
            function = Function(name=name, file="", kind="unknown")
        suffix = ""
        if depth >= MAX_RENDER_DEPTH:
            suffix = " … (depth limit)"
        elif name in active:
            suffix = " (cycle)"
        elif name in expanded and function.kind == "c":
            suffix = " (see above)"

        branch = "" if is_root else ("└─ " if is_last else "├─ ")
        location = f" [{function.file}]" if function.file else ""
        lines.append(f"{prefix}{branch}{function.marker} {name}{location}{suffix}")
        if suffix:
            return

        expanded.add(name)
        active.add(name)
        child_prefix = prefix if is_root else prefix + ("   " if is_last else "│  ")
        children = function.calls
        for index, child in enumerate(children):
            walk(child, child_prefix, index == len(children) - 1, depth + 1, False)
        active.remove(name)

    walk(root, "", True, 0, True)
    return "\n".join(lines)


def parse_args(argv: Iterable[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Print the GBA C-source call graph rooted at a function."
    )
    parser.add_argument("root", nargs="?", default="main", help="root symbol (default: main)")
    return parser.parse_args(list(argv))


def main(argv: Iterable[str] | None = None) -> int:
    args = parse_args(sys.argv[1:] if argv is None else argv)
    functions = build_index()
    root = resolve_root(functions, args.root)
    try:
        print(render(functions, root))
    except BrokenPipeError:
        # Be friendly to ordinary Unix pipelines such as `| head`.
        return 0
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
