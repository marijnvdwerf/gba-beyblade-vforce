#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.10"
# dependencies = []
# ///
"""Print translation-unit decompilation progress for the GBA project."""

from __future__ import annotations

import argparse
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable

ROOT = Path(__file__).resolve().parents[1]
SRC_DIR = ROOT / "src"

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
}


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


def mask_comments_and_strings(text: str) -> str:
    """Replace comments/string contents with spaces, preserving newlines."""
    out = list(text)
    i = 0
    state = "code"
    quote = ""
    while i < len(text):
        c = text[i]
        nxt = text[i + 1] if i + 1 < len(text) else ""
        if state == "code":
            if c == "/" and nxt == "/":
                out[i] = out[i + 1] = " "
                i += 2
                state = "line"
                continue
            if c == "/" and nxt == "*":
                out[i] = out[i + 1] = " "
                i += 2
                state = "block"
                continue
            if c in ('"', "'"):
                quote = c
                out[i] = " "
                i += 1
                state = "string"
                continue
            i += 1
            continue
        if state == "line":
            if c == "\n":
                state = "code"
            else:
                out[i] = " "
            i += 1
            continue
        if state == "block":
            if c == "*" and nxt == "/":
                out[i] = out[i + 1] = " "
                i += 2
                state = "code"
            else:
                if c != "\n":
                    out[i] = " "
                i += 1
            continue
        # string or character literal
        if c == "\\":
            out[i] = " "
            if i + 1 < len(text):
                if text[i + 1] != "\n":
                    out[i + 1] = " "
                i += 2
            else:
                i += 1
            continue
        if c == quote:
            out[i] = " "
            i += 1
            state = "code"
        else:
            if c != "\n":
                out[i] = " "
            i += 1
    return "".join(out)


def mask_if_zero_regions(masked: str) -> str:
    """Mask definitely-disabled ``#if 0`` branches while preserving lines."""
    # Parked drafts live under #if 0 above INCLUDE_ASM; do not index them as C.
    conditional_stack: list[tuple[bool, bool, bool]] = []
    out: list[str] = []
    directive_re = re.compile(r"^[ \\t]*#[ \\t]*(if|ifdef|ifndef|elif|else|endif)\\b(.*)$")
    if_zero_re = re.compile(r"^0[ \\t]*$")

    def active() -> bool:
        return not conditional_stack or conditional_stack[-1][1]

    for line in masked.splitlines(keepends=True):
        match = directive_re.match(line.rstrip("\\r\\n"))
        directive = match.group(1) if match else ""
        argument = match.group(2) if match else ""
        current_active = active()
        if directive in ("if", "ifdef", "ifndef"):
            is_if_zero = directive == "if" and bool(if_zero_re.fullmatch(argument.strip()))
            conditional_stack.append((is_if_zero, current_active and not is_if_zero, False))
            out.append(line)
            continue
        if directive in ("elif", "else") and conditional_stack:
            is_if_zero, branch_active, branch_taken = conditional_stack[-1]
            if is_if_zero:
                branch_active = conditional_stack[-1][1]
                if not branch_taken:
                    branch_active = not any(not entry[1] for entry in conditional_stack[:-1])
                conditional_stack[-1] = (is_if_zero, branch_active, True)
            out.append(line)
            continue
        if directive == "endif" and conditional_stack:
            out.append(line)
            conditional_stack.pop()
            continue
        if current_active:
            out.append(line)
        else:
            out.append("".join("\\n" if char == "\\n" else "\\r" if char == "\\r" else " " for char in line))
    return "".join(out)


def matching_brace(text: str, opening: int) -> int | None:
    depth = 0
    for i in range(opening, len(text)):
        if text[i] == "{":
            depth += 1
        elif text[i] == "}":
            depth -= 1
            if depth == 0:
                return i
    return None


def function_header_before(masked: str, opening: int) -> tuple[str, str] | None:
    """Return (name, header) when an opening brace starts a C function."""
    start = max(
        masked.rfind(";", 0, opening),
        masked.rfind("}", 0, opening),
        masked.rfind("{", 0, opening),
    ) + 1
    header = masked[start:opening].strip()
    match = re.search(r"([A-Za-z_]\w*)\s*\(([^;{}]*)\)\s*$", header, re.S)
    if not match:
        return None
    name = match.group(1)
    if name in CONTROL_WORDS:
        return None
    prefix = header[: match.start(1)].strip()
    if not prefix or prefix.endswith(("=", ",")):
        return None
    if re.search(r"\b(if|for|while|switch|catch)\s*\([^)]*\)\s*$", header):
        return None
    return name, header


def count_c_functions(text: str) -> int:
    masked = mask_if_zero_regions(mask_comments_and_strings(text))
    count = 0
    depth = 0
    i = 0
    while i < len(masked):
        char = masked[i]
        if char == "{":
            if depth == 0:
                header = function_header_before(masked, i)
                if header is not None:
                    end = matching_brace(masked, i)
                    if end is not None:
                        count += 1
                        i = end + 1
                        continue
            depth += 1
        elif char == "}":
            depth = max(0, depth - 1)
        i += 1
    return count


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
