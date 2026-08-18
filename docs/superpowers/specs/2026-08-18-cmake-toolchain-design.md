# Build system rewrite: agbcc as a first-class CMake toolchain, INCLUDE_ASM migration

**Date:** 2026-08-18
**Status:** Draft v3 — post adversarial review (gpt-5.6-sol), simplified per
review findings: `-ffunction-sections` dropped, dumps transformed for
inclusion, all toolchain-side blockers addressed.

## Context and goals

This is a **matching decompilation** of Beyblade V-Force (GBA). The invariant
that must never break: the build produces a ROM with SHA1
`cd527c8c24e20e33913fc45199e64b3e6138a6e5`.

The compile pipeline per C file is fixed by matching requirements:

```
host cc -E  (preprocess)  →  iconv UTF-8→WINDOWS-1252  →  old_agbcc (C→asm)  →  arm-none-eabi-as (asm→obj)
```

Today, `ld_script.ld` (~1250 hand-maintained lines) places objects and — via
`-ffunction-sections` — individual C functions at exact ROM positions,
interleaved with ~2900 one-function asm dump stubs. **`-ffunction-sections`
was only ever a workaround for not having INCLUDE_ASM**: it provided
link-time granularity to skip not-yet-matched functions. This design replaces
that model with the n64-decomp convention: every ROM code region lives in a C
translation unit, not-yet-decompiled functions are pulled in via
`INCLUDE_ASM` at their exact source position, `-ffunction-sections` is
dropped, each TU emits **one plain `.text` whose internal layout is source
order**, and the linker script collapses to a short, checked-in,
hand-maintained file — one `(.text)` placement per file. This is also closer to how the original was
built (one `.text` per TU; the level `metadata.s` files defaulting into
`.text` are the same phenomenon).

Goals, in priority order:

1. Byte-identical ROM (hard invariant, verified after every migration step).
2. Full INCLUDE_ASM migration: all dump stubs referenced from C TUs;
   `-ffunction-sections` removed; the ld script collapses to a short,
   hand-maintained, checked-in file (~100 file-level lines).
3. A **platform-agnostic `CMakeLists.txt`**: project + source list + include
   of the platform layer. Everything GBA — the ld script, agbcc flags,
   objcopy, the SHA1 gate — lives in the toolchain file and
   `cmake/gba.cmake`; a future port would supply a different toolchain and
   simply not use the ld file.
4. Correct incremental builds: header edits, dump edits, tool changes each
   rebuild exactly what they should.
5. `compile_commands.json` that works with clangd.
6. CI on GitHub Actions verifying the matching build on Linux.
7. objdiff wired up for diffing work-in-progress functions.
8. macOS + Linux. No Windows support.

Non-goals: tool provisioning; CLion support; converting `data/` or the asm
data files (`asm/data*.s`, `geometry.s`, audio) — they stay standalone `.s`.

## Architecture overview

```
CMakeLists.txt                  – project() + source list + include(gba.cmake)
                                  (platform-neutral; nothing GBA in it)
CMakePresets.json               – 'default' preset (toolchain, Ninja, build/)
ld_script.ld                    – checked in, hand-maintained; THE GBA layout
                                  (post-migration: ~100 file-level lines)
cmake/toolchain-agbcc.cmake     – finds tools, wires drivers into CMake
cmake/gba.cmake                 – the GBA platform layer: matching flags,
                                  ld script wiring, rom.gba, SHA1 test, objdiff
tools/agbcc                     – POSIX sh compiler driver (cpp→iconv→cc1→as)
tools/gba-link                  – POSIX sh linker driver (stage objects, run ld)
tools/objdiff-build             – 3-line ninja wrapper for objdiff
tools/migrate_include_asm.py    – migration tool (uv script)
src/include_asm.h               – the INCLUDE_ASM macro
.clangd, .github/workflows/     – tooling & CI
```

Deleted after migration: `scripts/compare.cmake`, `beyblade_stub`,
`DEVKITARM`/`GBAFIX`, `configure_file` templating, `-ffunction-sections`.
`ld_script.ld` is NOT deleted — it is rewritten (once, by the migration tool)
into the short per-file form and stays the hand-maintained platform artifact.
A port would supply a different toolchain + platform layer and never touch
it.

