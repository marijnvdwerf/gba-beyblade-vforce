#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.10"
# dependencies = ["mapfile_parser"]
# ///
"""Build a truthful decomp.dev report from build/rom.map."""

from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "build" / "report.json"
RAM_LO, ROM_LO = 0x02000000, 0x08000000


def n(d, k):
    try:
        return int(d.get(k, 0) or 0)
    except (TypeError, ValueError):
        return 0


def put(d, k, value):
    if value <= 0:
        d.pop(k, None)
    elif k.endswith("functions"):
        d[k] = value
    else:
        d[k] = str(value)


def addr(section):
    try:
        return int((section.get("metadata") or {}).get("virtual_address") or 0)
    except (TypeError, ValueError):
        return 0


def drop_empty_percents(m):
    for total, percents in (
        ("total_code", ("matched_code_percent", "complete_code_percent", "fuzzy_match_percent")),
        ("total_data", ("matched_data_percent", "complete_data_percent")),
        ("total_functions", ("matched_functions_percent",)),
    ):
        if n(m, total):
            continue
        for key in percents:
            m.pop(key, None)


def strip_ram(unit):
    m = unit.setdefault("measures", {})
    ram = 0
    kept = []
    for section in unit.get("sections") or []:
        if RAM_LO <= addr(section) < ROM_LO:
            ram += n(section, "size")
        else:
            kept.append(section)
    unit["sections"] = kept
    if ram:
        put(m, "total_data", max(0, n(m, "total_data") - ram))
        put(m, "matched_data", max(0, n(m, "matched_data") - ram))


def tables_as_data(unit):
    m = unit.setdefault("measures", {})
    code = n(m, "total_code")
    if not code:
        return
    put(m, "total_data", n(m, "total_data") + code)
    for key in ("total_code", "matched_code", "total_functions", "matched_functions"):
        m.pop(key, None)
    unit["functions"] = []


def rollup(units):
    keys = (
        ("total_code", "matched_code", "matched_code_percent"),
        ("total_data", "matched_data", "matched_data_percent"),
        ("total_functions", "matched_functions", "matched_functions_percent"),
    )
    out = {"total_units": len(units)}
    for total_k, matched_k, percent_k in keys:
        total = sum(n(u["measures"], total_k) for u in units)
        matched = sum(n(u["measures"], matched_k) for u in units)
        if not total:
            continue
        put(out, total_k, total)
        put(out, matched_k, matched)
        out[percent_k] = matched * 100.0 / total
        if total_k == "total_code":
            out["fuzzy_match_percent"] = out[percent_k]
    return out


def normalize(report):
    units = []
    for unit in report.get("units") or []:
        name = unit.get("name") or ""
        if name.startswith("asm/audio"):
            continue
        strip_ram(unit)
        if name.startswith("data/"):
            tables_as_data(unit)
        m = unit.get("measures") or {}
        if n(m, "total_code") + n(m, "total_data") == 0:
            continue
        drop_empty_percents(m)
        units.append(unit)
    report["units"] = units
    report["categories"] = []
    report["measures"] = rollup(units)
    report.setdefault("version", 2)


def check(report):
    units = report["units"]
    m = report["measures"]
    assert units, "no units"
    assert n(m, "total_code") and n(m, "total_data"), "missing code or data"
    assert not any((u.get("name") or "").startswith("asm/audio") for u in units)
    assert not any(
        (u.get("name") or "").startswith("data/") and n(u.get("measures") or {}, "total_code")
        for u in units
    )
    for key in ("total_code", "total_data", "total_functions"):
        rolled = sum(n(u.get("measures") or {}, key) for u in units)
        assert n(m, key) == rolled, f"{key} {n(m, key)} != {rolled}"


def main():
    out = Path(sys.argv[1]) if len(sys.argv) > 1 else OUT
    if not out.is_absolute():
        out = ROOT / out
    out.parent.mkdir(parents=True, exist_ok=True)
    subprocess.run(
        [sys.executable, "-m", "mapfile_parser", "objdiff_report", "--quiet", str(out)],
        cwd=ROOT,
        check=True,
    )
    report = json.loads(out.read_text())
    normalize(report)
    check(report)
    out.write_text(json.dumps(report, indent=2) + "\n")
    m = report["measures"]
    print(
        f"{n(m, 'matched_code')}/{n(m, 'total_code')} code, "
        f"{n(m, 'matched_data')}/{n(m, 'total_data')} data, "
        f"{n(m, 'matched_functions')}/{n(m, 'total_functions')} functions"
    )


if __name__ == "__main__":
    main()
