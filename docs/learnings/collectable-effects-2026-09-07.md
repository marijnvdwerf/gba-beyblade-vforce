# Collectable and effects matching notes — 2026-09-07

## `sub_8056E2C` (`0x08056E2C`)

The previously exact source used a peeled first test and a `do`/`while` loop with a `break`, plus `index < (count = data->count)`. The natural line-first `while` form below is byte-identical without that rotated source shape:

```c
while (entry->line != lineIndex && index < data->count) {
    index++;
    entry++;
}
```

Natural-form trials, one build per trial:

| Trial | First divergence | Observation |
| --- | --- | --- |
| Indexed `for`, uncached count | `0x02`: target `mov r2,r0`, trial `mov r3,r0` | The compiler tests the count before the indexed line load; the natural body was larger than the target. |
| Cursor `for`, uncached count | `0x04`: target `mov r5,#0`, trial enters an early literal-pool branch | The loop remains ascending with count-first control flow and does not reproduce the target's line-first test. |
| Cursor `while`, uncached count with count first | `0x04`: target `mov r5,#0`, trial enters an early literal-pool branch | The operand order produces count-first control flow. |
| Indexed `for`, cached `count` | `0x02`: target `mov r2,r0`, trial `mov r3,r0` | Caching the count does not restore the target line-first test. |
| Cursor `for`, cached `count` | `0x04`: target `mov r5,#0`, trial enters an early literal-pool branch | Cached bound changes allocation but remains nonmatching. |
| Cursor `while`, cached `count` | `0x04`: target `mov r5,#0`, trial enters an early literal-pool branch | Cached bound remains nonmatching. |
| Indexed natural form with folded `GameData` | `0x02`: target `mov r2,r0`, trial `mov r3,r0` | Folding the `GameData*` local does not restore the target. |
| Cursor natural form with folded `GameData` | `0x04`: target `mov r5,#0`, trial enters an early literal-pool branch | Folding the `GameData*` local remains nonmatching. |
| Cursor `while`, line test first, uncached count | No differing instruction | `entry->line != lineIndex && index < data->count` reproduces the target instruction sequence exactly. |

The final source keeps separate `index` and `entry` cursor locals, initializes `index` before global setup, and uses the line-first `while` condition. No header field was added.

## `sub_8055914` (`0x08055914`)

- `EffectSprites` remains a flat fixed-layout record. This function accesses word fields at `0x08`, `0x0C`, `0x10`, `0x14`, `0x18`, `0x1C`, `0x20`, `0x24`, `0x2C`, `0x30`, `0x34`, and `0x38`, halfword fields at `0x28` and `0x2A`, and sprite pointers at `0x00` and `0x04`. No sub-record or array type is introduced because this function does not prove a stride.
- Replacing the former `zero`, `vram0`, and `vram1` locals with plain literals preserves the target store order and instruction sequence. Direct assignment from `allocSprite(0)` to each destination field is required; a temporary `SpriteEntry*` alias inserted an extra `mov` before the pointer store.
- The target literal pool contains `0xFFFFBC00` (`-0x4400`) and the second coordinate uses `0x0000F400`, with the observed `mov`/`lsl` materialization. The final function and trailing alignment bytes are instruction-identical.
- `sheet0` and `sheet1` are `const unk8*` parameters. `TalkingHead.unk18` and `TalkingHead.unk20` use the same pointer type because `sub_80420C4` forwards those fields directly. The casts to `const void*` were removed; `LoadSpriteSheet` keeps its existing generic `const void*` declaration for its other callers.
- The required blank line after the function declaration is retained. No parked draft or unresolved first divergence remains.
