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
# Relative tables use ``relative_to`` as the base for each stored code offset.
HANDLER_TABLES = [
    {
        "label": "_LevelRowMusicTable",
        "stride": 0x18,
        "slots": {0x8: "unk8", 0xC: "unkC", 0x10: "unk10", 0x14: "unk14"},
    },
    {
        "label": "_renderFunctionOffsets",
        "stride": 0x80,
        "record_count": 1,
        "relative_to": "render_00",
        "slots": {
            0x00: "triangleSetup",
            0x04: "spanFill",
            0x08: "shortSpan",
            0x0C: "bucketInsert",
            0x10: "faceCull",
            0x14: "stridedCopyAlt",
            0x18: "triangleSetup2",
            0x1C: "triangleDraw",
            0x20: "stridedCopy",
            0x24: "postProcess",
            0x28: "faceDraw",
            0x2C: "stridedCopy2",
            0x30: "vertexTransform",
            0x34: "faceDraw2",
            0x38: "shortSpan2",
            0x40: "faceDraw3",
            0x44: "stridedCopyAlt2",
            0x48: "stridedCopyAlt3",
            0x54: "stridedCopyAlt4",
            0x58: "stridedCopyAlt5",
            0x5C: "stridedCopyAlt6",
            0x60: "stridedCopyAlt7",
            0x64: "faceDraw4",
            0x68: "shortSpan3",
            0x70: "shortSpan4",
            0x74: "postProcess2",
            0x78: "postProcess3",
            0x7C: "postProcess4",
        },
    },
]

# Function-pointer fields and globals whose values are installed at runtime.
# ``call_sites`` identifies the indirect expression in a C/asm caller;
# ``writer_functions`` keeps the assignment edge visible even when no call is
# present in live C.  Literal targets are annotated with their provenance;
# table-backed targets are read from the linked ELF above.
CALLBACK_FIELDS = [
    {
        "name": "Actor.unkB0",
        "call_sites": (("sub_8058754", "unkB0"),),
        "writer_functions": (
            "actor_8057C58",
            "initRider",
            "processMetadata_2",
            "initLevelEnvironmentActors",
        ),
        "targets": (
            {
                "name": "convert3DCoordsto2DCoords",
                "origin": "assembly literal",
                "providers": (
                    "initRider",
                    "processMetadata_2",
                    "initLevelEnvironmentActors",
                ),
            },
        ),
    },
    {
        "name": "ActorTimerEntry.unk8",
        "call_sites": (("sub_8058838", "unk8"),),
        "writer_functions": ("sub_8058794",),
        "targets": (),
    },
    {
        "name": "CameraState.callback",
        "call_sites": (("sub_805EB00", "callback"),),
        "writer_functions": ("sub_80539E8",),
        "targets": (
            {
                "name": "sub_80522D4",
                "origin": "assembly literal",
                "providers": ("sub_80539E8",),
            },
        ),
    },
    {
        "name": "MenuState.callback",
        "call_sites": (("sub_805AFBC", "callback"),),
        "writer_functions": ("sub_805AD24",),
        "targets": (
            {
                "name": "sub_8043604",
                "origin": "assembly literal",
                "providers": ("sub_8043370",),
            },
            {
                "name": "sub_8052B08",
                "origin": "assembly literal",
                "providers": ("sub_8052B24",),
            },
        ),
    },
    {
        "name": "FrontendObject.unk8",
        "call_sites": (("sub_80490CC", "unk8"),),
        "writer_functions": (),
        "handler_slot": ("_LevelRowMusicTable", "unk8"),
        "handler_origin": "assembly literal",
        "targets": (),
    },
    {
        "name": "_unk3000C0C",
        "call_sites": (("sub_8052978", "_unk3000C0C"),),
        "writer_functions": ("sub_8052978",),
        "targets": (),
    },
]

