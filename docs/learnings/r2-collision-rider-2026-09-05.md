# R2 collision and rider matching — 2026-09-05

## sub_80561A0 (0x080561A0)

Matched in `src/collision.c`. The target's signed loop comparisons establish
`s32 withBoundingAreaCount`; `withBoundingAreas` is a 32-element `unk32` array
(the existing 0x80-byte storage). A `unk32*` cursor with post-increment emits
the target's `ldmia` cursor load and exact loop shape. The function diff is
instruction-exact and the ROM compare passes.

## allocFXSprite (0x0804BEDC)

Matched in `src/rider.c`. The RiderBase byte at `0x3CE` is exposed as
`unk3CE`; its shift by four reproduces the target size calculation. Keeping an
`existing` pointer local preserves the three zero stack arguments to
`LoadSpriteSheet`, and assigning the allocated sprite back after the null
check reproduces the target store and control flow.

## GetQuadTreeNodeForPos (0x0805C308)

Matched in `src/geometry.c`. The root and node bounds are signed 32-bit
fields because midpoint subtraction and arithmetic shifts are signed. The
node's four child pointers, bounds, and leaf count are exposed in
`QuadTreeNode`; the existing root layout remains 0x2C bytes. Caching the
current node in a separately typed pointer after the null check reproduces
the target's reuse of the root argument register for child loads. The
function diff is instruction-exact and the ROM compare passes.

## sub_804BF3C (0x0804BF3C)

Parked in `src/rider.c` with the best typed semantic draft immediately above the original assembly inclusion; the RiderBase and display-record fields introduced only for this near-match were reverted when the function remained on assembly. First divergence: the target begins with `mov r12, r0`, while the best natural typed draft begins with a different base-pointer allocation (`adds r5, r0`).