## Component 1: INCLUDE_ASM and the dump transformation

`src/include_asm.h`, modeled on splat's reference implementation
(`test/basic_app/expected/include/include_asm.h`):

```c
#ifndef INCLUDE_ASM_H
#define INCLUDE_ASM_H

#if defined(M2CTX) || defined(PERMUTER)
/* context generators / decomp.me permuter parse the TU without the asm */
#define INCLUDE_ASM(path)
#else
#define INCLUDE_ASM(path) __asm__(".text\n.include \"" path "\"")
#endif

#endif
```

Two splat conventions adopted:

- **The macro selects `.text` explicitly.** Even without
  `-ffunction-sections` the current gas section at an arbitrary top-level
  position isn't guaranteed to be `.text` (agbcc emits `.rodata` blocks for
  string/const data and switches back around functions); one directive makes
  every include position-independent, including container TUs.
- **No-op fallback under `M2CTX`/`PERMUTER`**, so decomp.me context
  generation and the permuter can consume TUs without the assembly.

Used at top level, at the exact ROM position between C function definitions.
GCC 2.x emits top-level `asm()` verbatim into its output `.s`, in source
order relative to functions; everything — functions and included dump text
alike — flows into one plain `.text` in emission order. The driver's
assembler stage resolves the `.include` via `-I <repo root>`.

**Dump transformation** (one-time, part of migration; the review proved
unchanged dumps cannot be textually merged):

1. Make `common.inc` multiple-inclusion-safe with a gas include guard
   (`.ifndef _COMMON_INC_GUARD` … `.endif` — the pattern splat's `macro.inc`
   uses), instead of stripping the `.include "asm/common.inc"` line from 956
   dumps. One-file change, and — decisively — dumps remain **individually
   assemblable**, which the `.L`-rename pipeline (standalone `as -L` per
   dump) and any per-dump tooling depend on.
2. Rename every file-local `.L<n>` label (definitions and references) to a
   globally unique, information-carrying name: **`.L<ROM address>`**
   (e.g. `.L805795C`). Pipeline (validated hands-on against the real
   `build/rom.map` and a real dump): per-dump base = the dump's `.text`
   **VMA** from the linker map of a known-matching build (VMA, not VROM —
   labels carry the CPU address); label offsets = assemble the dump
   standalone with `arm-none-eabi-as -L` (without `-L`, gas discards `.L`
   locals) and read `arm-none-eabi-nm -a -n`; label address = base + offset.
   Map parsing uses a **bespoke ~20-line GNU-map regex parser** (research
   verdict: `mapfile-parser` v2.13.0 parses this map fine and stays useful
   for validation/JSON export, but it silently omits zero-sized sections and
   misses linker-script assignment symbols — the bespoke parser keeps those
   diagnostics). The rewrite covers all reference forms (branch operands,
   data directives, expressions); the tool refuses a dump it cannot rewrite
   completely, and explicitly reports: dumps with no map row (26 exist
   today), zero-sized map rows (e.g. `806513e.s.o` — its code lives in
   `8065108.s.o`, one object holding two functions), and any dump whose
   global-symbol count ≠ 1 rather than assuming one function per file.

Regions with no C file yet get **container TUs** named *numerically by their
start ROM address* — `src/code_8040d18.c`, `src/code_804a388.c`, … (matching
the `asm/dump/<addr>` convention). Deliberately NOT semantic names: the
region boundaries don't correspond to known original TUs yet, and moving
functions out of an address-named file later beats living with a wrongly
named one. Semantic naming happens per-file, later, when a region's identity
is actually understood.
Decompiling a function = replace its INCLUDE_ASM line with a C definition in
place; delete the dump when it matches. Standalone `.s` code inputs that stay
outside TUs (`asm/crt0.s`, `asm/arm1.s`, `asm/arm2.s`, audio) remain direct
sources with their own ld-script placement lines.

**Single-owner invariant (transactional):** at every migration step, each
dump is either a directly placed object (own ld-script line) or referenced
by exactly one INCLUDE_ASM — never both, never neither. The migration tool validates this
globally before and after each converted chunk and refuses to proceed on
violations (duplicate/missing symbols are the failure it prevents).

