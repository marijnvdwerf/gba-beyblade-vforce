# `sub_8059B00` matching notes

## Alias-reduction checks

The committed implementation retains the `base`/`transform` pointer pair and the three matrix-value pointers because the natural reductions below did not preserve the target instruction stream. First divergence addresses are relative to the linked target address `0x08059B00`.

| Change tested | First divergence | Result |
| --- | --- | --- |
| (a) Remove `matrixA`/`matrixB`/`matrixC`; pass `transform` or `_unk3000D00[index]` half fields directly to `SetLayerTransform` | `0x08059B02`: target `mov r7, sl`; candidate `mov r7, r9` | Not a match; frame and saved-register set changed |
| (b) Use only `transform` for all word and half accesses; remove the matrix-value pointers | `0x08059B02`: target `mov r7, sl`; candidate `sub sp, #4` | Not a match; frame and saved-register set changed |
| (c) Change `matrixD` from `s16` to `LayerTransformValue` and pass `matrixD.half` | `0x08059BD8`: target `add r1, r7`; candidate `lsls r0, r0, #16` | Near miss; matrix-D destination address materialization moved after result normalization |

The retained form is the only tested form that matches the target bytes and keeps the target's saved registers, frame size, address materialization, and final argument flow.

## Proven word/halfword storage pun

`LayerTransformValue` is a union because the transform record stores each matrix result as a 32-bit word and later consumes the low signed halfword from the same storage. The relevant instructions in `sub_8059B00` are:

- `unk8`: word store `str r0, [r1]` at `0x08059B66`; signed-halfword read `ldrsh r1, [r4, r2]` at `0x08059BE8`, where `r4` points to record offset `0x8`.
- `unkC`: word store `str r0, [r2]` at `0x08059B90`; signed-halfword read `ldrsh r2, [r3, r4]` at `0x08059BEE`, where `r3` points to record offset `0xC`.
- `unk10`: word store `str r0, [r6]` at `0x08059BBA`; signed-halfword read `ldrsh r3, [r6, r4]` at `0x08059BF2`, where `r6` points to record offset `0x10`.
- `unk14`: word store `str r0, [r5]` at `0x08059BE2`, with `r5` pointing to record offset `0x14`; this function forwards the normalized result directly as the fourth setter argument rather than reloading that field as a halfword. It uses the same union member type to preserve the shared four-word matrix layout.
