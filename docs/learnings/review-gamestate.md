# Review: gamestate.c decompilation batch

## Bug: unk6E8 union not wired up

The worktree defines `CurrentGameStateUnk6E8` union in ram.h but never changes
the struct member from `unk8 unk6E8[2]` to `CurrentGameStateUnk6E8 unk6E8`.
The code `_currentGameState->unk6E8.value = 0` will not compile. Either change
the struct field type or drop the union and write `*(unk16 *)_currentGameState->unk6E8 = 0`.

---

## sub_80510FC

Compiler-shaped throughout: do-while instead of for, `index <= 0` (always true only on first iteration) instead of `index == 0`, redundant pre-read of `_80788cc[0]`, dead branch `if (index < 0)`. Most of this is likely matching-required, but the variable names and the inline getLevelDescription replication are fixable.

```c
void sub_80510FC(void)
{
    LevelState *state;
    LevelDescription *desc;
    Unk80516E0 *entry;
    s32 i;
    s32 j;
    s32 tableVal;
    unk32 found;

    _currentGameState->unk0 = 0;
    *(unk16 *)_currentGameState->unk6E8 = 0;
    _currentGameState->unk4[0x6A7] = 1;
    _currentGameState->unk6C0 = 0;
    _currentGameState->unk6BC = 0;
    _currentGameState->unk6EA = 0xFFFF;

    i = 0;
    do {
        state = sub_8051720(i);
        desc = (LevelDescription *)((unk8 *)LevelDescriptions + i * 0xD0);
        state->unkC = desc;
        state->unk4 = desc->unk8;
        state->unk8 = desc->unk8;
        if (i <= 0) {
            state->unk0 = 6;
        } else {
            state->unk0 = 4;
        }
        __fastMemoryClearARM(0, &state->unk10, 4);
        __fastMemoryClearARM(0, &state->unk14, 4);
        i++;
    } while (i <= 0x37);

    i = 0;
    j = 0;
    do {
        entry = sub_80516E0(i);
        entry->unk4 = &_807582c[j];
        entry->unk0 = 0;
        entry->unk2 = 0;
        j += 0x50;
        i++;
    } while (i <= 9);

    __fastMemoryCopyARM(_807572c, &_currentGameState->unk4[0x5A0], 0x40);
    __fastMemoryCopyARM(_807576c, &_currentGameState->unk4[0x5E0], 0x40);
    __fastMemoryCopyARM(_80757ac, &_currentGameState->unk4[0x620], 0x40);
    __fastMemoryCopyARM(_80757ec, &_currentGameState->unk4[0x660], 0x40);

    _currentGameState->unk4[0x6A9] = 0;
    _currentGameState->unk4[0x6A8] = 0;
    _currentGameState->unk4[0x6A7] = 0;
    _currentGameState->unk4[0x6A6] = 0;
    _currentGameState->unk4[0x6A5] = 0;
    _currentGameState->unk4[0x6A4] = 0;

    i = 0;
    do {
        found = 0;
        tableVal = _80788cc[0];
        j = 0;
        while (tableVal >= 0 && tableVal != i) {
            j++;
            tableVal = _80788cc[j];
        }
        if (tableVal >= 0 && tableVal == i) {
            found = 1;
        }
        if (i < 0) {
            found = 1;
        }
        sub_8057104(i, found);
        i++;
    } while (i <= 0x6C);

    _gameData->unk1638 = 0;
}
```

Changes from worktree version: `index`/`offset`/`value`/`flag` renamed to
`i`/`j`/`tableVal`/`found`; `description` shortened to `desc`. The unk6E8
access uses a cast instead of the broken union. Structure otherwise preserved
since the do-while / `<= 0` / dead-`if` shapes are likely matching-required.

---

## sub_8051640

Fine as is. Trivial setter, nothing to change.

---

## getLevelDescription2

The name is misleading -- it returns an `ActiveLevelDescription*` for the
current level. Suggest renaming to `getActiveLevelDescription` or
`getCurrentLevelDescription` when the real purpose becomes clear.

```c
ActiveLevelDescription *getLevelDescription2(void)
{
    return (ActiveLevelDescription *)((unk8 *)LevelDescriptions + getSomeLevelID() * 0xD0);
}
```

Fine as is (the body is a one-liner). The cast chain is forced by
`LevelDescriptions` being typed as `unk8[]`.

---

## getLevelDescription

Fine as is.

---

## sub_8051720

This is clearly `getLevelState`. Propose renaming.

