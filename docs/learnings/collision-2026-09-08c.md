# Collision matching notes 2026-09-08c

## sub_80567E4 (0x080567E4)

Status: parked. The best source draft is retained above the assembly include in `src/collision.c`.

The four-argument ABI is proven by `sub_8056B54` and `sub_80561EC`: `(LevelGeometryAddresses*, GeometryLine*, Actor*, CollisionResult*)`. The shared result layout in `src/collision.h` is the merged 0x28-byte shape: `unk8 pad0[8]`, `s32 unk8`, and `unk8 padC[0x1C]`. The parked draft uses a scratch result record inside its `#if 0` block for the additional target accesses at offsets 0, 4, C, D, E, and F; no draft-only fields are added to the shared header.

The clean direct draft built successfully and first diverged at offset 0x0C: target `mov r8, r1`, draft `mov r7, r1`. The target then keeps the line in r8, the first point in r7, the second point in r4, and the actor coordinate in r6. The direct draft kept the line in r7, first point in r9, second point in r8, and actor coordinate in r4.

Target-only loads are present in both orientation arms after actor-coordinate calculation. The Y arm loads point0->x and point1->x shifted by five; the X arm loads point0->y and point1->y shifted by five. Assigning dead `point0Other` and `point1Other` locals in the direct draft caused old_agbcc to remove those loads. A trial with four unconditional staged coordinate locals emitted all four coordinate loads before the flag test and did not match the target order.

The target flag test reads the complete byte at GeometryLine +0x11 and masks with 2. The existing shared GeometryLine declaration exposes bitfields at that byte for established users; the direct draft's bitfield read emitted extraction shifts (`lsl #29`, `lsr #29`) instead of the target raw `ldrb; and`. A packed byte/bitfield overlay trial produced the raw byte load but changed unrelated source accesses and still did not resolve allocation or ordering; it was reverted. No overlay remains in the committed source.

Near-miss step table:

| Change | Measured result |
| --- | --- |
| Direct typed point/result draft | First divergence at 0x0C; no target endpoint-coordinate loads; current body was 0x126 bytes versus target 0x12A. |
| Explicit dead `point0Other`/`point1Other` assignments in each orientation arm | Loads were eliminated; allocator and first divergence unchanged. |
| Packed GeometryLine byte/bitfield overlay | +0x11 raw byte access appeared, but an extra mask-copy sequence and the same point/register residue remained; existing geometry consumers were tested and the overlay was reverted. |
| Four unconditional coordinate locals (`point0X`, `point0Y`, `point1X`, `point1Y`) | All four loads moved before the orientation test, unlike target's selected-coordinate/actor/other-coordinate order; body became substantially farther from target. |
| Alias, point-variable order, and reused-relative trials from the preceding pass | No natural trial produced target line/point register roles; aliases were removed. |

Unproven layout assumptions are confined to the parked draft's scratch locals. No header field is added solely for this parked draft. The target shape requiring unexplained dead endpoint loads and a raw/bitfield overlapping GeometryLine view remains unresolved.

## sub_8056910 (0x08056910)

Status: parked. The best source draft is retained above the assembly include in `src/collision.c`.

The four-argument ABI is the same as `sub_80567E4`: `(LevelGeometryAddresses*, GeometryLine*, Actor*, CollisionResult*)`. The target begins with a 16-byte local frame and spills the line pointer at `[sp]`. The latest natural draft retained an 8-byte frame and kept the line in `r9`; its first divergence is at offset `0x0A` (`sub sp, #16` in the target versus `sub sp, #8` in the draft), followed by the target `str r1, [sp]` at `0x0E`.

The target register roles after the prologue are actor in `r8`, result in `r7`, first point in `sl` (`r10`), and second point in `r9`. The draft instead allocates actor/result and both point values differently. The target reads the complete GeometryLine byte at `+0x11` and masks it with 2. The shared bitfield declaration in the natural draft emits extraction normalization (`lsl #29; lsr #29`, followed by byte normalization) before the mask, unlike the target raw `ldrb; and`. The target also uses signed `ldsh` at `+0x12`, signed `ldsb` at `+0x18`, unsigned `ldrb` at `+0x19`, unsigned `ldrh` at `+0x1A`, and signed `ldsh` at `+0x1C`; these accesses are recorded here without adding fields for the parked draft to the shared header.

The interpolation body is semantically close to the draft, but its register and stack lifetimes diverge from the first point onward. The target keeps the original endpoint difference at `[sp, #4]`, the sorted endpoint range at `[sp, #8]`, and the actor base coordinate at `[sp, #0xC]`. The latest `currentLine` alias trial did not change the 16-byte-frame or register-role divergence and was removed before parking.

Near-miss step table:

| Change | Measured result |
| --- | --- |
| Initial typed semantic draft | First divergence at `0x0A`: target 16-byte frame versus draft 8-byte frame; target line spill at `0x0E` was absent. |
| `GeometryLine* currentLine = line` alias and accesses through the alias | Built successfully but retained the same 8-byte frame and did not recover the target line spill or actor/result/point register roles. |
| Signed `GeometryLine.unk18` declaration | Produced the required signed-byte access evidence for this function's target, but did not resolve frame or allocation differences; the field is already present as `s8` in the shared layout. |
| Raw-byte/bitfield overlay trial | Produced a raw byte load but added an unsuitable mask-copy sequence and changed established users; reverted before parking. |

The parked function uses a scratch result record inside its `#if 0` block because the merged shared `CollisionResult` header intentionally exposes only the confirmed `unk8` field. No casts, raw-offset accesses, or other matching levers are retained in the parked draft.
