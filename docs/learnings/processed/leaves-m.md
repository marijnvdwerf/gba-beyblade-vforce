# sub_80581B8

## Status

Matched at `0x080581B8` in `src/actor.c`. The function uses the declared
`ActorFrameTable.unk8` array with a zero-length trailing-array declaration so
agbcc preserves the target's scaled-index-plus-field-offset instruction shape.

## Signedness and cast-removal experiments

| Change | Result |
| --- | --- |
| Declare `Actor.unk2E` as `s16` and remove the comparison cast | Full ROM compare passed; target `ldrsh` and unsigned argument load remained exact |
| Declare `Actor.unk1E` as `s16` and remove its comparison cast | Full ROM compare failed; the field load changed from target `ldrh` to `ldrsh` |
| Declare `ActorFrameTable.unk4` as `s16` | Full ROM compare failed; the frame-count load changed from target `ldrh` to `ldrsh` |
| Keep `unk1E` and `unk4` as `unk16`, assign them to `s32 currentFrame` and `s32 frameCount`, then compare the locals | Full ROM compare passed; field loads stayed unsigned while the local comparison remained signed |

The final source therefore uses `s16 unk2E` directly and uses typed signed
locals for the signed frame-count comparison. `nextFrame` remains `unk16`,
matching the halfword store and normalization sequence.

## Variable-size table cursor experiments

The word at `ActorConfig + 0x18` is a byte offset from the configuration base
to a variable-size frame table. `Actor.unk1C` is a byte cursor into that table,
not a fixed-record index. The table has a halfword count at offset `0x4` and a
variable trailing sequence-ID array beginning at offset `0x8`.

| Change | Result |
| --- | --- |
| Group the offsets as `(config->unk18 + actor->unk1C)` before adding them to `config` | Full ROM compare failed |
| Stage the base table address, then add `actor->unk1C` in a second assignment | Full ROM compare failed |
| Keep `((unk8*)config + config->unk18 + actor->unk1C)` | Full ROM compare passed |

The surviving cursor expression is the only tested natural form that preserves
the target's address-materialization order. The final table access is
`frameTable->unk8[nextFrame]`; its zero-length trailing array models the
variable-size record without changing the fixed prefix layout.

## Manager follow-up

The frame table is a plain `unk16` array inside the config blob (`[2]` = count, `[4 + i]` = sequence ids). A struct with `unk16 unk4[1]` / `unk16 unk8[1]` cannot reproduce the target: agbcc scales `(i + 2) * 2` before adding the base for an array member, but folds the constant into the load displacement (`ldrh [r0, #8]`) for `ptr[i + 4]` on a pointer variable. Matched form: `unk16* frameTable = (unk16*)((unk8*)config + config->unk18 + actor->unk1C); frameTable[nextFrame + 4]`.
