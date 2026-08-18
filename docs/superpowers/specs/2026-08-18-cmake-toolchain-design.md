# Build system rewrite: agbcc as a first-class CMake toolchain, INCLUDE_ASM migration

**Date:** 2026-08-18
**Status:** Draft (pending adversarial review)

## Context and goals

This is a **matching decompilation** of Beyblade V-Force (GBA). The invariant
that must never break: the build produces a ROM with SHA1
`cd527c8c24e20e33913fc45199e64b3e6138a6e5`.

The compile pipeline per C file is fixed by matching requirements:

```
host cc -E  (preprocess)  →  iconv UTF-8→WINDOWS-1252  →  old_agbcc (C→asm)  →  arm-none-eabi-as (asm→obj)
```

Today, `ld_script.ld` (~1250 hand-maintained lines) places objects — and, via
`-ffunction-sections`, *individual C functions* — at exact ROM positions,
interleaved with ~2900 one-function asm dump stubs. This design replaces that
model with the n64-decomp convention: **every ROM code region lives in a C
translation unit**, and not-yet-decompiled functions are pulled in via
`INCLUDE_ASM` at their exact position in the file. The `.text` section then
contains (almost) only C objects in file order, and the linker script
collapses to a short, *generated* file — the manifest becomes "a list of
source files added to the proper sections", which is the end state this
project always wanted.

Goals, in priority order:

1. Byte-identical ROM (hard invariant, verified by CTest after every step of
   the migration).
2. Full INCLUDE_ASM migration: all asm dump stubs referenced from C TUs; ld
   script generated from a manifest.
3. A platform-agnostic `CMakeLists.txt`: sources + flags + targets only; all
   toolchain mechanics live in a toolchain file and one small driver script.
4. Correct incremental builds: header edits and edits to INCLUDE_ASM'd dump
   files must trigger rebuilds.
5. `compile_commands.json` that works with clangd.
6. CI on GitHub Actions verifying the matching build on Linux.
7. objdiff wired up for diffing work-in-progress functions.
8. macOS + Linux. No Windows support.

Non-goals: tool provisioning (agbcc/binutils installation is the user's
problem; the build only *finds* tools and fails clearly), CLion-specific
support, converting `data/` or the asm data files (`asm/data*.s`,
`geometry.s`, audio) to anything else — they stay standalone `.s` inputs.

## Architecture overview

```
CMakeLists.txt                  – project(), source list, flags, targets
CMakePresets.json               – default preset (toolchain, Ninja, build/)
rom.manifest                    – ordered section→entries lists (THE manifest)
cmake/toolchain-agbcc.cmake     – finds tools, wires driver/as/ld into CMake
cmake/gen-ld-script.cmake       – manifest + fragments → build/ld_script.ld
cmake/ld/iwram.ld.in            – hand-written iwram fragment (verbatim)
tools/agbcc                     – POSIX sh compiler driver (cpp→iconv→cc1→as)
tools/migrate_include_asm.py    – one-shot migration script (uv script)
src/include_asm.h               – the INCLUDE_ASM macro
.clangd, .github/workflows/     – tooling & CI
```

Deleted after migration: `scripts/compare.cmake`, the `beyblade_stub` target,
`DEVKITARM`/`GBAFIX` variables, `configure_file` templating, and
`ld_script.ld` itself (replaced by the generated script; kept in git history).

## Component 1: INCLUDE_ASM

`src/include_asm.h`:

```c
#define INCLUDE_ASM(path) __asm__(".include \"" path "\"")
```

Usage in a TU, at top level, at the exact ROM position between C functions:

```c
INCLUDE_ASM("asm/dump/8040d18/8041078.s");
```

Mechanics: GCC 2.x emits top-level `asm()` statements verbatim into its
output `.s`, in source order relative to function definitions. The driver's
assembler stage runs `arm-none-eabi-as -I <repo root>`, which resolves the
`.include`. The dump files already carry their own `.include "asm/common.inc"`
and section state; nothing about them changes. iconv is irrelevant here (the
dump text never passes through the C pipeline).

