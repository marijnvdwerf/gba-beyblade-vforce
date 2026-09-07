# Effects, layer, and tutorial matching notes

## sub_8055C30 (0x08055C30)

- The target sequence is matched by loading the two 32-bit entries at offsets 0 and 4, calling `sub_8060A94` on each as a `SpriteEntry *`, clearing each entry immediately after its call, and preserving the input pointer across both calls.
- The existing `unk32 *` parameter and explicit integer-to-`SpriteEntry *` conversions produce the exact 28-byte target body.
- No additional temporary is required; the compiler materializes the zero value after the first call and reuses it for both stores.
- `bun run tools/diff/diff.ts sub_8055C30` reports no instruction differences, and the full ROM compare passes.

## sub_8059CB4 (0x08059CB4)

- The target loads `BGLayer.layerIndex` from offset `0x5E`, calls `GetBGLayerCntPtr`, reads a 32-bit value from the returned address, and extracts bits 0-1 with `lsl #30` followed by `lsr #30`.
- `unk8` is retained as the return type because the existing `renderActor` call site normalizes the result with `lsl #24` and `lsr #24`; the callee itself matches without an extra narrowing sequence.
- The explicit `unk32 *` view of the register-pointer result is required to produce the target `ldr` rather than a halfword load.
- `bun run tools/diff/diff.ts sub_8059CB4` and the `renderActor` caller diff report no instruction differences, and the full ROM compare passes.

## sub_804A364 (0x0804A364)

- The target loads `_unk3000C00`, calls `sub_804A378` with that value, and returns the helper result unchanged.
- Declaring `sub_804A378` as returning `const unk8* const*` and matching the public `sub_804A364` prototype preserves the pointer result used by `sub_80420C4`.
- `bun run tools/diff/diff.ts sub_804A364` and the `sub_80420C4` caller diff report no instruction differences, and the full ROM compare passes.
