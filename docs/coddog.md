# coddog

[coddog](https://github.com/ethteck/coddog) is a Rust command-line tool for
finding repeated code in decompilation projects. It computes instruction
signatures from a linked object and supports three useful operations:

- `match` finds functions similar to a named function.
- `cluster` groups identical or near-identical functions in one binary.
- `submatch` finds shared instruction sequences between functions.

It also has experimental `compare2`, `compare-n`, and `compare-raw` commands
for matching functions between projects or binaries. coddog is a similarity
and duplicate-finding tool, not a decompiler: it does not consume C source or
lift an assembly dump into C.

## GBA support

The coddog 0.6.3 source supports GBA explicitly. `Platform::Gba` uses
little-endian ARMv4T Thumb decoding with two-byte standard instructions, and
the repository includes a `test/simple_gba.o` regression test. The ELF path is
the best input for this project because it preserves linked symbol boundaries
and relocations. The map-file path is an alternative for raw ROMs.

There is one upstream CLI bug in the current 0.6.3 checkout: the `gba`
platform is accepted by the decomp.me-name parser but omitted from the parser
used by the normal `match`, `cluster`, and `compare-raw` commands. Stock coddog
therefore panics with `Invalid platform: gba` for this project. Until the
upstream mapping is fixed, build a local checkout with the following additions
to `Platform::from_name` in `crates/core/src/lib.rs`:

```rust
"gba" => Some(Platform::Gba),
"nds" => Some(Platform::Nds),
"n3ds" => Some(Platform::N3ds),
"irix" => Some(Platform::Irix),
```

The additions are outside this repository; no coddog source is vendored here.

## Project configuration

The root `decomp.yaml` contains the standard fields that coddog reads:

- `platform: gba` selects the ARMv4T Thumb decoder.
- `versions[].paths.elf` points to `build/rom.elf`.
- `versions[].paths.map` and `compiled_target` provide the map/ROM fallback.
- `versions[].paths.asm` points to `asm/dump`.

coddog walks `asm` recursively and treats a symbol as undecompiled when a
matching `.s` filename is found there. This means the existing dump tree lets
results distinguish functions that are already represented by C from the 600
current assembly dumps. All project artifact paths are relative to
`decomp.yaml`, so the configuration is portable between checkouts.

## Installation

coddog is Rust software. Clone it outside this repository and build its CLI
(the upstream README currently documents the source build through Cargo):

```sh
CODDOG_DIR="${CODDOG_DIR:-$HOME/src/coddog}"
git clone https://github.com/ethteck/coddog "$CODDOG_DIR"
cd "$CODDOG_DIR"
cargo build --release --bin coddog
```

For the current 0.6.3 checkout, apply the GBA mapping workaround above before
building. Keep `CODDOG_DIR` pointed at the local checkout; no global install is
needed.

Build this project first so that the configured ELF exists:

```sh
cmake --preset default
cmake --build build
```

## Examples for this project

From the project root, after building the patched coddog checkout:

```sh
"$CODDOG_DIR/target/release/coddog" match sub_805041C -t 0.6
```

Observed output on the current build:

```text
62.31% - sub_805A984 (decompiled)
61.03% - sub_805DBF0 (decompiled)
60.53% - sub_8057A7C (decompiled)
60.50% - processMetadata_5 (decompiled)
```

The same query at the README-style threshold (`-t 0.7`) produces no matches,
which is useful evidence that these are broad structural similarities rather
than likely duplicates. The output labels the candidates as decompiled
because none of them has a corresponding assembly dump under `asm/dump`.

To find likely duplicate groups across the linked GBA image:

```sh
"$CODDOG_DIR/target/release/coddog" cluster -t 0.985 -m 10
```

The current build reports, among others:

```text
Cluster LineDataE07S06_49 has 165 symbols
Cluster LineDataE07S06_41 has 120 symbols
Cluster LineDataE07S07_30 has 83 symbols
Cluster LineDataE07S06_44 has 50 symbols
Cluster LineDataE07S06_40 has 32 symbols
Cluster sub_8057048 has 7 symbols
```

Large clusters are dominated by generated line-data symbols, so filter those
when prioritizing code deduplication. Smaller clusters such as `sub_8057048`
are more promising candidates for shared implementations or includes.

## Recommendation

Use coddog after each build to identify exact/near-duplicate functions before
starting a new dump. Use `match` for a single undecompiled function and
`cluster` to prioritize broad cleanup of the dump backlog. First update
coddog's missing GBA CLI mapping upstream; until then, keep the local patched
build outside this repository and treat low-threshold matches as leads rather
than proof of equivalence.
