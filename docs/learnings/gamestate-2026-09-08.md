# Gamestate matching notes (2026-09-08)

## sub_80518C8 (0x080518C8)

The function counts set bits in `sub_8051720(index)->unk10[0]`. A plain `while (value != 0)` with `u32 value`, `unk32 count`, and `s32 index` is byte-identical to the target; agbcc rotates the plain loop into the observed entry-test shape. The target uses `lsr` for the value shift, so `u32 value` is retained. The sole real caller passes a level index as the existing `s32` API parameter.
