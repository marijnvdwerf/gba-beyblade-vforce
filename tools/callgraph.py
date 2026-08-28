#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.10"
# dependencies = [
#   "tree-sitter==0.26.0",
#   "tree-sitter-c==0.24.2",
#   "pyelftools==0.32",
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

from elftools.elf.elffile import ELFFile
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
    {
        "label": "Unk_872CAF4",
        "stride": 4,
        "slots": {0: "unk0"},
    },
]

CALLBACKS = [
    ("Unk_872CAF4[unk0]", [
        "onVBlank",
        "nullsub_37",
        "nullsub_31",
        "onTimer1Overflow",
        "Sound_onTimer1Overflow",
    ]),
    ("_unk3000DF0[5]", ["onTimer2Overflow"]),
    ("_unk3000DF0[6]", ["sub_8757D24", "sub_8757CD0", "sub_8757E4C"]),
    ("_unk3000DF0[7]", ["onSerialCommunication", "sub_8757FCC"]),
    ("Actor.unkB0", ["convert3DCoordsto2DCoords"]),
    ("CameraState.callback", ["sub_80522D4"]),
    ("MenuState.callback", ["sub_8043604", "sub_8052B08"]),
    ("_renderFunctionOffsets", [
        "render_00",
        "render_01",
        "render_02",
        "render_03",
        "render_04",
        "render_05",
        "render_06",
        "render_07",
        "render_08",
        "render_09",
    ]),
]
CALLBACK_NAMES = {callback[0] for callback in CALLBACKS}
CALLBACK_NODE_NAMES = [callback[0] for callback in CALLBACKS]

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
INDIRECT_FIELD_NAMES = {
    slot_name
    for table in HANDLER_TABLES
    for slot_name in table["slots"].values()
} | set(INDIRECT_SLOT_ALIASES)

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
    special_kind: str = ""  # "runtime" or "data"
    data_targets: tuple[str, ...] = ()

    @property
    def marker(self) -> str:
        if self.synthetic:
            return "🧭"
        if self.special_kind == "runtime":
            return "⚙"
        if self.special_kind == "data":
            return "📦"
        return FUNCTION_MARKERS[self.kind]

    @property
    def display_name(self) -> str:
        if self.special_kind == "runtime":
            return f"runtime {self.name}"
        if self.special_kind == "data":
            if self.data_targets:
                targets = ", ".join(self.data_targets)
                return f"data pointer {self.name} → {targets}"
            return f"data pointer {self.name}"
        return self.name


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
            name = node_text(source, field)
            if name in INDIRECT_FIELD_NAMES:
                return name
    return None


def function_pointer_names(body, source: bytes) -> set[str]:
    if body is None:
        return set()
    text = node_text(source, body)
    names = set(re.findall(r"\(\s*\*\s*([A-Za-z_]\w*)\s*\)", text))
    # Typedef function pointers in the drafts are declared as e.g.
    # ``LayerCopyFunc copy;`` and ``EventMetadataHandler handler;``.
    names.update(re.findall(r"\b[A-Za-z_]\w*(?:Func|Handler)\s+([A-Za-z_]\w*)\s*;", text))
    return names


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


ELF_PATH = ROOT / "build" / "rom.elf"
MAP_PATH = ROOT / "build" / "rom.map"

# These are compiler-provided entry points rather than game functions.  The
# map-file based discovery below covers the rest of libgcc, while this list
# keeps the classification useful when a map omits an archive member.
KNOWN_RUNTIME_SYMBOLS = {
    "__adddf3",
    "__addsf3",
    "__div0",
    "__divdi3",
    "__divsi3",
    "__eqdf2",
    "__eqsf2",
    "__extendsfdf2",
    "__fixdfsi",
    "__fixsfsi",
    "__fixunsdfsi",
    "__fixunssfsi",
    "__floatsidf",
    "__floatsisf",
    "__floatunsidf",
    "__floatunsisf",
    "__gedf2",
    "__gesf2",
    "__gtdf2",
    "__gtsf2",
    "__ledf2",
    "__lesf2",
    "__ltdf2",
    "__ltsf2",
    "__muldi3",
    "__muldf3",
    "__mulsf3",
    "__nedf2",
    "__nesf2",
    "__subdf3",
    "__subsf3",
    "__truncdfsf2",
    "__udivdi3",
    "__udivmoddi4",
    "__udivsi3",
    "__umoddi3",
    "__umodsi3",
}


@dataclass(frozen=True)
class ElfSymbol:
    name: str
    address: int
    size: int
    section: str | None
    symbol_type: str


@dataclass
class BinarySymbols:
    by_name: dict[str, ElfSymbol]
    functions_by_address: dict[int, str]
    runtime_names: set[str]
    data_targets: dict[str, tuple[str, ...]]


