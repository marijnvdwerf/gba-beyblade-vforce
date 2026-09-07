# collectionListFrontendHandler — 2026-09-07

Function: `collectionListFrontendHandler` (`0x080427E4`)

The function remains parked behind the original assembly because the best
natural C draft still differs in register allocation. The target body ends at
`0x9DE`; the best draft ended at `0x9E2`, a `+4` byte difference.

## Experiment step table

The first three bytes of the literal pool move whenever the body size changes.
The table records the first decoded body divergence where it was established;
when compilation failed, no assembled size exists.

| Experiment | Change | First divergence | Size delta |
| --- | --- | --- | --- |
| exp4 | Reworked initialization locals and typed pointer/frame accesses; retained the cached key-state form | `0x96`: target `mov r7, r3`, draft `mov r8, r3` | `+8` |
| exp5 | Tested the alternate incoming-state/global pointer lifetime | `0x0A`: target `mov r8, r0`, draft `mov r7, r0` | `-8` |
| exp6 | Tested the corresponding initialization address/lifetime arrangement | `0x002E`: target `ldr r0, [pc, #192] (->0x00F0)`, draft `ldr r0, [pc, #188] (->0x00EC)` | `-8` |
| exp7 | Reverted the preceding address/lifetime arrangement | `0x002E`: target `ldr r0, [pc, #192] (->0x00F0)`, draft `ldr r0, [pc, #188] (->0x00EC)` | `-8` |
| exp8 | Tested an anonymous union for the transition header | Build failed: old agbcc rejected existing `.value`/`.unk585`/`.unk586` users | n/a |
| exp9 | Reverted the anonymous transition-union experiment | `0x96`: target `mov r7, r3`, draft `mov r8, r3` | `+8` |
| exp10 | Removed the cached `KeyState*`; called `sub_805A914(6/7)` directly in the short-circuit tests | `0x96`: target `mov r7, r3`, draft `mov r8, r3` | `+4` |
| exp11 | Staged `_unk3000114 - 2` in `index` for movement arithmetic | `0x96`: target `mov r7, r3`, draft `mov r8, r3` | `+4` |
| exp12 | Folded the movement `index` temporary back into the expression | `0x96`: target `mov r7, r3`, draft `mov r8, r3` | `0` |
| exp13 | Rebuilt the folded movement baseline and checked the same lifetime shape | `0x96`: target `mov r7, r3`, draft `mov r8, r3` | `0` |
| exp14 | Changed the movement accumulator `value` from `unk32` to signed `s32` | `0x96`: target `mov r7, r3`, draft `mov r8, r3` | `+4` |
| exp15 | Removed a case-one `font` alias without removing its declaration | Build failed: unused variable `font` | n/a |
| exp16 | Removed the unused `font` declaration and kept direct detail-font calls | `0x96`: target `mov r7, r3`, draft `mov r8, r3` | `+4` |
| exp17 | Preserved the 20-byte frame/stack spill and signed `slot` comparison while testing the initialization lifetimes | `0x96`: target `mov r7, r3`, draft `mov r8, r3` | `+4` |
| exp18 | Tested an unnamed transition struct/union declaration | Build failed: old agbcc diagnosed unnamed struct/union declarations with no instances | n/a |
| exp19 | Reverted the transition declaration while other users still referenced the union-shaped members | Build failed in `background.c` on transition members | n/a |
| exp20 | Restored the original byte-field transition representation | `0x96`: target `mov r7, r3`, draft `mov r8, r3` | `0` |
| exp21 | Tested the named transition-union representation across users | Build failed in `background.c` because users still used the old member path | n/a |
| exp23 | Used a separate initialization `frame` local while retaining the final-loop `SpriteEntry*` alias | `0x08`: target 20-byte frame, draft 16-byte frame; the later structural residual remained `0x96` | `+4` |

The transition-union rewrite was a cross-translation-unit experiment and is
not included in the per-function step table because no standalone function diff
or body-size measurement was retained.

The `+4` final residual is:

```asm
0x0096  target: mov r7, r3
0x0096  draft:  mov r8, r3
```

The draft then needs an extra `mov r3, r8` before the first indexed font access.
The target keeps the `_collectionListFont` global-address value in `r7` and
keeps the loop continuation value in `r4`; the draft allocates those roles
differently. The stack-word/out-parameter form did reproduce the target
20-byte frame and the final `[sp, #0x10]` spill, but did not change this
initialization pointer allocation.

## Byte-required source shapes

The following source forms were established by controlled comparisons:

- `unk32 command` is required at the callback boundary; a narrow command
  parameter causes unwanted entry normalization.
- An explicit sparse `switch` with `case 0` reproduces the target dispatch
  ladder better than a nested lower-bound test.
- `s32 slot` reproduces the target signed final-loop `ble` comparison.
- A final-loop `SpriteEntry* sprite` local reproduces the target 20-byte stack
  frame and `[sp, #0x10]` spill. The target field is `frame.word` at offset
  `0x18`, not `oam_attr_2` at offset `0x14`.
- Direct `sub_805A914(6)->var08` and `sub_805A914(7)->var08` expressions preserve
  the target call placement. Hoisting `KeyState*` values changes the load/call
  order.
- The signed movement accumulator requires `s32` evidence from the target
  `asr #2`; unsigned temporaries produce `lsr #2`.
- The target initialization path is a real loop with rematerialized zero call
  arguments, not five independent unrolled calls.

## Transition halfword-overlap lead

The target transition guard reads the first two bytes of `FrontendTransition`
with `ldrh` from `FrontendState + 0x584`. The current canonical structure has
three byte fields beginning at that address, so the natural byte-field access
emits a byte load instead. `credits.c` independently contains:

```c
if (*(unk16*)&state->transition == 0) {
```

A named union containing both the byte view and a halfword view is a plausible
shared source recovery. Old agbcc requires named nested members rather than
anonymous-member promotion. The experiment touched `background.c`,
`frontend.c`, `festate.c`, `levelrow.c`, `credits.c`, and `collection.c`, and
therefore belongs to a separate cross-translation-unit task. No union change
is retained here.

## Parked draft state

The typed draft is inside a bare `#if 0` block in `src/collection.c`, immediately
above the untouched `INCLUDE_ASM` line. Draft-only types, globals, and prototypes
are scratch declarations inside that block. The draft was enabled with the
assembly include disabled for one build and compiled successfully; it was then
re-parked. The assembly dump remains present.
