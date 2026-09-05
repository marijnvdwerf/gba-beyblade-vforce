# R2 collision and rider matching — 2026-09-05

## sub_80561A0 (0x080561A0)

Matched in `src/collision.c`. The target's signed loop comparisons establish
`s32 withBoundingAreaCount`; `withBoundingAreas` is a 32-element `unk32` array
(the existing 0x80-byte storage). A `unk32*` cursor with post-increment emits
the target's `ldmia` cursor load and exact loop shape. The function diff is
instruction-exact and the ROM compare passes.
