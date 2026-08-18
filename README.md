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

`cmake --build build --target compare` reruns the ROM SHA1 check. After a matching build, `tools/update-expected` refreshes the gitignored objdiff baseline; launch objdiff from the repository root to compare against it. For a progress report, run `uvx mapfile_parser objdiff_report -i 1 build/rom.map build/progress.json`.

Undecompiled functions are included from `asm/dump/` with `INCLUDE_ASM`. To decompile one, replace its `INCLUDE_ASM` line with the C implementation and use objdiff while iterating. Delete the dump once the function matches.
