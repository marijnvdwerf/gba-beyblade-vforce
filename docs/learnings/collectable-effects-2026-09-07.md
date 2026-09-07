# Collectable and effects matching notes — 2026-09-07

## `sub_8056E2C` (`0x08056E2C`)

- The exact loop-entry code requires `index < (count = data->count)`. Keeping the assignment in the loop-entry comparison emits the target `cmp`/`bge` sequence; separating the assignment changes the comparison shape.
- Initializing `index` before the `GameData`/entry setup places the zeroing instruction at the target location. Moving it later hoists the zeroing instruction and changes the function layout.
- `entry` is a cursor over `CollectableEntry` records, and `geometry` points to the embedded `LevelGeometryAddresses` at `GameData` offset `0x65C`; the implementation uses typed fields rather than offset expressions.
- The target uses word stores for the collected-bit update and the `LineMetaObject` payload, so the corresponding fields remain `unk32`. No signedness change was needed beyond the `s32` loop/index values used by the signed loop branches.
- No parked draft or unresolved first divergence remains. The function diff is instruction-identical and the ROM comparison passes.

## `sub_8055914` (`0x08055914`)

- The `EffectSprites` fields accessed by this function are represented at their observed offsets: halfword fields at `0x28` and `0x2A`, and word fields at `0x08`, `0x0C`, `0x10`, `0x14`, `0x18`, `0x1C`, `0x20`, `0x24`, `0x2C`, `0x30`, `0x34`, and `0x38`. The two sprite pointers remain at `0x00` and `0x04`.
- Keeping `zero`, `vram0`, and `vram1` as named locals reproduces the target's register/literal lifetime. A temporary `SpriteEntry*` alias did not match: it emitted an extra `mov` before each store. Direct assignment from `allocSprite` to `effect->unk0`/`effect->unk4` removes those instructions and matches the target.
- The target literal pool contains `0xFFFFBC00` (`-0x4400`) and the initializer emits `0x0000F400` with the observed `mov`/`lsl` sequence. The final function and trailing alignment bytes are instruction-identical.
- The requested function prototype keeps `sheet0` and `sheet1` as `unk32`, while `LoadSpriteSheet` declares its sheet parameter as `const void*`. The matching source therefore necessarily uses `(const void*)sheet0` and `(const void*)sheet1`; these are the only rule-breaking casts in the matched implementation and should remain flagged for review.
- No parked draft or unresolved first divergence remains. The function diff is instruction-identical and the ROM comparison passes.
