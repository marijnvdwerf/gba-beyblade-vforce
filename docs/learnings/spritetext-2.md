# Sprite text layout matching

## sub_806123C

`sub_806123C` is a sprite-text line layout and alignment routine called by
`showString`. Its semantic implementation was reconstructed but was not
matched byte-for-byte. The dump remains authoritative through `INCLUDE_ASM`.

The target prologue saves `{r4, r5, r6, r7, lr}`, copies the high registers
`r8`-`r10` through `{r5, r6, r7}`, and allocates a 44-byte stack frame. It
spills the marked `SpriteEntry *` at `sp + 0x10` and stores the narrow mode
value at `sp + 0x20`, reusing that slot for the line-height pointer. The
natural C implementation kept the marker
in a register and assigned a different stack layout, causing the first
instruction divergence at target offset `0x2e`. Declaration order,
initialization order, scoping, expression shape, and local-lifetime experiments
could not reproduce the target spill without artificial constructs such as
`volatile`, register constraints, raw stack manipulation, or inline assembly.

Useful source-shape findings:

- Initializing the traversal pointer through the cursor (`cursor = text->unk14.prev; current = cursor;`) produces the target `r5`/`r6` roles.
- Caching `font_width` and using it in the initial alignment adjustment produces the target stack reloads.
- Reading the spacing byte directly before assigning its address avoids an unwanted loop-preheader pointer hoist; the parked draft now reads both spacing and line-height fields directly.
- The parked draft uses a plain counted loop rather than the earlier `goto next_sprite` and repeated `count - 1` scaffold; that scaffold was useful during matching experiments but obscured the semantics.
- `SpriteTextCleanup::unk2A` is signed because the target uses `ldsb` for the line-height read.
- The target reads the SpriteEntry storage at offset `0x18` as a halfword in `sub_806123C`, while existing sprite functions access the same bytes individually. A union was tested, but agbcc made the following SpriteEntry fields four bytes too far into the layout and broke already-matching sprite functions. It was therefore dropped; the canonical `SpriteEntry` remains the two original byte fields until a representation that preserves all existing offsets is found.

The semantic draft is retained under `#if 0` immediately above the assembly
include for future matching work. `sub_80614B0` was not touched because it is
not called from existing C.

With `sub_806123C` still included as assembly, the full ROM comparison passes:
expected SHA1 `cd527c8c24e20e33913fc45199e64b3e6138a6e5`.
