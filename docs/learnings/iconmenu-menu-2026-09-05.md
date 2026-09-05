# iconmenu menu matching learnings

## sub_8050C18 (0x8050C18)

Status: parked on the original assembly fallback after a semantically correct near-match failed to reproduce the target register allocation.

The best draft remains immediately above the `INCLUDE_ASM` fallback in `src/iconmenu.c` under `#if 0`. The draft used a typed 0x1C-byte runtime item and a typed menu layout while testing signed fixed-point arithmetic and the frame-toggle storage at item-data offset 0x2C. These speculative layouts were removed from `src/common.h` when the draft was parked; the header is restored to the pre-experiment declarations used by the remaining compiled icon-menu functions.

### First-divergence history

| Change | Result |
| --- | --- |
| Initial typed natural-C draft | Prologue allocated the incoming menu pointer in the wrong callee-saved register; later item/sprite registers cascaded. |
| Signed menu fixed-point fields | Replaced logical shifts with the target arithmetic shifts in menu interpolation and final state updates. |
| `(unk8)(angle >> 8)` index normalization | Matched the target byte-normalization shift pair, though the first temporary register still differed. |
| Explicit signed halfword casts for selected animation | Matched the target `ldrh; lsl #16; asr #20` and `ldrh; lsl #16; asr #22; lsl #24; lsr #24` sequences. |
| Cached `frameWord` for item-data offset 0x2C | Matched the target early word load before the halfword comparison. |
| Sprite pointer assignment inside the non-null branch | Improved the target-like load, null-test, pointer-copy, and scale-load ordering. |
| Scoped `FrontendMenu *self = menu` alias | Did not move the incoming pointer to the required register; target remained `add r4, r0`, current output remained `add r5, r0`. |
| Bitfield representations for selected-frame values | Produced the wrong sine-table stride/addressing and were discarded. |

The target prologue preserves the menu pointer in `r4`, the item cursor in `r5`, and selected scale in `r6`. The best natural C draft instead assigned those roles differently, with the first reliable divergence at the incoming pointer copy. The frame-toggle target also has an explicit `add r0, r1` before the halfword store in its alternate path; the draft stored the word temporary directly. No artificial register controls, inline assembly, volatile qualifiers, raw offset dereferences, or source `.word` edits were used.

## allocateMenuItems (0x805ADD4)

Status: parked on the original assembly fallback after a semantically correct typed near-match failed to reproduce the target register allocation within the time box.

The best draft remains immediately above the `INCLUDE_ASM` fallback in `src/menu.c` under `#if 0`. The draft recovered the descriptor scan, enabled-item counting, centering calculation, allocation size, primary and secondary item initialization, option-table traversal, linking, and selection-state update. Its typed layouts were not retained in `src/common.h` because the compiled source does not access those allocator-only fields while the function is parked.

### First-divergence history

| Change | Result |
| --- | --- |
| Initial typed natural-C draft | Produced the correct broad control flow but a 0x28-byte or 0x2C-byte frame and incorrect callee-saved register roles. |
| Initialize `index` before the descriptor scan | Reproduced the target stack local at `[sp,#0x10]`. |
| Add `itemNext` and `descriptorNext` successor locals | Reproduced the target 0x30-byte stack frame and preserved distinct moving cursors. |
| Use a typed `stateByte` pointer for selected/unselected state | Reproduced the target address addition followed by byte load before `sub_806185C`. |
| Reload `state->menuBlock` after `slowAllocate` | Reproduced the target post-allocation reload pattern. |
| Cache the language index during the initial scan | Removed repeated language loads and moved toward the target descriptor-offset lifetime, but did not reproduce its exact register allocation. |
| Reorder declarations pointer-first | Did not change the primary prologue allocation. |

The target prologue copies the state pointer to `r4` and the descriptor pointer to `r6`; the current near-match copies the state pointer to `r4` but the descriptor pointer to `r10`. The first reliable divergence is therefore `mov r6, r1` in the target versus `mov r10, r1` in the near-match. Subsequent item-count, descriptor, and item-cursor register differences cascade from that allocation. No forbidden controls, raw offset dereferences, inline assembly, volatile qualifiers, or source `.word` edits were used.