Ordering rule this creates: **a TU's ROM layout is its source order.** C
functions land in `.text.<name>` subsections, INCLUDE_ASM blocks in plain
`.text` chunks, in emission order; the generated ld script places each object
with a single wildcard `(.text*)`, which GNU ld fills in input-section order.
(Two patterns — `(.text .text.*)` — would group instead of interleave; the
single-pattern form is load-bearing.)

Regions that currently have no C file at all (pure dump runs, e.g. the
tutorial region) get **container TUs** — `src/tutorial.c` consisting of an
include of `include_asm.h` plus INCLUDE_ASM lines. Decompiling a function
becomes: replace its INCLUDE_ASM line with a C definition in place; delete
the dump file when it matches.

The handful of standalone `.s` code inputs that don't belong to any TU
(`asm/crt0.s`, `asm/arm1.s`, `asm/arm2.s`, `asm/audio0.s` if not absorbed)
remain direct manifest entries — the manifest is a list of *files*, C or asm.

## Component 2: manifest + generated ld script

`rom.manifest` — a plain, ordered, comment-friendly text file; one entry per
line, grouped by section:

```
[iwram]     # placement handled by cmake/ld/iwram.ld.in verbatim fragment
[text]
asm/crt0.s
data/7-7/metadata.s
…
src/frontend.c
src/tutorial.c
…
libgcc:_call_via_rX.o
…
src/libc.c
[rodata]
asm/data10.s
…
```

`cmake/gen-ld-script.cmake` (run at configure time, and re-run when the
manifest or the iwram fragment changes) expands this to `build/ld_script.ld`:

- prologue + the `iwram.ld.in` fragment verbatim (the hard-coded gaps and
  `_sub_*` symbols are hand-maintained knowledge, not generated),
- `[text]` entries → `<obj path>(.text*);` in order; `libgcc:member` entries
  → `libgcc.a:member.o(.text);`,
- `[rodata]` entries → `<obj path>(.rodata);`,
- DWARF passthrough + `/DISCARD/ : { *(*) }` epilogue as today.

The manifest is also the **source list**: CMake derives the compile list from
it (no glob, no drift — a file is built iff it is placed). `CONFIGURE_DEPENDS`
globbing dies.

## Component 3: `tools/agbcc` driver

A ~50-line POSIX sh script that presents the fixed 4-stage pipeline as a
normal gcc-style compiler driver, so CMake (and clangd, and a human at a
shell) can treat agbcc as "just a C compiler".

**Interface:**

```
agbcc [options] -c file.c -o file.o
```

- `-I`, `-D`, `-U` → routed to the preprocessor stage (host `cc -E -nostdinc
  -undef`).
- `-MD -MF <file> -MT <target>` → routed to the preprocessor; emits a
  gcc-format depfile. This buys header dependency tracking. **Additionally**
  the driver appends the `.s` files named by INCLUDE_ASM lines to the depfile
  (grep the preprocessed source for `.include` directives inside asm
  statements) — editing a dump stub must rebuild the TU that includes it.
- `--agbcc=<dir>` → agbcc install prefix (locates `bin/old_agbcc`,
  `lib/libgcc.a`). Falls back to `$AGBCC` env var; clear error otherwise.
- `--reset-flags` → clears cc1 flags accumulated so far. Per-file override
  mechanism: `src/libc.c` compiles with *only* `-O2`, and CMake per-source
  `COMPILE_OPTIONS` can only append (they come after target options, so
  `--reset-flags;-O2` yields exactly `-O2`). (Risk R3.)
- Everything else → passed to `old_agbcc` (cc1) verbatim.
- Assembler stage: `arm-none-eabi-as -mcpu=arm7tdmi -I <repo root>` (repo
  root passed by the toolchain via a driver flag, e.g. `--as-include=<dir>`).
