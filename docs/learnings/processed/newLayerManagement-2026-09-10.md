# newLayerManagement (0x080506F4, src/display.c) — matched 2026-09-10

Same layer loop as sub_80508CC (see sub_80508CC-2026-09-10.md); written in
the same shape on the real types, matched on the first build (only a
`.word _unk3000DE0` relocation-display row differs; compare green).
Differences from sub_80508CC that the asm dictates: `unk32 count` (the
increment has no `lsl #16`, the final `strh` narrows), fixed `i < 4` loop,
palettes loaded under `loadPalettes != 0` then per-pointer NULL tests.
Byte-required: the `record = &records[i]` local (ROM compare fails folded).

Header: newLayerManagement's records parameter `unk32*` → `DisplayRecord*`;
`UnkStruct_sub1.var10` `unk32` → `ScreenLayout*` (it stores `layout`);
`ScreenLayout` forward-declared in common.h (display.h now defines the
struct tag).

Historical (resolved the same day by the type-cleanup commit: the four slots
are now `BGLayer bgLayers[4]` and the casts are gone). At match time the five
background.c callers pass
`(DisplayRecord*)&_unk3000650.unkB8` (previously `&...unkB8.unk0` into an
`unk32*`). FrontendState.unkB8/unk140/unk1C8/unk250 are four consecutive
0x88-byte FrontendSubobject slots = the DisplayRecord array these
functions write; retyping them removes the cast but touches credits.c,
dialogue.c and frontend.c users.

## Measured fold test (2026-09-10)

- `layerMode`: kept. Assigning `BGControl.unk0_0` in each switch arm first
  diverged at function offset `0x0A` (`sub sp, #40` target vs `sub sp, #36`
  trial); the trial also moved the incoming-register allocation. No combination
  trial was applicable because the individual fold did not hold.
