# Effects, layer, and tutorial matching notes

## sub_8055C30 (0x08055C30)

- The target sequence is matched by loading the two 32-bit entries at offsets 0 and 4, calling `sub_8060A94` on each as a `SpriteEntry *`, clearing each entry immediately after its call, and preserving the input pointer across both calls.
- The storage is a 0x3C-byte `EffectSprites` record: `SpriteEntry *unk0`, `SpriteEntry *unk4`, and `unk8 pad8[0x34]`. Retyping `_unk3000080` in `ram.c` and `dialogue.h`, and changing `sub_8055914`, `sub_805599C`, and `sub_8055C30` to take `EffectSprites *`, removes the integer-to-pointer casts without changing layout.
- Because the global is now an object rather than an array, the three dialogue call sites pass `&_unk3000080`; the generated address is unchanged.
- `bun run tools/diff/diff.ts sub_8055C30` and `bun run tools/diff/diff.ts sub_80420C4` report no instruction differences after the record retype.

## sub_8059CB4 (0x08059CB4)

- The target loads `BGLayer.layerIndex` from offset `0x5E`, calls `GetBGLayerCntPtr`, reads a 32-bit value from the returned address, and extracts bits 0-1 with `lsl #30` followed by `lsr #30`.
- `unk8` is retained as the return type because the existing `renderActor` call site normalizes the result with `lsl #24` and `lsr #24`; the callee itself matches without an extra narrowing sequence.
- The final source uses a 32-bit `BGControl` bitfield allocation unit while retaining the `vu16 *` return type for `GetBGLayerCntPtr`, because BG0CNT through BG3CNT are 16-bit hardware registers. The only cast is in `sub_8059CB4`: `return ((BGControl*)GetBGLayerCntPtr(layer->layerIndex))->unk0_0;`.
- The two active register writers use the helper result directly as `vu16 *`, preserving their natural halfword stores. `sub_8059CB4`, `sub_8058AA8`, `unref_8058C74`, and `renderActor` all remain exact. The `sub_8059C18` references at source lines 741 and later are inside its `#if 0` draft and do not produce object code.

### Prototype and expression experiments

| form | first observed divergence | result |
| --- | --- | --- |
| `BGControl` bitfield with the original `vu16 *` helper and an explicit cast in `sub_8059CB4` | none | exact target body |
| `BGControl *GetBGLayerCntPtr` with `GetBGLayerCntPtr(layer->layerIndex)->unk0_0` | none in `GetBGLayerCntPtr`, `sub_8058AA8`, `unref_8058C74`, `sub_8059CB4`, or `renderActor` | codegen exact, but rejected because it moves `(vu16*)` casts into the two natural halfword writers |
| `vu16 *GetBGLayerCntPtr` with the `BGControl` field accessed through one cast in `sub_8059CB4` | none in `sub_8059CB4`, `sub_8058AA8`, `unref_8058C74`, or `renderActor` | final source form; preserves the 16-bit register helper and keeps the cast localized to the 32-bit bitfield read |
| `return *GetBGLayerCntPtr(layer->layerIndex) & 3` with `vu16 *` helper | `0x0A`: expected `ldr`, emitted `ldrh`; then `0x0C` expected `lsl #30`, emitted `mov #3` | rejected; documents that the 16-bit helper cannot express the target load |
| `return *GetBGLayerCntPtr(layer->layerIndex) & 3` with `vu32 *` helper | `0x0C`: expected `lsl #30`, emitted `mov #3`; `ldr` at `0x0A` matched | rejected; width is right but the mask is not the recovered expression |

## sub_804A364 (0x0804A364)

- The target loads `_unk3000C00`, calls `sub_804A378` with that value, and returns the helper result unchanged.
- Declaring `sub_804A378` as returning `const unk8* const*` and matching the public `sub_804A364` prototype preserves the pointer result used by `sub_80420C4`.
- `bun run tools/diff/diff.ts sub_804A364` and the `sub_80420C4` caller diff report no instruction differences.
