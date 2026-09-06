# riderphysics r4 learnings

## sub_804D710 (0x0804D710)

- Replaced the dump inclusion in `src/riderphysics.c` with a natural C implementation.
- The word read at offset `0x19C` required extending `RiderBase` while preserving its fixed size: `unk32 unk19C` between `padBC[0xE0]` and `pad1A0[0x5C]`.
- `sub_804E440` must return `unk8` (not `unk32`) so the caller emits the target `lsl r0, #24` normalization after the call. Its callee bytes remain unchanged.
- Matched all instructions at `0x0804D710` after the return-type correction.

## sub_804E154 (0x0804E154)

- Replaced the dump inclusion in `src/riderphysics.c` with a natural C implementation retaining the three-argument ABI; the middle argument is unused.
- The third argument remains `unk32` at the prototype, with a local `unk16` copy to produce the target entry `lsl`/`lsr` narrowing before the first call.
- Added only the accessed `RiderBase` fields at offsets `0x30`, `0x3C`, `0x6C`, `0x70`, `0x74`, `0xCC`, `0x144`, `0x150`, `0x19C`, `0x1EE`, and `0x1F2`, preserving the fixed `0x428`-byte layout.
- The `RiderHasFlag` result is tested directly; plain zero stores and signed `s16` field declarations reproduce the target evaluation order and register allocation without aliases or casts.
- A local `unk16` copy of the third argument is required to keep its entry normalization and final halfword store shape.
- Matched all instructions at `0x0804E154`.