- Intermediates kept next to the object (`file.o.i`, `file.o.s`) —
  inspecting agbcc's asm output is a core matching-workflow activity.
- `iconv --from-code=UTF-8 --to-code=WINDOWS-1252` from PATH.
- Any stage failing aborts with that stage's exit code; no partial `.o` left
  behind (write to temp, move on success).

The driver is deliberately self-contained: it must work when invoked by hand
outside CMake.

## Component 4: `cmake/toolchain-agbcc.cmake`

Passed via `-DCMAKE_TOOLCHAIN_FILE=` (in practice: via the preset). Contents:

- `CMAKE_SYSTEM_NAME Generic`, `CMAKE_SYSTEM_PROCESSOR arm`.
- `CMAKE_C_COMPILER` = `tools/agbcc`. Detection skipped:
  `CMAKE_C_COMPILER_WORKS TRUE`, `CMAKE_C_COMPILER_FORCED TRUE`,
  `CMAKE_C_COMPILER_ID GNU` (so CMake emits gcc-style `-MD -MT -MF`
  dependency flags), `CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY`.
- `CMAKE_ASM_COMPILER` = `arm-none-eabi-as` (find_program REQUIRED); rule
  override `CMAKE_ASM_COMPILE_OBJECT "<CMAKE_ASM_COMPILER> <FLAGS> <INCLUDES>
  -o <OBJECT> <SOURCE>"` since raw `as` is not a driver.
- `find_program(REQUIRED)`: `arm-none-eabi-ld`, `arm-none-eabi-objcopy`,
  `iconv`, host `cc`.
- `AGBCC` cache variable (default `$ENV{AGBCC}`), validated; forwarded via
  `--agbcc=` in `CMAKE_C_FLAGS_INIT`.
- Link rule override (Component 6), `CMAKE_C_STANDARD_LIBRARIES ""`.

## Component 5: `CMakeLists.txt`

