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
