# Sprite-text matching notes (2026-09-08)

## sub_80622E8 (0x080622E8)

The function copies one `UnkMenuItem` text record into a destination font cleanup object by calling `allocFont`. Typed `UnkMenuItem*` and `SpriteTextCleanup*` parameters, direct `text.unk24`/`text.unk20` pointers, and coordinate conversions `(text.x << 8) >> 16` and `(text.y << 8) >> 16` reproduce the target stack argument stores and call exactly. The `SpriteTextCleanup` fields at offsets 0, 4, 8, C, 20, and 24 are already established by `allocFont` and its callers.

## sub_8061684 (0x08061684)

The target refreshes the optional child sprite, propagates its position/threshold flags to the text-sprite list, and finally calls `sub_806123C`. The typed draft uses `SpriteTextCleanup`, `SpriteEntry`, and the existing `unk14`/`ptr2C` fields; it keeps the existing-child and no-child paths duplicated because the target contains duplicated blocks. The dump remains authoritative and the draft is parked under `#if 0` immediately above the `INCLUDE_ASM` line.

The entry sequence proves that the parked draft needs both sprite-refresh arguments narrowed to 16 bits at this call boundary. The target keeps the text pointer in `r6`, copies the first normalized argument through `r9`/`r8`, and copies the second through `r5`/`r7`. The live header keeps the assembly-backed declaration at `unk32, unk32` until the function is matched. The draft's semantic behavior and field widths are typed, but no natural lifetime/declaration form tested reproduced those roles.

| source form | first measured divergence |
| --- | --- |
| Initial natural draft with function-scope `sprite`, `count`, `flags`, and one child lifetime | `0x08`: target `mov r6, r0`; candidate used `mov r7, r0`. The following normalization also used `r5`/`r4` instead of target `r9`/`r8` and `r5`/`r7`. |
| Reordered local declarations | Prologue register-role divergence remained at `0x08`; declaration order did not recover the target mapping. |
| Chained child assignment (`child = text->ptr2C = sub_8060E8C(...)`) | The child store gained the target's direct result shape, but the first divergence remained in the prologue register roles before child-path code. |
| Temporary `SpriteTextCleanup*` record alias | Prologue allocation remained divergent at `0x08`; the alias was removed. |
| Branch-scoped child variables | Allocation changed, but the target's `r6` text pointer and `r9`/`r8`, `r5`/`r7` argument roles were still not recovered. |
| Latest separate branch-scoped child variables | `0x08`: target `mov r6, r0`; candidate `mov r7, r0`. At `0x0c`, target retained `r1` for normalization while the candidate copied into `r5`. |

The parked form does not use raw offsets, casts, volatile objects, register pinning, goto, or speculative struct fields. The three `sprite.c` helper prototypes are declared inside the parked `#if 0` draft; no live header or source declarations were added for them.
