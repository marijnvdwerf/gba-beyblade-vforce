# selectBladeFrontendHandler

## selectBladeFrontendHandler (0x080475E0)

The best typed draft is parked in `src/festate.c` under `#if 0`; the active implementation is the original assembly include. The dump is retained at `asm/dump/8040d18/80475e0-selectBladeFrontendHandler.s`. The final parked draft uses the existing `FrontendState` layout, contains no union over `FrontendState.transition`, and contains no scalar-global or scalar-field pointer alias.

The handler was rebuilt from the restored natural source before the final diff. The first target/current instruction divergence is at function offset `0x2`: the target saves `r8` with `mov r7, r8; push {r7}`, while the natural draft goes directly from `push {r4, r5, r6, r7, lr}` to `sub sp, #16`. The target keeps the incoming `FrontendState*` in `r7`, the command-zero search index in `r6`, and `state + 0x80` in `r8`; the natural draft keeps the incoming state pointer in `r6`, the search index in `r4`, and the derived pointer in `r7`. The target copies the `r8` value to low registers around the byte read and write at offset `0x80`; the natural draft accesses the `unk8` field directly. The remaining pool displacement is downstream of this approximately 12-byte lifetime/prologue difference. The command dispatch, case control flow, helper-call sequence, access widths, and statement order otherwise match the recovered body; no artificial register or control-flow construct was added.

The standing allocation probe for a long-lived pointer to offset `0x80` was not performed. In the canonical `FrontendState` declaration, offset `0x80` is the scalar field `unk8 unk80`, followed by scalar byte `unk81` and padding. The only direct probe shape would therefore be an alias such as `unk8* stateFlags = &state->unk80`, which is the explicitly rejected scalar-field alias shape. This probe was stopped without a build rather than shipping or parking that alias. The search index is already a function-scope `s32 index`; the dependent function-scope-versus-block-scope retest was not run after the scalar-alias probe was rejected.

The transition guard is written as adjacent byte-field tests:

`if (state->transition.value == 0 && state->transition.unk585 == 0)`

With the existing `s8` fields, agbcc emits the target `ldrh; cmp; bne` sequence. A union or casted halfword view is not retained. The same correction was applied to `credits.c`.

The first two animation blocks match when the helper result is used directly rather than cached in a persistent `frame` local. The third-sprite direction is written through `SpriteEntry.frame.word` at offset `0x18`. The initial scroll call matches with `-_unk30004E8[0]`.

The final key-normalization probe changed the nested test from a separate assignment followed by a test to a direct assignment in the condition:

`if ((keyBits = _unk3005DA0 & 0x40) != 0)`

where `keyBits` is `unk16`. One clean build showed the target and candidate now both emit `lsl r0, #16; lsr r3, r0, #16; cmp r3, #0`, and the fallback byte store uses `r3` directly. This was committed as `6da70483 Match select blade key normalization`.

The preceding natural key-handling rewrite was committed as `b978b850 Match select blade key handling`. Earlier matched improvements are `8609a50f Fuse transition byte guards`, `39881f37 Match select blade animation updates`, `99105fe4 Match select blade third sprite update`, and `2b2e9bab Match select blade initial scroll argument`.

After parking the draft and restoring the assembly include, `cmake --build build --target compare` passed with the expected ROM SHA1. The assembly dump remains intentionally undeleted because the active implementation is still assembly and the natural C draft is not an exact instruction match.
