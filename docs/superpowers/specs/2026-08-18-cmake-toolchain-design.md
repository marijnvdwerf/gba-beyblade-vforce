# Build system rewrite: agbcc as a first-class CMake toolchain

**Date:** 2026-08-18
**Status:** Draft (pending adversarial review)
**Scope:** CMake configuration only. `asm/`, `data/`, `src/` contents and the
overall structure of `ld_script.ld` are out of scope (the ld script gets two
mechanical edits, listed below).

## Context and goals

This is a **matching decompilation** of Beyblade V-Force (GBA). The invariant
that must never break: the build produces a ROM with SHA1
`cd527c8c24e20e33913fc45199e64b3e6138a6e5`.

The compile pipeline per C file is fixed by matching requirements:

```
host cc -E  (preprocess)  →  iconv UTF-8→WINDOWS-1252  →  old_agbcc (C→asm)  →  arm-none-eabi-as (asm→obj)
```

`ld_script.ld` is the true manifest of the ROM: it places objects — and, via
`-ffunction-sections`, *individual C functions* — at exact positions,
interleaved with asm dump stubs. It is treated as a legacy-but-authoritative
input. Long-term (post-decompilation) it will be generated; nothing in this
design may assume it can be restructured now.

Goals, in priority order:

1. Byte-identical ROM (hard invariant, verified by CTest).
2. A platform-agnostic `CMakeLists.txt`: sources + flags + targets only; all
   toolchain mechanics live in a toolchain file and one small driver script.
3. Correct incremental builds: header edits must trigger recompiles (the old
   setup only depended on the `.c` file — a real footgun for matching work).
4. `compile_commands.json` that works with clangd.
5. macOS + Linux. No Windows support.
6. CI on GitHub Actions verifying the matching build on Linux.
7. objdiff wired up for diffing work-in-progress functions.

Non-goals: tool provisioning (agbcc/binutils installation is the user's
problem; the build only *finds* tools and fails clearly), CLion-specific
support, generating the ld script.

## Architecture overview

```
CMakeLists.txt                  – project(), source list, flags, targets
cmake/toolchain-agbcc.cmake     – finds tools, wires driver/as/ld into CMake
tools/agbcc                     – POSIX sh compiler driver (cpp→iconv→cc1→as)
ld_script.ld                    – checked in verbatim (2 mechanical edits)
.clangd                         – makes clangd digest the driver's flags
```

Deleted: `scripts/compare.cmake`, the `beyblade_stub` IDE target, the
`DEVKITARM` cache variable, the `configure_file` templating of the ld script,
the unused `GBAFIX` variable.

## Component 1: `tools/agbcc` driver

A ~50-line POSIX sh script that presents the fixed 4-stage pipeline as a
normal gcc-style compiler driver, so CMake (and clangd, and a human at a
shell) can treat agbcc as "just a C compiler".

**Interface:**

```
agbcc [options] -c file.c -o file.o
```

- `-I`, `-D`, `-U` → routed to the preprocessor stage (host `cc -E
  -nostdinc -undef`).
- `-MD -MF <file> -MT <target>` → routed to the preprocessor; emits a
  gcc-format depfile. This is what buys header dependency tracking.
- `-o`, `-c` → structural.
- `--agbcc=<dir>` → agbcc install prefix (locates `bin/old_agbcc`,
  `lib/libgcc.a`). Falls back to `$AGBCC` env var. Hard error with a clear
  message if neither is set.
- `--reset-flags` → clears cc1 flags accumulated so far on the command line.
  This is the per-file flag-override mechanism: `src/libc.c` must be compiled
  with *only* `-O2` (no `-mthumb-interwork`, no `-ffunction-sections`, …), and
  CMake source-level `COMPILE_OPTIONS` can only *append* to target options.
  Because per-source options come after target options, `--reset-flags -O2` on
  the source property yields exactly `-O2`. (Risk R3 below.)
- Everything else → passed to `old_agbcc` (cc1) verbatim.
- Assembler stage is fixed: `arm-none-eabi-as -mcpu=arm7tdmi` (from PATH).
- Intermediates are kept next to the object (`file.o.i`, `file.o.s`) —
  inspecting agbcc's asm output is a core matching-workflow activity.
