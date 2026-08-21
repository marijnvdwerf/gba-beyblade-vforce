#!/usr/bin/env -S uv run
# /// script
# requires-python = ">=3.11"
# dependencies = []
# ///
"""Compile one GBA C translation unit and print agbcc diagnostics.

The old agbcc driver emits assembly as a side effect of an ordinary ``-c``
compile.  Its GCC 2.9 diagnostic dumps are also side effects, so this script
runs the compile in a temporary directory and never writes into the project.
"""

from __future__ import annotations

import argparse
import json
import os
from pathlib import Path
import re
import shlex
import subprocess
import sys
import tempfile
from typing import Any, Iterable, Sequence


# These are the dump suffixes emitted by the version of agbcc used by this
# project.  -dl/-dg produce the two allocation dumps; -da produces all of them.
ALL_PASSES: tuple[str, ...] = (
    "rtl",
    "jump",
    "jump2",
    "cse",
    "cse2",
    "gcse",
    "loop",
    "addressof",
    "combine",
    "lreg",
    "regmove",
    "mach",
    "greg",
)
ALLOCATION_PASSES: tuple[str, ...] = ("lreg", "greg")


class ToolError(Exception):
    """An expected command-line or compiler setup error."""


class CompileEntry:
    """The useful parts of one compile_commands.json entry."""

    def __init__(self, raw: dict[str, Any], database: Path) -> None:
        self.directory = Path(raw.get("directory", database.parent)).resolve()
        file_value = raw.get("file")
        if not isinstance(file_value, str):
            raise ToolError(f"compile database entry has no file: {raw!r}")
        self.file = Path(file_value)
        if not self.file.is_absolute():
            self.file = self.directory / self.file
        self.file = self.file.resolve()
        arguments = raw.get("arguments")
        if isinstance(arguments, list) and all(isinstance(x, str) for x in arguments):
            self.arguments = list(arguments)
        else:
            command = raw.get("command")
            if not isinstance(command, str):
                raise ToolError(f"compile database entry has no command: {raw!r}")
            self.arguments = shlex.split(command)


def project_root() -> Path:
    """Return the repository root containing this script."""

    return Path(__file__).resolve().parents[1]


def compile_databases(source: Path) -> list[Path]:
    """Find likely compilation databases, nearest first."""

    roots: list[Path] = []
    for start in (source.parent, project_root(), Path.cwd()):
        current = start.resolve()
        for candidate in (current / "build" / "compile_commands.json", current / "compile_commands.json"):
            if candidate not in roots and candidate.is_file():
                roots.append(candidate)
        for parent in current.parents:
            candidate = parent / "build" / "compile_commands.json"
            if candidate.is_file() and candidate not in roots:
                roots.append(candidate)
    return roots


def load_entries(source: Path) -> list[CompileEntry]:
    """Load all entries from the nearest available compilation database."""

    for database in compile_databases(source):
        try:
            raw_entries = json.loads(database.read_text(encoding="utf-8"))
        except (OSError, json.JSONDecodeError) as exc:
            raise ToolError(f"cannot read {database}: {exc}") from exc
        if not isinstance(raw_entries, list):
            raise ToolError(f"compile database is not a JSON array: {database}")
        entries: list[CompileEntry] = []
        for raw in raw_entries:
            if isinstance(raw, dict):
                try:
                    entries.append(CompileEntry(raw, database))
                except ToolError:
                    continue
        if entries:
            return entries
    raise ToolError(
        "could not find a usable compile_commands.json; run CMake first or put "
        "the source under a project with a build/compile_commands.json"
    )


def path_distance(left: Path, right: Path) -> int:
    """Approximate directory distance between two paths."""

    try:
        common = Path(os.path.commonpath((str(left), str(right))))
    except ValueError:
        return 1000
    return len(left.parts) + len(right.parts) - 2 * len(common.parts)


def choose_entry(source: Path, entries: Sequence[CompileEntry]) -> CompileEntry:
    """Choose an exact, same-name, or nearest C compile command."""

    source = source.resolve()
    exact = [entry for entry in entries if entry.file == source]
    if exact:
        return exact[0]

    def score(entry: CompileEntry) -> tuple[int, int, int]:
        same_name = int(entry.file.name != source.name)
        same_stem = int(entry.file.stem != source.stem)
        return (same_name, same_stem, path_distance(entry.file.parent, source.parent))

    c_entries = [entry for entry in entries if entry.file.suffix == ".c"]
    if not c_entries:
        raise ToolError("compile_commands.json contains no C translation-unit entry")
    return min(c_entries, key=score)


def as_absolute(value: str, directory: Path) -> str:
    """Resolve a compiler path option relative to its compile-command directory."""

    if value.startswith("${") or value.startswith("$") or value.startswith("~"):
        return value
    path = Path(value)
    if path.is_absolute():
        return value
    return str((directory / path).resolve())