_BINARY_SYMBOLS: BinarySymbols | None = None


def libgcc_symbol_names() -> set[str]:
    names = set(KNOWN_RUNTIME_SYMBOLS)
    if not MAP_PATH.is_file():
        return names

    section_re = re.compile(r"^\s+\*?\.([A-Za-z0-9_]+)\s+0x[0-9A-Fa-f]+")
    symbol_re = re.compile(r"^\s+0x[0-9A-Fa-f]+\s+(\S+)")
    in_libgcc = False
    for line in MAP_PATH.read_text(encoding="utf-8", errors="replace").splitlines():
        section_match = section_re.match(line)
        if section_match:
            in_libgcc = "libgcc.a(" in line
            continue
        if in_libgcc:
            symbol_match = symbol_re.match(line)
            if symbol_match:
                names.add(symbol_match.group(1))
    return names


def load_binary_symbols() -> BinarySymbols | None:
    global _BINARY_SYMBOLS
    if _BINARY_SYMBOLS is not None:
        return _BINARY_SYMBOLS
    if not ELF_PATH.is_file():
        return None

    by_name: dict[str, ElfSymbol] = {}
    section_symbols: dict[str, list[ElfSymbol]] = {}
    with ELF_PATH.open("rb") as stream:
        elf = ELFFile(stream)
        symtab = elf.get_section_by_name(".symtab")
        if symtab is None:
            return None
        for symbol in symtab.iter_symbols():
            if symbol["st_shndx"] == "SHN_UNDEF":
                continue
            section = None
            if isinstance(symbol["st_shndx"], int):
                section = elf.get_section(symbol["st_shndx"]).name
            info = ElfSymbol(
                name=symbol.name,
                address=symbol["st_value"] & ~1,
                size=symbol["st_size"],
                section=section,
                symbol_type=symbol["st_info"]["type"],
            )
            if info.name:
                by_name.setdefault(info.name, info)
                if info.section is not None:
                    section_symbols.setdefault(info.section, []).append(info)

        function_candidates: dict[int, list[str]] = {}
        for info in by_name.values():
            if info.symbol_type == "STT_FUNC":
                function_candidates.setdefault(info.address, []).append(info.name)
        functions_by_address = {
            address: min(
                names,
                key=lambda name: (
                    name.startswith("$"),
                    ".NON_MATCHING" in name,
                    name,
                ),
            )
            for address, names in function_candidates.items()
        }

        segments = [
            segment for segment in elf.iter_segments() if segment["p_type"] == "PT_LOAD"
        ]
        data_targets: dict[str, tuple[str, ...]] = {}
        for section, symbols in section_symbols.items():
            section_info = elf.get_section_by_name(section)
            if section_info is None or section_info["sh_flags"] & 0x4:
                continue
            ordered = sorted(
                {info.address: info for info in symbols}.values(),
                key=lambda info: info.address,
            )
            for index, info in enumerate(ordered):
                size = info.size
                if not size and index + 1 < len(ordered):
                    size = ordered[index + 1].address - info.address
                size = min(size or 4, 64)
                size -= size % 4
                targets: list[str] = []
                for offset in range(0, size, 4):
                    try:
                        raw = read_elf_bytes(stream, segments, info.address + offset, 4)
                    except SystemExit:
                        break
                    pointer = int.from_bytes(raw, byteorder="little") & ~1
                    target = functions_by_address.get(pointer)
                    if target is not None and target not in targets:
                        targets.append(target)
                for alias in symbols:
                    if alias.address == info.address:
                        data_targets[alias.name] = tuple(targets)

    _BINARY_SYMBOLS = BinarySymbols(
        by_name=by_name,
        functions_by_address=functions_by_address,
        runtime_names=libgcc_symbol_names(),
        data_targets=data_targets,
    )
    return _BINARY_SYMBOLS


def read_elf_bytes(stream, segments, address: int, size: int) -> bytes:
    for segment in segments:
        segment_start = segment["p_vaddr"]
        segment_end = segment_start + segment["p_filesz"]
        if segment_start <= address and address + size <= segment_end:
            stream.seek(segment["p_offset"] + address - segment_start)
            return stream.read(size)
    raise SystemExit(
        f"cannot read handler table bytes at 0x{address:08x} from {ELF_PATH}"
    )


