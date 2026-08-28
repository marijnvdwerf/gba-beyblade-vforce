# Fresh small frontend

## sub_805041C

The function remains assembly-backed. The preserved C draft in `src/motion.c` is the closest natural source shape tested.

First divergence in the closest draft is at the final axis-selection sequence after the boundary adjustment. The target emits `mov r0, r1`, `mov r1, ip`, and then tests `r1`; the draft emits `mov r0, r12` and tests `r0`. The target function is 0xC8 bytes; the draft is 0xC6 bytes. Earlier instructions through the motion updates, sprite updates, boundary arithmetic, reflected velocity calculation, and loop tail match except for branch polarity and downstream address shifts.

### Step table

| Step | Experiment | Result |
| --- | --- | --- |
| 1. Temporary reduction | Reduced the function to typed `MotionEntry*` and `SpriteEntry*` cursors, cached mode flags, signed axis temporaries, and the shared boundary condition. | Established the correct prologue, cursor registers, motion record stride, sprite-list walk, and signed reflected-velocity operation. |
| 2. Ternary versus if/else and precompute-then-overwrite | Compared direct axis-specific stores with shared-value and branch-reordered forms. The closest form uses an `if/else` with axis-specific stores and reuses `vertical` for the reflected result. | Direct axis-specific stores preserve the target store widths and branch layout; ternary and precomputed store values changed control flow or register allocation. |
| 3. Signedness sweep | Tested unsigned and signed forms for the motion velocity, selected axis, and reflection factor. | `vertical` and `UnkMotion.unk14` must be signed to produce the target `neg` followed by arithmetic `asr #8`. The cached mode flags remain `unk32`. |
| 4. Loop shape | Compared top-tested loops, countdown loops, and a guarded `do/while`. | The explicit entry guard followed by a `do/while` produces the target ascending cursor updates and loop-back comparison. |
| 5. Statement order | Kept position updates before velocity updates, sprite writes before boundary handling, selected-axis extraction before threshold arithmetic, and cursor increments at the bottom. | This matches the target through the boundary arithmetic and preserves the target register roles. Caching `group->unk10` in a `limit` local worsened the match by changing arithmetic registers and adding downstream differences. |
| 6. Declaration scope | Cached `mode3`, `axisFlag`, and `reflect` for the loop; kept `horizontal`, `vertical`, `boundary`, and `delta` as function locals. Tried a late axis temporary and removed it when agbcc coalesced it without improving the output. | The cached mode flags reproduce the target saved-register allocation. The remaining axis-register movement was not recovered without an artificial temporary or an unnatural source rewrite. |

The best draft was retained directly above the `INCLUDE_ASM` line inside a bare `#if 0` block, as required for a parked function.
