#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.10"
# dependencies = []
# ///
"""Print a source-oriented call graph for the GBA decompilation.

This deliberately follows calldiff's small, syntax-oriented approach: index
C function definitions first, collect ordered call steps, then render a tree
with cycle/repetition guards.  It does not try to be a C compiler; this
repository's C90 headers and INCLUDE_ASM macro make a lightweight source scan
more useful than a general-purpose parser.
"""

from __future__ import annotations

import argparse
import re
import sys
from collections import OrderedDict
from dataclasses import dataclass, field
from pathlib import Path
from typing import Iterable

ROOT = Path(__file__).resolve().parents[1]
SRC_DIR = ROOT / "src"

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
    # A function definition's declaration follows the previous top-level
    # declaration.  Looking back to punctuation keeps this independent of
    # include order and preprocessor lines.
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
    # Function pointers and control constructs can end in ') {' too.  Require
    # a plausible return-type/declaration prefix, or a constructor-like name.
    prefix = header[: match.start(1)].strip()
    if not prefix or prefix.endswith(("=", ",")):
        return None
    if re.search(r"\b(if|for|while|switch|catch)\s*\([^)]*\)\s*$", header):
        return None
    return name, header


def extract_c_calls(body: str, macros: set[str]) -> list[str]:
    calls: list[str] = []
    seen_at: set[tuple[str, int]] = set()
    for match in re.finditer(r"\b([A-Za-z_]\w*)\s*\(", body):
        name = match.group(1)
        if name in CONTROL_WORDS or name in macros:
            continue
        # A cast to a pointer-to-array/type is written as Type(*)[N].  It
        # matches the call-shaped regex but is not a function call.
        after_open = body[match.end() :].lstrip()
        if after_open.startswith("*"):
            continue
        # Unresolved names are intentionally retained because they are useful
        # red nodes (library, BIOS, or unresolved calls).
        key = (name, match.start())
        if key not in seen_at:
            calls.append(name)
            seen_at.add(key)
    return calls


def add_function(functions: Functions, function: Function) -> None:
    existing = functions.get(function.name)
    if existing is None or (existing.kind != "c" and function.kind == "c"):
        functions[function.name] = function


def index_c_sources(functions: Functions) -> None:
    macro_files = list(SRC_DIR.rglob("*.c")) + list(SRC_DIR.rglob("*.h")) + list((ROOT / "lib").rglob("*.h"))
    macros: set[str] = set()
    for macro_path in macro_files:
        macro_text = macro_path.read_text(encoding="utf-8", errors="replace")
        macros.update(re.findall(r"(?m)^\s*#\s*define\s+([A-Za-z_]\w*)\s*\(", macro_text))

    for path in sorted(SRC_DIR.rglob("*.c")):
        original = path.read_text(encoding="utf-8", errors="replace")
        masked = mask_comments_and_strings(original)
        depth = 0
        i = 0
        while i < len(masked):
            char = masked[i]
            if char == "{":
                if depth == 0:
                    header = function_header_before(masked, i)
                    if header is not None:
                        name, _ = header
                        end = matching_brace(masked, i)
                        if end is not None:
                            add_function(
                                functions,
                                Function(
                                    name=name,
                                    file=relpath(path),
                                    kind="c",
                                    calls=extract_c_calls(masked[i + 1 : end], macros),
                                ),
                            )
                            # Count the function body as one top-level region;
                            # nested braces must not be mistaken for functions.
                            i = end + 1
                            continue
                depth += 1
            elif char == "}":
                depth = max(0, depth - 1)
            i += 1


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