```cmake
cmake_minimum_required(VERSION 3.21)
project(beybladevforce LANGUAGES C ASM)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include(cmake/gen-ld-script.cmake)   # reads rom.manifest →
                                     #   MANIFEST_C_SOURCES, MANIFEST_ASM_SOURCES,
                                     #   build/ld_script.ld

add_executable(rom ${MANIFEST_C_SOURCES} ${MANIFEST_ASM_SOURCES})
set_target_properties(rom PROPERTIES SUFFIX ".elf")

target_include_directories(rom SYSTEM PRIVATE ${AGBCC}/include)
target_compile_options(rom PRIVATE
    $<$<COMPILE_LANGUAGE:C>:-mthumb-interwork -Wimplicit -Wparentheses
        -Wunused -Werror -O2 -fhex-asm -ffunction-sections>
    $<$<COMPILE_LANGUAGE:ASM>:-mcpu=arm7tdmi -I${CMAKE_SOURCE_DIR}>)
set_source_files_properties(src/libc.c PROPERTIES
    COMPILE_OPTIONS "--reset-flags;-O2")

target_link_options(rom PRIVATE
    -T ${CMAKE_BINARY_DIR}/ld_script.ld -Map rom.map)
set_property(TARGET rom APPEND PROPERTY LINK_DEPENDS
    ${CMAKE_BINARY_DIR}/ld_script.ld)

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

The in-source-build guard stays. The old stub target dies: `rom` carries the
real sources.

## Component 6: linking

Objects are *not* passed on the linker command line: GNU ld opens every file
named in the (generated) script as an input, resolved relative to its CWD.
The build materializes objects at script-matching paths and runs `ld` from
the directory above them. `CMAKE_C_LINK_EXECUTABLE` is a two-command
sequence:

1. `${CMAKE_COMMAND} -DOBJECTS="<OBJECTS>" -DDEST=<bindir>/link -P
   cmake/link-layout.cmake` — hardlinks (copy fallback) each object into
   `<bindir>/link/`, stripping everything up to and including the `*.dir/`
   component → `link/src/tutorial.c.o`, `link/asm/crt0.s.o`, …; also links
   `${AGBCC}/lib/libgcc.a` to `link/libgcc.a`. The script **first clears
   stale entries**: any object in `link/` not in the current `<OBJECTS>` list
   is deleted — a leftover hardlink for a removed source would otherwise be
   silently pulled in by the ld script.
2. `${CMAKE_COMMAND} -E chdir <bindir>/link <LD> <LINK_FLAGS> -o <TARGET>` —
   no `<OBJECTS>` on the ld command line; the script pulls them.

`rom.map` lands in `link/` (documented in README).

## Component 7: migration (`tools/migrate_include_asm.py`)

One-shot, uv-scripted Python; converts the whole tree, verifiable at every
step against the SHA1. Steps:

1. **Parse `ld_script.ld`** into the ordered `[text]`/`[rodata]` entry lists
   (objects, subsection placements, libgcc members, comments preserved where
   feasible).
2. **Chunk `.text`** into TU-sized runs: maximal contiguous spans whose C
   placements all belong to one `.c` file. Dump runs between two different C
   files' spans attach to a chosen side (heuristic: same `asm/dump/<dir>`
   family; overridable). Pure-dump spans become container TUs named after
   their dump directory (`src/frontend.c` for `8040d18`, `src/tutorial.c`,
   `src/debug.c`, …; names confirmed with the user before running).
3. **Verify source order**: for each existing C file, the ld-script order of
   its functions must equal the definition order in the file. Mismatches are
   *reported*, then fixed by mechanically reordering function definitions
   (with user review — this touches real code).
4. **Rewrite the C files**: insert `INCLUDE_ASM("…")` lines at the correct
   positions between function definitions; create container TUs.
5. **Emit `rom.manifest`** ([text] = crt0, level metadata, TUs, standalone
   asm, libgcc members, libc; [rodata] = unchanged file-level list).
6. **Build + compare.** The script supports converting one chunk at a time
   (leaving the rest as direct manifest entries) so a mismatch bisects to a
   single chunk instead of a 2900-file diff.

After the migration lands and matches, the dump `.s` files stop being linker
inputs — they are compile-time includes of their TU. `asm/dump/` stays until
each function is decompiled, exactly as today.

## Component 8: developer experience

- **`CMakePresets.json`**: `default` preset — toolchain file, Ninja,
  `build/`. Entry point: `cmake --preset default && cmake --build build &&
  ctest --test-dir build`. `AGBCC` is the only knob.
- **`compile_commands.json`**: native (real language rules). Checked-in
  **`.clangd`**:

  ```yaml
  CompileFlags:
    Remove: [-fhex-asm, -mthumb-interwork, --agbcc=*, --reset-flags, --as-include=*]
  ```

- **README**: install arm-none-eabi binutils, build pret/agbcc, `export
  AGBCC=…`, run the preset.

## Component 9: objdiff

[objdiff](https://github.com/encounter/objdiff) diffs a *target* (expected)
object against a *base* (current) object per unit. With the INCLUDE_ASM
model, units are simply **one per C translation unit**, and the expected side
uses the **snapshot pattern** common in n64 projects:

- `expected/` (gitignored) mirrors the build's object tree. A CMake target
  `update-expected` — only meaningful after `compare` passes — copies
  `link/src/*.o` into `expected/src/`.
- `objdiff.json` is generated at configure time from the manifest:
  `custom_make: "ninja"`, `custom_args: ["-C", "build"]` (ninja accepts
  output paths as targets, so objdiff rebuilds exactly one object); per unit
  `base_path` = the object in the build tree, `target_path` =
  `expected/src/<file>.o`; `watch_patterns` = `src/**/*.c`, `src/**/*.h`,
  `asm/dump/**/*.s`. Generated into `build/`, symlinked from the repo root
  (gitignored).
- Workflow: after any matching build, refresh the snapshot; while
  reimplementing a function, objdiff shows the per-symbol diff of your TU
  against the last-known-matching object. Symbol matching is by name, so
  untouched functions pair trivially and the WIP one highlights.
- Exact schema field names to be confirmed against current objdiff docs
  during implementation (a research pass on the objdiff repo is running;
  its findings supersede the field spellings above).
- **CI (optional, non-blocking)**: `objdiff-cli` progress report for
  decomp.dev. Not part of acceptance.

## Component 10: GitHub Actions CI

`.github/workflows/build.yml`, one job on `ubuntu-latest`:

1. `apt-get install binutils-arm-none-eabi ninja-build` (iconv, cc are in the
   base image).
2. Build agbcc from `pret/agbcc`, cached via `actions/cache` keyed on a
   pinned agbcc commit (cache hit skips the slow GCC 2.x build). Export
   `AGBCC`.
3. `cmake --preset default && cmake --build build && ctest --test-dir build
   --output-on-failure`.

Policy: the built ROM is copyrighted — **no step uploads `rom.gba` or the ELF
as artifacts**; CI outputs are pass/fail and logs. The agbcc commit is pinned
at the top of the workflow, not `master`.

## Testing / acceptance

0. **Spike gate (before the full migration runs):** convert one small region
   by hand to INCLUDE_ASM; ROM must still match. This validates the two
   critical assumptions: GCC 2.x preserves top-level `asm()` position between
   functions under `-ffunction-sections`, and `as`-resolved same-object
   branches produce the same bytes as the previous link-time resolution.
1. Full pipeline on macOS and Linux (CI): configure, build, `ctest` passes.
2. Incremental correctness: touching a header, a dump stub referenced by
   INCLUDE_ASM, the manifest, or the iwram fragment each rebuilds exactly the
   affected steps; ROM still matches.
3. Flag override: `src/libc.c.o.s` compiled with only `-O2` (byte-compare
   against a reference from the old build).
4. Both Ninja and Unix Makefiles generators produce a matching ROM.
5. clangd opens `src/sound.c` and a container TU without configuration
   errors.
6. objdiff end-to-end: snapshot, perturb a function, objdiff shows the diff
   of exactly that symbol.

## Risks and fallbacks

- **R0 — INCLUDE_ASM byte-compat** (top-level asm ordering in GCC 2.x;
  same-object branch resolution; literal-pool/alignment behavior when many
  stubs share one object). Gated by acceptance step 0 *before* the migration
  script runs at scale. Fallback if it fails: the pivot is off; revert to
  per-object placement (previous revision of this spec).
- **R1 — object path layout** (`CMakeFiles/<target>.dir/…`) is undocumented.
  Contained in `cmake/link-layout.cmake` (strips `*.dir/` generically);
  validated every link — ld fails loudly on a missing input.
- **R2 — forced `CMAKE_C_COMPILER_ID GNU`**: CMake may assume other GNU
  behaviors. Mitigated by `SYSTEM_NAME Generic` + fully overridden link rule;
  covered by acceptance 4.
- **R3 — `--reset-flags` ordering** assumes per-source `COMPILE_OPTIONS`
  follow target options (CMake's documented order); verified by acceptance 3.
  Fallback: separate OBJECT library for libc.c; `link-layout.cmake` already
  merges multiple `.dir` trees.
- **R4 — migration chunking ambiguity**: dumps between two C files' spans
  have two legal homes; wrong choice can't break bytes (order is preserved
  either way) but can be ugly. Heuristic + manual override list in the
  script's input.
- **R5 — function order mismatches** between C files and ld script require
  touching real code (reordering definitions). Script reports; reorders are
  reviewed by the user; SHA1 re-verified per file.
- **R6 — depfile completeness for INCLUDE_ASM**: the driver's `.include`
  scraping must catch all spellings the macro produces (it produces exactly
  one). Nested `.include` inside dump files (`asm/common.inc`) is added
  unconditionally as a dependency of every TU that has any INCLUDE_ASM.
