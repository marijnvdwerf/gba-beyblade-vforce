# riderphysics round three

## sub_804E454 (0x0804E454)

The function tests whether all bits in `flags` are present in the prior-rider-flags word at offset `0xA0`, returning an `unk8` boolean. The existing `RiderBase` padding at `0xA0` was promoted to `unk32 unkA0`; its size and following offsets remain unchanged. A file-scope `ASM_ZEROPAD` is required after the C function because the original dump's explicit zero alignment emits `00 00`, while the compiler otherwise emits a Thumb NOP before the next translation-unit function.

## sub_804E1DC (0x0804E1DC)

The function clears the actor's `unk4C` and `unk50` fields, clears rider flag `0x200`, and copies `unk10` to `unk1C`. Keeping the actor pointer in a local reproduces the target's callee-saved pointer across `UnsetRiderFlag`.

## sub_804E224 (0x0804E224)

The helper computes a signed, capped movement step from the difference between two signed positions. `arg2` is an `unk8` parameter: the callee's `lsl #24`/`lsr #24` normalization is reproduced by the narrow formal. Signed `s32` position, magnitude, result, and cap values reproduce the `bge`, `ble`, `asr`, and final negation sequence.
