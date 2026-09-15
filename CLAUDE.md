# Beyblade V-Force decomp

Matching decompilation of a GBA game. The ROM must stay byte-identical: after
any change, verify with the SHA1 test before claiming success.

## Build & verify

```sh
cmake --preset default        # configure US (needs AGBCC env var or -DAGBCC=)
cmake --build --preset us     # build build/us/rom.elf + rom.gba
cmake --build --preset us --target compare   # enforced US SHA1 check
cmake --build --preset eu --target compare   # enforced EU SHA1 check
```

`default` aliases the `us` preset. The canonical build directory is `build/us/`.
The `eu` and `debug` presets use `build/eu/` and `build/debug/`. US and EU
comparisons are enforced; debug prints both hashes and skips until validated.

## Diffing a function

US objects are compared against the baseline snapshot in `expected/build/us/`
(gitignored), which mirrors the versioned build tree.

```sh
bun run tools/diff/diff.ts <symbolName>   # defaults to US (bun install --cwd tools/diff once)
```

objdiff (GUI) also works from the repository root via `objdiff.json`.

After the US ROM matches, refresh the baseline: `tools/update-expected us`.

## Decompiling workflow

- Undecompiled functions live as asm in `asm/dump/`, pulled into C files via
  `INCLUDE_ASM("asm/dump/...")`. Replace the line with a C implementation,
  iterate with the diff tools until no instructions differ, then delete the dump file.
- Link order is fixed by the preprocessed `ld_script.ld` template (object paths
  relative to `build/us/CMakeFiles/rom.dir/`, where ld runs for the US build).
  New source files need an entry there and in `CMakeLists.txt`.
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
