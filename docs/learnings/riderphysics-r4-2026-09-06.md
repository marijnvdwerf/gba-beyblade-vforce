# riderphysics r4 learnings

## sub_804D710 (0x0804D710)

- Replaced the dump inclusion in `src/riderphysics.c` with a natural C implementation.
- The word read at offset `0x19C` required extending `RiderBase` while preserving its fixed size: `unk32 unk19C` between `padBC[0xE0]` and `pad1A0[0x5C]`.
- `sub_804E440` must return `unk8` (not `unk32`) so the caller emits the target `lsl r0, #24` normalization after the call. Its callee bytes remain unchanged.
- Matched all instructions at `0x0804D710` after the return-type correction.
