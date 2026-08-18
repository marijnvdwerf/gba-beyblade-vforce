# Beyblade V-Force

Matching decompilation of Beyblade V-Force for the Game Boy Advance.

## Building

Install CMake, Ninja, and the ARM GNU binutils (`uv` is only needed for the optional progress report).

```sh
brew install arm-none-eabi-binutils cmake ninja uv          # macOS
sudo apt install binutils-arm-none-eabi cmake ninja-build  # Debian/Ubuntu
```

Building [pret/agbcc](https://github.com/pret/agbcc) also requires a host C/C++ toolchain and 32-bit compiler support on Linux.

Build and install agbcc, then export the directory containing its `bin/`, `include/`, and `lib/` directories:

```sh
export AGBCC=/path/to/agbcc-install/tools/agbcc
```

You can instead pass `-DAGBCC=/path/to/agbcc-install/tools/agbcc` to the configure command. The canonical build is:

```sh
cmake --preset default
cmake --build build
ctest --test-dir build
```

`cmake --build build --target compare` reruns the ROM SHA1 check. For a progress report, run `uvx mapfile_parser objdiff_report -i 1 build/rom.map build/progress.json`.

## Decompiling and diffing

Undecompiled functions are included from `asm/dump/` with `INCLUDE_ASM`. To decompile one, replace its `INCLUDE_ASM` line with the C implementation and diff against the baseline while iterating. Delete the dump once the function matches.

Diffs compare freshly built objects in `build/` against the gitignored baseline snapshot in `expected/`. After any matching build, refresh the baseline with:

```sh
tools/update-expected
```

Two ways to diff:

- **objdiff (GUI):** launch [objdiff](https://github.com/encounter/objdiff) from the repository root; it picks up `objdiff.json` and rebuilds objects on save.
- **`tools/diff` (CLI):** print the instruction diff and match percentage for a single function:

  ```sh
  bun install --cwd tools/diff   # once
  bun run tools/diff/diff.ts <symbolName>
  ```
