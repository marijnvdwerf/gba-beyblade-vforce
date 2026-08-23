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

# ROM tables whose entries are function pointers.  Add another table by giving
# its assembly label, record stride, and the function-pointer slot offsets.
HANDLER_TABLES = [
    {
        "label": "_LevelRowMusicTable",
        "stride": 0x18,
        "slots": {0x8: "unk8", 0xC: "unkC", 0x10: "unk10", 0x14: "unk14"},
    },
]

# A local may receive pointers from more than one table slot.  These overrides
# also document the few cases where the C name is not the slot name itself.
INDIRECT_SITES = {
    ("sub_8049344", "stored"): ("unk588",),
    ("sub_8049344", "callback"): ("unk10", "unk14", "unk588"),
}
INDIRECT_LOCAL_NAMES = {"callback", "stored", "transition"}
# ``unk588`` stores a callback selected from the same two frontend-handler
# columns; it is an alias rather than a physical field in the row record.
INDIRECT_SLOT_ALIASES = {"unk588": ("unk10", "unk14")}

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

FUNCTION_KINDS = (
    ("unknown", 0, "🔴"),
    ("provisional", 1, "🟡"),
    ("c", 2, "🟢"),
)
FUNCTION_PRIORITY = {kind: priority for kind, priority, _ in FUNCTION_KINDS}
FUNCTION_MARKERS = {kind: marker for kind, _, marker in FUNCTION_KINDS}


@dataclass
class Function:
    name: str
    file: str
    kind: str  # "c", "provisional", or "unknown"
    calls: list[str] = field(default_factory=list)
    indirect_names: set[str] = field(default_factory=set)
    synthetic: bool = False

    @property
    def marker(self) -> str:
        return "🧭" if self.synthetic else FUNCTION_MARKERS[self.kind]


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


def iter_active_branch_children(
    node, source: bytes, invert_literal_zero: bool
) -> Iterator:
    condition = node.child_by_field_name("condition")
    alternative = node.child_by_field_name("alternative")
    for child in node.named_children:
        if same_node(child, condition) or same_node(child, alternative):
            continue
        yield from iter_active_nodes(child, source, invert_literal_zero)


def iter_active_preprocessor_branch(
    node, source: bytes, invert_literal_zero: bool
) -> Iterator:
    """Yield nodes from the selected branch of a definitely-false #if 0."""
    if node.type == "preproc_else":
        for child in node.named_children:
            yield from iter_active_nodes(child, source, invert_literal_zero)
        return
    if node.type == "preproc_elif":
        condition = node.child_by_field_name("condition")
        if is_literal_zero(source, condition):
            alternative = node.child_by_field_name("alternative")
            if alternative is not None:
                yield from iter_active_preprocessor_branch(
                    alternative, source, invert_literal_zero
                )
            return
        # The first non-zero/unknown elif is the conservatively active branch.
        yield from iter_active_branch_children(node, source, invert_literal_zero)
        return
    yield from iter_active_nodes(node, source, invert_literal_zero)


def iter_active_nodes(node, source: bytes, invert_literal_zero: bool) -> Iterator:
    """Walk syntax nodes, optionally inverting literal #if 0 branches."""
    if node.type == "preproc_if":
        condition = node.child_by_field_name("condition")
        alternative = node.child_by_field_name("alternative")
        if is_literal_zero(source, condition):
            if invert_literal_zero:
                yield from iter_active_branch_children(
                    node, source, invert_literal_zero
                )
            elif alternative is not None:
                yield from iter_active_preprocessor_branch(
                    alternative, source, invert_literal_zero
                )
            return
    yield node
    for child in node.named_children:
        yield from iter_active_nodes(child, source, invert_literal_zero)


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


def call_target_name(function, source: bytes) -> str | None:
    if function is None:
        return None
    if function.type == "identifier":
        return node_text(source, function)
    if function.type == "field_expression":
        field = function.child_by_field_name("field")
        if field is not None and field.type == "field_identifier":
            return node_text(source, field)
    return None


def function_pointer_names(body, source: bytes) -> set[str]:
    if body is None:
        return set()
    return set(re.findall(r"\(\s*\*\s*([A-Za-z_]\w*)\s*\)", node_text(source, body)))


def extract_c_calls(
    body, source: bytes, macros: set[str], invert_literal_zero: bool
) -> list[str]:
    calls: list[tuple[int, str]] = []
    for node in iter_active_nodes(body, source, invert_literal_zero):
        if node.type != "call_expression":
            continue
        name = call_target_name(node.child_by_field_name("function"), source)
        if name is None or name in CONTROL_WORDS or name in macros:
            continue
        calls.append((node.start_byte, name))
    return [name for _, name in sorted(calls)]


