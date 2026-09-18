# riderphysics 2026-09-16

## sub_804C8C0 (0x0804C8C0)

- The matching signature is `void sub_804C8C0(RiderBase* rider, s32 arg1, s32 arg2)`.
- `unk1CA` and `unk1CC` are existing halfword fields. The target computes each signed word argument as `(arg << 8) / 100` via `__divsi3`, then stores the result with `strh`.
- The shared quotient temporary is not byte-required: both an `s32 value` temporary and the folded direct stores reproduce the target exactly. The final form uses direct stores, `(arg << 8) / 100`, and signed `__divsi3` calls.
- `bun run tools/diff/diff.ts sub_804C8C0` reports every instruction equal, and the US ROM compare passes.

## sub_804DF88 (0x0804DF88)

- The matching signature is `void sub_804DF88(RiderBase* rider, Actor* actor)`.
- The function copies `actor->unk40` and `actor->unk44` to `rider->unk1A0` and `rider->unk1A4`, then tests bit 0 of `rider->unk150`.
- When that bit is set, six explicit switch arms for cases 1000 through 1005 each assign `actor->unk68 = 0x10`. Repeating the assignment in each arm is byte-required: grouped cases collapsed to a compare range, and a single guarded range assignment also diverged, while explicit arms preserve the target jump table with six identical entries.
- The target's `ldrh` accesses are reproduced by the existing `unk16` fields `unk14C` and `unk150`; the switch normalizes the selector with the target `-1000` pool constant and unsigned `bhi` range check.
- `bun run tools/diff/diff.ts sub_804DF88` reports every instruction equal.

## sub_804E20C (0x0804E20C)

- The matching signature uses default-width parameters: `void sub_804E20C(RiderBase* rider, unk32 arg1, unk32 arg2)`. Replacing both with `s32` is also byte-identical; the target's `asr #16` comes from the explicit signed halfword conversion, not independently proven formal signedness.
- The two signed `s16` temporaries are not byte-required. Folding each pair into a chained store with an explicit `(s16)(arg << 8)` conversion, and folding both pairs together, preserves the target `lsl #24; asr #16` sequences and store order. The final form stores arg1 to `unk30` and `unk28`, arg2 to `unk3C` and `unk34`; `unk2C` and `unk38` are cleared.
- `bun run tools/diff/diff.ts sub_804E20C` reports every instruction equal.