- `iconv` from PATH; `--from-code=UTF-8 --to-code=WINDOWS-1252`.
- Any stage failing aborts with that stage's exit code; no partial `.o` left
  behind (write to temp, move on success).

The driver is deliberately self-contained: it must work when invoked by hand
outside CMake, e.g. `tools/agbcc --agbcc=$HOME/agbcc/tools/agbcc -c
src/sound.c -o /tmp/sound.o <flags>`.

## Component 2: `cmake/toolchain-agbcc.cmake`

Passed via `-DCMAKE_TOOLCHAIN_FILE=` (or a `CMakePresets.json` preset — see
Component 5). Contents:

- `CMAKE_SYSTEM_NAME Generic`, `CMAKE_SYSTEM_PROCESSOR arm`.
- `CMAKE_C_COMPILER` = `${CMAKE_CURRENT_LIST_DIR}/../tools/agbcc`.
  Compiler detection is skipped: `CMAKE_C_COMPILER_WORKS TRUE`,
  `CMAKE_C_COMPILER_FORCED TRUE`, `CMAKE_C_COMPILER_ID GNU` (so CMake emits
  gcc-style `-MD -MT <obj> -MF <depfile>` dependency flags),
  `CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY`.
- `CMAKE_ASM_COMPILER` = `arm-none-eabi-as` (find_program, REQUIRED). Since
  `as` is not a driver, override the rule:
  `CMAKE_ASM_COMPILE_OBJECT "<CMAKE_ASM_COMPILER> <FLAGS> <INCLUDES> -o <OBJECT> <SOURCE>"`.
- `find_program(REQUIRED)` for `arm-none-eabi-ld`, `arm-none-eabi-objcopy`,
  `iconv`, and a host `cc` (consumed by the driver via PATH).
- `AGBCC` cache variable (default `$ENV{AGBCC}`); validated to contain
  `bin/old_agbcc` and `lib/libgcc.a`; forwarded to the driver by appending
  `--agbcc=${AGBCC}` to `CMAKE_C_FLAGS_INIT`.
- Link rule override (see Component 4):
  `CMAKE_C_LINK_EXECUTABLE` = the two-command layout+link sequence.
- No standard libraries: `CMAKE_C_STANDARD_LIBRARIES ""`, no default flags.

## Component 3: `CMakeLists.txt`

Roughly:

```cmake
cmake_minimum_required(VERSION 3.21)
project(beybladevforce LANGUAGES C ASM)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

file(GLOB_RECURSE C_SOURCES CONFIGURE_DEPENDS src/*.c)
file(GLOB_RECURSE ASM_SOURCES CONFIGURE_DEPENDS asm/*.s data/*.s)

add_executable(rom ${C_SOURCES} ${ASM_SOURCES})
set_target_properties(rom PROPERTIES SUFFIX ".elf")

target_include_directories(rom SYSTEM PRIVATE ${AGBCC}/include)
target_compile_options(rom PRIVATE
    $<$<COMPILE_LANGUAGE:C>:-mthumb-interwork -Wimplicit -Wparentheses
        -Wunused -Werror -O2 -fhex-asm -ffunction-sections>
    $<$<COMPILE_LANGUAGE:ASM>:-mcpu=arm7tdmi -I${CMAKE_SOURCE_DIR}>)
set_source_files_properties(src/libc.c PROPERTIES
    COMPILE_OPTIONS "--reset-flags;-O2")

target_link_options(rom PRIVATE
    -T ${CMAKE_SOURCE_DIR}/ld_script.ld -Map rom.map)
set_property(TARGET rom APPEND PROPERTY LINK_DEPENDS
    ${CMAKE_SOURCE_DIR}/ld_script.ld)

# rom.gba: objcopy + pad
add_custom_command(TARGET rom POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary --pad-to 0x8800000
            $<TARGET_FILE:rom> ${CMAKE_BINARY_DIR}/rom.gba)

# verification
enable_testing()
add_test(NAME rom-matches
    COMMAND ${CMAKE_COMMAND} -E sha1sum ${CMAKE_BINARY_DIR}/rom.gba)
set_tests_properties(rom-matches PROPERTIES PASS_REGULAR_EXPRESSION
    "^cd527c8c24e20e33913fc45199e64b3e6138a6e5")
add_custom_target(compare
    COMMAND ${CMAKE_CTEST_COMMAND} --output-on-failure -R rom-matches
    DEPENDS rom)
```