def parse_elf_table(table: dict, stream, elf) -> dict[str, list[str]]:
    symtab = elf.get_section_by_name(".symtab")
    if symtab is None:
        raise SystemExit(f"{ELF_PATH} has no .symtab; rebuild the ELF with symbols")
    symbols = [
        symbol
        for symbol in symtab.iter_symbols()
        if symbol["st_shndx"] != "SHN_UNDEF"
    ]
    label = table["label"]
    table_symbol = next((symbol for symbol in symbols if symbol.name == label), None)
    if table_symbol is None:
        raise SystemExit(f"handler table symbol {label!r} was not found in {ELF_PATH}")
    address = table_symbol["st_value"] & ~1
    stride = table["stride"]
    size = table_symbol["st_size"]
    if size:
        record_count = size // stride
    else:
        next_addresses = [
            symbol["st_value"] & ~1
            for symbol in symbols
            if (symbol["st_value"] & ~1) > address
        ]
        if not next_addresses:
            raise SystemExit(
                f"could not determine the end of handler table {label!r} in {ELF_PATH}"
            )
        record_count = (min(next_addresses) - address) // stride
    if record_count <= 0:
        raise SystemExit(f"handler table {label!r} has no records in {ELF_PATH}")

    function_symbols: dict[int, str] = {}
    for symbol in symbols:
        if symbol["st_info"]["type"] != "STT_FUNC":
            continue
        function_symbols.setdefault(symbol["st_value"] & ~1, symbol.name)
    segments = [
        segment for segment in elf.iter_segments() if segment["p_type"] == "PT_LOAD"
    ]
    targets = {slot_name: [] for slot_name in table["slots"].values()}
    for record in range(record_count):
        base = address + record * stride
        for slot_offset, slot_name in table["slots"].items():
            raw = read_elf_bytes(stream, segments, base + slot_offset, 4)
            pointer = int.from_bytes(raw, byteorder="little") & ~1
            target = function_symbols.get(pointer)
            if target is not None and target not in targets[slot_name]:
                targets[slot_name].append(target)
    return targets


def build_handler_tables() -> tuple[dict[str, list[str]], dict[str, list[str]]]:
    if not ELF_PATH.is_file():
        raise SystemExit(
            f"{ELF_PATH} is missing; build the project first "
            "(for example, cmake --build build)"
        )
    nodes: dict[str, list[str]] = {}
    slots_by_name: dict[str, list[str]] = {}
    with ELF_PATH.open("rb") as stream:
        elf = ELFFile(stream)
        for table in HANDLER_TABLES:
            targets = parse_elf_table(table, stream, elf)
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


def add_callbacks(functions: Functions) -> None:
    for name, targets in CALLBACKS:
        functions[name] = Function(
            name=name,
            file="",
            kind="unknown",
            calls=list(targets),
            synthetic=True,
        )


def classify_symbol(name: str) -> tuple[str, tuple[str, ...]]:
    binary_symbols = load_binary_symbols()
    if binary_symbols is None:
        return "", ()
    if name in binary_symbols.runtime_names:
        return "runtime", ()
    symbol = binary_symbols.by_name.get(name)
    if symbol is None or symbol.section is None:
        return "", ()
    # A symbol in any non-code section is a data object, including linker
    # labels with STT_NOTYPE.  Keep this broad because the callgraph also sees
    # function-pointer objects declared as externs in C.
    if not symbol.section.startswith(".text") and symbol.section not in {
        ".iwram",
        ".iwram_code",
    }:
        return "data", binary_symbols.data_targets.get(name, ())
    return "", ()


def make_unknown(functions: Functions, name: str) -> None:
    if name and name not in functions:
        special_kind, data_targets = classify_symbol(name)
        functions[name] = Function(
            name=name,
            file="",
            kind="unknown",
            special_kind=special_kind,
            data_targets=data_targets,
        )


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
    add_callbacks(functions)
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
        expand_children: bool = True,
    ) -> None:
        function = functions.get(name)
        if function is None:
            special_kind, data_targets = classify_symbol(name)
            function = Function(
                name=name,
                file="",
                kind="unknown",
                special_kind=special_kind,
                data_targets=data_targets,
            )
        suffix = ""
        if depth >= MAX_RENDER_DEPTH:
            suffix = " … (depth limit)"
        elif name in active:
            suffix = " (cycle)"
        elif name in expanded and function.kind == "c":
            suffix = " (see above)"

        branch = "" if is_root else ("└─ " if is_last else "├─ ")
        location = f" [{function.file}]" if function.file else ""
        lines.append(
            f"{prefix}{branch}{function.marker} {function.display_name}{location}{suffix}"
        )
        if suffix or not expand_children:
            return

        expanded.add(name)
        active.add(name)
        child_prefix = prefix if is_root else prefix + ("   " if is_last else "│  ")
        children = function.calls
        if is_root and name not in CALLBACK_NAMES:
            children = children + CALLBACK_NODE_NAMES
        for index, child in enumerate(children):
            walk(
                child,
                child_prefix,
                index == len(children) - 1,
                depth + 1,
                False,
                name not in CALLBACK_NAMES,
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
