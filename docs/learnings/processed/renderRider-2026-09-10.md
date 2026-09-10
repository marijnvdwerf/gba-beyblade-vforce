# renderRider — 2026-09-10

Matched `renderRider` at `0x0804BBF0` (0x2EC bytes) in `src/rider.c`.
The function is reachable from `mainLoop`; its C caller passes `RiderBase*` in the rider render loop. The final source matches the target instruction-for-instruction and the full ROM SHA1 passes after formatting and removal of the assembly dump.

## Corrections to the existing disabled draft

- Use the existing display fields `field_40` and `field_44`.
- Expose `RiderBase.unk3CF` as one byte, replacing one byte of padding. The target loads it with `ldrb` at `0x0804BE1E` and shifts it by 12 for the palette bits. No layout size changes.
- Call `sub_804BF3C` after both visibility arms, with one argument. The target sets only r0 for this call. Add the prototype and remove the disabled draft's unused second parameter.
- Read sprite order through the reloaded `actor->unkB8`, as in the target after the palette store.
- Keep direct embedded actor addresses at the two `renderActor2` calls.

## Differences reconciled between independent matches A and B

Both versions had the same `RiderBase.unk3CF` field and `sub_804BF3C(RiderBase*)` prototype changes. Version A retained the legal offset marker comment on `unk3CF`; version B omitted it. A wins this non-codegen choice because the project permits offset-marker comments and the marker documents the fixed layout. `rider.h` has exactly one copy of the prototype, and `common.h` has exactly one copy of the field.

The render body differed in four places:

1. Version A declared `unk32 offset` and used `+ (offset = layer - 0x1C00)`; version B removed that single-use temporary and used `(screenY << 8) - 0x1C00 + layer`. B wins: it is more natural source and the combined B form matches exactly. On A's otherwise-matching skeleton, folding only `offset` produced nine differing diff rows, first at `+0xE2` from the shifted pool; the first changed calculation was `+0x108`, the target's r12-held sprite pointer disappeared, and the function became four bytes shorter. Assigning `offset = layer - 0x1C00` as a preceding statement produced 65 differing rows, first at `+0xA8` (`mov r5, #241` instead of `mov r1, #241`). The reconciliation build removed the declaration and changed the expression together; `compare` and `diff.ts renderRider` both passed.
2. Version A wrote `shift < 0 ? 8 : shift`; version B wrote `shift >= 0 ? shift : 8`. B wins as the direct nonnegative selection and it is semantically identical. The one-change build with B's spelling passed `compare` and had no instruction differences.
3. Version A parenthesized `(screenY + 0x40) > 0x108`; version B wrote `screenY + 0x40 > 0x108`. B wins the simpler equivalent spelling. The one-change build passed `compare` and had no instruction differences.
4. Both versions use the same direct field accesses, callback form, table-index idiom, actor aliases, and wide `mode`; neither side had a codegen difference in those parts.

The apparent conflict between A's byte-required `offset` report and B's exact no-offset report is resolved by the measured skeleton dependency above: the no-offset Y expression matches only after the complete B spelling is used, while folding the temporary alone from A's expression does not. The final B expression is therefore retained rather than treating the isolated A fold as a contradiction.

The original parking reason was the entry allocator mismatch: the target used `mov r5, r0` while the parked draft used `mov r4, r0` for the corresponding actor value. The semantic draft was therefore parked instead of being treated as a match.

## Measured matching steps

