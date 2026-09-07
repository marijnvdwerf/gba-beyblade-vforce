# Round 5 style measurements — 2026-09-07

These notes record source shapes measured against the target objects. They are
not source-code comments or general compiler assumptions.

## sub_8050A50 (0x08050A50, src/display.c)

The exact match requires `DisplayData.ptrC` to be `unk8*`, a byte offset local,
and a cast to `DisplayRecord*` at the call. The loop advances the byte offset
by `sizeof(DisplayRecord)` (`0x88`). A typed `DisplayRecord*` cursor or typed
index changes the initialization order (`mov r5,#0` versus `mov r4,r0`) and
misses the target. This is the coordinator-approved exception to the normal
field-typed pointer rule.

## sub_805AD9C (0x0805AD9C, src/menu.c)

The target uses a separate `item` cursor and a signed `count` local with a
`while (count--)` cleanup walk. `MenuState.unk10` is an `AllocatedBlock*` at
offset `0x10`; the cleanup stores it to `NULL` after deallocation. The final
field resets are emitted in source order: `itemCount`, `objectCount`, then
`unk9`.

## sub_8057104 (0x08057104, src/beyblade.c)

`arg0` is `s32` because the target performs arithmetic shift right by five.
`arg1` is byte-width (`unk8`) and is normalized at entry. The target requires
the `_currentGameState->unk594[arg0 >> 5]` expression to remain separately
written in the two branches; caching the array pointer and mask changes the
allocation. The final implementation keeps the set and clear expressions
branch-local.

## sub_804A280 (0x0804A280, src/levelrow.c)

The matching shape caches `index` and `entry`, but accesses the global field
with explicit signed views: `(s16)_gameData->unkC26`. `GameData.unkC26` is
committed as `u16`. A temporary experiment declaring it `s16` made this
function's instructions identical, but changed other users and failed the full
ROM SHA1. The field remains `u16` with the two per-use casts pending a separate
cross-user signedness pass.

The signed-field experiment table was:

| symbol | diverged with global `s16 unkC26` | target evidence | final action |
| --- | --- | --- | --- |
| `initGame` | yes | target uses `ldrh`, `orr`, `strh` for `unkC26 |= 0xFFFF`; the signed declaration optimized the operation into a constant halfword store and changed literal-pool layout | retain `u16` |
| `initGameLoop` | yes | target again uses `ldrh`, `orr`, `strh` for `unkC26 |= 0xFFFF` | retain `u16` |
| `sub_8049264` | no | no instruction difference in the signed experiment | no change |
| `sub_804AF04` | no | assignment remains a halfword store with no signed read difference | no change |
| `sub_804AF5C` | no | existing explicit `(s16)` test already selects the signed comparison path | no change |
| `sub_804A280` | no | both comparisons use signed halfword loads in the matched object | restore committed `u16` field and retain per-use `(s16)` casts |

## sub_804DA48 (0x0804DA48, src/riderphysics.c)

Typed `RiderBase*` parameters and typed `Actor*` position fields match without
raw offset arithmetic. The target requires all six coordinates to be staged
before delta arithmetic: `x0`, `y0`, `z0`, then `x1`, `y1`, `z1`. The three
fixed-point deltas are shifted by eight before the squared-distance test.

## sub_805AD24 (0x0805AD24, src/menu.c)

The ABI-sensitive prototype is:

`MenuState*, unk32, unk32, s32, unk32, unk32, unk32, unk8, unk8, unk8, unk8, MenuStateCallback, MenuStateValueCallback, unk8`

In particular, `arg6` is `unk32` and late `argD` is `unk8`. The initializer
store order is byte-required, including the duplicate `items = NULL` store and
the final `unk8 = argD` assignment.

## sub_805AFBC (0x0805AFBC, src/menu.c)

The final source is block-free and contains no `goto` or labels. It uses the
raw matching loop shape with function-scope `old` and `oldItem` locals:

- declarations are ordered `step`, `current`, `count`, `item`, `old`,
  `oldItem`;
- the loop is `while (count-- != 0)`;
- `item->unk44 != 0` uses `continue`;
- the successful path is guarded by `if (old != current) { ... }`, followed by
  one unconditional `break`.

Step table from the one-change builds:

| change | result |
| --- | --- |
| Initial typed draft with direct `state`, `step/current/count/item`, and a nested declaration block | Near miss; target keeps the state pointer in `r6` and step in `r5`, while the draft swapped those roles |
| Hoist `old` and `oldItem` to function scope, preserving the control-flow draft | No reduction; the same register-role swap remained |
| Add a `MenuState* menu = state` record alias | Worse; an extra parameter-to-alias move appeared and the register swap remained |
| Replace the control-flow draft with a direct `while (count-- != 0)` and `if (old == current) break` | Worse CFG; agbcc emitted a top-tested layout instead of the target's rotated condition/body layout |
| Use `while (count--)` | No improvement; the same top-tested layout remained |
| Use the raw declaration order `step/current/count/item`, hoisted locals, `if (old != current) { ... }`, and an unconditional `break` | Exact instruction match, with no nested bare block, `goto`, or label |

## sub_8056EC0 (0x08056EC0, src/collectable.c)

The target keeps `gameData`, `geometry`, `data`, `cursor`, and `state` as
separate locals. `LevelState.unk10` is represented as a one-element `unk32`
array so `state->unk10[i >> 5]` emits the target address formation
(`state + 0x10`, then the scaled index). The corresponding scalar reader in
`sub_80518F0` uses `unk10[0]`.

Using `(&state->unk10)[i >> 5]` or an explicit cast did not produce the target
address sequence; a `stateBits` pointer alias changed register allocation and
added saved-register traffic. The array field is the matching typed layout.
The final copy uses the array expression as the destination and preserves the
four-byte copy call. The bit mask remains `1 << (i & 0x1F)` and the metadata
lookup uses each cursor entry's `line` field.