## Component 2: the ld script (checked in, hand-maintained)

No manifest, no generator. `ld_script.ld` stays a checked-in file — it *is*
the GBA layout, and only the GBA build consumes it. The migration rewrites it
once into the short per-file form (~100 lines):

```
INPUT(libgcc.a)                        /* ld does NOT open archives merely
                                          named in filespecs (review-verified);
                                          plain objects it does */
SECTIONS {
    . = 0x3000000;
    iwram (NOLOAD) : { … }             /* hand-maintained gaps/symbols,
                                          unchanged from today */
    . = 0x8000000;
    .text : {
        asm/crt0.s.o(.text);
        data/7-7/metadata.s.o(.text);
        …
        src/code_8040d18.c.o(.text);
        src/code_804a388.c.o(.text);
        …
        libgcc.a:_call_via_rX.o(.text);
        …
        src/libc.c.o(.text);
    }
    .rodata : { … }                    /* per-file, as today */
    /* DWARF passthrough + /DISCARD/ : { *(*) } as today */
}
```

Adding a TU = one source-list line in CMake + one placement line here. The
two lists can drift exactly as far as today (an unplaced object falls into
`/DISCARD/`); a small optional configure-time check greps the ld script and
warns about sources with no placement line. `LINK_DEPENDS` covers rebuild on
edit.

## Component 3: `tools/agbcc` compiler driver

POSIX sh; presents the 4-stage pipeline as a gcc-style driver.

```
agbcc [options] -c file.c -o file.o
```

- `-I`, `-D`, `-U` → preprocessor stage (host cc `-E -nostdinc -undef`).
- `-MD -MF <file> -MT <target>` → preprocessor emits the C-side depfile.
  The **assembler stage additionally runs `as --MD <tmp>`** and the driver
  merges both into the final depfile — this natively captures INCLUDE_ASM'd
  dumps, nested includes (`common.inc`), and `.incbin` payloads, instead of
  the fragile "grep the preprocessed source" approach.
- Tool paths: `--cpp=`, `--iconv=`, `--cc1=`, `--as=` (absolute paths passed
  by the toolchain from its `find_program` results — configure-time discovery
  and build-time execution use the same binaries). Standalone invocation
  falls back to `$AGBCC` + PATH.
- `--reset-flags` → clears accumulated cc1 flags; per-source override for
  `src/libc.c` (`--reset-flags;-O2`), which per-source `COMPILE_OPTIONS`
  appends after target options (documented CMake order; verified by
  acceptance test).
- Everything else → old_agbcc verbatim.
- Assembler stage: `<as> -mcpu=arm7tdmi -I <repo root>` (`--as-include=`).
- **Atomicity**: all outputs — `.o`, kept intermediates `.o.i` / `.o.s`, and
  the depfile — are written to temp names and moved into place only as one
  successful completion; on failure temps are removed and no output is
  touched. Intermediates are registered via `ADDITIONAL_CLEAN_FILES`.

## Component 4: `cmake/toolchain-agbcc.cmake`

- `CMAKE_SYSTEM_NAME Generic`, `CMAKE_SYSTEM_PROCESSOR arm`.
- Forced compiler, done completely: `CMAKE_C_COMPILER` = `tools/agbcc`,
  `CMAKE_C_COMPILER_ID GNU`, **`CMAKE_C_COMPILER_ID_RUN TRUE`** (without it
  CMake clears the ID and re-runs identification against a driver that can't
  answer), `CMAKE_C_COMPILER_WORKS TRUE`, `CMAKE_C_COMPILER_FORCED TRUE`,
  `CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY`.
- **`CMAKE_C_OUTPUT_EXTENSION ".o"` and `CMAKE_ASM_OUTPUT_EXTENSION ".o"`**
  — `Generic` defaults to `.obj` (review finding), which would break every
  generated filespec.
- `CMAKE_ASM_COMPILER` = `arm-none-eabi-as`; rule override
  `CMAKE_ASM_COMPILE_OBJECT "<CMAKE_ASM_COMPILER> <FLAGS> <INCLUDES> -o
  <OBJECT> <SOURCE>"`.