def add_function(functions: Functions, function: Function) -> None:
    existing = functions.get(function.name)
    if existing is None or FUNCTION_PRIORITY[function.kind] > FUNCTION_PRIORITY[existing.kind]:
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
        for invert_literal_zero in (False, True):
            kind = "provisional" if invert_literal_zero else "c"
            for node in iter_active_nodes(tree.root_node, source, invert_literal_zero):
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
                        kind=kind,
                        calls=(
                            extract_c_calls(body, source, macros, invert_literal_zero)
                            if body is not None
                            else []
                        ),
                        indirect_names=function_pointer_names(body, source),
                    ),
                )


ASM_LABEL_RE = re.compile(r"^([A-Za-z_]\w*):\s*$")
ASM_DIRECTIVE_RE = re.compile(r"^\s*\.(byte|4byte)\s+(.+?)\s*$")
ASM_SYMBOL_RE = re.compile(r"^([A-Za-z_]\w*)\s*(?:\+\s*1)?$")


def parse_asm_table(table: dict) -> dict[str, list[str]]:
    label = table["label"]
    stride = table["stride"]
    slots = table["slots"]
    for path in sorted((ROOT / "asm").glob("data*.s")):
        lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
        for index, line in enumerate(lines):
            match = ASM_LABEL_RE.match(line)
            if match is None or match.group(1) != label:
                continue
            offset = 0
            entries: dict[int, str] = {}
            for following in lines[index + 1 :]:
                if ASM_LABEL_RE.match(following):
                    break
                directive = ASM_DIRECTIVE_RE.match(following)
                if directive is None:
                    continue
                kind, values = directive.groups()
                width = 1 if kind == "byte" else 4
                for value in (part.strip() for part in values.split(",")):
                    if width == 4:
                        symbol = ASM_SYMBOL_RE.match(value)
                        if symbol is not None:
                            entries[offset] = symbol.group(1)
                    offset += width
            targets = {slot_name: [] for slot_name in slots.values()}
            record = 0
            while record * stride + max(slots, default=0) < offset:
                base = record * stride
                values = [entries.get(base + slot_offset) for slot_offset in slots]
                if any(value is None for value in values):
                    break
                for slot_offset, slot_name in slots.items():
                    target = entries[base + slot_offset]
                    if target not in targets[slot_name]:
                        targets[slot_name].append(target)
                record += 1
            return targets
    return {slot_name: [] for slot_name in slots.values()}


def build_handler_tables() -> tuple[dict[str, list[str]], dict[str, list[str]]]:
    nodes: dict[str, list[str]] = {}
    slots_by_name: dict[str, list[str]] = {}
    for table in HANDLER_TABLES:
        targets = parse_asm_table(table)
        for slot_name, functions in targets.items():
            node = f"{table['label']}[{slot_name}]"
            nodes[node] = functions
            slots_by_name.setdefault(slot_name, []).append(node)
        for alias, source_slots in INDIRECT_SLOT_ALIASES.items():
            functions: list[str] = []
            for source_slot in source_slots:
                for target in targets.get(source_slot, ()):
                    if target not in functions:
                        functions.append(target)
            node = f"{table['label']}[{alias}]"
            nodes[node] = functions
            slots_by_name.setdefault(alias, []).append(node)
    return nodes, slots_by_name


def resolve_indirect_calls(functions: Functions) -> None:
    nodes, slots_by_name = build_handler_tables()
    for node, children in nodes.items():
        functions[node] = Function(
            name=node, file="", kind="unknown", calls=children, synthetic=True
        )
    for function in list(functions.values()):
        if function.synthetic:
            continue
        resolved: list[str] = []
        for target in function.calls:
            slot_names = INDIRECT_SITES.get((function.name, target))
            if slot_names is None and target in slots_by_name:
                slot_names = (target,)
            if slot_names is not None:
                replacements = [
                    node
                    for slot_name in slot_names
                    for node in slots_by_name.get(slot_name, ())
                ]
            elif target in function.indirect_names or target in INDIRECT_LOCAL_NAMES:
                replacements = []
            else:
                replacements = [target]
            for replacement in replacements:
                if replacement not in resolved:
                    resolved.append(replacement)
        function.calls = resolved


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
    resolve_indirect_calls(functions)
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

    def walk(
        name: str,
        prefix: str,
        is_last: bool,
        depth: int,
        is_root: bool,
        expand: bool = True,
    ) -> None:
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
        if suffix or not expand:
            return

        expanded.add(name)
        active.add(name)
        child_prefix = prefix if is_root else prefix + ("   " if is_last else "│  ")
        children = function.calls
        for index, child in enumerate(children):
            walk(
                child,
                child_prefix,
                index == len(children) - 1,
                depth + 1,
                False,
                expand=not function.synthetic,
            )
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
