# R2 collision and rider matching — 2026-09-05

## sub_80561A0 (0x080561A0)

Matched in `src/collision.c`. The signed loop comparisons establish
`s32 withBoundingAreaCount`; `withBoundingAreas` is a 32-element `unk32`
array (the existing 0x80-byte storage). The indexed loop is instruction-exact
and preserves the target `ldmia` cursor load. The function diff is exact and
the ROM compare passes.

## allocFXSprite (0x0804BEDC)

Matched in `src/rider.c`. The RiderBase byte at `0x3CE` is exposed as
`unk3CE`; shifting it by four reproduces the target size calculation. Passing
literal zero arguments to `LoadSpriteSheet` is instruction-exact. Folding the
`existing` pointer into the null check is also instruction-exact, so no cached
local is needed. The function diff is exact and the ROM compare passes.

## GetQuadTreeNodeForPos (0x0805C308)

Matched in `src/geometry.c`. The root and node bounds are signed 32-bit fields
because midpoint subtraction and arithmetic shifts are signed. The node's four
child pointers, bounds, and leaf count are exposed in `QuadTreeNode`; the
existing root layout remains 0x2C bytes. Staged root and nested midpoint locals,
a separately typed `current` node pointer, and explicit root and child switch
ladders are required for the exact code shape. The function diff is exact and
the ROM compare passes.

Shape retry results:

| Variant | Result |
| --- | --- |
| Direct root midpoint expressions | Diverged immediately after the prologue; the target starts with `mov r6, r0`, while direct expressions allocate registers differently. |
| Direct nested midpoint expressions | Diverged at `+0x08`; staged nested min/max/midpoint locals were restored. |
| Fold `current` into child selection | Diverged around `+0x90`; the target retains `mov r6, r4` before loading child pointers. |
| Indexed root selection | Diverged in root selection and removed the target switch ladder. |
| Natural `children[4]` child array | Diverged around `+0x78`, producing indexed shift/add addressing instead of the target switch. |

## sub_804BF3C (0x0804BF3C)

Parked in `src/rider.c` with the best typed semantic draft immediately above
the original assembly inclusion. The draft uses offset-marked scratch structs
inside its `#if 0` block and begins with the required `RiderDraft*` cast. The
RiderBase, Actor, DisplayRecord, GameData, and camera header/layout changes
introduced only for this near-match were reverted. First divergence of the
best draft is the target's `mov r12, r0` versus the draft's `adds r5, r0`.

The staged `fxX` local was retained in the parked draft: folding it into the
sprite store increased the frame and diverged at the prologue. The draft
remains on assembly because the natural typed variants did not match.

## Header changes retained after parked-draft rollback

- `src/ram.h`: `withBoundingAreaCount` and `withBoundingAreas` declarations,
  used by matched `sub_80561A0`.
- `src/ram.h`: the proven `QuadTreeNode` child-pointer, bound, and leaf fields,
  used by matched `GetQuadTreeNodeForPos`.
- `src/common.h`: `RiderBase.unk3CE`, used by matched `allocFXSprite`.
- `src/rider.h`: the owning `allocFXSprite(RiderBase*)` prototype.
- `src/unsorted.h`: the shared `sub_80561A0(unk32, unk32)` prototype.

No parked-only CameraState embedding, DisplayRecord fields, RiderBase/Actor
fields, or `sub_805EF18` header prototype remains.
