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

The target child-sprite sequence loads the complete OAM word from offset `0x10`, masks it with `0xC1FFFFFF`, extracts `(child->x & 0x3E0) << 20`, ORs `0x100`, and stores the complete word back. The parked draft uses the existing `SpriteEntry` whole-word field directly; no OAM bitfield or union overlay is retained, and the shared `SpriteEntry` definition and active sprite users remain unchanged.

The final full-ROM compare passed with renderActor parked and its dump retained.

### Measured step table

| Change | First differing instruction | Size delta or result |
| --- | --- | --- |
| Best valid typed baseline with direct actor field accesses | `0x0000000A`: target `mov r5, r0`, current `mov r4, r0` | No size change; parked |
| Actor pointer local alias | `0x0000000A`: unchanged | No size change; discarded |
| Coordinate declaration order and initializer permutations | `0x0000000A`: unchanged | No size change; discarded |
| Width/height temporaries removed in favor of direct culling expressions | `0x0000000A`: unchanged | No size change; retained direct culling order |
| Nested sprite/OAM scopes | `0x0000000A`: unchanged | No size change; discarded |
| Long-lived configuration alias | Prologue allocation changed before the prior body divergence | Did not match; discarded |
| `sub_8059CB4` return changed from `u32` to `unk8` | Actor allocation remained divergent at `0x0000000A` | Caller gained the target `lsl #24` / `lsr #24` normalization; retained |
| OAM temporary folded into the `SpriteEntry` store | `0x0000000A`: unchanged | Current literal-pool endpoint was `0x214` versus target `0x220` (`-12` bytes); discarded |
| Priority temporary folded into direct field assignment/OR | `0x0000000A`: unchanged | Current literal-pool endpoint was `0x21C` versus target `0x220` (`-4` bytes); discarded |
| Post-call `sprite` alias folded into direct `self->unkB8` accesses | `0x0000000A`: unchanged | Current literal-pool endpoint was `0x218` versus target `0x220` (`-8` bytes); discarded |
| Callback output changed to `s32*` | No instruction diff | Build failed with an incompatible callback-pointer assignment; discarded |
| Minimal scratch actor/config layouts with real `BGLayer` and `SpriteEntry` types | Not applicable while parked | Draft enabled once and compiled successfully, then re-parked |

### Review-question geometry experiment

The named overlap predicate rewrite produced a first divergence at `0x00000002` (`mov r7, r8` target versus `mov r7, r0` current). Its current function endpoint was `0x42` versus target `0xAC`, a `-0x6A` byte delta, so the original mask/branch choreography was retained.

### Matched-function review question

Changing `currentIndex` from `s32` to `unk32` compiled with no instruction differences for `sub_8050DF8` and no size delta. The unsigned declaration is retained.
