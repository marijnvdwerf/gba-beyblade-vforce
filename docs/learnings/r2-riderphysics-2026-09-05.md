# Rider physics round 2 — 2026-09-05

## UnsetRiderFlag (0x0804E40C)

Matched in `src/riderphysics.c`. The target is a direct read-modify-write of `RiderBase.flags` at offset `0x9C`; `rider->flags &= ~flags` emits the target five instructions exactly. `RiderBase.flags` remains `unk32` because this function proves only whole-word access and bitwise clearing.

## sub_804D104 (0x0804D104)

Matched in `src/riderphysics.c`. The function copies the two word fields at
`RiderBase` offsets `0x40` and `0x44` into the word fields at `0x48` and
`0x4C`, respectively. Extending the existing `RiderBase` padding with
`unk32 unk48` and `unk32 unk4C` preserves the fixed layout and emits the target
five instructions exactly.

## sub_804C870 (0x0804C870)

Matched in `src/riderphysics.c`. The signed `s32` parameter and fixed-point
formula `rider->unk208 = (arg1 * 0xC0 >> 8) + 0x600` reproduce the target's
multiply-by-three, shift-by-six, arithmetic shift-by-eight, and `0x600`
addition. The existing `RiderBase.unk208` signed field is retained.

## sub_804CEF4 (0x0804CEF4)

Matched in `src/riderphysics.c`. The action selector is an unsigned `unk32`
used in an explicit `if (action <= 4)` dense switch; retaining an empty case 3
produces the target jump table. The repeated speed updates use direct
`rider->unk208 += -0x600` followed by the signed clamp, which preserves the
store-before-compare sequence. The random values are staged from
`sub_8057C40()` before each actor-field assignment so the actor pointer reload
occurs before the shift/mask arithmetic. `RiderBase.unk21E` is a halfword field
at offset `0x21E`; its declaration preserves the existing fixed layout.

## sub_804CB08 (0x0804CB08)

Parked with the semantic draft retained under `#if 0`; first divergence was the target input-magnitude allocation (`r4`) versus the draft allocation (`r9`) immediately after the speed clamp. The draft-proven fields at offsets `0x1C4`, `0x1C8`, `0x1FC`, `0x22E`, and `0x230` were removed from `RiderBase` after parking.

## sub_804D110 (0x0804D110)

Parked with the best available semantic draft under `#if 0`; the first unresolved target-specific divergence is the AI-speed branch at `0x0804D2A8`, where the target performs additional clamping, flag, and animation-state updates beyond the draft.

## Review-question verdicts

- Random staging: folded both `sub_8057C40()` calls directly into the two actor-field assignments; one compare build passed, so the single-use temporary was removed.
- Repeated speed clamp: a shared prelude/common update changed the ROM (`expected cd527c8c24e20e33913fc45199e64b3e6138a6e5`, `generated 305e6cc06ba2ea2cb0850964ffe01825ab5e2169`); duplicated switch arms remain.
- `input`: folded the player/AI input selection into the movement condition; the compare remained identical, so no single-use `input` local remains.
- `aiInputPtr`: removed the scalar-global pointer alias and selected `_unk3005DA0` or `rider->unk1C8` directly; the compare passed with the same ROM.
- `rotateY`: retained the temporary because the second rotated component must use the original `moveX` and `moveY`; a direct assignment fold changes the expression's meaning.
- Timer pointers: retained `timer0` and `timer1`; the target keeps both field addresses live across `sub_804A504`, so direct stores do not represent the target lifetime shape.
- Parked `sub_804D110` locals: removed `state`, `angle`, and `speed`; retained `oldDirection`, and added only the signed `splineIndex` and `angularVelocity` values used by the recovered branches.
- Repeated timer stores: retained the duplicated branch-local stores and address selection; a selected-value/common-store rewrite was not adopted because the target has distinct branch arms and address lifetimes.

## Parked-draft retry tables

### `sub_804CB08` (`0x0804CB08`)

| Change | Measured result |
| --- | --- |
| Replace the one-parameter draft with `(RiderBase*, Actor*)` | Source-only change while parked; compare unchanged; second argument is unused by the target body. |
| Replace byte/offset access with `RiderBase` members | Source-only change while parked; compare unchanged; all accessed fields are now typed members. |
| Fold the selected input into the movement test | Compare unchanged; the single-use `input` local was removed. |
| Remove the scalar `_unk3005DA0` pointer alias | Compare passed; direct global/field value selection retained. |
| Fold `rotateY` into the `moveY` assignment | Rejected as non-equivalent: the following `moveX` assignment needs both pre-rotation values; `rotateY` remains. |
| Remove `timer0`/`timer1` | Rejected by target lifetime evidence: `r7`/`r6` preserve the two addresses across the tutorial call; pointers remain. |
| Merge the two timer-update arms | Not adopted; target has separate branch-local stores and address setup. |

### `sub_804D110` (`0x0804D110`)

| Change | Measured result |
| --- | --- |
| Replace `(unk8*, unk8*)` with `(RiderBase*, Actor*)` | Source-only parked change; compare unchanged; caller and all accessed records now agree. |
| Remove the `unk8*` cursor and cast-and-offset expressions | Source-only parked change; compare unchanged; accesses now use `RiderBase`, `Actor`, `CurrentGameState`, `GameData`, `LevelGeometryAddresses`, and `GeometrySplineLine` fields. |
| Remove `state`, `angle`, and `speed` | Source-only parked change; compare unchanged; none is consumed by the target semantics. |
| Change the halfword timer local to `unk16` | No timer local remains in the typed draft; halfword fields are accessed directly, with signed locals only where `ldsh` evidence exists. |

## Removed byte cursors

- `sub_804D110` parameter `unk8 *rider` became `RiderBase* rider`.
- `sub_804D110` parameter `unk8 *other` became `Actor* other`.
- `sub_804D110` local `unk8 *state` was removed because the loaded pointer was unused; the known rider actor remains `rider->unk0` where needed.
- The `_currentGameState` byte-pointer cast became `_currentGameState->unkC64`.
- The `_gameData` byte-pointer casts became `_gameData->base` and `_gameData->unk65C` member accesses.
- `sub_804CB08` had no remaining byte cursor; its second parameter is the typed `Actor* actor` required by the real call site and is explicitly unused by the target body.

## Parked-draft local layouts

The parked drafts keep their asm-proven layouts in function-local `RiderDraft` scratch structs inside their respective `#if 0` blocks. No fields used only by the parked drafts remain exposed in `RiderBase` or any shared header. The `sub_804D110` scratch layout includes the proven `GeometrySpline*` field at `0x214`, the spline position word at `0x224`, and the 16-byte local `GeometrySplineLine` record with its proven word at `0x0C`.

The shared `RiderBase` layout retains the fields required by the four matched functions and the pre-existing live layout: `unk0`, `unk4`, `unk40`, `unk44`, `unk48`, `unk4C`, `flags`, `unk208`, and `unk21E`, along with the pre-existing named fields and padding.
