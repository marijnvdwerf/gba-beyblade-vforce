#!/usr/bin/env -S uv run --script
# /// script
# dependencies = ["mapfile-parser"]
# ///
"""Replace dump-file address literals with exact linker-map symbols.

Only literals in .word/.4byte directives are rewritten.  The script is
idempotent: already-symbolized lines do not match the address regex.
"""

from __future__ import annotations

import argparse
import re
from collections import Counter, defaultdict
from pathlib import Path

from mapfile_parser import MapFile

# The first alternative is the eight-hex-digit form requested by the task
# (for example 0x08012345).  Existing dumps also omit the zero after 0x for
# GBA addresses (for example 0x8012345), so the second alternative accepts
# that equivalent seven-digit spelling.
ADDRESS_RE = re.compile(
    r"(?<![\w])0x(?:0?[38][0-9A-Fa-f]{7}|[38][0-9A-Fa-f]{6})"
    r"(?![0-9A-Fa-f\w])"
)
DIRECTIVE_RE = re.compile(r"^\s*\.(?:word|4byte)\b")
NON_MATCHING_SUFFIX = ".NON_MATCHING"

# Names generated from an address (rather than a meaningful source-level
# name) are still valid linker symbols and are intentionally retained.
AUTO_NAME_RE = re.compile(
    r"^(?:"
    r"_?unk[_0-9A-Fa-f]+|Unk_[0-9A-Fa-f]+|sub_[0-9A-Fa-f]+|"
    r"_?[0-9A-Fa-f]{7,8}|"
    r"(?:byte|word|dword|qword|DAT|FUN|LAB|PTR|off)_[0-9A-Fa-f]+"
    r")$",
    re.IGNORECASE,
)


class MappedSymbol:
    def __init__(self, name: str, is_function: bool, section_type: str) -> None:
        self.name = name
        self.is_function = is_function
        self.section_type = section_type


def load_symbols(map_path: Path) -> dict[int, list[MappedSymbol]]:
    map_file = MapFile.newFromMapFile(map_path)
    symbols: dict[int, list[MappedSymbol]] = defaultdict(list)
    for segment in map_file._segmentsList:  # mapfile-parser exposes these lists internally
        for section in segment._sectionsList:
            section_type = section.sectionType or ""
            is_function = section_type in {".text", ".init", ".fini"}
            for symbol in section._symbols:
                symbols[symbol.vram].append(
                    MappedSymbol(symbol.name, is_function, section_type)
                )
    return dict(symbols)


def is_auto_name(name: str) -> bool:
    return bool(AUTO_NAME_RE.fullmatch(name.removesuffix(NON_MATCHING_SUFFIX)))


def choose_symbol(candidates: list[MappedSymbol]) -> MappedSymbol | None:
    """Choose one usable spelling when the map has aliases at one address."""
    if not candidates:
        return None

    def rank(symbol: MappedSymbol) -> tuple[int, int, str]:
        # Prefer the canonical symbol over mapfile-parser's synthetic
        # .NON_MATCHING alias, then prefer source-level names over auto names.
        return (
            int(symbol.name.endswith(NON_MATCHING_SUFFIX)),
            int(is_auto_name(symbol.name)),
            symbol.name,
        )

    return min(candidates, key=rank)


def classify(name: str) -> str:
    return "auto" if is_auto_name(name) else "descriptive"


def format_symbol(symbol: MappedSymbol, value: int, odd: bool) -> str:
    if odd:
        return f"{symbol.name} + 1"
    return symbol.name


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--map", dest="map_path", type=Path, default=Path("build/rom.map"))
    parser.add_argument("--root", type=Path, default=Path("asm/dump"))
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    symbols = load_symbols(args.map_path)
    files_touched = 0
    stats: Counter[str] = Counter()
    unmatched: Counter[str] = Counter()
    odd_skipped: Counter[str] = Counter()
    skipped: Counter[str] = Counter()
    replacements_by_file: Counter[str] = Counter()

    for path in sorted(args.root.rglob("*.s")):
        original = path.read_text()
        lines = original.splitlines(keepends=True)
        changed = False
        out_lines: list[str] = []
        for line_no, line in enumerate(lines, 1):
            matches = list(ADDRESS_RE.finditer(line))
            if not matches:
                out_lines.append(line)
                continue
            stats["literals_found"] += len(matches)
            allowed_context = bool(DIRECTIVE_RE.match(line))
            if not allowed_context:
                stats["literals_outside_literal_pool"] += len(matches)

            def replace(match: re.Match[str]) -> str:
                nonlocal changed
                literal = match.group(0)
                value = int(literal[2:], 16)
                exact = choose_symbol(symbols.get(value, []))
                odd = False
                symbol = exact
                if symbol is None and value & 1:
                    odd_candidates = [s for s in symbols.get(value - 1, []) if s.is_function]
                    symbol = choose_symbol(odd_candidates)
                    odd = symbol is not None
                if symbol is None:
                    stats["left_unmatched"] += 1
                    unmatched[literal] += 1
                    if value & 1 and symbols.get(value - 1):
                        odd_skipped[literal] += 1
                    return literal
                if not allowed_context:
                    stats["left_context_skipped"] += 1
                    skipped[f"{path}:{line_no}: {literal}"] += 1
                    return literal
                if odd:
                    stats["odd_thumb_handled"] += 1
                else:
                    stats["exact_symbol_matches"] += 1
                kind = classify(symbol.name)
                stats[f"replaced_{kind}"] += 1
                replacements_by_file[str(path)] += 1
                changed = True
                return format_symbol(symbol, value, odd)

            out_lines.append(ADDRESS_RE.sub(replace, line))

        rewritten = "".join(out_lines)
        if changed:
            path.write_text(rewritten)
            files_touched += 1

    print(f"map: {args.map_path}")
    print(f"root: {args.root}")
    print(f"regex: {ADDRESS_RE.pattern}")
    print(f"files scanned: {len(list(args.root.rglob('*.s')))}")
    print(f"files touched: {files_touched}")
    print(f"total literals found: {stats['literals_found']}")
    print(f"replaced descriptive-named: {stats['replaced_descriptive']}")
    print(f"replaced auto-named: {stats['replaced_auto']}")
    print(f"odd/thumb handled: {stats['odd_thumb_handled']}")
    print(f"left unmatched: {stats['left_unmatched']}")
    print(f"left due to context: {stats['left_context_skipped']}")
    print(f"outside literal-pool contexts: {stats['literals_outside_literal_pool']}")
    if unmatched:
        print("unmatched addresses:")
        for literal, count in unmatched.most_common():
            print(f"  {literal}: {count}")
    if odd_skipped:
        print("odd addresses skipped (addr-1 was not a function symbol):")
        for literal, count in odd_skipped.most_common():
            print(f"  {literal}: {count}")
    if skipped:
        print("context-skipped addresses:")
        for location in skipped:
            print(f"  {location}")
    print(f"replacement occurrences by file: {len(replacements_by_file)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
