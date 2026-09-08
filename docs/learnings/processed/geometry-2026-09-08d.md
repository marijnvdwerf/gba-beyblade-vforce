# Geometry matching notes

## call_rider_94_8 (0x0805D400)

Matched exactly at 48 bytes. The helper initializes a byte-sized success result to
one, loads `Actor.callbacks.unk4`, and invokes its `unk8` filter callback when
both the callback bundle and filter are non-NULL. The callback result is narrowed
to a byte before returning. The `unk16` mask parameter produces the target
halfword normalization at entry, while `ActorCollisionFilter` supplies the
indirect-call signature.

The result initialization must precede loading `rider->callbacks.unk4`; reversing
those two source statements moves `mov r1, #1` after the callback-bundle load and
changes the ROM bytes. No local temporary beyond the callback pointer and result
is byte-required. No casts, raw offsets, or artificial control-flow shapes are
used.

`bun run tools/diff/diff.ts call_rider_94_8` has no differing instructions, and
`cmake --build build --target compare` passes. The assembly dump was removed after
verification.

## sub_805DBF0 (0x0805DBF0)

Matched exactly at 228 bytes. The function walks the variable-length spline
records returned by `GetSplineAtIndex`, skips the target spline, and scans each
point-index array with independent line and point-index cursors. `SplineConnection`
therefore uses pointer fields at offsets `0x0`, `0xC`, and `0x10`; the record
stride remains 20 bytes.

The target's 16-byte frame and cursor setup require separate initial line and
point-index bases, moving line and point-index cursors, and a predecessor cursor.
The inner null-line value is a block-local `GeometrySplineLine*` initialized to
`NULL`; no integer-to-pointer conversion is used. The `unk16` capacity and count
locals retain the target `lsl/lsr #16` normalizations. The target's return value
is wide (`mov r0, r8` with no byte normalization), so the declaration is
`unk32`. Each of the two conditional call sites in `sub_805D650` assigns the
wide result to a block-local `unk8 found` before testing it; this typed local
reproduces the caller's `lsl/lsr #24` normalization without a cast. The four
discarded-result call sites need no temporary.

Measured alternatives: with the requested `unk8` return declaration and the
same `unk16 count`, the body otherwise matched but the increment sequence used
`mov r2, #16` instead of the target's `mov r1, #16`, and the return emitted
`mov r1, r8; lsl r0, r1, #24; lsr r0, #24`. The successful `unk32` declaration
with one typed `unk8 found` local in each conditional caller changed both
remaining differences to the target. A separate connection temporary enlarged
the frame, and a direct indexed point-index load lost the target moving-cursor
form; neither is retained.

`bun run tools/diff/diff.ts sub_805DBF0` and
`bun run tools/diff/diff.ts sub_805D650` have no differing instructions, and
`cmake --build build --target compare` passes. The assembly dump was removed
after verification.

## sub_805DD18 (0x0805DD18)

