# sub_80413FC matching measurements

## sub_80413FC (0x080413FC)

The function remains assembly-backed. The typed implementation is parked in a
`#if 0` block immediately above the original `INCLUDE_ASM` line in
`src/levelselect.c`.

The assembly-backed checkpoint was restored before parking. The final full-ROM
comparison passes with the unchanged dump and the surrounding translation units.

Target and best natural draft measurements:

- Expected object symbol size: `0xAA4` bytes.
- Best natural C draft symbol size: `0xA94` bytes, 16 bytes shorter.
- First differing instruction: function offset `0xBA`.
- Target at `+0xBA`: `ldr r3, [pc, #16]`, loading the `0x624` displacement.
- Draft at `+0xBA`: `ldr r5, [pc, #16]`, loading the same displacement.
- Target at `+0xBC`: `add r0, r2, r3`.
- Draft at `+0xBC`: `add r0, r2, r5`.
- The target's false mode-4 arm loads the `0x664` displacement into `r4`;
  the draft loads it into `r3`.
- The target count loop keeps the list cursor in `r2`, the count-global
  address in `r1`/`r4`, and `state + 0x80` in `r9`; the natural draft uses
  different register assignments.

The best parked draft uses the following source shapes:

- `SpriteEntry* firstSprite` and `SpriteEntry* secondSprite` are separate
  locals. This matches the target's first allocation result in `r4` and second
  result in `r5`, including the address loads after each call.
- The list count uses a signed `s8*` cursor and `while (*ptr++ != -1)`.
- The level search uses a plain `for` loop and writes the selected index after
  the loop. The target instead writes the index only on a found element; this
  semantic/control-flow difference is retained in the parked best-size draft.
- The offline confirmation fallback includes `sub_80490F8(9)` when the level
  is unavailable or already completed. This was required by the target control
  flow but did not close the register-allocation residual.
- The callback uses the shared `FrontendStateCallback` declaration and the bare
  `StoreFunction(sub_8049DE0)` expression. The displayed `sub_8049DE0 + 1`
  versus `sub_8049DE0` pool entry is Thumb relocation display noise, not source
  pointer arithmetic.
- The packet synchronization byte remains signed (`PacketTransport.unk4` is
  `s8`), matching target `ldsb` followed by `strh`.

The step table reports the first differing offset and candidate size delta for
each measured experiment. A value of `unmeasured` means that no exact symbol
size or offset number was retained for that experiment.

| Step | Change | First divergence (target versus candidate) | Size delta (candidate minus target) |
| --- | --- | --- | --- |
| 1 | Stage the `0x624` list expression in a local. | `+0xAA`: target `ldr r0, [pc, #20]`; candidate `ldr r0, [pc, #24]`. | unmeasured |
| 2 | Stage `_currentGameState` for all mode-4 accesses. | `+0xBA`: target `ldr r3, [pc, #16]`; candidate `ldr r5, [pc, #16]`. | unmeasured |
| 3 | Reverse the mode-4 branch spelling. | `+0xB6`: target `bne`; candidate `beq`. | unmeasured |
| 4 | Use a ternary mode-4 selection. | `+0x6C`: target branches; candidate has an extra `str`. | unmeasured |
| 5 | Use a pointer-to-pointer alias for `_unk3000074`. | `+0x0A`: target `sub sp, #16`; candidate `sub sp, #20`. | unmeasured; frame grew by 4 bytes |
| 6 | Use deferred or persistent count-pointer aliases. | `+0xBA`: target `ldr r3, [pc, #16]`; candidate `ldr r5, [pc, #16]`. | unmeasured |
| 7 | Remove the level-list cursor's later use and use direct indexed accesses. | `+0xBA`: target `ldr r3, [pc, #16]`; candidate `ldr r5, [pc, #16]`. | unmeasured |
| 8 | Reorder the sprite, cursor, and integer declarations. | `+0xBA`: target `ldr r3, [pc, #16]`; candidate `ldr r5, [pc, #16]`. | unmeasured |
| 9 | Share a `levelList` temporary across dispatch arms. | `+0x62`: target loads the list-base address; candidate loads a different literal first. | unmeasured |
| 10 | Use a found-only level-search loop and write the index in the found arm. | `+0xBA`: target `ldr r3, [pc, #16]`; candidate `ldr r5, [pc, #16]`. | `+0x04` (`0xAA8` versus `0xAA4`) |
| 11 | Replace the transition byte fields with a named overlapping halfword union. | unmeasured for the function candidate; the candidate generated the target transition `ldrh`. | unmeasured; full-ROM hash changed in other users and the union was reverted |
| 12 | Remove the dead `ptr = _unk3000074` immediately before the level-ID search. | unmeasured | unmeasured |
| 13 | Call `sub_8060070()` once in the navigation gating predicate. | unmeasured | unmeasured |
| 14 | Fold the single-use `levelId` staging into the search comparison. | unmeasured | unmeasured |
| 15 | Fold the single-use `next` staging into the two direct counter updates. | unmeasured | unmeasured |
| 16 | Fold the single-use `canEdit` staging into its comparison. | unmeasured | unmeasured |
| 17 | Fold the single-use `ls` staging into the completion predicate. | unmeasured | unmeasured |
| 18 | Fold the single-use `ld` staging into the completion predicate. | unmeasured | unmeasured |

The loop/unroll alternatives and packet bitfield alternatives remain open
questions because they were not measured in this parked pass.

Final verification after the review cleanup:

- The enabled parked draft translation unit object compiled successfully.
- `cmake --build build --target compare`: passed (`rom-matches`, 100%).
- The dump `asm/dump/8040d18/80413fc.s` was intentionally kept because the
  function is parked.
