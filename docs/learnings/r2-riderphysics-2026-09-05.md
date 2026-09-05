# Rider physics round 2 — 2026-09-05

## UnsetRiderFlag (0x0804E40C)

Matched in `src/riderphysics.c`. The target is a direct read-modify-write of `RiderBase.flags` at offset `0x9C`; `rider->flags &= ~flags` emits the target five instructions exactly. `RiderBase.flags` remains `unk32` because this function proves only whole-word access and bitwise clearing.

## sub_804D104 (0x0804D104)

Matched in `src/riderphysics.c`. The function copies the two word fields at
`RiderBase` offsets `0x40` and `0x44` into the word fields at `0x48` and
`0x4C`, respectively. Extending the existing `RiderBase` padding with
`unk32 unk48` and `unk32 unk4C` preserves the fixed layout and emits the target
five instructions exactly.

## sub_804C870 (0x0804C870)

Matched in `src/riderphysics.c`. The signed `s32` parameter and fixed-point
formula `rider->unk208 = (arg1 * 0xC0 >> 8) + 0x600` reproduce the target's
multiply-by-three, shift-by-six, arithmetic shift-by-eight, and `0x600`
addition. The existing `RiderBase.unk208` signed field is retained.

## sub_804CEF4 (0x0804CEF4)

Matched in `src/riderphysics.c`. The action selector is an unsigned `unk32`
used in an explicit `if (action <= 4)` dense switch; retaining an empty case 3
produces the target jump table. The repeated speed updates use direct
`rider->unk208 += -0x600` followed by the signed clamp, which preserves the
store-before-compare sequence. The random values are staged from
`sub_8057C40()` before each actor-field assignment so the actor pointer reload
occurs before the shift/mask arithmetic. `RiderBase.unk21E` is a halfword field
at offset `0x21E`; its declaration preserves the existing fixed layout.

## sub_804CB08 (0x0804CB08)

Parked with the semantic draft retained under `#if 0`; first divergence was the target input-magnitude allocation (`r4`) versus the draft allocation (`r9`) immediately after the speed clamp. The draft-proven fields at offsets `0x1C4`, `0x1C8`, `0x1FC`, `0x22E`, and `0x230` were removed from `RiderBase` after parking.
