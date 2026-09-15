# Beyblade V-Force

Matching decompilation of Beyblade V-Force for the Game Boy Advance.

## Building

Install CMake, Ninja, and the ARM GNU binutils (`uv` is only needed for the decomp.dev progress report).

```sh
brew install arm-none-eabi-binutils cmake ninja uv          # macOS
sudo apt install binutils-arm-none-eabi cmake ninja-build  # Debian/Ubuntu
```

Building [pret/agbcc](https://github.com/pret/agbcc) also requires a host C/C++ toolchain and 32-bit compiler support on Linux.

Build and install agbcc, then export the directory containing its `bin/`, `include/`, and `lib/` directories:

```sh
export AGBCC=/path/to/agbcc-install/tools/agbcc
```

You can instead pass `-DAGBCC=/path/to/agbcc-install/tools/agbcc` to the configure command. The canonical US build is:

```sh
cmake --preset default
cmake --build --preset us
ctest --preset us
```

`default` is an alias of `us`, and both configure into `build/us`. The other versions use independent trees:

```sh
cmake --preset eu && cmake --build --preset eu
cmake --preset debug && cmake --build --preset debug
```

`cmake --build --preset us --target compare` and `cmake --build --preset eu --target compare` enforce the validated US and EU ROM SHA1 checks. The `debug` comparison test prints expected and actual hashes, then skips until that build is validated. For a decomp.dev progress report, run `uv run tools/gen-report.py` after a matching US build.

## Decompiling and diffing

Undecompiled functions are included from `asm/dump/` with `INCLUDE_ASM`. To decompile one, replace its `INCLUDE_ASM` line with the C implementation and diff against the baseline while iterating. Delete the dump once the function matches.

Diffs compare freshly built objects in `build/<version>/` against the corresponding gitignored baseline snapshot in `expected/build/<version>/`. After a matching validated build, refresh only that version with:

```sh
tools/update-expected us
tools/update-expected eu
```

Unvalidated versions are refused unless `--force` is supplied; their objdiff baselines should normally wait until validation.

Two ways to diff:

- **objdiff (GUI):** launch [objdiff](https://github.com/encounter/objdiff) from the repository root; it picks up `objdiff.json` and rebuilds objects on save. Units are prefixed with their ROM version.
- **`tools/diff` (CLI):** print the instruction diff for a single function; iterate until no instructions differ:

  ```sh
  bun install --cwd tools/diff   # once
  bun run tools/diff/diff.ts <symbolName>
  bun run tools/diff/diff.ts --version us <symbolName>
  ```

  The default version is `us`; set `BVV_VERSION` or pass `--version` explicitly.
