#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.11"
# dependencies = []
# ///
"""Print the size-sorted reachable decompilation worklist."""

from __future__ import annotations

import argparse
import json
import re
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MARKERS = {"red": "🔴", "yellow": "🟡"}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--color", action="append")
    parser.add_argument("--json", action="store_true", help="emit JSON")
    args = parser.parse_args()
    colors = {color for value in (args.color or ["red", "yellow"]) for color in value.split(",")}
    if not colors <= MARKERS.keys():
        parser.error("--color must contain red or yellow")
    callgraph = subprocess.run(["uv", "run", "tools/callgraph.py", "mainLoop"], cwd=ROOT, capture_output=True, text=True, check=True).stdout
    functions = {}
    for line in callgraph.splitlines():
        for color in colors:
            match = re.search(rf"{MARKERS[color]}\s+(\S+?)(?:\s+\[([^\]]+)\])?\s*$", line)
            if match:
                functions.setdefault(match.group(1), match.group(2) or "")
                break
    mapped = subprocess.run(["uvx", "--from", "mapfile-parser", "mapfile_parser", "jsonify", "-m"], cwd=ROOT, capture_output=True, text=True, check=True)
    sizes = {}
    for segment in json.loads(mapped.stdout)["segments"]:
        for file in segment.get("files", []):
            for symbol in file.get("symbols", []):
                sizes[symbol["name"]] = (symbol.get("size", 0), file.get("filepath", ""))
    rows = []
    for name, tu in functions.items():
        size, filepath = sizes.get(name, (0, ""))
        rows.append((tu or filepath.removesuffix(".o"), size, name))
    rows.sort(key=lambda row: -row[1])
    if args.json:
        print(json.dumps([{"tu": tu, "size": size, "name": name} for tu, size, name in rows]))
    else:
        print("tu\tsize\tname")
        for tu, size, name in rows:
            print(f"{tu}\t{size}\t{name}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
