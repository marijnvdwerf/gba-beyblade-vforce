# Collectable and effects matching notes — 2026-09-07

## `sub_8056E2C` (`0x08056E2C`)

The previously exact source used a peeled first test and a `do`/`while` loop with a `break`, plus `index < (count = data->count)`. Those forms reproduce the target rotation but are not retained in source.

Natural-form trials, one build per trial:

| Trial | First divergence | Observation |
| --- | --- | --- |
| Indexed `for`, uncached count | `0x02`: target `mov r2,r0`, trial `mov r3,r0` | The compiler tests the count before the indexed line load; the natural body was larger than the target. |
| Cursor `for`, uncached count | `0x04`: target `mov r5,#0`, trial enters an early literal-pool branch | The loop remains ascending with count-first control flow and does not reproduce the target's line-first test. |
| Cursor `while`, uncached count | `0x04`: target `mov r5,#0`, trial enters an early literal-pool branch | Same count-first rotation and nonmatching layout as the cursor `for`. |
| Indexed `for`, cached `count` | `0x02`: target `mov r2,r0`, trial `mov r3,r0` | Caching the count does not restore the target line-first test. |
| Cursor `for`, cached `count` | `0x04`: target `mov r5,#0`, trial enters an early literal-pool branch | Cached bound changes allocation but remains nonmatching. |
| Cursor `while`, cached `count` | `0x04`: target `mov r5,#0`, trial enters an early literal-pool branch | Cached bound remains nonmatching. |
| Indexed natural form with folded `GameData` | `0x02`: target `mov r2,r0`, trial `mov r3,r0` | Folding the `GameData*` local does not restore the target. |
| Cursor natural form with folded `GameData` | `0x04`: target `mov r5,#0`, trial enters an early literal-pool branch | Folding the `GameData*` local remains nonmatching. |

The cursor `for` form was retained as the best natural draft under `#if 0`; it preserves separate index and entry-cursor roles and had the smallest measured natural layout difference. The target assembly remains included because no natural form was byte-identical. No header field was added for the parked draft.

## `sub_8055914` (`0x08055914`)

- The `EffectSprites` fields accessed by this function are represented at their observed offsets: halfword fields at `0x28` and `0x2A`, and word fields at `0x08`, `0x0C`, `0x10`, `0x14`, `0x18`, `0x1C`, `0x20`, `0x24`, `0x2C`, `0x30`, `0x34`, and `0x38`. The two sprite pointers remain at `0x00` and `0x04`.
- Keeping `zero`, `vram0`, and `vram1` as named locals reproduces the target's register/literal lifetime. A temporary `SpriteEntry*` alias did not match: it emitted an extra `mov` before each store. Direct assignment from `allocSprite` to `effect->unk0`/`effect->unk4` removes those instructions and matches the target.
- The target literal pool contains `0xFFFFBC00` (`-0x4400`) and the initializer emits `0x0000F400` with the observed `mov`/`lsl` sequence. The final function and trailing alignment bytes are instruction-identical.
- The requested function prototype keeps `sheet0` and `sheet1` as `unk32`, while `LoadSpriteSheet` declares its sheet parameter as `const void*`. The matching source therefore necessarily uses `(const void*)sheet0` and `(const void*)sheet1`; these are the only rule-breaking casts in the matched implementation and should remain flagged for review.
- No parked draft or unresolved first divergence remains. The function diff is instruction-identical and the ROM comparison passes.
