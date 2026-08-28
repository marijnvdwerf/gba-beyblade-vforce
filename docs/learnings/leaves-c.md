# Leaf decompilation notes

## sub_805AD9C (0x0805AD9C)

Status: parked; semantic draft retained above the assembly include.

The function walks `MenuState.items` as an array of 0x4C-byte `UnkMenuItem` records, calls `sub_8061204` on each record's leading `SpriteTextCleanup`, frees the menu allocation at offset 0x10, clears offsets 0x14 and 0x18, and clears byte 0x09. The `MenuState.menuBlock` field at offset 0x10 was added because the assembly loads and frees that field.

| Change | Result |
| --- | --- |
| Initial typed draft with `while (count-- != 0)` and `UnkMenuItem*` cursor | Extra saved register; compiler emitted pre-decrement/sentinel loop rather than target's rotated loop. |
| Changed loop to `do { ... } while (count-- != 0)` with `unk32 count` | Target loop shape remained different; unsigned sentinel compare introduced `-1` materialization. |
| Changed count to `s32` | Target decrement/test shape matched (`mov`, `sub`, `cmp`, `bne`), but state/item/count were colored as r7/r6/r5 instead of target r6/r5/r4, with an extra saved register. |
| Reordered declarations, declaration initializers, and pointer casts | No reduction in the prologue or first divergence. |
| Tried an opaque helper declaration in this TU | No code improvement; reverted to shared typed prototype. |

First divergence in the best natural draft is the prologue: target saves `{r4,r5,r6,lr}`, while the draft saves `{r4,r5,r6,r7,lr}`. The remaining body differs only by register coloring and the target's explicit zero materialization after the loop. No artificial register/lifetime lever was retained.