- `find_program(REQUIRED)`: ld, objcopy, iconv, host cc, as; results injected
  into the driver command line via rule variables (not `CMAKE_C_FLAGS_INIT`,
  which caches once and goes stale when `AGBCC` changes — review finding).
- `AGBCC` cache var (default `$ENV{AGBCC}`), validated for `bin/old_agbcc`
  and `lib/libgcc.a`.
- **Flag hygiene**: this is a canonical matching build — the toolchain file
  hard-sets `CMAKE_C_FLAGS`, `CMAKE_ASM_FLAGS`, per-config flag variables,
  and link flags to empty/known values and warns if the environment supplied
  `CFLAGS`/`ASMFLAGS`. Unknown flags must never leak into old_agbcc.
- `CMAKE_C_STANDARD_LIBRARIES ""`; link rule = `tools/gba-link` (Component
  6).

## Component 5: `CMakeLists.txt` + `cmake/gba.cmake`

`CMakeLists.txt` is deliberately boring — nothing in it says "GBA". Flags,
the ld script, objcopy, the SHA1 gate: all of that is platform, not project
(the `target_compile_options` block from earlier drafts was platform-specific
and moves out):

```cmake
cmake_minimum_required(VERSION 3.21)
project(beybladevforce LANGUAGES C ASM)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(rom
    src/main.c
    src/sound.c
    src/code_8040d18.c
    …                       # the full, explicit source list (no glob)
    asm/crt0.s
    asm/audio0.s
    data/1-1/metadata.s
    …
)

include(cmake/gba.cmake OPTIONAL)   # no-op for a future non-GBA toolchain
```

`cmake/gba.cmake` — the platform layer (guarded so it only applies under the
agbcc toolchain):

```cmake
set_target_properties(rom PROPERTIES SUFFIX ".elf")

# agbcc headers: C-only, plain -I routed to the preprocessor. NOT `SYSTEM`
# (would become -isystem, which neither old_agbcc nor raw `as` accepts) and
# NOT target-wide (must not leak into ASM compiles).
target_compile_options(rom PRIVATE
    "$<$<COMPILE_LANGUAGE:C>:-I${AGBCC}/include;-mthumb-interwork;-Wimplicit;-Wparentheses;-Wunused;-Werror;-O2;-fhex-asm>"
    "$<$<COMPILE_LANGUAGE:ASM>:-mcpu=arm7tdmi;-I${CMAKE_SOURCE_DIR}>")
set_source_files_properties(src/libc.c PROPERTIES
    COMPILE_OPTIONS "--reset-flags;-O2")

target_link_options(rom PRIVATE -T ${CMAKE_SOURCE_DIR}/ld_script.ld)
set_property(TARGET rom APPEND PROPERTY LINK_DEPENDS
    ${CMAKE_SOURCE_DIR}/ld_script.ld ${AGBCC}/lib/libgcc.a)

# rom.gba is a real output with its own dependency edge (POST_BUILD would
# neither recreate a deleted rom.gba nor rerun after a failed objcopy).
add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/rom.gba
    COMMAND ${CMAKE_OBJCOPY} -O binary --pad-to 0x8800000
            $<TARGET_FILE:rom> ${CMAKE_BINARY_DIR}/rom.gba
    DEPENDS rom)
add_custom_target(rom_gba ALL DEPENDS ${CMAKE_BINARY_DIR}/rom.gba)

enable_testing()
add_test(NAME rom-matches
    COMMAND ${CMAKE_COMMAND} -E sha1sum ${CMAKE_BINARY_DIR}/rom.gba)
set_tests_properties(rom-matches PROPERTIES PASS_REGULAR_EXPRESSION
    "^cd527c8c24e20e33913fc45199e64b3e6138a6e5")
add_custom_target(compare
    COMMAND ${CMAKE_CTEST_COMMAND} --output-on-failure -R rom-matches
    DEPENDS rom_gba)
```

Notes: generator expressions are single quoted arguments with
semicolon-separated options (unquoted space-separated forms are malformed —
review finding). Genex-quoting, flags, and every compile command are verified
by inspecting the generated Ninja/Make rules and `compile_commands.json`, not
just by configure succeeding. C objects additionally depend on the driver
script and `old_agbcc` via `OBJECT_DEPENDS`/a toolchain stamp file (hash of
driver + cc1 + as), so tool changes invalidate objects. The in-source-build
guard stays. Source order in `add_executable` is irrelevant (the ld script
orders); keeping the list roughly ROM-ordered anyway aids humans.

