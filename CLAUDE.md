# Beyblade V-Force decomp

Matching decompilation of a GBA game. The ROM must stay byte-identical: after
any change, verify with the SHA1 test before claiming success.

## Build & verify

```sh
cmake --preset default        # configure (once; needs AGBCC env var or -DAGBCC=)
cmake --build build           # build rom.elf + rom.gba
cmake --build build --target compare   # build + ROM SHA1 check — the ground truth
```

The canonical build directory is `build/` (tools assume it).

## Diffing a function

Objects are compared against the baseline snapshot in `expected/` (gitignored), which mirrors the `build/` directory layout.

```sh
bun run tools/diff/diff.ts <symbolName>   # instruction diff (bun install --cwd tools/diff once)
```

objdiff (GUI) also works from the repository root via `objdiff.json`.

After the ROM matches, refresh the baseline: `tools/update-expected`.

## Decompiling workflow

- Undecompiled functions live as asm in `asm/dump/`, pulled into C files via
  `INCLUDE_ASM("asm/dump/...")`. Replace the line with a C implementation,
  iterate with the diff tools until no instructions differ, then delete the dump file.
- Link order is fixed by `ld_script.ld` (object paths relative to
  `build/CMakeFiles/rom.dir/`, where ld runs). New source files need an entry
  there and in `CMakeLists.txt`.
- IWRAM globals have fixed addresses; their layout is pinned in the `iwram`
  section of `ld_script.ld` and the `src/ram*.c` files.

## Conventions

- SDK-style headers live in `lib/agb/include/agb/` (`types.h`, `define.h`,
  `memory_map.h`, `macro.h`, `bios.h`) using official Nintendo SDK naming
  (`u8`/`vu16`, `REG_*` are plain addresses — write `*(vu16 *)REG_DISPCNT`,
  `DmaCopy`/`DmaClear`/`CpuSet`, `DISP_*`/`BLD_*`/`DMA_*` constants).
- Compiler is agbcc (old GCC, C90): declarations before statements, no `//`
  pitfalls to worry about but keep it C90-safe.
- Formatting: clang-format (config in `.clang-format`, includes are sorted:
  `<agb/...>` first, then other `<...>`, then `"..."`).
