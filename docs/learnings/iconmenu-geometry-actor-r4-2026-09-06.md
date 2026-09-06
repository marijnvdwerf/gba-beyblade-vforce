# iconmenu, geometry, actor r4

## sub_8050DF8 (0x08050DF8)

Matched exactly as a typed `FrontendMenu` selection refresh. The function takes a menu pointer and a signed index, computes the current item from `selection`, validates the requested index and transition flag, updates the selected/current sprites and positions, then refreshes the menu text. Existing `FrontendMenu`, `FrontendMenuItem`, and `FrontendMenuItemData` fields provided all accessed offsets; no new layout fields were needed. `bun run tools/diff/diff.ts sub_8050DF8` showed no instruction differences, and the full ROM compare passed.

The three source call sites in parked `festate.c` drafts pass only the menu pointer because those callers remain assembly inclusions; the function's assembly and raw semantic draft prove the second ABI argument is the requested index. The public prototype was added as `void sub_8050DF8(FrontendMenu*, s32);`.

## sub_805BF18 (0x0805BF18)

Matched exactly as an eight-argument signed rectangle-overlap test. The two endpoint pairs are ordered first, then a two-bit flag records x and y boundary intersections; containment checks promote the flag to `3`, and the function returns `1` only when both dimensions overlap. All eight parameters are `s32`, as proven by the signed comparison branches. A local `unk16 flags` reproduces the target's halfword normalization after the y-bit updates. `bun run tools/diff/diff.ts sub_805BF18` showed no instruction differences, and the full ROM compare passed.

## renderActor (0x08057D88)

Parked as the best typed semantic draft above the assembly inclusion. The draft computes an optional callback position in fixed-point coordinates, subtracts the layer and actor offsets, culls against the 240 by 160 display bounds, frees a stale sprite on cull, allocates and initializes a sprite when needed, writes frame/resource pointers, constructs OAM attributes and priority, updates child-sprite state, and calls `sub_8060F64`. The dump remains in place because the compiled implementation did not reach an exact match.

The first instruction divergence in the best valid compiled baseline is the incoming actor copy: target `mov r5, r0`, current `mov r4, r0`. The corresponding x coordinate is target `r4` and current `r5`; later differences follow from this allocator role swap. The target later materializes the child sprite pointer in `r4` after x dies, while the baseline uses `r7`. `uv run tools/asm-annotated.py src/actor.c renderActor` measured the actor pseudo at 37 references, live length 209, crossing three calls, assigned to `r4`; the x pseudo had 11 references, live length 119, assigned to `r5`.

Measured source-shape attempts included direct actor accesses versus an actor alias, coordinate declaration and initializer permutations, parameter typing and naming variants, nested sprite/OAM scopes, direct versus staged OAM and priority expressions, and a long-lived configuration alias. None moved the first actor/x allocation to the target without introducing other differences. The best valid draft retains typed field access and the measured culling order: test `unk70`, calculate the width product, test x bounds, calculate the height product, then test y bounds.

`sub_8059CB4` is declared with an `unk8` return in the measured baseline. Its caller then emits the target `lsl r0, #24` / `lsr r0, #24` byte normalization; a `u32` declaration omitted those instructions. The resource pointer uses the runtime offset `config base + config->unk10`; bytes at offset `0x10` in `data/spritesheet-86faeac.bbsprites` are `48 00 00 00`, supporting the packed-resource interpretation.

The target child-sprite sequence loads the complete OAM word from offset `0x10`, masks it with `0xC1FFFFFF`, extracts `(child->x & 0x3E0) << 20`, ORs `0x100`, and stores the complete word back. The parked draft therefore keeps the proven OAM union and bitfield typedef inside its `#if 0` block only; the shared `SpriteEntry` definition and active sprite users remain unchanged.

The final full-ROM compare passed with renderActor parked and its dump retained.