for _render_field in HANDLER_TABLES[1]["slots"].values():
    CALLBACK_FIELDS.append(
        {
            "name": f"RenderCode.{_render_field}",
            "call_sites": (),
            "writer_functions": ("allocateRenderCode",),
            "handler_slot": ("_renderFunctionOffsets", _render_field),
            "handler_origin": "C writer",
            "targets": (),
        }
    )

# Register-indirect assembly calls whose value flow is clear at the call site.
# Generic _call_via_rN thunks are otherwise ignored rather than shown as bogus
# direct callees.
ASM_INDIRECT_CALLS = {
    "gameLoop": ("sub_8052978",),
}

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
    ("c", 1, "🟢"),
)
FUNCTION_PRIORITY = {kind: priority for kind, priority, _ in FUNCTION_KINDS}
FUNCTION_MARKERS = {kind: marker for kind, _, marker in FUNCTION_KINDS}


@dataclass
class Function:
    name: str
    file: str
    kind: str  # "c" or "unknown"
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


def iter_active_branch_children(node, source: bytes) -> Iterator:
    condition = node.child_by_field_name("condition")
    alternative = node.child_by_field_name("alternative")
    for child in node.named_children:
        if same_node(child, condition) or same_node(child, alternative):
            continue
        yield from iter_active_nodes(child, source)


def iter_active_preprocessor_branch(node, source: bytes) -> Iterator:
    """Yield the live alternative of a definitely-false literal #if 0."""
    if node.type == "preproc_else":
        for child in node.named_children:
            yield from iter_active_nodes(child, source)
        return
    if node.type == "preproc_elif":
        condition = node.child_by_field_name("condition")
        if is_literal_zero(source, condition):
            alternative = node.child_by_field_name("alternative")
            if alternative is not None:
                yield from iter_active_preprocessor_branch(alternative, source)
            return
        # The first non-zero/unknown elif is conservatively the live branch.
        yield from iter_active_branch_children(node, source)
        return
    yield from iter_active_nodes(node, source)


def iter_active_nodes(node, source: bytes) -> Iterator:
    """Walk syntax nodes while completely excluding literal #if 0 drafts."""
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


def call_target_name(function, source: bytes) -> str | None:
    """Return only a statically named function call target."""
    if function is not None and function.type == "identifier":
        return node_text(source, function)
    return None


def indirect_field_name(function, source: bytes) -> str | None:
    """Find a field invoked through ``expr->field`` or ``(*expr->field)``."""
    if function is None:
        return None
    if function.type == "field_expression":
        field = function.child_by_field_name("field")
        if field is not None and field.type == "field_identifier":
            return node_text(source, field)
        return None
    if function.type in {"parenthesized_expression", "pointer_expression"}:
        for child in function.named_children:
            name = indirect_field_name(child, source)
            if name is not None:
                return name
    return None


def function_pointer_names(body, source: bytes) -> set[str]:
    if body is None:
        return set()
    return set(re.findall(r"\(\s*\*\s*([A-Za-z_]\w*)\s*\)", node_text(source, body)))


def extract_c_calls(body, source: bytes, macros: set[str]) -> tuple[list[str], set[str]]:
    calls: list[tuple[int, str]] = []
    indirect_names = function_pointer_names(body, source)
    for node in iter_active_nodes(body, source):
        if node.type != "call_expression":
            continue
        function = node.child_by_field_name("function")
        name = call_target_name(function, source)
        if name is None:
            name = indirect_field_name(function, source)
            if name is not None:
                indirect_names.add(name)
        if name is None or name in CONTROL_WORDS or name in macros:
            continue
        calls.append((node.start_byte, name))
    return [name for _, name in sorted(calls)], indirect_names


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


