# Credits and level-select migration

## `sub_80413FC` signedness sweep

The level-select C migration was restored to `INCLUDE_ASM` after this sweep. Counts below are the instruction-diff row count reported by `bun run tools/diff/diff.ts sub_80413FC`; the function was not considered migrated unless the diff reached zero.

| Step | Type or source change | Diff count / size effect |
| --- | --- | --- |
| 1 | Restored the previous natural signed draft (`s8` list pointer, signed locals, SDK signed helper declarations) | 183 differing rows; target remained 12 bytes longer (six instructions) |
| 2 | Converted the level-select locals, helper declarations, and touched fields to width-only project types (`unk8`/`unk16`/`unk32`) | 184 rows before the `isMultiplayer` adjustment |
| 3 | Changed the local `isMultiplayer` return declaration from `u8` to `unk16` | 182 rows; preserved the target `lsl #16` / `lsr #16` return masking |
| 4 | Re-signed the level-list pointer as `s8*` | No measurable improvement over the all-unknown baseline; the signed byte loads were already selected in the relevant loop shape |
| 5 | Kept the four `CurrentGameState` level-ID arrays as `s8[0x40]` | No measurable improvement by itself; this is nevertheless required by the signed list values proven by the target loads below |
| 6 | Changed the loop index `i` from `unk32` to `s32` | 205 rows; rejected |
| 7 | Changed the local `levelId` from `unk32` to `s32` | No improvement in the declaration-order variant; rejected with that variant |
| 8 | Changed the fourth argument of `sub_8041188` and `sub_8041288` from `unk8` to `s8` | 177 rows; six signed-byte argument loads matched the target shape |
| 9 | Changed the argument of `sub_80517E8` from `unk8` to `s8` | 173 rows; retained as the best natural C result |
| 10 | Changed `sub_8051688`'s declaration and definition argument from `unk32` to `s8` | Stayed at 173 rows; no improvement in this function's object |
| 11 | Added an `s8` temporary for `playerData[5]` before storing it to `_gameData->unk15C0` | 188 rows; rejected |
| 12 | Replaced the temporary with a direct `(s8)playerData[5]` cast | Stayed at 188 rows; rejected |
| 13 | Made `_unk3000078` volatile to force count reloads in the search loop | 211 rows alone; rejected. Combined with the signed helper arguments it reached 186 rows, still worse than 173 |
| 14 | Replaced the bounded `for` search with an explicit `while` condition | 218 rows; rejected |
| 15 | Changed the low-nibble mask from `0xF0` to `-0x10` | 205 rows and introduced the target's `mov #16` / `neg` shape, but worsened the overall result; rejected |

### Signedness proven by the target assembly

- The four level-ID lists at `CurrentGameState + 0x5A4`, `+0x5E4`, `+0x624`, and `+0x664`, and the level-list pointer, carry signed byte IDs. The sentinel scan uses `mov r0, #0` followed by `ldrsb r0, [r2, r0]`; the search and callback paths also use signed-byte loads where the destination register differs from the base register.
- `LevelSelectState.unk1D` at offset `0x1D` is a signed selected-level index. The target repeatedly uses `ldrsb r1, [r4, #29]` before indexing the level-description tables, and compares it with signed branches.
- The fourth arguments passed to `sub_8041188` and `sub_8041288` are signed bytes. The target emits `mov r3, #0; ldrsb r3, [r0, r3]` immediately before those calls.
- The argument passed to `sub_80517E8` is a signed byte, using the same `ldrsb` pattern at the call site.
- The stored multiplayer player value at `playerData + 5` is signed. The target emits `mov r1, #5; ldrsb r1, [r2, r1]` before the halfword store.
- The search-loop index is used in a signed comparison: the target uses `cmp` followed by `bge`. A direct `s32` declaration did not reproduce the target register allocation, so the source was not retained.

The target does not prove signedness for plain byte loads such as `CurrentGameState + 0x6A4`, `+0x6A6`, or `+0x6A9`; those remain width-only byte fields. Likewise, the `lsl #16` / `lsr #16` sequence proves that `isMultiplayer` returns a 16-bit value, not that it is signed.

### Best result and remaining divergence

The best natural C result was 173 differing instruction rows after using signed `s8` arguments for `sub_8041188`, `sub_8041288`, and `sub_80517E8`. It was still 12 bytes shorter than the target, corresponding to six missing instructions in the generated function body.

The persistent divergence begins in the level-ID search loop after `sub_805137C` returns. The target keeps the loop index in `r2` and the selected `levelId` in `r3`; it compares the index against the count and the signed list byte against `r3`. The compiler-generated draft instead assigns the loop index to `r1` and the selected ID to `r2`, with different temporary/list-pointer roles. The target also reloads the count/list globals in a different order. Source-level renaming, declaration-order changes, pointer forms, loop forms, and the signedness trials above did not reproduce those register roles without making other regions worse.

### Generic lesson

For this agbcc migration, signedness can change both operation width and register allocation, but it is not sufficient to force a historical register assignment. First use the target's sign-extension instructions to identify the semantic type; then keep only changes that improve the complete function diff. When the remaining mismatch is a stable register-allocation difference in a small loop and the natural source is already structurally correct, preserving the assembly is preferable to introducing artificial temporaries or volatile qualifiers.
