# Review: sub_80538C0 and sub_8053F0C drafts

## sub_80538C0

**Verdict:** The agent dereferences `_gameData->unk42C` (loads the pointer
value stored at offset 0x42C) and adds the offset to *that*. The raw-decomp
does byte arithmetic on the struct address itself: `(u8 *)_gameData + 0x42C +
offset`. These are different operations --- one has an extra `ldr` from the
field, which is the extra live value causing the r6 spill. Fix: byte-arithmetic
on `_gameData`, not a field dereference.

The offset scheme: index 0 passes `_gameData` directly (the base struct *is*
the first rider); index 1+ walks `(u8 *)_gameData + 0x42C + (i-1)*0x428`.
The pre-decremented offset of -0x428 is the m2c artefact that reproduces the
loop's running sum; keeping a running `ptr` that starts at the second rider
and advances by the stride is the natural equivalent.

```c
void sub_80538C0(void)
{
    s32 i;
    u8 *ptr;

    for (i = 0; i <= (s32)_gameData->unk430; i++) {
        if (i == 0)
            sub_804B4A4(_gameData);
        else
            sub_804B4A4(ptr);
        ptr += 0x428;
    }
}
```

If the for-loop guard doesn't match (agbcc sometimes needs a do-while with a
pre-check), fall back to:

```c
void sub_80538C0(void)
{
    s32 i;
    u8 *ptr;

    i = 0;
    if (i >= (s32)(_gameData->unk430 + 1))
        return;
    ptr = (u8 *)_gameData + 0x42C;
    do {
        if (i != 0)
            sub_804B4A4(ptr);
        else
            sub_804B4A4(_gameData);
        ptr += 0x428;
        i++;
    } while (i < (s32)(_gameData->unk430 + 1));
}
```

**Key change:** `ptr` is initialised to `(u8 *)_gameData + 0x42C` (the address
inside the struct at that fixed offset) rather than loading `_gameData->unk42C`
(the pointer value stored there). That removes the extra load and the extra
live register. No header change needed; unk42C already exists but simply isn't
used here.

---

## sub_8053F0C

**Verdict:** Two issues. (1) The agent assigns `value = 0` at the top of every
case arm, including cases 2 and 3 where the raw-decomp uses no `value`
variable, and the default case where the raw-decomp sets `value = 1` (not 0).
This changes the live-variable set per case and will move register allocation.
(2) The `gameData` local is assigned inside each case arm; hoisting it above
the switch is the natural shape and likely what the compiler expects.

The raw-decomp's `mode` variable (reused for fields equal to the case
constant) is an m2c artefact: the compiler already has the case constant
available, so writing the literal is equivalent and more natural. Try literals
first; fall back to `mode` only if a specific case arm differs.

```c
void sub_8053F0C(unk32 arg0)
{
    GameData *gameData = _gameData;

    switch (_currentGameState->unk3) {
    case 1:
        gameData->unk7FC = 0x200;
        gameData->unk7FE = 0x100;
        gameData->unk800 = 2;
        gameData->unk802 = 1;
        gameData->unk804 = 9;
        gameData->unk806 = 8;
        gameData->unk808 = 1;
        gameData->unk80A = 0;
        return;
    case 2:
        gameData->unk7FC = 0x100;
        gameData->unk7FE = 0x200;
        gameData->unk800 = 2;
        gameData->unk802 = 1;
        gameData->unk804 = 8;
        gameData->unk806 = 9;
        gameData->unk808 = 1;
        gameData->unk80A = 0;
        return;
    case 3:
        gameData->unk7FC = 0x100;
        gameData->unk7FE = 2;
        gameData->unk800 = 1;
        gameData->unk802 = 0x200;
        gameData->unk804 = 8;
        gameData->unk806 = 1;
        gameData->unk808 = 0;
        gameData->unk80A = 9;
        return;
    default:
        gameData->unk7FC = 0x200;
        gameData->unk7FE = 0x100;
        gameData->unk800 = 1;
        gameData->unk802 = 2;
        gameData->unk804 = 9;
        gameData->unk806 = 8;
        gameData->unk808 = 0;
        gameData->unk80A = 1;
        return;
    }
}
```

If any case arm doesn't match with pure literals, the raw-decomp shows where
a `value` local was used to share a constant across two fields:

- case 1: `s16 value = 0;` placed after `gameData =`, then `value` used for
  unk80A only.
- default: `s16 value = 1;` placed *after* the unk7FE store, then `value`
  used for unk80A.
- cases 2 and 3: no `value` variable at all; 0 is written as a literal.

If `mode` is needed: `u8 mode = _currentGameState->unk3;` then
`switch (mode)`, and `mode` replaces the matching literal (e.g.
`gameData->unk802 = mode` in case 1 where mode==1).

### Header / type notes

The eight new u16 fields at 0x7FC--0x80A in the agent's ram.h delta look
correct: all stores are strh and values are small positive integers. Keep them
u16 (not s16) --- the raw-decomp uses `*(s16 *)` casts but that's an m2c
artefact; the store instruction is the same and no consumer is known to use
ldrsh for these fields. The padding split (`unk7A4[0x58]` + 8 fields +
`pad80C[4]`) sums to the original `unk7A4[0x6C]`, which is correct.

The `sub_804B4A4` extern already declared as `void sub_804B4A4(void*)` in the
agent's draft is fine.
