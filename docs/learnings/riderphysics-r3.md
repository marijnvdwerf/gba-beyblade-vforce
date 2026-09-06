# riderphysics round three

## sub_804E454 (0x0804E454)

The function tests whether all bits in `flags` are present in the prior-rider-flags word at offset `0xA0`, returning an `unk8` boolean. The existing `RiderBase` padding at `0xA0` was promoted to `unk32 unkA0`; its size and following offsets remain unchanged. A file-scope `ASM_ZEROPAD` is required after the C function because the original dump's explicit zero alignment emits `00 00`, while the compiler otherwise emits a Thumb NOP before the next translation-unit function.
