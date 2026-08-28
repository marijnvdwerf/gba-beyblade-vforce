# Leaves N3

## sub_8059284 (0x08059284)

Status: parked; the assembly inclusion remains active.

The semantic draft selects `mode = bgPriority >> 14`, uses the low bit of `flags` to select the 256/512/1024/2048-byte mode-specific allocation, and writes both layer dimensions. The draft is directly above the inclusion in `src/layer.c`.

The first divergence in the natural draft was the prologue register assignment. The target begins with `mov r3, r0`, normalizes the two halfword arguments, and copies the mode to `r0`; the natural draft assigned the layer pointer and mode to different registers. The remaining differences were register allocation and branch lowering, not an unresolved field offset.

Near-miss steps:

| Change | Result |
| --- | --- |
| Natural switch with direct `bgLayer` accesses | Different prologue allocation and branch lowering |
| Added a local `BGLayer*` pointer alias | Changed allocation but did not reach target |
| Kept `size = mode` before the flag branch | Reproduced the target's early mode-to-return-value lifetime, but register allocation still differed |
| Rewrote the mode selection as a branch ladder | Increased branch-shape differences |

No struct layout was added for this function. Accessed fields are the existing `BGLayer` byte fields at offsets `0x5F` and `0x60`.

## sub_8060E8C (0x08060E8C)

Status: parked; the assembly inclusion remains active.

The semantic draft normalizes the two halfword angles and byte frame, treats frame zero with angles `0x100, 0x100` as the special release case, allocates or releases an affine rotation/scale entry, and writes the four halfword matrix values at offsets `0x0C`, `0x0E`, `0x10`, and `0x12`.

The `SpriteEntry` layout now represents the proven storage pun at offsets `0x0C..0x13` with `SpriteTransformValue` unions: the same words remain available as `y` and `unk10`, while the matrix halves are available through `halves.first` and `halves.second`. The signed table loads in the nonzero-frame path prove the table values are signed; the zero-frame path independently uses unsigned halfword loads.

The first divergence in the natural draft was the prologue allocation. The target keeps the sprite pointer in `r5`, the first angle in `r7`, the second angle in `r8`, and the frame in `r6`; the natural draft used different callee-saved registers. Introducing a local frame-plus-`0x40` index reproduced the target's expanded table-index instruction shape and moved the sprite pointer to `r5`, but did not reproduce the target angle allocation. The target also retained a longer function body than the direct indexed expression draft.

Near-miss steps:

| Change | Result |
| --- | --- |
| Direct natural matrix implementation | Correct stores and signed table operations, but different register allocation and shorter table-index sequence |
| Swapped matrix field widths/order | Corrected semantic store order to target: `arg1` at `0x14`, `arg2` at `0x16`; no exact match |
| Changed table pointers from const to mutable signed pointers | Preserved signed `ldsh` operations; no exact match |
| Added explicit `frame_offset = frame + 0x40` | Reproduced target's add-before-scale index shape and moved sprite to `r5`; angle registers still differed |
| Added normalized angle temporaries | Changed normalization scheduling but did not improve the target diff |
| Widened `sin_frame` | Reverted; it moved away from the target shape |

## resizeSpriteBlock (0x08060D98)

Status: parked; the assembly inclusion remains active.

The semantic draft is directly above the inclusion in `src/sprite.c`. It handles unchanged size, expansion of a nonempty block by taking entries from `_spritesLeft`, expansion of an empty block through `sub_8060C1C`, and reduction through `sub_8060CDC` followed by `sub_8060C1C`. The expanded-list draft retains the original first newly allocated entry separately from the moving cursor, because the target links that first entry after the old block tail and links the final entry to the old successor.

The first divergence was the prologue. The target preserves `_spritesFree` through a callee-saved pointer in `r9` and uses `r10` for the original free-list head; the natural direct-global implementation keeps only the count in a local and produces a shorter save/restore sequence. The target also loads the original block tail and first entry, and the first entry's `var22`, earlier than the first natural draft. Reordering those accesses and retaining `var22` reproduced the target's load/store lifetime more closely, but the global pointer lifetime remained different.

Near-miss steps:

| Change | Result |
| --- | --- |
| Direct `_spritesFree` reads/writes with a local count | Correct basic control flow, but no persistent `_spritesFree` pointer and different register saves |
| Reordered `last = block->next` before `first = block->prev` | Matched the target's tail/first load order |
| Retained the original free-list head separately | Added the target's stack-backed list-head lifetime and corrected the linked-list semantics |
| Loaded `var22 = first->var22` before updating the count | Matched the target's early halfword load |

A pointer alias to `_spritesFree` would likely reproduce the remaining target lifetime, but that source shape is prohibited. The draft therefore remains parked rather than using a pointer-to-global matching lever.

## Verification

`cmake --build build --target compare` passed after restoring all three assembly inclusions. No dump was removed because no function reached an exact natural C match.
