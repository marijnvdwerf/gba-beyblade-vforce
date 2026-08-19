#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.11"
# dependencies = []
# ///
"""List functions called from C that do not have a C definition."""

from __future__ import annotations

import argparse
import json
import re
import shutil
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
C_FILES = sorted((ROOT / "src").glob("*.c"))
HEADER_FILES = sorted((ROOT / "src").glob("*.h"))
HEADER_FILES += sorted((ROOT / "lib/agb/include/agb").glob("*.h"))

# Permanent assembly entry points that are intentionally never decompiled to C.
# Extend this set when an asm-only subsystem is permanently out of scope.
PERMANENT_ASM = {
    "__fastMemoryClearARM",
    "__fastMemoryCopyARM",
    "__sub_87577B4",
    "__sub_8757A64",
    "sub_80627A8",
}


def rel_paths(paths: list[Path]) -> list[str]:
    return [str(path.relative_to(ROOT)) for path in paths]


def sg_json(sg: str, *args: str, paths: list[Path]) -> list[dict]:
    command = [sg, "run", *args, "--lang", "c", "--json=compact", *rel_paths(paths)]
    result = subprocess.run(command, cwd=ROOT, text=True, capture_output=True)
    if result.returncode:
        raise RuntimeError(f"ast-grep failed ({result.returncode}): {result.stderr.strip()}")
    try:
        return json.loads(result.stdout or "[]")
    except json.JSONDecodeError as error:
        raise RuntimeError(f"ast-grep returned invalid JSON: {result.stdout[:200]!r}") from error


def meta_name(match: dict, key: str = "NAME") -> str | None:
    return match.get("metaVariables", {}).get("single", {}).get(key, {}).get("text")


def byte_range(match: dict) -> tuple[int, int]:
    offsets = match["range"]["byteOffset"]
    return offsets["start"], offsets["end"]


def containing_definition(
    definitions: dict[str, list[tuple[int, int, str]]], match: dict
) -> tuple[str, int, int, str] | None:
    start, _ = byte_range(match)
    for source, ranges in definitions.items():
        if source != match["file"]:
            continue
        for definition_start, definition_end, name in ranges:
            if definition_start <= start <= definition_end:
                return source, definition_start, definition_end, name
    return None


def find_include_refs(sg: str) -> list[dict]:
    return sg_json(
        sg,
        "--pattern",
        "INCLUDE_ASM($PATH);",
        paths=C_FILES,
    )


def include_locations(name: str, refs: list[dict]) -> list[dict[str, int | str]]:
    wanted = name.lower()
    address_match = re.search(r"(?:^|_)([0-9a-f]{7,8})$", wanted)
    address = address_match.group(1) if address_match else None
    candidates: list[tuple[int, dict[str, int | str]]] = []
    for ref in refs:
        path = meta_name(ref, "PATH")
        if not path:
            continue
        dump_path = Path(path.strip('"'))
        stem = dump_path.stem.lower()
        label = stem.split("-", 1)[1] if "-" in stem else ""
        score: int | None = None
        if label == wanted or stem == wanted:
            score = 0
        elif address and address in stem.split("-", 1)[0]:
            score = 1
        elif wanted in label:
            score = 2
        if score is None:
            continue
        candidates.append(
            (
                score,
                {
                    "file": ref["file"],
                    "line": ref["range"]["start"]["line"] + 1,
                },
            )
        )
    if not candidates:
        return []
    best = min(score for score, _ in candidates)
    locations = [location for score, location in candidates if score == best]
    return sorted(locations, key=lambda location: (str(location["file"]), int(location["line"])))


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--json", action="store_true", help="emit machine-readable JSON")
    args = parser.parse_args()

    sg = shutil.which("ast-grep") or shutil.which("sg")
    if not sg:
        parser.error("ast-grep (or sg) is required on PATH")
    if not C_FILES:
        parser.error("no src/*.c files found")

    # First collect real function_definition nodes. The second query selects their
    # function_declarator, which gives us the name without parsing C text ourselves.
    definition_nodes = sg_json(sg, "--kind", "function_definition", paths=C_FILES)
    declarators = sg_json(
        sg,
        "--pattern",
        "void $NAME($$$PARAMS) { $$$BODY }",
        "--selector",
        "function_declarator",
        paths=C_FILES,
    )
    definitions: dict[str, list[tuple[int, int, str]]] = {}
    for node in definition_nodes:
        start, end = byte_range(node)
        matches = [
            declarator
            for declarator in declarators
            if declarator["file"] == node["file"]
            and start <= byte_range(declarator)[0] <= end
            and meta_name(declarator)
        ]
        if len(matches) != 1:
            raise RuntimeError(
                f"could not identify function at {node['file']}:{node['range']['start']['line'] + 1}"
            )
        definitions.setdefault(node["file"], []).append(
            (start, end, meta_name(matches[0]) or "")
        )

    # Include C-local macros too: they are preprocessor definitions, not calls.
    macro_nodes = sg_json(
        sg,
        "--pattern",
        "#define $NAME($$$PARAMS)",
        paths=HEADER_FILES + C_FILES,
    )
    macros = {name for name in (meta_name(node) for node in macro_nodes) if name}

    call_nodes = sg_json(
        sg,
        "--pattern",
        "$NAME($$$ARGS);",
        "--selector",
        "call_expression",
        paths=C_FILES,
    )
    called: set[str] = set()
    for call in call_nodes:
        name = meta_name(call)
        if not name or not name.isidentifier() or name in macros:
            continue
        if name.startswith("__builtin_"):
            continue
        if containing_definition(definitions, call):
            called.add(name)

    defined = {
        name
        for ranges in definitions.values()
        for _, _, name in ranges
    }
    undefined = sorted(called - defined - PERMANENT_ASM)
    refs = find_include_refs(sg)
    result = [
        {"name": name, "include_asm": include_locations(name, refs)}
        for name in undefined
    ]

    if args.json:
        json.dump(result, sys.stdout, indent=2)
        sys.stdout.write("\n")
    else:
        for item in result:
            locations = ", ".join(
                f"{location['file']}:{location['line']}" for location in item["include_asm"]
            )
            print(f"{item['name']} ({locations})" if locations else item["name"])
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except RuntimeError as error:
        print(f"worklist.py: {error}", file=sys.stderr)
        raise SystemExit(1)
