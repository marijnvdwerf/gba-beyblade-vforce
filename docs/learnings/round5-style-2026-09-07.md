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

The matching shape caches `index` and `entry`. `GameData.unkC26` is now
committed as `s16`, so both comparisons use the field directly; the explicit
`(s16)` casts from the prior `u16` declaration were removed. The final local
`index` remains `s32`: changing it to `s16` inserted `lsl #16; asr #16` before
index scaling and shifted the remainder of the function.

The signed-field and source-shape measurements were:

| symbol | tested form or declaration | result | target evidence / final action |
| --- | --- | --- | --- |
| `initGame` | `s16 unkC26`; `_gameData->unkC26 = -1` | exact | target uses `ldrh`, `orr`, `strh`; retain cast-free `|= -1` form |
| `initGame` | `s16 unkC26`; `_gameData->unkC26 = 0xFFFF` | exact | same instruction sequence; not retained because `|= -1` preserves the measured read-modify-write intent |
| `initGame` | `s16 unkC26`; `_gameData->unkC26 |= -1` | exact | retained cast-free form |
| `initGame` | prior cast-heavy `(s16)((unk16)unkC26 | 0xFFFF)` | exact but rejected | source shape is artificial; replaced by cast-free `|= -1` |
| `initGame` | `s16 unkC26`; `_gameData->unkC26 |= 0xFFFF` | mismatch | agbcc optimized the positive literal form differently; do not use |
| `initGameLoop` | `s16 unkC26`; each of the three assignment forms above | exact | same result and retained `|= -1` form |
| `sub_8049264` | global declaration changed from `u16` to `s16` | exact | no further source change |
| `sub_804AF04` | global declaration changed from `u16` to `s16` | exact | assignment remains a halfword store |
| `sub_804AF5C` | global declaration changed from `u16` to `s16` | exact | signed halfword load is preserved |
| `sub_804A280` | global declaration changed from `u16` to `s16`, casts removed | exact | retain direct `unkC26` comparisons |

The target initialization instructions are `ldrh`, `orr`, `strh`, not a direct
`mov`/`neg`/`strh` constant store. The previous source before migration was
`_gameData->unkC26 |= 0xFFFF` with a `u16` field; that source explains the
read-modify-write sequence. The negative literal spelling is the cast-free
signed-field form that preserves it.

The six users above were all rebuilt and diffed after the field migration.

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

The exact source retains `geometry`, `data`, `state`, `cursor`, `metadata`,
`object`, and signed `i` locals. `GameData* gameData` can be folded into the
two global member initializers without changing instructions. The single-use
`metadata` result can also be folded into the object lookup call. The retained
source therefore begins with direct `_gameData` initializers and performs the
nested metadata lookup inline.

`LevelState.unk10` is represented as a one-element `unk32` array so
`state->unk10[i >> 5]` emits the target address formation (`state + 0x10`,
then the scaled index). The corresponding scalar reader in `sub_80518F0` uses
`unk10[0]`.

The alias and signedness measurements were:

| change | result | first observed effect / final action |
| --- | --- | --- |
| Fold `gameData` into `_gameData->unk65C` and `_gameData->collectables` | exact | retain the fold |
| Fold `geometry` and use `_gameData->unk65C` directly | mismatch | prologue saved-register allocation and literal-pool layout changed; retain `geometry` |
| Fold `data` and use direct `_gameData->collectables` expressions | mismatch | first global/table setup diverged; retain `data` |
| Fold `state` and repeat `sub_8051734()->unk10` | mismatch | prologue diverged and calls were repeated; retain `state` |
| Fold `cursor` and use `data->entries[i].line` | mismatch | scaled-index address formation replaced cursor walking; retain `cursor` |
| Fold `metadata` into `getLineMetaobjectByTypeAndId` | exact | retain the inline lookup |
| Fold `object` and duplicate the lookup for the null test and field access | mismatch | second lookup call emitted; retain `object` |
| Fold `i` and drive the loop from cursor/pointer subtraction | mismatch | loop entry and pointer arithmetic diverged, including `asr #8`; retain `i` |
| Change local `i` from `s32` to `unk32` | mismatch | first index shift changed from `asr #5` to `lsr #5` and the terminating branch from `blt` to `blo`; retain `s32` |
| Change `CollectableData.count` from `s32` to `unk32` | mismatch | terminating `blt` changed to `blo`; retain signed field |

The final copy keeps the array expression as the destination and preserves the
four-byte copy call. The bit mask remains `1 << (i & 0x1F)` and the metadata
lookup uses each cursor entry's `line` field.