```c
LevelState *getLevelState(s32 index)
{
    return (LevelState *)&_currentGameState->unk4[index * 0x18];
}
```

---

## sub_8051734

This is `getCurrentLevelState`. Propose renaming.

```c
LevelState *getCurrentLevelState(void)
{
    return getLevelState(getSomeLevelID());
}
```

(If sub_8051720 is renamed, callers including sub_80510FC and sub_80512AC need
updating too.)

---

## sub_8051744

The increment-inside-the-if is compiler-shaped. A human would write the for
loop below instead. Try it; if it doesn't match, the do-while version is
acceptable but should at least pull the increment out of the if-body.

```c
unk32 sub_8051744(void)
{
    s32 i;
    LevelState *state;

    for (i = 0; i <= 0x37; i++) {
        state = getLevelState(i);
        if ((state->unk0 & 1) == 0) {
            return 0;
        }
    }
    return 1;
}
```

If the for-loop doesn't match, fall back to:

```c
unk32 sub_8051744(void)
{
    s32 i;
    LevelState *state;

    i = 0;
    do {
        state = getLevelState(i);
        if ((state->unk0 & 1) == 0) {
            return 0;
        }
        i++;
    } while (i <= 0x37);
    return 1;
}
```

This is the same semantics as the worktree version but moves the increment out
of the if-branch, which is what a human would write even with a do-while.

---

## GetLevelDescriptionNo

The redundant `descriptions` local and double-cast are compiler artifacts. A
human would reuse the helper. Try:

```c
unk32 GetLevelDescriptionNo(void)
{
    ActiveLevelDescription *desc;

    desc = getLevelDescription2();
    if (sub_8051780(0x20) != 0) {
        desc = (ActiveLevelDescription *)((unk8 *)LevelDescriptions
            + _currentGameState->unk6C4 * 0xD0);
    }
    return desc->unk0;
}
```

This removes the second local (`descriptions`) and the double cast through it.
If this doesn't match, the original two-local version is acceptable.

---

## sub_80518F0

This is a bit-popcount of `state->unk10`. Clear enough; just tighten names.

```c
unk32 sub_80518F0(void)
{
    LevelState *state;
    unk32 bits;
    unk32 count;

    state = getCurrentLevelState();
    bits = state->unk10;
    count = 0;
    if (bits != 0) {
        do {
            if ((bits & 1) != 0) {
                count++;
            }
            bits >>= 1;
        } while (bits != 0);
    }
    return count;
}
```

---

## Header / type suggestions

### LevelDescriptions extern type

`extern const unk8 LevelDescriptions[]` forces every user to cast through
`(unk8 *)` with manual stride arithmetic. Since the stride is 0xD0 and both
`LevelDescription` (0x2C) and `ActiveLevelDescription` are partial views of the
same 0xD0-byte record, the right fix is a full-size struct. Until then, at
minimum declare as a char array so the casts are less noisy, or define a
`FullLevelDescription` placeholder at 0xD0 bytes and declare the extern as
`extern const FullLevelDescription LevelDescriptions[]`. Then
`getLevelDescription` becomes `return (LevelDescription *)&LevelDescriptions[level]`
and `getLevelDescription2` becomes
`return (ActiveLevelDescription *)&LevelDescriptions[getSomeLevelID()]`.

### LevelState size vs unk4 stride

`sub_8051720` uses stride 0x18 (24 bytes) into `unk4[]`. `LevelState` in the
worktree is `{unk16, unk16, s32, s32, LevelDescription*, unk32, unk32}` = 4 + 4 + 4
+ 4 + 4 = 20 bytes... that is only 0x14. Two bytes of padding after unk2 brings
it to 0x18 if `unk0` is u16 + pad + s32 alignment, but verify with
`sizeof(LevelState)` == 0x18. If not, add explicit padding or a trailing field.

### CurrentGameState.unk6E8

Either change the struct member to `CurrentGameStateUnk6E8 unk6E8` (and keep the
union), or drop the union and cast in the one place that writes it as u16. The
union is overkill for a single use; a cast is more honest about uncertainty.

### Unk80516E0.unk4

Used as a pointer into `_807582c[]` (a byte array). `void *` is fine for now but
should become `unk8 *` once the pointed-to data is better understood -- `void *`
hides the arithmetic.

### _807582c and friends

All declared `unk8[]` with raw address names. These are ROM data tables; once
their purpose is known they should get real names and types. Not blocking but
worth a TODO comment in the extern block.
