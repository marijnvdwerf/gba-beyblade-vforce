# sub_804B4FC

The best semantic draft matches the expected object except for the order of two setup instructions and uses a prohibited byte-pointer offset expression.

Target first divergence in the loop setup:

- expected: `adds r7, r4, #0` followed by `movs r6, #0`
- draft: `movs r6, #0` followed by `adds r7, r4, #0`

The remainder of the loop, including the global reload, rider field widths, helper calls, branch structure, and epilogue matched instruction-for-instruction after relocation normalization. The draft uses `rider = (RiderBase *)((unk8 *)_gameData->unk42C + offset)`, which cannot remain in final source under the typed-struct rule. `RiderBase` is 0x428 bytes, but expressing this access through a typed array changes the byte-cursor code shape. The function remains parked on the original dump.

The `RiderBase::unk3C8` field is proven as a halfword by the target `ldrh` at offset 0x3C8. The helper prototypes required by the target are `void sub_804B8F0(RiderBase *, void *)`, `unk32 sub_80501F8(s32, RiderBase *)`, and `void sub_804B754(unk32)`.
