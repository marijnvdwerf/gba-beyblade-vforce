# Small red matches

## sub_80517E8 (0x080517E8)

The target uses an explicit conditional return: `bne` to `return 1`, otherwise `return 0`. A direct boolean return compiled to a shift/mask sequence, while the explicit branch matched exactly. `LevelState.unk0` is accessed with `ldrh`, so no signedness change was justified.

## sub_8059FF8 (0x08059FF8)

The five-argument `void` helper writes four consecutive word arguments through the destination pointer. Direct indexed stores match the target's `ldr` of the fifth stack argument and four `str` instructions exactly; no extra temporary is required.

## sub_8062318 (0x08062318)

The target normalizes the second argument with `lsl #24; lsr #24`, proving an 8-bit formal or equivalent ABI narrowing. A typed `unk8` parameter and direct `SpriteTextCleanup.unk2B` byte store reproduce the null check, offset materialization, and `strb` exactly. The controlled `unk32` formal with the unchanged byte store diverges at offset `0x0`: the target has `lsl r1, #24; lsr r1, #24`, while the alternative begins with `cmp r0, #0`. The `unk32` formal with an `unk8 value` local assigned from `arg1` before the null check has no instruction divergence and reproduces the target exactly. The final source remains the simpler `unk8` formal. The TU needed `ASM_ZEROPAD` after the final function: without it, agbcc emitted a trailing `0xC046` where the baseline has two zero bytes.

## GetPointAtIndex (0x0805DBAC)

The matched implementation stages `points = arg0->unk4`; the target loads the point-table pointer first. Folding `points` into `&arg0->unk4[arg1]` was tested once and inserted `mov r2, r0` at `0x0`, shifting the target's initial `ldr r2, [r0, #4]`; the `points` alias is byte-required. The target's signed `blt` at `0x8` proves that `LevelGeometryTable.pointCount` is `s32`, not `unk32`. With the field corrected to `s32`, folding `count` into `arg1 < arg0->unk0->pointCount` preserves `blt` and matches exactly; the `count` temporary is not required.

## GetPointAtSplineIndex (0x0805DBC0)

A local `unk32* offsets = spline->pointIndices` is required to keep the `spline + 0x20` base in `r2` before the point-count check; using the indexed member directly allocated a separate `r3` and shifted the CFG. The target's `bge` proves signed indices, so the public prototype and definition use `s32` for both indices. The final typed array lookup matches without raw offset arithmetic.

## sub_8063B44 (0x08063B44)

The matched implementation uses `TeletypeState::unk1C` as the byte code array and `unkBF` as its cursor; the target materializes offset `0xBF` for both the read and increment. `sub_8063AD8` is declared in `teletype.h` as `(TeletypeState*, unk32)`, derived from the call site and asm-only helper ABI. The direct byte table lookup, helper call, fixed-width coordinate update, and two byte increments match exactly. Adding `unkBF` replaced existing padding without changing the layout or other matched users. Folding the staged `result` into explicit `return 1`/`return 0` branches was tested once; it removed the target's `r7` result register, changed the push mask from `{r4, r5, r6, r7, lr}` to `{r4, r5, r6, lr}`, and first diverged at `0x0`. The staged `result` is therefore byte-required.

## turorial_804A488 (0x0804A488)

The typed natural draft recovers the tutorial-entry search and completion-bit update. The target keeps the state result in `r1`, the signed index in `r3`, and the signed count in `r2` immediately after `sub_8051734`; the clean typed draft instead allocates these three values as `r3`, `r2`, and `r1`, with the first divergence at `0x14` (`mov r1, r0` versus `mov r3, r0`). A staged `levelFlags` alias produced the target roles but materialized `add r1, #20` before the index `asr`/`lsl`, diverging at `0x42`; typed indexing and split assignments also reversed the target index-scaling/base-add order. The only exact form tested uses a byte-offset local and a casted byte-pointer addition from `&levelState->unk10[1]`; it violates the no-raw-offset-arithmetic rule and is parked rather than shipped. The best natural typed draft is retained in `#if 0` above the asm inclusion. `sub_80555F4` is declared in `effects.h` from the call site.

## sub_8041188 (0x08041188)

The direct typed body initially allocated `description`, `levelState`, and `levelIndex` in `r7`, `r6`, and `r8`, producing a four-byte-short function. A `LevelState* laterLevelState` initialized before `getLanguage()` and used for the later time-field reads moved the body values to the target registers (`description` in `r8`, `levelState` in `r7`, and `levelIndex` in `r9`) and made every instruction after the prologue exact; the only remaining divergence was the order of the `mov r9, r3` and `mov r7, r2` entry moves. Adding `unk32 laterIndex`, initialized before `getLanguage()` and used for `sub_80518C8`, produced the target move order and an exact function. Folding `laterLevelState` into direct `levelState` field reads was tested once and removed the target's `mov r9, r3` at `0x0E`, shifting the rest of the function; the alias is byte-required. Folding `laterIndex` into the `sub_80518C8(levelIndex)` call was tested once and swapped the entry moves at `0x0C`/`0x0E` (`mov r9, r3` before `mov r7, r2` instead of the target order); the alias is byte-required. These two locals are byte-required for the target lifetime shape. `LevelState.unk0` is accessed with `ldrh`; no signedness change is justified, and `language` remains `unk32`.

## sub_805DFD4 (0x0805DFD4)

The function calls `GetSplineAtIndex`, clamps a signed fixed-point position to the spline's last point while preserving its low ten bits, interpolates the three signed point coordinates, and stores the fraction and segment index in the five-word output array. The target's `bge` and `blt` branches and arithmetic right shifts prove `s32 position` and `s32 index`; the spline-index formal remains `unk32` because the target has no entry narrowing before the `GetSplineAtIndex` call, despite the rider call site sourcing an `s16` field. The output pointer is returned in `r0` after the final store, so the declaration uses `s32*` as both the output parameter and return type. Computing `position & 0x3FF` directly in the first interpolation expression, rather than staging `fraction` before the coordinate loads, preserved the target's `ldr`/`sub`/literal-load/`and` order; CSE then reused the fraction for all three coordinates and the output store. The typed `GeometrySpline.pointIndices` member and `s32` output indexing reproduce the `spline + 0x20` address and five stores without raw offset arithmetic.

Coordinator-approved typed indexing probes were tested after the raw-offset draft was parked. With `flags = &levelState->unk10[1 + (index >> 5)]`, the first divergence remained at `0x14`: target `mov r1, r0` and `mov r3, #0`, while the candidate emitted `mov r3, r0` and `mov r2, #0`; subsequent count/index uses were correspondingly allocated to `r1`/`r2` instead of target `r2`/`r3`. With `wordIndex = index >> 5; flags = &levelState->unk10[wordIndex + 1]`, the same first divergence and register assignment occurred. Both typed candidates therefore remained parked, and the asm inclusion was restored.