Parked with the best typed draft retained above the assembly include. The target
prologue establishes a 12-byte local frame after saving r4-r7 and the incoming
high registers. Its measured register roles are geometry in r7, result in r8,
position in r5, spline in r6, line base in r9, and segment index in sl/r10.
The two point pointers occupy [sp] and [sp, #4], and one coordinate is later
spilled at [sp, #8].

The draft reproduces the variable-length line-base calculation, position clamps,
point lookup sequence, and linear/curved interpolation semantics, but it does
not reproduce the target register roles or final frame consistently. The latest
measured first divergence was at relative offset 0x0C: target `mov r7, r0` versus
draft `mov r8, r0`; the draft also spilled the result pointer and used a 16-byte
frame in the latest reduced experiment. Earlier pointer-array variants reached
the target 12-byte frame but still assigned the incoming values to the wrong
registers.

| Change | Measured result |
| --- | --- |
| Target register roles | geometry=r7, result=r8, position=r5, spline=r6, line base=r9, index=sl/r10, point pointers=[sp]/[sp, #4], spilled coordinate=[sp, #8]. |
| Explicit two-element point-pointer array | Reproduced point pointers at [sp] and [sp, #4]; frame and register allocation remained mismatched. |
| Direct line-base materialization from `spline->pointIndices[spline->pointCount]` | Reproduced the target add/scale/add sequence and kept line base in the target-style long-lived role. |
| Explicit interpolation temporaries and latest reduced expression form | Latest first divergence remained at 0x0C; result was spilled and frame grew to 16 bytes. |
| Union view for the +0x8 line halfword | Reverted: the observed accesses differ in signedness but not width, so they do not justify a differing-width union. |
| `GeometrySplineLine.unkA` in the canonical header | Reverted to padding because only the parked draft uses that field. |

The canonical `GeometrySplineLine` layout remains `s16 unk8` followed by
`unk8 padA[2]`; the parked draft uses a private scratch layout for its unproven
+0xA access.

## Signedness audit and fold review (2026-09-08d follow-up)

The signed declarations retained in the matched functions and parked draft are
supported by the following target instructions. `call_rider_94_8` has no signed
declaration: its `unk16 mask` is normalized with `lsl #16`/`lsr #16` at
`0x0805D408`/`0x0805D40A`, and its `unk8 result` is byte-normalized at
`0x0805D420`/`0x0805D422`.

- `sub_805DBF0.s32 splineIndex` is used by the signed `bge` loop exit at
  `0x0805DCB2`; `s32 index` is used by the signed `bge` at `0x0805DC2A`,
  `ble` at `0x0805DC5A`, and `bge` at `0x0805DC6A`. Its `unk16 count` remains
  unsigned: the capacity/count path uses `lsl #16`/`lsr #16` and `bcs` at
  `0x0805DC92`.
- In `sub_805D650`, `s32 index` is established by `asr #18` at
  `0x0805D66C`; `s32 endPosition` is shifted with `asr #8` at
  `0x0805D9F8`; `s32 velocity` is tested with signed `ble` at
  `0x0805D8B0`; `s32 delta` is formed with `asr #8` at `0x0805D6E8` and
  tested with signed `blt` at `0x0805D894`; `s32 angle` is tested with signed
  `ble` at `0x0805D842` and `blt` at `0x0805D894`; and the
  `s32 previousPosition`/`s32 newPosition` difference is tested with signed
  `bge` at `0x0805DA7C`. `s32 values[6]`, `s32 nextPoint`, `s32 callbackPoint`,
  and `s32* result` are also fixed by their call sites: the interpolation
  helpers and callback table use signed `s32*`/`s32` views. `GeometrySplineLine`
  supplies signed evidence for the fields used here: `unk0` is loaded with
  `ldrsb` at `0x0805D848`, `0x0805D84E`, and `0x0805D868`; `unk8` is loaded
  with `ldrsh` at `0x0805D832` and `0x0805D83C`; and `unkC` participates in
  the signed `muls`/`asr #8` sequence beginning at `0x0805D6E2`.
- The `sub_805D650` locals `remaining` and `nextIndex` had no signed load,
  arithmetic shift, or signed branch requiring `s32`. Both were changed to
  `unk32`; the complete `sub_805D650` and `sub_805DBF0` instruction diffs
  remained exact, and the ROM compare passed.
- In the parked `sub_805DD18` draft, `s32 position` has the signed `bge` at
  `0x0805DD42`, `asr #10` at `0x0805DD44`, and signed `blt` at
  `0x0805DD4A`; `s32 index` has `bge` at `0x0805DD8A` and signed `ble` at
  `0x0805DDD6`; `s32 angle` has the sign-normalizing `lsl #16`/`asr #16`
  sequence at `0x0805DDA0`/`0x0805DDA8` and signed `bge` at
  `0x0805DDAE`. `s32 midpointX` and `s32 midpointY` use the signed
  `asr #1` operations at `0x0805DE50` and `0x0805DE54`; `s32 firstX`,
  `s32 firstY`, `s32 secondX`, and `s32 secondY` use the signed interpolation
  `asr #10` operations at `0x0805DE5E`, `0x0805DE6C`, `0x0805DE78`,
  `0x0805DE82`, `0x0805DE8E`, and `0x0805DE98`. The draft's `s32* result`
  is the signed result view passed by the `s32 values[6]` call site in
  `sub_805D650`. The scratch `unk8` field at `+0x0` is `s8` by the canonical
  `GeometrySplineLine` `ldrsb` instructions above; its `s16` field at `+0x8`
  is confirmed by the draft target's `ldrsh` at `0x0805DDC6` and by
  `sub_805D650` at `0x0805D832`. The scratch `s32` field at `+0xC` is the
  same signed line-length/scale field used by the `muls`/`asr #8` sequence.
  The draft's `angle0`/`angle1`/`angle2` locals remain `unk16`; their signed
  per-use casts are proven by `ldrh` followed by `lsl #16`/`asr #16` at
  `0x0805DDC0`-`0x0805DDC4` and `0x0805DDCC`-`0x0805DDD0`.

The fold experiments were kept one source-shape change at a time and checked
against both matched functions where they emit code:

| Fold | Result | First divergence |
| --- | --- | --- |
| `sub_805DBF0.pointIndexStart` | Kept; folding failed | `sub_805DBF0 +0x2E`: target stages `add r2, r3, r0`, while the folded form uses `add r0, r3, r0` and loses the separate line-base lifetime. |
| `sub_805DBF0.nullLine` | Kept; fold rejected by full-ROM check | No differing instruction in `sub_805DBF0` or `sub_805D650`, but the folded build changed the ROM SHA1 from `cd527c8c24e20e33913fc45199e64b3e6138a6e5` to `8f78a4354d39983cd4ac8eb2439800a86d493de7`; restoring the alias returned the expected SHA1. |
| First block-local `sub_805D650.unk8 found` | Kept; folding failed | `sub_805D650 +0xE8`: target has `lsl r0, #24`/`cmp r0, #0` at `0x0805D738`; the folded form starts with `cmp r0, #0`, losing the byte result normalization. |
| Second block-local `unk8 found` | Untested | — |
| Parked `angle0`, `angle2`, `firstX`, `firstY`, `secondX`, `secondY` | Untested; retained in the `#if 0` draft | They are compile-elided and were not spent as build experiments. |

The null-line alias is retained in source because the folded form failed the
full-ROM check despite no instruction difference in either matched function.
`pointIndexStart` and the tested `found` local remain because their distinct
lifetimes are required by the matched bytes.
