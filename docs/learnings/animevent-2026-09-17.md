# animevent matching notes — 2026-09-17

## sub_805FCC8 (0x0805FCC8)

- The function takes an `UnkAnimEventData*` whose allocation handles are `AllocatedBlock*` fields at offsets 0x18, 0x1C, and 0x28; it deallocates them in target order 0x28, 0x18, 0x1C and clears them in the same order.
- The `void` implementation with direct typed field accesses matches all target instructions. No local temporary or artificial control-flow shape is required.
- `bun run tools/diff/diff.ts sub_805FCC8` reports every instruction equal.

## sub_805FA8C (0x0805FA8C)

- The function appends a polygon index to a scanline's linked list when `unk4 < unk2`; each scanline record is four bytes at `unk8` with signed halfwords at offsets 0 and 2, and each polygon record is four bytes at `unkC` with signed halfwords at offsets 0 and 2.
- `PolyTable.unk4` is signed: the index/limit comparison uses `ldrsh` from offset 0x4, while later stores and increment use `ldrh` as a narrow store source. `PolyTable.unk2` is unsigned from its `ldrh` comparison load.
- A separate `unk32 offset = scanline->unk2` temporary is byte-required: using `entry = arg0->unkC + offset` emits the target's `ldrsh; lsl #2; ldr; add` order, while direct indexed access loads the table base before scaling. The temporary is not literal-valued and has a distinct address-calculation role.
- The implementation matches `sub_805FA8C` instruction-for-instruction. `newPolyTable`, `sub_805FA4C`, and `sub_805FA68` remain instruction-for-instruction matches after the shared `PolyTable` field typing.

## sub_805FE04 (0x0805FE04)

- The function takes `UnkAnimEventData*`; it clears halfword fields at offsets 0x0, 0x2, 0x24, 0x26, 0x2E, and 0x30, then uses two 32-bit fixed-source DMA clears through `DmaClear(3, ..., ..., ..., 32)`.
- `UnkAnimEventData.unk1C` is an `AllocatedBlock*` and `unk10` is a `unk32*`, proven by the DMA destination/address loads at offsets 0x1C and 0x10. `unk6` is an unsigned-width `unk16` from the target `ldrh` loads.
- The second DMA size must be written as `(arg0->unk6 >> 5) << 2`; spelling it as `(arg0->unk6 >> 5) * 4` lets agbcc cancel the macro's division by four and removes the target `lsl #2; asr #2` pair.
- The implementation matches `sub_805FE04` instruction-for-instruction and the full US ROM SHA1 compare passes.
## sub_805FB60 (0x0805FB60)

- The function logs one `PolyScanline` and walks its linked `PolyEntry` chain, using `unk0` as the first index and `unk2` as the next index; `-1` terminates each chain.
- `PolyScanline.unk0/unk2` and `PolyEntry.unk0/unk2` remain signed halfwords, evidenced by `ldrsh` at every logging, termination, and index use.
- The `nullsub_9`/`nullsub_10` debug stubs take `s32` value parameters: `unk16` prototypes produce `ldrh` for the halfword arguments, while `s32` parameters produce the target `ldrsh` sequence; variadic prototypes do not match.
- A direct positive `if` assignment for the next entry preserves the target's branch layout and direct `add r4, r1, r0`; the equivalent ternary and explicit `continue` forms diverged in the result-register copy or field reload.

## sub_805FD80 (0x0805FD80)

- The function takes `UnkAnimEventData*` and two signed halfword indices. `UnkAnimEventData.unk8` is an array of eight-byte rows; offsets 0x2 and 0x4 are signed halfwords, while `unkC` is a `PolyEntry*` table and `unk10` is a word bitset.
- Separate record-pointer temporaries for the two linked-row updates are byte-required. A single shared pointer changed the first update's add/load register roles; direct indexed writes changed both address formation and load order. The two-record implementation matches every instruction.

## sub_805FBE0 (0x0805FBE0)

- The function signature is `void(UnkAnimEventData*, unk16, unk16, unk16, unk16)`: each of the four count parameters is normalized as a 16-bit value at entry, including the fifth stack argument.
- The function initializes `UnkAnimEventData` halfwords at offsets 0x0, 0x2, 0x4, 0x6, 0x24, 0x26, 0x2C, 0x2E, and 0x30. It conditionally releases the existing map at offset 0x28, allocates blocks at 0x28, 0x18, and 0x1C, and reports allocation sizes through `nullsub_9`.
- The target proves new fields `unk4` (`unk16`), `unk14` (`unk32*`), `unk20` (`unk8*`), `unk2C` (`unk16`), and `unk34` (`unk8*`) in `UnkAnimEventData`; all are accessed at their exact target offsets.
- `size = arg3 << 5` and `entriesSize = arg1 << 2` are retained locals: removing `entriesSize` changes the frame and shifts the stack fifth-argument load, while the target requires `size` spilled across calls. Folding the separate bitset-size local into `((arg1 >> 5) << 2)` preserves every instruction.
- Initializing `unk10` from the allocation address and incrementing the typed pointer by `arg1` reproduces the target without a cast; the resulting `unk14` pointer advances by `arg1 >> 5`. The function diff is instruction-for-instruction equal and the full US ROM SHA1 compare passes.
