# Level HUD and AI learnings — 2026-09-07

## sub_804FE50 (0x0804FE50)

The target is 76 bytes and matches with the existing `GameData` layout. The
increment reads and writes `GameData.levelHud.unk12D` at offset `0x107D`.
The text destination is `GameData.levelHud.text3` at offset `0xFE0`.

The matching source keeps `GameData *state = _gameData` live across all three
calls. Removing that alias and using `_gameData` directly changed the prologue
from `push {r4, lr}` to `push {r4, r5, lr}` and introduced extra global
reloads. A `SpriteTextCleanup *hud` alias for `&state->levelHud.text3` was
removed; rebuilding after its removal was byte-identical.

The function diff had no differing instructions, and `sub_8056E2C`, its caller,
remained exact after the change.

## sub_8057878 (0x08057878)

The target is 72 bytes and implements a table-based angular lookup using
`Unk_874CEBC`. Its matching prototype is:

```c
unk32 sub_8057878(s32, s32);
```

The parked `s16 sub_8057878(s16, s16)` declaration was disproven. Narrowing
both parameters added entry normalization and changed the prologue. Narrowing
only the first parameter likewise added entry normalization and diverged at the
first instruction after the prologue. Narrowing only the second parameter gave
this first divergence:

```text
TARGET 0x00000000: mov r3, r0
BASE   0x00000000: push {r4, lr}
BASE   0x00000004: lsl r0, r1, #16
BASE   0x00000006: asr r3, r0, #16
```

The wide `s32` parameters are supported by the signed comparisons and arithmetic
right shifts in the target. A narrow return was also tested and produced an
extra `lsl #24`/`lsr #24` before return; the target returns without that
normalization, so the return type is wide `unk32`.

The body retains `absArg1`, `angle`, and `value`. Removing the `angle` local and
assigning directly to a narrow table index moved the halfword normalization into
branch arms and diverged. Direct indexing with `(s16)angle` matches the target's
`lsl #16`/`asr #16` sequence and was byte-identical to a separate `s16 index`
temporary; the separate temporary was removed. The sign temporary was removed
by assigning `arg1` to `arg0` in the large-magnitude branch; that was
byte-identical.

The function diff had no differing instructions. The equivalent active helper
`sub_804AB88` in `src/trail.c` has the same wide-argument and wide-return shape.