## Component 6: linking — `tools/gba-link`

Objects are not passed to ld: GNU ld opens plain object files named in the
script relative to its CWD (archives it does not — hence `INPUT(libgcc.a)`).
The build stages objects at script-matching paths and links from the staging
root.

`CMAKE_C_LINK_EXECUTABLE` invokes a single linker-driver script (no `<LD>`
pseudo-placeholder, no `-DOBJECTS="…"` string smuggling — both review
findings):

```
tools/gba-link --ld=<abs ld> --script=<abs ld_script> --out=<abs TARGET>
               --map=<abs map> --libgcc=<abs libgcc.a> --stage=<bindir>/link
               <OBJECTS>
```

- Objects arrive as ordinary argv; the script handles CMake **response files**
  (`@file`) since large object lists get one on both generators.
- `--out` is resolved to an absolute path *before* any chdir, so the ELF
  lands exactly where CMake declared it (`build/rom.elf`); `rom.map` goes to
  `build/rom.map` the same way.
- **Staging is rebuilt fully on every link**: fresh temp directory, hardlink
  (copy fallback) every object to its `*.dir/`-stripped path plus
  `libgcc.a`, atomically swap into `<bindir>/link`. This fixes both staleness
  classes the review found: removed sources leaving live hardlinks, and —
  worse — recompiled objects whose atomic-rename created a *new inode* while
  the old hardlink kept feeding ld the previous bytes (a silent false-match
  generator). Staging cost is hardlinks; negligible.
- Then `cd` into the staging dir and exec
  `<ld> -T <script> -Map <map> -o <out>`.
- The `CMakeFiles/<target>.dir/` prefix-stripping is the single place the
  undocumented object layout is assumed; a missing staged file makes ld fail
  loudly.

## Component 7: migration (throwaway script)

The migration is a **one-shot, disposable** uv-scripted Python tool. It does
not need to be robust, resumable, or preserved: git is the undo button, and
the SHA1 is a perfect oracle — duplicate symbols fail the link loudly,
missing/misplaced code fails the hash. Worst case: it fails, we revert, we
fix the script, we rerun. What it does:

1. Rename `.L` labels in all dumps to `.L<ROM address>` (Component 1
   mechanics: map VMA base + `as -L`/`nm` offsets); guard `common.inc`.