def normalize_path_options(arguments: Sequence[str], directory: Path) -> list[str]:
    """Make relative include paths independent of the temporary cwd."""

    result: list[str] = []
    separate_options = {"-I", "-isystem", "-iquote", "-include", "-imacros", "--as-include"}
    index = 0
    while index < len(arguments):
        argument = arguments[index]
        if argument in separate_options and index + 1 < len(arguments):
            result.append(argument)
            result.append(as_absolute(arguments[index + 1], directory))
            index += 2
            continue
        for prefix in ("-I", "-isystem", "-iquote", "--as-include="):
            if argument.startswith(prefix) and argument != prefix:
                result.append(prefix + as_absolute(argument[len(prefix) :], directory))
                break
        else:
            result.append(argument)
        index += 1
    return result


def replace_source_and_output(
    arguments: Sequence[str], entry: CompileEntry, source: Path, output: Path
) -> list[str]:
    """Retarget the compile command to the temporary source and object."""

    result = normalize_path_options(arguments, entry.directory)
    source_indices: list[int] = []
    for index, argument in enumerate(result):
        path = Path(argument)
        if path.suffix != ".c":
            continue
        try:
            if path.resolve() == entry.file or path.name == entry.file.name:
                source_indices.append(index)
        except OSError:
            continue
    if not source_indices:
        source_indices = [index for index, argument in enumerate(result) if argument.endswith(".c")]
    if not source_indices:
        raise ToolError(f"could not find the C source argument in compile command for {entry.file}")
    result[source_indices[-1]] = str(source.resolve())

    for index, argument in enumerate(result):
        if argument == "-o" and index + 1 < len(result):
            result[index + 1] = str(output)
        elif argument.startswith("-o") and len(argument) > 2:
            result[index] = "-o" + str(output)
    # A diagnostic run may target a copied source (for example, a temporary
    # one-loop experiment).  Preserve the original TU's quote-include lookup
    # even though the copied file now lives outside the source directory.
    source_include = str(entry.file.parent)
    result.extend(("-I", source_include))
    if "-o" not in result and not any(argument.startswith("-o") for argument in result):
        result.extend(("-o", str(output)))
    return result


def add_diagnostic_flags(arguments: Sequence[str], all_passes: bool) -> list[str]:
    """Add the old-agbcc diagnostic switches without duplicating them."""

    result = list(arguments)
    wanted = ["-fverbose-asm", "-da" if all_passes else "-dl", "-dg"]
    for flag in wanted:
        if flag not in result:
            result.append(flag)
    return result


def dump_files(work: Path, output: Path) -> dict[str, Path]:
    """Find GCC 2.9 dump files associated with the temporary object."""

    prefix = f".{output.name}.tmp."
    found: dict[str, Path] = {}
    for candidate in work.iterdir():
        if not candidate.name.startswith(prefix) or ".i2." not in candidate.name:
            continue
        pass_name = candidate.name.rsplit(".", 1)[-1]
        if pass_name in ALL_PASSES:
            found[pass_name] = candidate
    return found


def read_text(path: Path) -> str:
    """Read compiler output while tolerating old-tool oddities."""

    try:
        return path.read_text(encoding="utf-8", errors="replace")
    except OSError as exc:
        raise ToolError(f"cannot read compiler output {path}: {exc}") from exc


def slice_rtl(text: str, function: str) -> str:
    """Select a GCC dump's ``;; Function`` section."""

    lines = text.splitlines(keepends=True)
    header = re.compile(r"^;; Function " + re.escape(function) + r"(?:\s*)$")
    starts = [index for index, line in enumerate(lines) if header.match(line.rstrip("\n"))]
    if not starts:
        raise ToolError(f"function {function!r} was not found in an RTL dump")
    start = starts[0]
    end = next(
        (index for index in range(start + 1, len(lines)) if lines[index].startswith(";; Function ")),
        len(lines),
    )
    return "".join(lines[start:end]).rstrip() + "\n"