Notes:

- GLOB with `CONFIGURE_DEPENDS` is kept deliberately (status quo). The ld
  script governs placement; an unplaced file falls into `/DISCARD/`, which is
  the existing, accepted semantics. When the ld script becomes generated, the
  manifest replaces the glob.
- In-source-build guard stays.
- The old stub target dies: `rom` itself carries the sources, so tooling that
  reads CMake targets sees them natively.

## Component 4: linking against the ld script

**How linking works today (and must keep working):** the objects are *not*
passed on the linker command line. GNU ld opens every file named in
`ld_script.ld` (`src/sound.c.o`, `asm/crt0.s.o`, …) as an input, resolved
relative to the linker's CWD. The build must therefore materialize objects at
paths matching the script's filespecs, and run `ld` from the directory above
them.

CMake places objects at `CMakeFiles/rom.dir/<source-path>.o` — the right
shape, wrong root, and an undocumented internal layout. To keep
`ld_script.ld` free of CMake internals, `CMAKE_C_LINK_EXECUTABLE` is a
two-command sequence:

1. `${CMAKE_COMMAND} -DOBJECTS="<OBJECTS>" -DDEST=<bindir>/link -P
   cmake/link-layout.cmake` — hardlinks (falls back to copy) each object into
   `<bindir>/link/`, stripping everything up to and including the
   `*.dir/` component, yielding `link/src/sound.c.o`, `link/asm/crt0.s.o`, …
   Also links `${AGBCC}/lib/libgcc.a` to `link/libgcc.a`. Hardlinks make the
   step near-free and inherently incremental (`copy_if_different` semantics).
2. `${CMAKE_COMMAND} -E chdir <bindir>/link <LD> <LINK_FLAGS> -o <TARGET>`
   — note: no `<OBJECTS>` on the ld command line; the script pulls them.

**Mechanical edits to `ld_script.ld`** (the only ones):

1. `${LIBGCC_A}:member.o` → `libgcc.a:member.o` (14 occurrences). This is
   what kills `configure_file`: the script becomes a plain static file —
   exactly the shape a future generator would emit.
2. No other edits. `src/…`, `asm/…`, `data/…` filespecs already match the
   layout produced by step 1.

`rom.map` lands in `link/`; acceptable (documented in README).

## Component 5: developer experience

- **`CMakePresets.json`** (checked in): a `default` preset wiring the
  toolchain file, `Ninja` generator, and binary dir `build/`. Entry point
  becomes: `cmake --preset default && cmake --build build && ctest --test-dir
  build`. The `AGBCC` cache variable remains the only knob.
- **`compile_commands.json`**: produced natively by CMake since compilation
  now goes through real language rules. A checked-in **`.clangd`**:

  ```yaml
  CompileFlags:
    Remove: [-fhex-asm, -mthumb-interwork, --agbcc=*, --reset-flags]
  ```

  clangd treats the unknown `tools/agbcc` driver as gcc-compatible and parses
  `-I`/`-D` normally; the `Remove` list drops flags clang would reject.
- **README** gains a short "building" section: install arm-none-eabi
  binutils, build pret/agbcc, `export AGBCC=…`, run the preset.

## Component 6: GitHub Actions CI

`.github/workflows/build.yml`, one job on `ubuntu-latest`:

1. `apt-get install binutils-arm-none-eabi ninja-build` (iconv and cc are in
   the base image).
2. Build agbcc from `pret/agbcc`, cached with `actions/cache` keyed on the
   pinned agbcc commit hash — a cache hit skips the (slow) GCC 2.x build
   entirely. Export `AGBCC` for later steps.
3. `cmake --preset default && cmake --build build && ctest --test-dir build
   --output-on-failure`.

Policy points:

- CI is the second platform required by acceptance test 1 — Linux
  verification stops being manual.
- The built ROM is copyrighted content: **no step uploads `rom.gba` (or the
  ELF) as an artifact**. CI's only outputs are pass/fail and logs.
- The agbcc commit is pinned in the workflow (a variable at the top), not
  `master` — matching builds must not drift because upstream moved.

## Component 7: objdiff integration

[objdiff](https://github.com/encounter/objdiff) diffs a *target* object (the
expected original) against a *base* object (the current build), per unit,
rebuilding bases automatically via `custom_make`.

