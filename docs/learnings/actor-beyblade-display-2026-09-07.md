# Actor, beyblade, and display functions — 2026-09-07

## sub_8058390 (0x08058390)

Matched in `src/actor.c`.

- The function takes `(Actor *, unk16, unk16, unk16)` and scans variable-size `ActorSequenceEntry` records from `ActorConfig->unk18`.
- The second entry halfword at offset `0x4` is compared against the frame index; it is represented as `ActorSequenceEntry.unk4`.
- The payload beginning at offset `0x8` is represented as `ActorSequenceEntry.frames[1]`. `actor_80580C0` uses `frames[0]` for the same established offset.
- A local `unk16 *frames` assigned from `entry->frames` is byte-required. Direct `entry->frames[frame]` produced an extra saved register and a different frame-index schedule; the pointer local reproduces the target's `add #8`, scaled index, and load sequence.
- All parameters use `unk16`; the target performs `lsl #16`/`lsr #16` normalization on each at entry.
- The loop uses a wide `unk32 index`; the target reloads `actor->unk28` each iteration and advances the entry pointer by its `size` field.
- A coordinator-requested `unk8 *cursor` with one `ActorSequenceEntry *entry` view assigned at the top of each loop iteration was tested. It did not match: the compiler saved `r7`, with the first code difference at the prologue (`push {r4, r5, r6, r7, lr}` instead of `push {r4, r5, r6, lr}`), followed by the sequence/frame register roles changing.
- An `unk32 cursor` variant was also tested and failed for the same reason; its first difference was the extra `r7` save and its normalized sequence/frame values were allocated to `r6`/`r5` rather than target `r5`/`r2`.
- The exact match requires repeated typed views at field-use points: `((ActorSequenceEntry *)cursor)->unk0`, `((ActorSequenceEntry *)cursor)->unk4`, and `((ActorSequenceEntry *)cursor)->size`. The successful form uses a single `unk8 *cursor`, and the only named `entry` view is created in the success arm for the payload pointer. These are casts of the cursor itself, not casts of offset expressions; replacing them with one loop-top `entry` view was not byte-identical.

## GetTalkingHead (0x080571E4)

Matched in `src/beyblade.c`.

- `TalkingHead` records have a `0x28`-byte stride, established by the target's `lsl #2`, add, and `lsl #3` index calculation. The existing typedef was extended with `pad24[4]` to preserve that stride.
- The implementation is `return &TalkingHeads[index];` with the requested `TalkingHead *` return and `s32` index types; the generated instructions match exactly.
- `TalkingHeads` is declared as an external `TalkingHead` array in `beyblade.h`.

## sub_8050894 (0x08050894)

Matched in `src/display.c`.

- The input is an `UnkStruct_sub1 *`; the target reads its halfwords at offsets `0x6` and `0x8`, corresponding to `var06` and `var08`.
- Writing `*(vu16 *)REG_DISPCNT = (data->var06 << 8) | data->var08;` reproduces the target's hardware-register address materialization, loads, shift, OR, and halfword store exactly.