def index_c_sources(functions: Functions) -> set[Path]:
    macros = macro_names()
    parser = Parser(C_LANGUAGE)
    asm_paths: set[Path] = set()
    for path in sorted(SRC_DIR.rglob("*.c")):
        source = path.read_bytes()
        tree = parser.parse(source)
        active_nodes = list(iter_active_nodes(tree.root_node, source))
        for node in active_nodes:
            if node.type == "call_expression":
                target = call_target_name(node.child_by_field_name("function"), source)
                if target == "INCLUDE_ASM":
                    match = re.search(r'"([^"]+\.s)"', node_text(source, node))
                    if match is not None:
                        asm_paths.add(ROOT / match.group(1))
            if node.type != "function_definition":
                continue
            name = function_name(node.child_by_field_name("declarator"), source)
            if name is None:
                continue
            body = node.child_by_field_name("body")
            if body is None:
                calls, indirect_names = [], set()
            else:
                calls, indirect_names = extract_c_calls(body, source, macros)
            add_function(
                functions,
                Function(
                    name=name,
                    file=relpath(path),
                    kind="c",
                    calls=calls,
                    indirect_names=indirect_names,
                ),
            )
    return asm_paths


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


def index_assembly_sources(functions: Functions, paths: set[Path]) -> None:
    """Index direct calls in assembly selected by live INCLUDE_ASM branches."""
    binary_symbols = load_binary_symbols()
    if binary_symbols is None:
        return
    function_names = {
        name
        for name, symbol in binary_symbols.by_name.items()
        if symbol.symbol_type == "STT_FUNC"
    }
    label_re = re.compile(r"(?m)^([A-Za-z_]\w*):")
    call_re = re.compile(r"(?m)^\s*(?:bl|blx|b)\s+([A-Za-z_]\w*)")
    for path in sorted(paths):
        if not path.is_file():
            raise SystemExit(f"live INCLUDE_ASM source {path} does not exist")
        text = path.read_text(encoding="utf-8", errors="replace")
        labels = [
            match
            for match in label_re.finditer(text)
            if match.group(1) in function_names
        ]
        for index, match in enumerate(labels):
            name = match.group(1)
            end = labels[index + 1].start() if index + 1 < len(labels) else len(text)
            body = text[match.end() : end]
            calls = []
            for call_match in call_re.finditer(body):
                target = call_match.group(1)
                if target.startswith("_call_via_") or re.fullmatch(r"r\d+", target):
                    continue
                if target not in calls:
                    calls.append(target)
            for target in ASM_INDIRECT_CALLS.get(name, ()):
                if target not in calls:
                    calls.append(target)
            add_function(
                functions,
                Function(
                    name=name,
                    file=relpath(path),
                    kind="unknown",
                    calls=calls,
                ),
            )


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
    if "record_count" in table:
        record_count = table["record_count"]
    elif size:
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
    function_addresses = sorted(function_symbols)

    relative_base = 0
    relative_to = table.get("relative_to")
    if relative_to is not None:
        base_symbol = next(
            (symbol for symbol in symbols if symbol.name == relative_to), None
        )
        if base_symbol is None:
            raise SystemExit(
                f"relative base symbol {relative_to!r} was not found in {ELF_PATH}"
            )
        relative_base = base_symbol["st_value"] & ~1

    def resolve_table_target(pointer: int) -> str | None:
        target = function_symbols.get(pointer)
        if target is not None or relative_to is None:
            return target
        # Some render-table entries are alternate entry points a few bytes
        # inside a named routine.  Attribute them to the enclosing symbol.
        previous = None
        for function_address in function_addresses:
            if function_address > pointer:
                break
            previous = function_address
        return function_symbols.get(previous) if previous is not None else None

    segments = [
        segment for segment in elf.iter_segments() if segment["p_type"] == "PT_LOAD"
    ]
    targets = {slot_name: [] for slot_name in table["slots"].values()}
    for record in range(record_count):
        base = address + record * stride
        for slot_offset, slot_name in table["slots"].items():
            raw = read_elf_bytes(stream, segments, base + slot_offset, 4)
            stored_value = int.from_bytes(raw, byteorder="little")
            pointer = (relative_base + stored_value) & ~1
            target = resolve_table_target(pointer)
            if target is not None and target not in targets[slot_name]:
                targets[slot_name].append(target)
    return targets


