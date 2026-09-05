# Round 2 gamestate and level HUD — 2026-09-05

## Matched functions

### `sub_8051868` (`0x08051868`)

The function returns `unk8` and forwards the wide result of `sub_8051820` to
`sub_805749C(unk32)`. The `unk8` return declaration reproduces the target's
`lsl #24` / `lsr #24` normalization after the table lookup; no explicit shift
expression is present in the source.

### `sub_80515A4` (`0x080515A4`)

The matching source shape uses a `BackupBlock*` pointing at
`&_currentGameState->unk6FC`, a separate `s32 size` initialized to `0x564`,
and an `unk8 result` temporary. The result temporary preserves the target's
byte normalization before `Sound_80626E0`, matching the established shape of
`sub_80515E0`.

### `sub_804FB6C` (`0x0804FB6C`)

The nested `GameData.levelHud` layout supplies `text0` at `0xF50`,
`motion0` at `0x1010`, `flags` at `0x105E`, `status` at `0x1040`, and `state`
at `0x105A`. A cached `GameData*`, `SpriteTextCleanup*`, table pointer, and
`MotionGroup*` reproduce the target's address materialization and call order.
The language table is `_806E8C4`; the function sets the HUD state to `5`.

### `sub_804FC00` (`0x0804FC00`)

The callback parameter is `unk32`: the target uses it as a row index before
adding the language index. Indexing the flat `_806E724` table as
`table[arg0 * 5 + language]` reproduces the `lsl #2`, multiply-by-five, and
pointer lookup sequence. The function uses the same nested `LevelHudData`
fields and motion setup as `sub_804FB6C`, calls `sub_804F84C(0)` before cleanup,
and sets the HUD state to `4`.

All four implementations matched without artificial shift/mask choreography
or speculative struct fields.