def slice_assembly(text: str, function: str) -> str:
    """Select one assembly function, including its pool and ``.size`` line."""

    lines = text.splitlines(keepends=True)
    escaped = re.escape(function)
    thumb_start = re.compile(r"^\s*thumb_func_start\s+" + escaped + r"\s*$")
    thumb_end = re.compile(r"^\s*thumb_func_end\s+" + escaped + r"\s*$")
    symbol = re.compile(r"^" + escaped + r":\s*$")
    size = re.compile(r"^\s*\.size\s+" + escaped + r"(?:\s|,)")
    type_line = re.compile(r"^\s*\.type\s+" + escaped + r"\s*,\s*function\s*$")

    start: int | None = None
    for index, line in enumerate(lines):
        if thumb_start.match(line.rstrip("\n")):
            start = index
            break
        if symbol.match(line.rstrip("\n")):
            start = index
            while start > 0 and type_line.match(lines[start - 1].rstrip("\n")):
                start -= 1
            break
    if start is None:
        raise ToolError(f"function {function!r} was not found in generated assembly")

    end = next((index + 1 for index in range(start + 1, len(lines)) if size.match(lines[index].rstrip("\n"))), None)
    if end is None:
        end = next(
            (index for index in range(start + 1, len(lines)) if thumb_end.match(lines[index].rstrip("\n"))),
            None,
        )
    if end is None:
        end = next(
            (
                index
                for index in range(start + 1, len(lines))
                if re.match(r"^\s*\.type\s+\S+\s*,\s*function\s*$", lines[index].rstrip("\n"))
            ),
            len(lines),
        )
    return "".join(lines[start:end]).rstrip() + "\n"


def find_assembly(work: Path, output: Path) -> Path:
    """Find the assembly side effect of an ordinary agbcc compile."""

    expected = Path(str(output) + ".s")
    if expected.is_file():
        return expected
    candidates = sorted(path for path in work.glob("*.s") if path.is_file())
    if len(candidates) == 1:
        return candidates[0]
    raise ToolError("agbcc did not leave a recognizable assembly file in the temporary directory")


def print_section(title: str, text: str) -> None:
    """Print a consistently delimited output section."""

    print(f"\n=== {title} ===")
    print(text, end="" if text.endswith("\n") else "\n")


def parse_args(argv: Sequence[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Compile one C translation unit with agbcc diagnostics in a temporary "
            "directory and print assembly plus allocation dumps."
        ),
        epilog=(
            "Default dumps: .lreg (local allocation) and .greg (global allocation). "
            "With --all-passes, -da additionally exposes .rtl, .jump, .jump2, .cse, "
            ".cse2, .gcse, .loop, .addressof, .combine, .regmove, and .mach. "
            "The old driver rejects -S and -save-temps; ordinary -c emits <object>.s."
        ),
    )
    parser.add_argument("source", type=Path, help="C translation unit to compile")
    parser.add_argument("function", nargs="?", help="function to slice from each output")
    parser.add_argument(
        "--all-passes",
        action="store_true",
        help="also emit every GCC 2.9 pass dump (including .loop)",
    )
    return parser.parse_args(argv)


def run(args: argparse.Namespace) -> int:
    source = args.source.expanduser().resolve()
    if not source.is_file():
        raise ToolError(f"source file does not exist: {source}")
    if source.suffix != ".c":
        raise ToolError(f"source must be a .c file: {source}")

    entries = load_entries(source)
    entry = choose_entry(source, entries)
    with tempfile.TemporaryDirectory(prefix="asm-annotated-") as temporary:
        work = Path(temporary)
        output = work / "unit.o"
        command = replace_source_and_output(entry.arguments, entry, source, output)
        command = add_diagnostic_flags(command, args.all_passes)
        completed = subprocess.run(
            command,
            cwd=work,
            check=False,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
        )
        if completed.returncode != 0:
            if completed.stdout:
                print(completed.stdout, file=sys.stderr, end="")
            if completed.stderr:
                print(completed.stderr, file=sys.stderr, end="")
            raise ToolError(f"agbcc failed with exit status {completed.returncode}")
        if completed.stderr:
            print(completed.stderr, file=sys.stderr, end="")

        assembly = read_text(find_assembly(work, output))
        dumps = dump_files(work, output)
        if args.function:
            assembly = slice_assembly(assembly, args.function)
        print_section(f"assembly: {source.name}" + (f" / {args.function}" if args.function else ""), assembly)

        pass_order: Iterable[str] = ALL_PASSES if args.all_passes else ALLOCATION_PASSES
        for pass_name in pass_order:
            dump = dumps.get(pass_name)
            if dump is None:
                continue
            text = read_text(dump)
            if args.function:
                text = slice_rtl(text, args.function)
            print_section(f"dump: .{pass_name}" + (f" / {args.function}" if args.function else ""), text)
        missing = [name for name in pass_order if name not in dumps]
        if missing:
            print(f"\n[missing dump files: {', '.join('.' + name for name in missing)}]", file=sys.stderr)
    return 0


def main(argv: Sequence[str] | None = None) -> int:
    try:
        return run(parse_args(sys.argv[1:] if argv is None else argv))
    except ToolError as exc:
        print(f"asm-annotated.py: error: {exc}", file=sys.stderr)
        return 2
    except OSError as exc:
        print(f"asm-annotated.py: error: {exc}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