def build_handler_tables() -> tuple[
    dict[str, list[str]],
    dict[str, list[str]],
    dict[tuple[str, str], list[str]],
]:
    if not ELF_PATH.is_file():
        raise SystemExit(
            f"{ELF_PATH} is missing; build the project first "
            "(for example, cmake --build build)"
        )
    nodes: dict[str, list[str]] = {}
    slots_by_name: dict[str, list[str]] = {}
    targets_by_slot: dict[tuple[str, str], list[str]] = {}
    with ELF_PATH.open("rb") as stream:
        elf = ELFFile(stream)
        for table in HANDLER_TABLES:
            targets = parse_elf_table(table, stream, elf)
            for slot_name, children in targets.items():
                node = f"{table['label']}[{slot_name}]"
                nodes[node] = children
                slots_by_name.setdefault(slot_name, []).append(node)
                targets_by_slot[(table["label"], slot_name)] = children
            for alias, source_slots in INDIRECT_SLOT_ALIASES.items():
                if not any(source_slot in targets for source_slot in source_slots):
                    continue
                children = []
                for source_slot in source_slots:
                    for target in targets.get(source_slot, ()):
                        if target not in children:
                            children.append(target)
                node = f"{table['label']}[{alias}]"
                nodes[node] = children
                slots_by_name.setdefault(alias, []).append(node)
    return nodes, slots_by_name, targets_by_slot


def resolve_indirect_calls(functions: Functions) -> None:
    nodes, slots_by_name, targets_by_slot = build_handler_tables()
    for node, children in nodes.items():
        functions[node] = Function(
            name=node, file="", kind="unknown", calls=children, synthetic=True
        )

    callback_sites: dict[tuple[str, str], str] = {}
    callback_owners: dict[str, list[str]] = {}
    for callback in CALLBACK_FIELDS:
        node = callback["name"]
        children = [target["name"] for target in callback["targets"]]
        handler_slot = callback.get("handler_slot")
        if handler_slot is not None:
            children.extend(targets_by_slot.get(handler_slot, ()))
        children = list(dict.fromkeys(children))
        functions[node] = Function(
            name=node, file="", kind="unknown", calls=children, synthetic=True
        )
        for site in callback["call_sites"]:
            callback_sites[site] = node
            callback_owners.setdefault(site[0], []).append(node)
        for writer in callback["writer_functions"]:
            callback_owners.setdefault(writer, []).append(node)

    # Assembly call sites and writers have no parsed body.  Give them the same
    # explicit callback edge as their C equivalents; if they later become C,
    # add_function's priority rules preserve the real body and this edge is
    # appended below.
    for owner, callback_nodes in callback_owners.items():
        if owner not in functions:
            functions[owner] = Function(name=owner, file="", kind="unknown")
        for node in callback_nodes:
            if node not in functions[owner].calls:
                functions[owner].calls.append(node)

    for function in list(functions.values()):
        if function.synthetic:
            continue
        resolved: list[str] = []
        for target in function.calls:
            callback_node = callback_sites.get((function.name, target))
            slot_names = INDIRECT_SITES.get((function.name, target))
            if callback_node is not None:
                replacements = [callback_node]
            elif slot_names is not None:
                replacements = [
                    node
                    for slot_name in slot_names
                    for node in slots_by_name.get(slot_name, ())
                ]
            elif target in slots_by_name:
                replacements = slots_by_name[target]
            elif target in function.indirect_names or target in INDIRECT_LOCAL_NAMES:
                replacements = []
            else:
                replacements = [target]
            for replacement in replacements:
                if replacement not in resolved:
                    resolved.append(replacement)
        function.calls = resolved


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
    asm_paths = index_c_sources(functions)
    index_assembly_sources(functions, asm_paths)
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
        name: str, prefix: str, is_last: bool, depth: int, is_root: bool
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
        elif name in expanded and (function.kind == "c" or function.calls):
            suffix = " (see above)"

        branch = "" if is_root else ("└─ " if is_last else "├─ ")
        location = f" [{function.file}]" if function.file else ""
        lines.append(
            f"{prefix}{branch}{function.marker} {function.display_name}{location}{suffix}"
        )
        if suffix:
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