The repo-specific twist: there is no natural per-C-file expected object. The
originals exist as one-function-per-file stubs under `asm/dump/`, interleaved
with C placements in the ld script — and a stub is deleted precisely when its
function is decompiled, so fully-matched C files have no original asm left in
the tree. Diffing those is pointless anyway (the ROM hash already proves
them); objdiff's value here is for **work-in-progress functions**, whose dump
stubs are still present by definition.

Design:

- **`objdiff-units.txt`** (checked in, hand-maintained, small): the WIP
  mapping. One line per active unit:
  `src/foo.c : asm/dump/<dir>/<a>.s asm/dump/<dir>/<b>.s …` — the dump stubs
  whose functions `foo.c` is currently reimplementing. Only files being
  actively worked on appear here; the file is usually a handful of lines.
- For each unit, CMake adds a **target-object rule**: assemble each listed
  dump stub and merge them with `arm-none-eabi-ld -r` into
  `build/expected/src/foo.c.o`. objdiff matches symbols by name across
  objects, so the merged stub object and the C object pair up per-function;
  unmatched symbols (already-matched functions with no remaining stub) are
  simply not diffed.
- **`objdiff.json`** is generated at configure time from `objdiff-units.txt`
  by CMake (`file(GENERATE)`), with:
  - `custom_make: "ninja"`, `custom_args: ["-C", "build"]` — ninja accepts
    output paths as targets, so objdiff can rebuild exactly one object.
  - per unit: `base_path` = the C object in the build tree, `target_path` =
    `build/expected/src/foo.c.o`, `build_target: true`.
  - `watch_patterns`: `src/**/*.c`, `src/**/*.h`, `asm/dump/**/*.s`.
  - `build/objdiff.json` is where it lands; `objdiff.json` at the repo root
    is a gitignored symlink created at configure time (objdiff expects it at
    the project root).
- **CI (optional step, non-blocking)**: `objdiff-cli report generate` for
  progress metrics. Not part of the acceptance criteria; listed so the
  workflow leaves room for it.

Deliberately out of scope: generating expected objects for *finished* files
from the baseline ROM + map (only becomes cleanly possible once the ld script
is generated from a manifest — same milestone).

## Testing / acceptance

1. `cmake --preset default && cmake --build build && ctest --test-dir build`
   passes (SHA1 match) on macOS. Same commands verified on Linux (CI or
   container) before this design is called done.
2. Incremental correctness: `touch src/sound.h` (any header) → dependent
   objects rebuild; ROM still matches.
3. Flag override: confirm `src/libc.c.o.s` in the build tree is compiled with
   only `-O2` (byte-compare against a reference from the old build).
4. Both Ninja and Unix Makefiles generators produce a matching ROM.
5. clangd opens `src/sound.c` with no configuration errors and resolves
   `#include`s.

## Risks and fallbacks

- **R1 — object path layout** (`CMakeFiles/<target>.dir/…`) is undocumented.
  Mitigated: the assumption lives in exactly one place
  (`cmake/link-layout.cmake`, which strips up to `*.dir/` generically rather
  than hardcoding the prefix) and is validated every build by the link step
  itself failing loudly (ld: cannot open `src/foo.c.o`) if the layout shifts.
- **R2 — `CMAKE_C_COMPILER_ID GNU` forced without detection**: CMake might
  make other GNU-flavored assumptions (e.g. `-rdynamic` on link). Mitigated:
  the link rule is fully overridden, `CMAKE_SYSTEM_NAME Generic` disables
  most host assumptions; acceptance test 4 covers both generators.
- **R3 — `--reset-flags` ordering** assumes per-source `COMPILE_OPTIONS`
  appear after target-level options on the command line. This is CMake's
  documented order, but it is verified explicitly by acceptance test 3.
  Fallback: compile `libc.c` in a tiny separate OBJECT library with its own
  flags and teach `link-layout.cmake` to merge both object trees (the
  path-stripping already makes this work without touching the ld script).
- **R4 — `cmake -E sha1sum` output format** must start with the hash for the
  regex; true for all supported CMake versions (`<hash>  <file>`).
- **R5 — depfile paths**: the host `cc -E -MD` emits paths relative to its
  CWD; CMake needs them to resolve against the build dir. The driver passes
  `-MT <object>` through verbatim, which CMake supplies; verified by
  acceptance test 2.
