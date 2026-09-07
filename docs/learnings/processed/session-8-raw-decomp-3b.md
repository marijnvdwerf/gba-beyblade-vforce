# Session 8b learnings — sub_805AFBC (menu item navigation)

EARLIER notes, copied verbatim from the user's `raw-decomp-3` branch
(pre-house-style). Superseded where they conflict with
`round5-style-2026-09-07.md`.

## sub_805AFBC (0x805AFBC, menu.c)

Menu item cursor movement: steps through items (up or down based on `arg1`),
wrapping at boundaries, skipping disabled items (`unk44 != 0`), updating
selection and firing callbacks.

### Matched first try

The parked `#if 0` draft used `goto` (forbidden). Restructured as
`while (count-- != 0)` with `continue` (skip disabled) and `break` (found
valid item). This is the natural C for the asm's "jump to condition at entry,
body loops back to condition" pattern:

- `.L805B038` (condition): `mov r0, r2; sub r2, #1; cmp r0, #0; bne body`
  = post-decrement while.
- `.L805AFD8` (body top): advance cursor, wrap, check item, continue or
  update-and-break.

### Key observations

- **`while (count--)` for entry-at-condition loops**: when asm initializes,
  jumps to a bottom condition block, and loops back from the body, the natural
  C is a `while` with the decrement in the condition. No goto needed.

- **`continue` for skip-and-recheck**: `bne .L805B038` (back to condition) from
  inside the loop body = `continue` in C. Clean match.

- **Struct field exposure**: `pad44[4]` in `UnkMenuItem` split to
  `unk8 unk44; unk8 pad45[3];` because offset 0x44 is accessed with `ldrb` as
  a skip/disabled flag. Field exists because it's accessed.

- **Signed comparisons on `current`**: `bge` and `blt` at the wrap-around
  checks prove `current` is `s32`. `step` is also `s32` (-1 or 1).

- **Function pointer via `_call_via_r5`**: `state->callback` loaded into `r5`
  (reusing the register after `step` is dead), called indirectly. The
  `_call_via_rN` pattern = function pointer call in source.

- **`u8` parameter normalization**: `lsl r1, #24` then `cmp r1, #0` — the
  shift is entry normalization for a `u8` formal, not source-level shifting.
  Just declare `u8 arg1` and test `arg1 != 0`.

## sub_8056EC0 (0x8056EC0, collectable.c)

Iterates collectables, checking collected-bit flags against a saved state
bitfield, calling handlers for each collected item.

### Array member vs pointer indexing for address formation

The critical match fix: `(&state->unk10)[i >> 5]` (pointer indexing a scalar
field) produces `add r0, r3, r1; ldr r0, [r0, #16]` — the compiler folds the
struct offset into the load displacement. But the target does
`mov r0, r8; add r0, #16; add r0, r3; ldr r0, [r0]` — three incremental adds
then load at displacement 0.

**Fix**: declare `unk10` as `unk32 unk10[2]` (absorbing the adjacent `unk14`)
and use `state->unk10[i >> 5]` (embedded array member indexing). Agbcc
computes embedded array accesses as `base + member_offset + index*scale`
without folding the member offset into the load displacement.

This matches the skill's rule: "`ptr[i + k]` on a pointer variable can fold
constant `k` into the load displacement, while indexing an embedded array
member may scale the whole `i + k` before adding its base."

### Other observations

- **Address derivation from nearby offset**: target computes
  `cursor = data->entries` as `add r1, #4; add r5, r0, r1` reusing the
  collectables offset literal (0x12F4 + 4 = 0x12F8). The source
  `cursor = data->entries` naturally produces this when `data` was just
  computed from the same offset.

- **No `bit` temporary needed**: inlining `1 << (i & 0x1F)` at both use
  sites matched — the compiler CSEs the bit computation across the two
  tests within the same iteration.