2. Parse the old `ld_script.ld`; chunk `.text` into TU-sized runs. Ownership
   rule, deterministic, no heuristic: a dump run goes **inside an existing
   TU only when it sits between two placements of that same TU** (e.g. the
   dumps between `layer.c`'s clusters). A dump run between two *different*
   TUs — or touching none — becomes its own address-named container TU.
   Existing TUs never absorb neighboring code they don't already surround.
3. Where a C file's ld-script function order ≠ its definition order, reorder
   the definitions (this touches real code — eyeball the diff, then let the
   hash judge).
4. Write the TUs (INCLUDE_ASM lines inserted / container TUs created), the
   short ld script, and the CMake source list.
5. Build. `ctest`. Matching → commit the result, delete or archive the
   script. Not matching → debug or `git checkout .` and rerun.

The **spike gate** (acceptance 0) still runs first — it's cheap and it
de-risks writing the script at all. Chunk-at-a-time conversion, dry-run
plans, override files, and transactional invariants from earlier drafts are
dropped as overengineering; if the one-shot run mismatches and the cause
isn't obvious, bisecting by rerunning the script on half the chunks is a
debugging *technique*, not a designed-in feature.

## Component 8: developer experience

- `CMakePresets.json`: `default` = toolchain + Ninja + `build/`. Entry point:
  `cmake --preset default && cmake --build build && ctest --test-dir build`.
  `build/` under the `default` preset is the **canonical build directory**;
  objdiff and expected-snapshots are defined against it.
- `compile_commands.json`: native. Checked-in `.clangd` does more than strip
  flags (review finding — clangd needs a target and dialect, not just the
  absence of unknown flags):

  ```yaml
  CompileFlags:
    Compiler: clang
    Remove: [-fhex-asm, -mthumb-interwork, --reset-flags, --agbcc=*, --cpp=*, --iconv=*, --cc1=*, --as=*, --as-include=*]
    Add: [--target=arm-none-eabi, -mcpu=arm7tdmi, -mthumb, -std=gnu89, -fno-builtin]
  ```

  Validated on real files (diagnostics, include resolution, type sizes), not
  just "clangd starts".
- README: install binutils, build pret/agbcc, `export AGBCC=…`, preset.

## Component 9: objdiff

Units = one per C TU; expected side = snapshot of last-known-matching
objects. Schema per objdiff v3.8.0 (`config.schema.json`, researched):

- `objdiff.json` generated at the **repo root** (required location; all paths
  project-root-relative), gitignored, and **only for the canonical `default`
  preset**: the generator refuses to (re)write it from a non-canonical binary
  dir, so a second build directory can't repoint it (review finding).
- `min_version: "3.0.0"`; `options: {"arm.archVersion": "v4t"}`.
- Per unit: `target_path: "expected/src/<file>.o"`, `base_path:
  "build/CMakeFiles/rom.dir/src/<file>.o"`, `metadata: {source_path,
  progress_categories}`; `build_base: true`, `build_target: false`.
- Rebuilds: objdiff runs `<custom_make> <custom_args…> <base_path>` from the
  repo root; `base_path` is root-relative while ninja runs in `build/`, so
  `custom_make` = `tools/objdiff-build`, which canonicalizes against the repo
  root, rejects paths outside `build/`, strips the prefix, and execs
  `ninja -C build <target>` with proper quoting; clear error if the target
  doesn't exist.
- `watch_patterns`: `src/**/*.c`, `src/**/*.h`, `asm/dump/**/*.s`,
  `ld_script.ld`; default `ignore_patterns` (`build/**/*`) kept.
- **`update-expected` enforces its own gate** (review finding: "only
  meaningful after compare" as documentation is how baselines get poisoned):
  it runs the SHA1 comparison itself, enumerates objects from the CMake source
  list (not a glob), verifies all exist, snapshots into a temp dir with metadata
  (ROM SHA1, git commit, ld-script hash, toolchain stamp), and atomically
  replaces `expected/`. A missing snapshot produces a "run update-expected
  after a matching build" message, not an objdiff file-not-found.
- **Progress reporting (decomp.dev)** — via `mapfile_parser objdiff_report`
  (researched hands-on against `build/rom.map`; it emits objdiff report
  schema v2, works on this GNU ARM map, and is preferred over its legacy
  `progress` subcommand, which has a broken `.text` filter and a path-index
  failure mode on this repo's shallow paths — `-i 1` required either way):

  - Matched/unmatched detection is **not** path-magic: a symbol is unmatched
    iff (a) the whole derived `.s` file exists under `--asmpath`, (b) a
    per-function `.s` exists under `--nonmatchingspath`, or (c) the map
    contains a `<symbol>.NON_MATCHING` marker symbol.
  - Pre-migration, signal (a) works for dumps (their `.s` files exist, so
    they correctly count unmatched), but **overstates matched code**:
    "matched" is the fall-through, so `data/*/metadata.s` objects placed in
    `.text` (whose lookup path reverse-maps outside `asm/`), libgcc members,
    and anything else without a discoverable `.s` all count as matched. The
    measured "64.8% code matched" is an upper bound, not a baseline — do not
    quote it as progress.
  - Post-migration the markers fix this automatically and completely: since
    `data/*/metadata.s` and the other standalone `.s` files also define
    their symbols via `common.inc`'s `global` macro, they receive
    `.NON_MATCHING` markers too and count unmatched-until-converted. libgcc
    stays matched (original object code; nothing to decompile).
  - **Post-migration the path signal disappears** (the map attributes
    everything to `src/*.c.o`), so the design adopts signal (c): the
    `global` macro in `common.inc` (which every dump already uses to define
    its symbols) is extended to also define a zero-size
    `<name>.NON_MATCHING` label. Markers then exist exactly while a dump
    exists — created by INCLUDE_ASM inclusion, gone when the function is
    decompiled and its dump deleted. No per-function bookkeeping, no ROM
    byte impact (symbols never reach `objcopy -O binary`; verified by the
    SHA1 gate anyway). Fallback if the macro route misbehaves: a two-arg
    `INCLUDE_ASM(path, name)` emitting the marker from C.
  - `report_data: false` — counting data without full marker coverage
    inflates progress.
- CI (optional, non-blocking): run `mapfile_parser objdiff_report` on the CI
  map and publish the JSON for decomp.dev. objdiff-cli's own `report
  generate` is the alternative; caveat there: `symbol_mappings` reportedly
  ignored (objdiff #279).

## Component 10: GitHub Actions CI

`.github/workflows/build.yml`, one job, **digest-pinned container** (or
pinned runner + pinned package versions — review finding: `ubuntu-latest` +
floating apt binutils is not reproducible enough for a byte-matching
toolchain):

1. Install pinned `binutils-arm-none-eabi`, `ninja-build`.
2. Build agbcc from `pret/agbcc` at a pinned commit; `actions/cache` keyed on
   **agbcc commit + container/runner identity + host compiler version + build
   script hash**. On cache hit, verify tool hashes before use.
3. `cmake --preset default && cmake --build build && ctest --test-dir build
   --output-on-failure`.
4. Log non-copyrighted diagnostics: tool versions/hashes, ROM SHA1, map
   summary. No ROM/ELF artifacts uploaded (policy; low stakes given the repo
   contents, but free to keep).

## Testing / acceptance

0. **Spike matrix gate** (before migration runs at scale) — each case built
   both ways and compared on section bytes, symbols, relocations, map order,
   and final SHA1:
   - top-level `asm()` position between functions (plain `.text`, no
     function-sections) — before first function, between functions,
     container TU with no functions;
   - two includes that both used `.L1` and both formerly included
     `common.inc` (post-transformation);
   - branch/reloc matrix: Thumb→Thumb, ARM→ARM, interworking, C↔include both
     directions, include→include, local vs global targets, near and far
     branches, literal pools, alignment boundaries;
   - transition of an already-matched C file from N `.text.<fn>` sections to
     one contiguous `.text`.
1. Full pipeline on macOS and Linux (CI): configure, build, ctest pass; both
   Ninja and Unix Makefiles generators.
2. Incremental correctness: touching a header / a dump / `common.inc` / an
   `.incbin` payload / `ld_script.ld` / `tools/agbcc` /
   `old_agbcc` / `libgcc.a` each rebuilds exactly the affected steps; ROM
   still matches. Inode test: recompile one source, relink, staged object is
   byte-identical to the new object (not the old inode).
3. Flag override: `src/libc.c.o.s` compiled with only `-O2` (byte-compare vs
   old build). Reconfigure with a different `AGBCC` in the same build dir:
   every compile command updates.
4. Clean-tree behaviors: delete `rom.gba` → one build recreates it; failed
   objcopy reruns; second build after success is a no-op.
5. `compile_commands.json` inspected: no `-isystem` reaches old_agbcc or
   `as`; clangd validated on real files.
6. objdiff end-to-end: snapshot, perturb a function, objdiff shows exactly
   that symbol diffing; `update-expected` refuses on a non-matching build.

## Risks and fallbacks

- **R0 — INCLUDE_ASM byte-compat** (asm() ordering; same-object resolution;
  literal pools; the function-sections→plain-.text transition). Gated by the
  acceptance-0 matrix. Fallback: keep dumps as separate objects and generate
  the current per-object placement model (toolchain work is unaffected).
- **R1 — object path layout** (`CMakeFiles/<t>.dir/…`): assumed only inside
  `tools/gba-link`; fails loudly.
- **R2 — forced compiler**: completed per review (`ID_RUN`, output
  extensions, flag hygiene); verified on clean configures of both generators.
- **R3 — `--reset-flags` ordering**: documented CMake order; acceptance 3.
  Fallback: separate OBJECT library for libc.c (staging already merges
  multiple `.dir` trees).
- **R4 — migration mistakes** (chunk ownership, function reordering, `.L`
  rename slips): all caught by the oracle — link errors or SHA1 mismatch —
  and undone by git. Eyeball the C-reordering diffs before committing;
  everything else is the throwaway script's problem, not the design's.
