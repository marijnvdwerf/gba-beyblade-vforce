# Tutorial and HUD matching — 2026-09-05

## sub_804A310 (0x0804A310)

Matched with:

```c
void sub_804A310(void)
{
    sub_804AE34(0, 0x3C);
}
```

The generated sequence matched the six-instruction dump: `push {lr}`, the two
immediate arguments, `bl sub_804AE34`, and the `pop`/`bx` return sequence. The
full ROM compare passed.

## sub_804A550 (0x0804A550)

Matched with a typed `TutorialEntry*` parameter and typed tutorial data. The
page data is represented as five signed language counts followed by eight
five-pointer string groups. The signed count produces the target `bge` in the
page-bound check. The initial page string is selected from group zero, and the
advancing lookup uses `languageStrings[index].strings[getLanguage()]`; agbcc
strength-reduces the indexed access to the target byte-cursor arithmetic while
keeping the source fully typed.

The matched control flow is a plain `while (done == 0)`: the done flag is
initialized before the guard, the loop waits for VBlank, updates input,
decrements the 30-frame timer, and advances one page when the input or timeout
condition is met. The frame toggle uses a zero-initialized `unk16` temporary, conditionally
sets it to one, and performs one final halfword store. This reproduces the
shared target store and the 24-byte frame with the incoming entry spilled at
`[sp, #16]` and the loop counter at `[sp, #20]`.

The first near-miss used a byte cursor and cast-and-offset dereference for the
string lookup. Replacing that with the typed grouped-array index preserved the
same instruction sequence and removed the raw offset access. The full function
diff was identical, including literal-pool placement and trailing padding; the
ROM compare passed.

## sub_804EE54 (0x0804EE54)

Matched with the existing `LevelHudData` layout rooted at `GameData.levelHud`.
The combined nonzero/decrement condition reproduces the target's initial status
branch and keeps the cleanup call on the shared path. A direct `switch
(state->state)` with cases 1 through 6 was tested against the prior
`switch (state->state - 1)` form and produced identical instructions; the direct
switch is retained. Its body order is case 1, case 6, case 2 with fall-through
to cases 3 and 4, then case 5.

Case 5 requires a case-local status value, a long-lived `maxY` value, and a
`SpriteTextCleanup*` pointing at `text1`. Assigning the text pointer before the
motion calls keeps it live across those calls, producing the target's saved
`r6`/`r7` allocation and the `[r6, #4]` load. The color selection initializes
`0xF` and overwrites it with `0xD` when the shifted mode is nonzero; this emits
the target's `beq` polarity in both color-selection arms.

The HUD data is now one nested `LevelHudData levelHud` member inside
`GameData`, preserving the original offsets while avoiding a view-struct cast.
The helper prototypes use `SpriteTextCleanup*` parameters.

`LevelHudData.status` remains `s32` because the target has a signed `bgt` at
`sub_804EE54 + 0xD4`. `maxY` is used by the signed coordinate interpolation
with arithmetic shifts at `+0x10E`, `+0x114`, and `+0x11A`; `mode` is used by
the arithmetic-shift extraction at `+0x12C`, `+0x13A`, `+0x178`, and `+0x186`.
`mode2` is only equality-tested and therefore uses the default `unk32`; changing
it from `s32` preserved the full ROM match.

The duplicated mode/color block was also tested hoisted before the switch under
`state->state == 2 || state->state == 5`. That source shape changed the ROM, so
the two per-case blocks are retained. The repeated shifts are left as ordinary
expressions because `sub_8057C40()` returns a value rather than exposing a
proven packed field.

The final instruction diff matched exactly, including the five-register
prologue/epilogue, jump table, literal pools, and trailing padding. The full
ROM compare and source lint passed.
