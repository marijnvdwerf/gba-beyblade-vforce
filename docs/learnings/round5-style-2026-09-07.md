# Round 5 style measurements — 2026-09-07

These notes record source shapes measured against the target objects. They are
not source-code comments or general compiler assumptions.

Provenance: `session-8-raw-decomp-3.md` and `session-8-raw-decomp-3b.md` are
EARLIER notes copied verbatim from the user's `raw-decomp-3` branch (the muse
for this round). Where they disagree with this file, this file is the later
measurement and wins.

## sub_8050A50 (0x08050A50, src/display.c)

The exact source keeps separate `count` and byte `offset` locals. The loop
calls `sub_8058EF4` through a `DisplayRecord*` cast from `display->ptrC +
offset`, advances by `sizeof(DisplayRecord)`, and decrements `count`. A typed
record cursor or typed index changes initialization and misses the target.

## sub_805AD9C (0x0805AD9C, src/menu.c)

The target uses a separate `item` cursor and signed `count` local with a
`while (count--)` cleanup walk. `MenuState.unk10` is an `AllocatedBlock*` at
offset `0x10`; the cleanup stores it to `NULL` after deallocation. The final
field resets are emitted in source order: `itemCount`, `objectCount`, then
`unk9`.

## sub_8057104 (0x08057104, src/beyblade.c)

`arg0` is `s32`; the target performs arithmetic shift right by five for the
bitset word index. `arg1` is byte-width `unk8` and is normalized at entry. The
set and clear expressions remain branch-local; caching the array pointer or
mask changes allocation.

## sub_804A280 (0x0804A280, src/levelrow.c)

The matching source caches `index` and `entry`. The final `index` declaration
is `unk32`, not `s32`: changing only that local to `unk32` produced an exact
function diff and a passing ROM comparison. The earlier `s16` test inserted
`lsl #16; asr #16` before index scaling and was rejected; that result did not
prove that a 32-bit signed local was required.

`GameData.unkC26` is declared `s16`. Its explicit casts in this function were
removed. The direct comparisons remain exact after the field migration.

## GameData.unkC26 and its users

The field at offset `0xC26` is `s16`. The initialization target uses a
halfword read-modify-write (`ldrh`, `orr`, `strh`), rather than a direct
constant store. With the field declared `s16`, each of `= -1` and `= 0xFFFF`
compiled exactly, and `|= -1` also compiled exactly; the retained source is
the cast-free read-modify-write spelling:

    _gameData->unkC26 |= -1;

The positive-literal compound form `|= 0xFFFF` mismatched because agbcc
optimized it differently. The former cast-heavy spelling was byte-identical
but was rejected as an artificial source shape.

The migrated field was rebuilt and diffed in `initGame`, `initGameLoop`,
`sub_8049264`, `sub_804AF04`, `sub_804AF5C`, and `sub_804A280`; all remained
exact.

## sub_804DA48 (0x0804DA48, src/riderphysics.c)

The exact source stages six coordinates before delta arithmetic:
`x0`, `y0`, `z0`, then `x1`, `y1`, `z1`. The three differences are shifted by
eight before the squared-distance comparison. All six staged coordinates are
`s32` in the final source because each individual `unk32` experiment changed
the corresponding target `asr #8` to `lsr #8`:

| local changed to `unk32` | target operation that changed | final type |
| --- | --- | --- |
| `x0` | first delta `asr #8` at function offset `0x24` became `lsr #8` | `s32` |
| `y0` | second delta `asr #8` at offset `0x28` became `lsr #8` | `s32` |
| `z0` | third delta `asr #8` at offset `0x2C` became `lsr #8` | `s32` |
| `x1` | first delta `asr #8` at offset `0x24` became `lsr #8` | `s32` |
| `y1` | second delta `asr #8` at offset `0x28` became `lsr #8` | `s32` |
| `z1` | third delta `asr #8` at offset `0x2C` became `lsr #8` | `s32` |

The `radius` parameter is also `s32`. Changing only the public declaration
and definition to `unk32` changed the final target `blt` at function offset
`0x48` to `blo`; restoring `s32` produced an exact diff. The multiplication
alone was not treated as signedness evidence; the measured signed branch is
the reason the signed parameter is retained.

The position pointers are typed `Actor*`, and the final source uses no raw
offset arithmetic.

## sub_805AD24 (0x0805AD24, src/menu.c)

The ABI-sensitive prototype is:

    MenuState*, unk32, unk32, s32, unk32, unk32, unk32, unk8, unk8, unk8, unk8,
    MenuStateCallback, MenuStateValueCallback, unk8

The exact initializer uses unknown names for unproven `MenuState` fields:
`unk0`, `unk4`, `unk28`, and `unk34`. Existing code did not prove semantic
meanings for those slots. The store order is byte-required, including the
duplicate `items = NULL` store and final `unk8 = argD` assignment.

## sub_805AFBC (0x0805AFBC, src/menu.c)

The final source has no `goto`, labels, or nested bare block. It keeps
function-scope `step`, `current`, `count`, `item`, `old`, and `oldItem`
locals. The matching control flow is `while (count-- != 0)`, a
`continue` for disabled items, an `if (old != current)` update body, and one
unconditional `break` after the successful path.

A direct block-free rewrite with this declaration order and control flow was
exact. `while (count--)`, a nested declaration block, and the alternative
`if (old == current) break` shape all produced different control-flow or
register allocation.

## sub_8056EC0 (0x08056EC0, src/collectable.c)

The exact source retains `geometry`, `data`, `state`, `cursor`, `metadata`,
`object`, and signed `i` locals. Folding `gameData`, or folding the single-use
`metadata` result into the object lookup, is byte-identical and retained.
Folding `geometry`, `data`, `state`, `cursor`, or `object` changes the prologue,
address formation, or lookup count and is not retained.

`LevelState.unk10` is a proven two-word `unk32` array:

    unk32 unk10[2]; /* 0x10 */

`sub_8056EC0` indexes it as `state->unk10[i >> 5]`. The final copy passes the
array expression to `__fastMemoryCopyARM`, and `sub_80518F0` reads
`state->unk10[0]`. `sub_80510FC` clears `&levelState->unk10[0]` and
`&levelState->unk10[1]`. These forms all preserve the target address
formation, and the LevelState users diff exactly.

The local `i` remains `s32`: changing it to `unk32` changed the first index
shift from `asr #5` to `lsr #5` and the loop branch from `blt` to `blo`.
Changing `CollectableData.count` to `unk32` likewise changed the terminating
branch from `blt` to `blo`, so that field remains signed.
