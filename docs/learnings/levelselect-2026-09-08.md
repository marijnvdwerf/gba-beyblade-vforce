# Level-select matching notes — 2026-09-08

## sub_8041288 (0x08041288)

The matched implementation keeps the four-parameter ABI (`LevelSelectState*`, `LevelDescription*`, `LevelState*`, `s8`) while the last two formals are unused by the body. The target uses a wide `unk32 language` local from `getLanguage()`, then selects rows 1 and 0 in that order. The three branches use `LevelDescription` pointer arrays at offsets `0x68`, `0x40`, `0x94`, and `0xA8`, plus the global five-entry tables `_806EA70` and `_806EA5C`; the complete target instruction sequence matches.

`LevelDescription` was extended without changing its `0xD0` size: `unk40[5]` replaces padding at `0x40`, and `unk94[5]`/`unkA8[5]` replace padding from `0x94` through `0xBB`. `_currentGameState->unk6A4` remains a byte field, producing the target `ldrb` comparison with `2`. No temporary beyond the language index remains.

## displayFrontendLevel (0x080410B4)

The matched implementation keeps `palette` and `spriteSheet` as pointer locals, with the asset-selection branches ordered as `(levelState->unk0 & 2) != 0 || sub_8051780(4) != 0`, followed by an inner `sub_8051780(4) != 0` test. This reproduces the target's `bne`/`beq` layout and shared loads from `LevelDescription` offsets `0xC0`/`0xC4` and `0xC8`/`0xCC`. The `LevelDescription` asset fields are all pointer-width; `unkC4` was changed from `void *` to `const unk8 *` without changing its generated users.

The target call to `LoadSpriteSheet` uses trailing arguments `1, 0, 0, 0`, producing stores at stack offsets `0`, `4`, `8`, and `0xC` in that order. A draft using `0, 0, 1, 0` differed in those stores. Swapping the declaration order of the two pointer locals and using the target argument order produced the target `{r4, r5, r6}` prologue and complete instruction match; no artificial register or lifetime lever remains.

## Review measurements

Folding `palette` into the palette consumers diverged at offset `0x00`: the candidate saved `r7` and emitted `push {r4, r5, r6, r7, lr}`, while the target emits `push {r4, r5, r6, lr}`. The staged `palette` local is retained.

Folding `spriteSheet` into the load/null-test consumers likewise diverged at offset `0x00` with an extra saved `r7`. The staged `spriteSheet` local is retained.

A common row-call tail using `row1`/`row0` locals did not match. The first meaningful divergence is at target offset `0x16`: the target loads the row pointer before shifting the language index, while the candidate shifts the index before loading the pointer. The duplicated branch-local calls are retained.
