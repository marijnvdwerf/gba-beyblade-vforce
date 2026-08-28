# Leaf decompilation notes

## sub_805AD9C (0x0805AD9C)

Status: parked; semantic draft retained above the assembly include.

The function walks `MenuState.items` as an array of 0x4C-byte `UnkMenuItem` records, calls `sub_8061204` on each record's leading `SpriteTextCleanup`, frees the menu allocation at offset 0x10, clears offsets 0x14 and 0x18, and clears byte 0x09. The field at offset 0x10 remains padding in the canonical `MenuState` layout because the draft is parked and does not determine compiled structure definitions.

| Change | Result |
| --- | --- |
| Initial typed draft with `while (count-- != 0)` and `UnkMenuItem*` cursor | Extra saved register; compiler emitted pre-decrement/sentinel loop rather than target's rotated loop. |
| Changed loop to `do { ... } while (count-- != 0)` with `unk32 count` | Target loop shape remained different; unsigned sentinel compare introduced `-1` materialization. |
| Changed count to `s32` | Target decrement/test shape matched (`mov`, `sub`, `cmp`, `bne`), but state/item/count were colored as r7/r6/r5 instead of target r6/r5/r4, with an extra saved register. |
| Reordered declarations, declaration initializers, and pointer casts | No reduction in the prologue or first divergence. |
| Tried an opaque helper declaration in this TU | No code improvement; reverted to shared typed prototype. |

First divergence in the best natural draft is the prologue: target saves `{r4,r5,r6,lr}`, while the draft saves `{r4,r5,r6,r7,lr}`. The remaining body differs only by register coloring and the target's explicit zero materialization after the loop. No artificial register/lifetime lever was retained.

## sub_8059310 (0x08059310)

Status: parked; semantic draft retained above the assembly include.

The function partitions a horizontal tile-map transfer at the layer column boundary. It selects `sub_80594FC` for the alternate map mode and otherwise loads `__sub_8756FC0`; it performs the first segment, then either copies the wrapped remainder or invokes `__sub_8757380` when horizontal wrapping is disabled.

| Change | Result |
| --- | --- |
| Initial natural callback draft | Correct control-flow semantics, but unsigned `bls`/`bcs` branches and callback/layer register allocation differed. |
| Made x and width signed | Reproduced the target signed `ble`/`bge` comparisons and aligned the main arithmetic shape. |
| Reordered locals to preserve source x and callback arguments | Matched the target layer/x/width/remainder arithmetic registers in portions of the body, but callback address remained stack- or register-colored differently. |
| Added explicit stack-value locals for y, height, and source y | Compiler optimized those aliases into incoming stack reloads; frame stayed 0x18 instead of target 0x1C and later call setup diverged. |
| Cached column count in a local | Worsened allocation and changed the target's direct field-load shape; reverted. |

The best natural draft's first divergence is the stack frame size (`sub sp, #24` versus target `sub sp, #28`). The target also stores y, height, source y, and wrapped x in fixed local slots, keeps the selected callback in r9, and emits `sub_80594FC + 1`; the draft does not reproduce those lifetimes without artificial address-taking or pointer arithmetic. The draft uses no volatile, inline assembly, fake symbol, or raw offset access.