Version B recorded approximately 35 builds. The parked draft with field names fixed had 125 differing rows. One measured staging pass made these related corrections together: move `sub_804BF3C` after the `unk3C8 & 2` if/else (the target's else arm falls into it), use `renderActor2(&rider->unk238/&rider->unk2FC)`, and address `unkBC` off the rider. That pass reduced the result to 111 rows.

The isolated historical edits were:

| Isolated edit | Result |
| --- | --- |
| Add long-lived `screenX = x; screenY = y;` copies after the `unk3C` adjustment | 67 differing rows |
| Remove those copies on the final form | 66 differing rows |
| Widen `mode` to `unk32` | 51 differing rows when tested alone in the tail |
| Use direct actor/actor2 sprite accesses | 64 differing rows when tested alone in the tail |
| Remove the `sprite` local | 50 differing rows when tested alone in the tail |
| Use `shift >= 0 ? shift : 8` for the frame ternary | 9 differing rows |
| Use `(screenY << 8) - 0x1C00 + layer` for the Y expression | 0 differing rows |

Applying the three tail simplifications together produced 15 differing rows. The target computes x/y in r3/r1 and then moves them to r7/r9; using one pair of variables allocates callee-saved registers from the start and loses actor r6. The final cleanup folded the table-index cast idiom, single-use `sprite` and `positionFunc` locals; each cleanup remained at 0 rows. The table index `(unk8)((sub_8057C40() >> 4) * 4)` reproduces `asr #4; lsl #26; lsr #23` including halfword scaling, whereas an explicit `& 0x3F` emits a mask instruction. The frame ternary loads the sprite pointer before selecting the frame; a separate `offset` variable loads it afterward.

The reconciliation rows were tests on the final form:

| Test on final form | Result |
| --- | --- |
| Remove the single-use `offset` declaration and use `(screenY << 8) - 0x1C00 + layer` | `compare` and `diff.ts renderRider` passed; this was the final B form. |
| Spell the frame selection as `shift >= 0 ? shift : 8` | `compare` and `diff.ts renderRider` passed. |
| Omit parentheses in `screenY + 0x40 > 0x108` | `compare` and `diff.ts renderRider` passed. |

The isolated `offset` probes on the otherwise matching skeleton were also measured: folding only `offset` left nine differing rows, first at `+0xE2`; the first changed calculation was at `+0x108`, the target's r12-held sprite pointer disappeared, and the function became four bytes shorter. Assigning `offset = layer - 0x1C00` as a preceding statement left 65 differing rows, first at `+0xA8` (`mov r5, #241` in the target versus `mov r1, #241` in the trial). The reconciliation build removed the declaration and changed the expression together; `compare` and `diff.ts renderRider` both passed. A signed/unsigned constant suffix and reversing the sum operands did not recover the target expression sequence.

The final-form fold probes requested after reconciliation were each isolated from the unchanged matching source and were not kept because `compare` failed:

| Isolated edit on final form | Result; first divergent instruction (target vs trial) |
| --- | --- |
| Fold `screenX` into `x` at both consumers | `compare` failed; `+0x12`: `add r6, r4, r0` vs `add r7, r4, r0`. |
| Fold `screenY` into `y`, declaring `y` as `unk32` to preserve the unsigned range test | `compare` failed; `+0x12`: `add r6, r4, r0` vs `add r0, r4` (followed by `mov r8, r0`). |
| Use `screenX`/`screenY` as the accumulators from the start | `compare` failed; `+0x12`: `add r6, r4, r0` vs `add r0, r4` (followed by `mov r8, r0`). |
| Inline `shift` into the frame ternary | `compare` failed; `+0x2`: `mov r7, r10` vs `mov r7, r9`. |
| Remove the table-index `(unk8)` cast | `compare` failed; `+0xE2`: `ldr r1, [pc, #140] (->0x170)` vs `ldr r1, [pc, #136] (->0x16C)`. |
| Mask the table index with `& 0xFF` | `compare` failed; `+0xE2`: `ldr r1, [pc, #140] (->0x170)` vs `ldr r2, [pc, #144] (->0x174)`. |
| Store the table index in an `unk8` local | `diff.ts renderRider` showed no differing instructions, but `compare` failed; no instruction offset diverged. |
| Collapse the nested duplicate `if (actor->unkB8 != NULL)` | `compare` failed; `+0x224`: `ldr r0, [pc, #80] (->0x278)` vs `ldr r0, [pc, #76] (->0x274)`. |
| Factor the duplicated `sub_804C098(rider)` calls into one conditional call | `compare` failed; `+0x1A0`: `beq 0x1EA` vs `beq 0x1C4`. |

Version A's measured notes add:

- The initially activated, semantically corrected draft first diverged at `+0x12`, where actor was allocated to r8 instead of r6.
- Separating projected x/y from `screenX`/`screenY` made the opening instructions match; remaining differences began in the sprite update.
- Wide `unk32 mode` and separate sprite aliases during development reduced all differences to the Y-coordinate expression and shifted literal addresses.
- Folding `screenX` gave 32 differing rows, first at `+0x12` (r7 instead of r6 for actor); folding `screenY` gave 44, first at `+0x12` (r7 instead of r6).
- Folding `actor2` into the member expression gave 34 differing rows, starting in the prologue at `+0x2` because r10 was no longer saved.
- Folding away `offset` gave the nine-row result described above; the preceding-assignment form gave the 65-row result. A signed/unsigned constant suffix and reversing the sum operands did not recover the target expression sequence.
- The callback and frame/actor/priority/shadow sprite aliases each folded byte-identically and are absent from the final function; the primary actor pointer is reused throughout.

## Signedness and required temporaries

Projected coordinates and callback outputs require arithmetic right shifts. `screenX` uses signed bounds; frame shift uses a signed negative test; layer uses a signed positive test and negation. The lookup table is already signed halfword data, matching `ldsh`. `screenY`, the removed offset, and mode need no signed operation and use `unk32`. No shared field signedness was changed.

The final source retains `screenX`, `screenY`, `actor`, and `actor2` because the measured folds changed code generation. It does not retain the single-use offset, callback, frame/actor/priority/shadow sprite aliases, or position-function alias. No volatile, register pinning, inline assembly, scalar pointer aliases, raw offset accesses, or new struct overlays were needed.

## Verification

The final one-change reconciliation builds passed both `bun run tools/diff/diff.ts renderRider` with no differing instructions and `cmake --build build --target compare` with the ROM SHA1 test green. clang-format was run on every touched source/header file.
