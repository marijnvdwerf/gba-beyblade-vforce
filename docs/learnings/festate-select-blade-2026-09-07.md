# selectBladeFrontendHandler

## selectBladeFrontendHandler (0x080475E0)

The previously parked typed draft was activated in `src/festate.c`; the assembly dump `asm/dump/8040d18/80475e0-selectBladeFrontendHandler.s` was removed after the function matched. The implementation uses the existing `FrontendState` layout, contains no union over `FrontendState.transition`, and uses the user-sanctioned byte-pointer alias for `state->unk80`.

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


## Activation measurement (2026-09-08)

The allocation near-miss was resolved by reusing the function-scope `index` local for both the case-0 search and the case-2 directional search; removing the separate `nextIndex` local changed the prologue and roles to the target: `state` in `r7`, `index` in `r6`, and the byte pointer in `r8`, with the target `mov r7, r8; push {r7}` save. Moving `index = 0` before `p = &state->unk80` reproduced the target order (`mov r6, #0`, then pointer formation) while preserving the dispatch table. The measured live source shape is `unk8* p = NULL; // TODO: fake match? Is this temp required?` at function scope, followed by `p = &state->unk80` in case 0; direct function-scope initialization from `&state->unk80` materialized the address before dispatch and did not match.

The final two literal-pool differences were caused by hardware register names. Replacing `REG_BG2PA`/`REG_BG2PB` with `REG_BLDCNT`/`REG_BLDALPHA` changed the pool values from `0x04000020`/`0x04000022` to the target `0x04000050`/`0x04000052`. `bun run tools/diff/diff.ts selectBladeFrontendHandler` then reported no differing instructions or literal values, and `cmake --build build --target compare` passed.

The signed type of `FrontendBladeState.unk34` and `sub_805185C`'s parameter is proven at both call sites by the target sequence `ldrb r0, [r0]; lsl r0, r0, #0x18; asr r0, r0, #0x18; bl sub_805185C`. The byte load followed by sign-extension before the call requires `unk34` and the parameter to be `s8`; `sub_805185C` stores the received value with `strb r0, [r1, #0x2]`.

## Review experiments (2026-09-08)

- Direction fold: assigning `sprite->frame.word = (((sub_8057C40() >> 8) & 1) != 0) ? 2 : 3` directly instead of assigning a `direction` local produced a byte-identical function and was retained.
- Delta fold: replacing the temporary-based update with direct conditional stores diverged first at function offset `0x3F0`; the target keeps the decremented/incremented value in a temporary before the store, so the temporary-based form was restored.
- Key-bits fold: removing the `keyBits` local, testing `_unk3005DA0 & 0x40` directly, and assigning zero in the fallback produced a byte-identical function and was retained.
- KeyState5 fold: replacing the `keyState5` cache with `sub_805A914(5)->var08` diverged first around function offset `0x682`; the target caches the calls to key states 5 and 4 in order, so the cache was restored.
- KeyState4 fold: replacing the `keyState4` cache with `sub_805A914(4)->var08` diverged first at function offset `0x682`; the target loads the cached pointer into `r5` and later uses the cached pointer in `r6`, so the cache was restored.
- `0x100` mask fold: replacing `((sub_8057C40() >> 8) & 1)` with `(sub_8057C40() & 0x100)` diverged first at function offset `0x4C8`; the target emits `asr r0, #8` followed by `mov r1, #1`, while the candidate emits `mov r1, #128; lsl r1, #1`, so the shift form was restored.
- `0x70` mask fold: replacing `((sub_8057C40() >> 4) & 7)` with `(sub_8057C40() & 0x70)` diverged first at function offset `0x6CC`; the target emits `asr r0, #4; mov r1, #7; and r0, r1`, while the candidate emits `mov r1, #112; and r1, r0`, so both shift forms were restored.
- Direction-parameterized navigation: replacing the duplicated previous/next blocks with a shared `navigationDirection` path diverged first at function offset `0x682`; the candidate changed key-state register allocation and shortened the dispatch target, so the duplicated paths were restored.
- Common transition-call factoring: introducing `transitionCommand` to select `0x1F` or `0x1B` before one shared `sub_805185C`/`sub_80490F8` sequence removed 4 bytes; the first divergence was at function offset `0x564` from the shifted literal pool, with the candidate's new control flow beginning at `0x5B8`, so the duplicated branches were restored.
