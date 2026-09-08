# Collision matching notes

## sub_8055F04 (0x08055F04)

The target body is 40 bytes. The target's first post-call instruction is `lsl r0, #16`; the natural two-call draft emits `mov r0, r4` at that position and is 36 bytes. `RiderBase.unk10` is declared `s32`, producing the target `asr r1, #4`.

| Measured source-shape change | First divergent instruction | Size delta |
| --- | --- | ---: |
| Raw decompiler pointer assignment | Target `0x16: lsl r0, #16`; draft `0x16: mov r0, r4` | 36 vs 40 bytes (`-4`) |
| Typed pointer temporary | Target `0x16: lsl r0, #16`; draft `0x16: mov r0, r4` | 36 vs 40 bytes (`-4`) |
| `void*` pointer temporary | Target `0x16: lsl r0, #16`; draft `0x16: mov r0, r4` | 36 vs 40 bytes (`-4`) |
| Separate assignment to `rider` | Target `0x16: lsl r0, #16`; draft `0x16: mov r0, r4` | 36 vs 40 bytes (`-4`) |
| Nested assignment to `rider` | Target `0x16: lsl r0, #16`; draft `0x16: mov r0, r4` | 36 vs 40 bytes (`-4`) |
| Direct parameter reassignment | Target `0x16: lsl r0, #16`; draft `0x16: mov r0, r4` | 36 vs 40 bytes (`-4`) |
| OR/add-zero pointer expressions | Target `0x16: lsl r0, #16`; draft `0x16: mov r0, r4` | 36 vs 40 bytes (`-4`) |
| Unused `unk32` result temporary | Target `0x16: lsl r0, #16`; draft `0x16: mov r0, r4` | 36 vs 40 bytes (`-4`) |
| Unused `s16` result temporary | Target `0x16: lsl r0, #16`; draft `0x16: mov r0, r4` | 36 vs 40 bytes (`-4`) |
| Direct unused helper call | Target `0x16: lsl r0, #16`; draft `0x16: mov r0, r4` | 36 vs 40 bytes (`-4`) |
| Assignment to `angle` | Target `0x16: lsl r0, #16`; draft `0x16: mov r0, r4` | 36 vs 40 bytes (`-4`) |
| Assignment to `collisionMask` | Target `0x16: lsl r0, #16`; draft `0x16: mov r0, r4` | 36 vs 40 bytes (`-4`) |
| `sub_804E358` return view changed to `unk16` | Target `0x16: lsl r0, #16`; draft `0x16: mov r0, r4` | 36 vs 40 bytes (`-4`) |
| Wide helper parameter/prototype views | Target `0x16: lsl r0, #16`; draft `0x16: mov r0, r4` | 36 vs 40 bytes (`-4`) |
| Explicit shifted expression statement | No object: compiler rejected the unused value with a warning treated as an error | N/A |
| Final direct two-call draft | Target `0x16: lsl r0, #16`; draft `0x16: mov r0, r4` | 36 vs 40 bytes (`-4`) |

The final retained natural draft was:

```c
void sub_8055F04(Actor* actor, RiderBase* rider, GeometryLine* line, unk16 collisionMask, s16 angle)
{
    sub_804E358(angle, rider->unk10 >> 4);
    sub_804E154(rider, 0, 0);
}
```

The function remains parked under `#if 0` immediately above its assembly include. No header fields were added for the parked draft.

## def_94_4_AddWithBoundingAreaMessage (0x0805616C)

The body matches with the count test `withBoundingAreaCount > 0x1F`, an overflow `printf(Str_87297D0)`, and the normal-path indexed store followed by `withBoundingAreaCount++`. `withBoundingAreas` is the existing 32-entry `unk32` array, and the third callback parameter is stored unchanged at the indexed word.

The target preserves `r0` through the epilogue and uses `pop {r1}`/`bx r1`; the matching definition therefore has the ABI return view `unk8` with no explicit return value. A `void` definition produced the same body but `pop {r0}`/`bx r0`. Changing `ActorCollisionOverlap` to return `unk8` allows direct registration with no cast; `sub_8055CB8` remains byte-identical. The first void-form divergence was offset `0x2A`; the `unk8` form has no instruction differences.

## sub_8056B54 (0x08056B54)

After exposing `GeometryLine` byte `0x11` bits as individual one-bit fields, `line->unk11_2 == 0` emits the target raw test `mov r0, #4; ldrb r1, [r4, #17]; and r0, r1`; the previous three-bit `unk11_0` declaration emitted an extra shift/extraction sequence. The target callback body matches with a 0x28-byte `CollisionResult` local and `s32 unk8` at offset `0x8`.

The target comparison is `ldrh r1, [r7, #18]; cmp r1, r0; bge`; spelling the condition as `object->unk12 < (result.unk8 >> 8)` produces that operand order, whereas `(result.unk8 >> 8) > object->unk12` emitted the reversed `cmp`/`ble` pair.

The value in `r0` at both exits is the shifted result `result.unk8 >> 8`: the result is initialized to zero for skipped line types, and the common tail reloads and arithmetic-shifts the result before the comparison and epilogue. Declaring `sub_8056B54` as `unk8` with no return statement produces the target `pop {r1}; bx r1`. Changing `ActorCollisionOverlap` from `void` to `unk8` permits direct callback registration without a cast.

Measured after the callback typedef change: `def_94_4_AddWithBoundingAreaMessage`, `sub_8055CB8`, and `sub_805CEB8` remain instruction-identical. Existing `GeometryLine.unk11_3` users `allocateDynamicBoundingAreas`, `initQuadTreeNode`, and `sub_8055D64` also remain instruction-identical.

The first ROM compare after the body and ABI matched failed only in the switch jump table. The target's fall-through case set is `0x80, 0x82, 0x86, 0x87, 0x89, 0x8B, 0x8C, 0x8D, 0x8E, 0x90, 0x91, 0x92`; using the corrected list made all 19 jump-table entries and the ROM SHA1 exact. The earlier inferred list incorrectly classified `0x86`, `0x89`, `0x8B`, and `0x90` as helper cases and `0x88`, `0x8A`, and `0x8F` as fall-through cases.
