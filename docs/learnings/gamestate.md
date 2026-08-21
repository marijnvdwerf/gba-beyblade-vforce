# gamestate.c matching notes

## Matched functions

- `getSomeLevelID` matches with the condition written as `if (sub_8051780(0x20) != 0)` first. The low-byte path must explicitly cast `_currentGameState->unk0` to `s8`; this produces the target `ldrb` plus `lsl/asr` sign extension.
- The existing natural implementations of `getLevelDescription2`, `getLevelDescription`, `sub_8051734`, `sub_8051640`, `sub_8051720`, `sub_8051744`, `sub_80518F0`, and `GetLevelDescriptionNo` remain byte-identical.
- `sub_805176C` can use a typed `unk16` field plus `*(unk8 *)&_currentGameState->unk6E8`; this emits the target low-byte load while preserving the fixed layout.

## Header layout

`LevelDescription` needs a word field at offset `0x4` in addition to the word at `0x8`:

```c
typedef struct LevelDescription {
    unk8 pad0[4];
    s32 unk4;
    s32 unk8;
    /* ... */
} LevelDescription;
```

`LevelState` contains fields at offsets `0x4`, `0x8`, `0xC`, `0x10`, and `0x14`, giving it the required `0x18` stride. `CurrentGameState.unk6E8` is a `unk16` typedef so both its halfword initialization and the byte-reading helper retain the original offsets.

## Review proposals that did not match

- In `sub_8051744`, moving `index++` out of the true branch and inverting the condition (`if ((state->unk0 & 1) == 0) return 0; index++;`) changed the ROM. The original increment-inside-the-true-branch form is required by agbcc for the target control flow.
- In `GetLevelDescriptionNo`, reusing one `ActiveLevelDescription *description` local changed the ROM. The two-local version with `descriptions = (ActiveLevelDescription *)LevelDescriptions` is required for the target register allocation and literal-pool layout.
- The requested `sub_80510FC` natural draft was not retained. Its first initialization and level-state loops matched, but the final table scan used a pointer-increment induction form (`adds #4`) instead of the target indexed form (`index++`, `lsl #2`, base-plus-index). Leaving the draft in C changed the ROM, so the `INCLUDE_ASM` remains and its dump is intentionally not deleted.

The final SHA1 comparison passed after restoring `sub_80510FC` assembly and retaining the matched functions above.
