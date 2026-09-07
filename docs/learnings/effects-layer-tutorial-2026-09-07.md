# Effects, layer, and tutorial matching notes

## sub_8055C30 (0x08055C30)

- The target sequence is matched by loading the two 32-bit entries at offsets 0 and 4, calling `sub_8060A94` on each as a `SpriteEntry *`, clearing each entry immediately after its call, and preserving the input pointer across both calls.
- The existing `unk32 *` parameter and explicit integer-to-`SpriteEntry *` conversions produce the exact 28-byte target body.
- No additional temporary is required; the compiler materializes the zero value after the first call and reuses it for both stores.
- `bun run tools/diff/diff.ts sub_8055C30` reports no instruction differences, and the full ROM compare passes.
