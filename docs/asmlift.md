# asmlift

[asmlift](https://github.com/macabeus/asmlift) lifts one GBA ARMv4T/Thumb function from GNU-as assembly into C, using an SSA-like intermediate representation, type recovery, and CFG structuring. The project-local configuration is `decomp.yaml`; the CLI discovers it by walking upward from the input file.

Set `ASMLIFT_DIR` to use another checkout; commands below default to the local checkout:

```sh
ASMLIFT_DIR="${ASMLIFT_DIR:-/Users/marijn/Projects/asmlift}"
```

## Installation

The durable checkout and build are at:

```text
$ASMLIFT_DIR
```

It was installed with pnpm and built with:

```sh
cd $ASMLIFT_DIR
pnpm install --frozen-lockfile
pnpm --filter @asmlift/cli build
```

The executable is:

```text
$ASMLIFT_DIR/packages/cli/dist/asmlift.mjs
```

The repository root `decomp.yaml` selects the `agbcc` target, uses `build/rom.elf` as the optional symbol/DWARF sidecar, and mirrors this project's compiler flags. The compiler command invokes the local `tools/agbcc` driver and finds the external old agbcc toolchain through `$AGBCC`, falling back to `$HOME/agbcc/tools/agbcc`, matching `cmake/toolchain-agbcc.cmake`.

## Lift a function

From the repository root, pass an assembly dump and its symbol name:

```sh
node $ASMLIFT_DIR/packages/cli/dist/asmlift.mjs \
  asm/dump/8057b80-debug/8058918-nullsub_50.s \
  --name nullsub_50 \
  --strict
```

Verified output:

```c
s32 nullsub_50(s32 a0) {
    return a0;
}
```

Use `--backend pascal` for Pascal output. Without `--strict`, unsupported portions are emitted as annotated `ASMLIFT_ERROR` markers instead of making the command fail.

## Score against the build

`--score-against` recompiles asmlift's candidate(s) with `tools.asmlift.compiler` from `decomp.yaml`, then compares the resulting object with a project object using objdiff:

```sh
node $ASMLIFT_DIR/packages/cli/dist/asmlift.mjs \
  /path/to/function.s \
  --name function_name \
  --score-against build/CMakeFiles/rom.dir/src/actor.c.o
```

The option implies strict mode and exits zero only for a byte-exact match. It was verified against this project's `actor.c.o`; asmlift reported:

```text
asmlift: [score] unsigned: 0 (match)
asmlift: [score] signed: 0 (match)
```

## What the ELF configuration actually provides

The configured `tools.asmlift.elf` is a real input channel, not just a filename retained for scoring. The relevant implementation is in `$ASMLIFT_DIR`:

- `packages/cli/src/config.ts:24-27` defines `elf` as the project ELF used for `.symtab` names and DWARF declaration shapes.
- `packages/cli/src/main.ts:263-277` resolves that path relative to `decomp.yaml`, calls `loadSymbolMap`, and fails loudly if it cannot read the ELF.
- `packages/cli/src/symbols-provider.ts:246-283` calls `DebugInfo.fromElf`, iterates `.symtab` entries, and attaches `variableShape`, struct layouts, and compiled-function signatures from DWARF by symbol name.
- `packages/core/src/pipeline.ts:113-137` merges those facts into the frontend and structurer. `packages/core/src/frontend/thumb.ts:2425-2461` uses the map to promote numeric literal-pool addresses to named globals.
- Struct/pointer/array field recovery is supported by `packages/core/src/symbols.ts:14-165` and declaration synthesis in `packages/core/src/declare.ts:64-115,171-213`.
- `--proto` is the only separate input channel. The CLI reads JSON at `packages/cli/src/main.ts:241-260`; its schema is only `params` and `returnsVoid` (`packages/core/src/proto.ts:15-28`). Typed parameter strings are currently used for their count, not propagated into emitted function parameters. The Thumb frontend uses this as callee arity (`packages/core/src/frontend/thumb.ts:1207-1209,2638-2645`).

There is no supported `headers`, include-path, symbol-map, global-type-map, or per-global override key in the CLI/config. It does not parse project headers. The target function's own DWARF signature is deliberately removed by `packages/cli/src/main.ts:289-297` / `packages/core/src/symbols.ts:423-478`; only callee signatures and declarations from other compiled translation units transfer.

The ELF is the correct general shape: ELF32 ARM little-endian, unstripped `.symtab`, `.debug_info`, `.debug_abbrev`, and `.debug_line`. `@gba-kit/debug-info` supports DWARF 2-5 and GBA sidecar ELFs. This build has no `.debug_macro` section, so `-g` does not provide `REG_*` macro names; asmlift's macro path (`packages/cli/src/symbols-provider.ts:394-430`) is optional and requires `-g3` macro records.

## Configuration and observed lift

`decomp.yaml` now documents and enables the existing working channel:

```yaml
tools:
  asmlift:
    target: agbcc
    elf: build/rom.elf
```

Using the current CLI syntax (the built CLI takes the assembly path directly; it has no `lift` subcommand):

```sh
node $ASMLIFT_DIR/packages/cli/dist/asmlift.mjs \
  asm/dump/sound/80627f0.s --config decomp.yaml --name sub_80627F0 --strict
```

Without `elf`, the relevant output was:

```c
v9 = _unk3005E4C + 4294901760 + v8;
_unk3005E78 = 0;
_call_via_r3(...);
_unk3000D90 = _unk3000D90 + v9;
if (_unk3000D90 == _unk3005E4C + _soundMixer) _unk3000D90 = _unk3000D90 - _unk3005E4C;
```

With `tools.asmlift.elf: build/rom.elf`, the same lift exited 0 in strict mode and changed those lines to:

```c
v9 = (u8 *)_unk3005E4C + 4294901760 + v8;
*_unk3005E78 = 0;
_call_via_r3(...);
_unk3000D90 = (u8 *)_unk3000D90 + v9;
if (_unk3000D90 == (u8 *)_unk3005E4C + (u32)_soundMixer) _unk3000D90 = (u8 *)_unk3000D90 - (u8 *)_unk3005E4C;
```

The improvement is real but limited: the ELF contains the names currently present in the linked binary (`_unk3005E24`, etc.), and the compiled DWARF sees several RAM cells as pointers/byte arrays because those are the declarations that made it into compiled translation units. It cannot invent the hand-recovered `SoundStructA`/`SoundStructC` declarations in the `#if 0` draft, rename `_unk...` globals, or turn `67109124` into `REG_TM1CNT` without those facts being present in a sidecar.

## Known limitations

- The Thumb frontend parses `add sp, sp, #0xffffffd8` as a large positive hexadecimal immediate instead of signed `-40`. This can invalidate frame-depth analysis for agbcc output using that spelling.
- The stack-slot model deliberately rejects outgoing stack-argument stores that are not reloaded, such as `[sp]` through `[sp,#0xc]` before a call. This currently prevents faithful lifting of `gameLoop` even after correcting its frame-adjustment spelling.

These are frontend capability gaps, not configuration or GNU-as input-dialect problems.
