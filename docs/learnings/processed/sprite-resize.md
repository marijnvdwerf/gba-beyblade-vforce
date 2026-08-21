# resizeSpriteBlock matching note

`resizeSpriteBlock` at `0x08060D98` remains parked behind `INCLUDE_ASM` in
`src/sprite.c`. The natural C draft is retained under `#if 0` immediately
above the inclusion. It is semantically based on the allocator/list behavior,
but it does not match the original instruction allocation.

## Remaining divergence

The target starts with the following allocation after normalizing the two
16-bit arguments:

- `block` is kept in `r5`.
- `new_size` is copied from `r1` to `r4`.
- `arg2` is narrowed into `r3` and then kept in `r7`.
- `block->x` is loaded into `r2`.

The closest retained draft instead produces:

- `block` in `r5`.
- `new_size` in `r7`.
- `arg2` narrowed in place in `r2` and then copied to `r6`.
- `block->x` loaded into `r4`.

The target's growth path then keeps the `_spritesFree` address in `r9` and
its loaded value in `r8`; the draft uses different registers, generally
`r8`/`r0` or `r12`/`r0` depending on the source shape. The target uses `r10`
for the first newly inserted node, `r3` for the free-list cursor, `r6`/`ip`
for the existing block tail, and the stack slot at `[sp]` for the predecessor
cursor. The retained draft uses an ordinary predecessor pointer; the target's
stack spill is therefore still unresolved. The remaining list-node values are
also allocated to different registers.

The target also copies `first->var22` into `r7` once and stores that value to
each new node. Several drafts reload the field or place the value in another
register. These allocation differences change branch offsets, literal-pool
placement, and the trailing alignment halfword even when the control flow and
memory operations are semantically equivalent.

## Source shapes tried

The following natural-C variations were tested against the target object:

- The direct typed `SpriteEntry *` implementation with 16-bit `extra`; this width is retained because the target explicitly narrows it with `lsl r0, #16` followed by `lsr r4, r0, #16` at offsets `0x2C-0x30`.
- `previous = new_first` instead of the rough draft's `previous = last`.
- A volatile predecessor pointer to reproduce the target's stack slot.
- Cached `old_size` locals with both `unk32` and narrower forms.
- Explicit normalized `size`/`value` aliases for the arguments.
- A cached `first->var22` value.
- `SpriteTextBlock *` parameter variants and typed allocator-call prototypes.
- Explicit `_spritesFree` pointer and volatile-global variants.
- 32-bit formal arguments with explicit 16-bit narrowing.
- Multiple local declaration orders to probe agbcc register coloring.

None reproduced the target's complete register allocation and instruction
layout without introducing artificial register-pinning or assembly hacks,
which are not appropriate for the final source.

The active assembly implementation is intentionally unchanged. The current
ROM remains byte-identical with the parked state.
