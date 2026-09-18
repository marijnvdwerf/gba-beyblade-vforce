# riderphysics 2026-09-17

## sub_804E328 (0x0804E328)

- The matching signature is `s16 sub_804E328(unk8 arg0, unk8 arg1)`.
- The `unk8` parameters reproduce the entry `lsl #24; lsr #24` normalization before the call to `sub_804E358`; `sub_804E358` remains the existing `s16` return declaration.
- A signed `s16 delta` is required for the target `lsl #16; asr #16` before the `> 0x3F` comparison. The natural comparison without a redundant cast is byte-identical.
- The branch result must be assigned to an `unk16 result` before returning. This preserves the target common `lsr #16; lsl #16; asr #16` conversion. Folding `result` into the two returns removed those instructions, so the local is byte-required.
- `bun run tools/diff/diff.ts sub_804E328` reports every instruction equal, and the US ROM compare passes.

## sub_804E3B0 (0x0804E3B0)

- The matching signature is `unk32 sub_804E3B0(unk32 arg0, unk32 arg1, unk32 arg2)`.
- `delta` remains `s32` for the signed `cmp`/`blt`; `magnitude`, `result`, `difference`, and threshold values are `unk32`.
- `difference = magnitude - 1`, `unk32 half = threshold >> 1`, and `unk32 threshold_copy = threshold` are each byte-required; folding any one changes the target instruction sequence or allocation.
- The natural unary negations and omitted redundant `unk32` casts are byte-identical to the target.
- `bun run tools/diff/diff.ts sub_804E3B0` reports every instruction equal.

## RiderHasSomeFlags (0x0804E42C)

- The matching signature is `unk8 RiderHasSomeFlags(RiderBase* rider, unk32 flags)`.
- The target accesses `RiderBase::flags` at offset `0x9C`, masks it with `flags`, and returns 1 for any overlap and 0 otherwise. The existing `unk32 flags` field and direct `!= 0` branch reproduce the target exactly.
- `bun run tools/diff/diff.ts RiderHasSomeFlags` reports every instruction equal.
