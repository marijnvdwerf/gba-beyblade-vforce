#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.10"
# dependencies = [
#   "tree-sitter==0.26.0",
#   "tree-sitter-c==0.24.2",
# ]
# ///
"""Print translation-unit decompilation progress for the GBA project."""

from __future__ import annotations

import argparse
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Iterator, Iterable

import tree_sitter_c
from tree_sitter import Language, Parser

ROOT = Path(__file__).resolve().parents[1]
SRC_DIR = ROOT / "src"
C_LANGUAGE = Language(tree_sitter_c.language())


@dataclass
class TranslationUnit:
    path: Path
    asm_paths: list[str]
    c_functions: int

    @property
    def asm_count(self) -> int:
        return len(self.asm_paths)

    @property
    def total_functions(self) -> int:
        return self.asm_count + self.c_functions

    @property
    def percent(self) -> int:
        if self.total_functions == 0:
            return 100
        return round(self.c_functions * 100 / self.total_functions)

    @property
    def asm_lines(self) -> int:
        total = 0
        for asm_path in self.asm_paths:
            path = ROOT / asm_path
            try:
                total += len(path.read_text(encoding="utf-8", errors="replace").splitlines())
            except OSError:
                pass
        return total


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


def count_c_functions(text: str) -> int:
    source = text.encode("utf-8")
    tree = Parser(C_LANGUAGE).parse(source)
    return sum(node.type == "function_definition" for node in iter_active_nodes(tree.root_node, source))


def read_translation_units() -> list[TranslationUnit]:
    include_re = re.compile(r'\bINCLUDE_ASM\s*\(\s*"([^"]+)"\s*\)')
    units = []
    for path in sorted(SRC_DIR.glob("*.c")):
        text = path.read_text(encoding="utf-8", errors="replace")
        asm_paths = [match.group(1) for match in include_re.finditer(text)]
        units.append(TranslationUnit(path, asm_paths, count_c_functions(text)))
    return units


def parse_args(argv: Iterable[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Print decompilation progress for each C translation unit."
    )
    parser.add_argument("--all", action="store_true", help="include pure data/empty source files")
    parser.add_argument("--asm-lines", action="store_true", help="show source lines in remaining asm dumps")
    parser.add_argument("--color", action="store_true", help="force ANSI color output")
    return parser.parse_args(list(argv))


def format_unit(unit: TranslationUnit, asm_lines: bool) -> str:
    name = str(unit.path.relative_to(ROOT))
    done = unit.asm_count == 0
    marker = "✅ " if done else "  "
    if asm_lines:
        return f"{marker}{name:<24} {unit.asm_count:>3} asm  {unit.asm_lines:>6} lines  {unit.c_functions:>3} C   ({unit.percent:>3}%)"
    return f"{marker}{name:<24} {unit.asm_count:>3} asm  {unit.c_functions:>3} C   ({unit.percent:>3}%)"


def main(argv: Iterable[str] | None = None) -> int:
    args = parse_args(sys.argv[1:] if argv is None else argv)
    units = read_translation_units()
    if not args.all:
        units = [unit for unit in units if unit.asm_count or unit.c_functions]
    units.sort(key=lambda unit: (unit.asm_count == 0, -unit.asm_count, unit.path.name))

    use_color = args.color or sys.stdout.isatty()
    green = "\033[32m"
    reset = "\033[0m"
    try:
        for unit in units:
            line = format_unit(unit, args.asm_lines)
            if use_color and unit.asm_count == 0:
                line = f"{green}{line}{reset}"
            print(line)

        done = sum(unit.asm_count == 0 for unit in units)
        asm_remaining = sum(unit.asm_count for unit in units)
        c_functions = sum(unit.c_functions for unit in units)
        total_functions = asm_remaining + c_functions
        percent = round(c_functions * 100 / total_functions) if total_functions else 100
        print(
            f"Totals: {done} TUs done / {len(units)}, {asm_remaining} asm remaining, "
            f"{c_functions} C functions, {percent}%"
        )
    except BrokenPipeError:
        return 0
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
