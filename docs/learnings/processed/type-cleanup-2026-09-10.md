# Type cleanup — 2026-09-10 (decomp/manual)

## Step 1: one ScreenLayout type

`LevelDesign` (common.h) deleted; `ScreenLayout` defined once in common.h
(forward typedef already there): pad0[0x14], `LevelDesignLayer layers[4]`,
`unk8 unk74_0/2/4/6 : 2` at 0x74, pad75[3], `unk16* bgPalette` (0x78),
`unk16* spritePalette` (0x7C), `LevelGeometryTable* geometry` (0x80;
replaces display.h's unaccessed `var80`). `LevelDesigns[]` is
`extern const ScreenLayout[]`; `_806A828[]` stays non-const (background.c).
CameraState.unk220 and sub_805E8A0/sub_805E8D8 take `const ScreenLayout*`
(LevelDesigns is const; the parked gameinit.c sub_80539E8 draft lost its
`(unk32*)` cast on that argument).

Files: common.h, display.h, camera.h, camera.c, gameinit.c.
Re-diffed: every defined function in camera.c (22), gameinit.c (25),
display.c (8), background.c (16) = 71 symbols, all 0 differing rows;
ROM compare green.

0x74 byte: the only committed readers are sub_80508CC and
newLayerManagement (display.c, already bitfields, 0 rows). The camera path
reader is the parked sub_805E8D8 draft (camera.c `#if 0`); its
`settings = level->unk74` + hand shifts were rewritten as
`sub_8059C18(level->unk74_0, level->unk74_2, level->unk74_4, level->unk74_6)`.
Compiled temporarily: 0x1A2–0x1B2 is identical to the target (one
`ldrb r3,[r0]`; `lsl #30/#28/#26; lsr #30`; `lsr #6`) — nothing resisted;
the draft's remaining diffs are its pre-existing register roles. Draft
re-parked.

Not touched (outside the brief): camera.h `CameraSubState` /
`CameraDisplayEntry` is a third view of the same 0x84 layout (pad 0x14,
four 0x18 entries whose first word is the layer's TileMapHeader*, unk80),
used only by the parked gameloop.c sub_80522D4 draft
(`camera->unk220->entries[i]`, which no longer type-checks against
`const ScreenLayout*` once unparked).

## Step 2: FrontendState's four layer slots are `BGLayer bgLayers[4]`

`FrontendState.unkB8/unk140/unk1C8/unk250` (four `FrontendSubobject`) →
`BGLayer bgLayers[4]; /* 0xB8 */` (0x220 bytes, pad2D8 unchanged). Slot
accesses map 1:1 onto BGLayer in offset and width: unk14/unk18/unk24 →
field_14/18/24 (s32; the old unk18/unk24 were unk32 but only stored),
unk48/unk4A → field_48/4A (s16), unk7C → field_7C (u8 `|= 3`).

Include cycle: `struct BGLayer` is now defined in common.h just before
FrontendState (after FrontendSubobject). Its pointer members need only
names: common.h gains forward typedefs `Struct3000CA0` and `TileMapHeader`;
`struct Struct3000CA0` stays defined in layer.h, `struct TileMapHeader` in
common.h (both lost their typedef-at-definition). No partial BGLayer.

`typedef struct BGLayer DisplayRecord` retired (common.h:17 — there was no
TODO for it in layer.h); every `DisplayRecord` renamed to `BGLayer`
(riderphysics.c, camera.c/.h, layer.c/.h, envactor.c, iwram.h, gameloop.c
parked draft, display.c/.h, common.h). newLayerManagement's records
parameter, UnkStruct_sub1.var0C (already DisplayRecord*), sub_80439A0 and
sub_804903C are `BGLayer*`. Shims removed: background.c ×5
`(DisplayRecord*)&_unk3000650.unkB8` → `_unk3000650.bgLayers`,
`unk140.unk7C` → `bgLayers[1].field_7C`, `&unk1C8` → `&bgLayers[2]`;
credits/festate/collection/levelselect `&state->unkB8/unk140/unk250` →
`&state->bgLayers[0/1/3]`; dialogue.c `base = state->bgLayers` with
field_24/7C/14; frontend.c `&_unk3000650.bgLayers[1]`.

`FrontendSubobject` (ROM config record via FrontendObject.unk4) stays,
reduced to the fields committed C still reads: unk10
(FrontendSubobjectData*, frontend.c sub_80495C4), unk14 (s32 count,
frontend.c/levelrow.c), unk20 (frontend.c sub_8049458
`(*object)->unk4->unk20`, menuobject.c sub_8043370); everything else padding.

Re-diffed: every defined function in the 14 changed .c TUs = 314 symbols
(background 16, camera 22, collection 2, credits 2, dialogue 3, display 8,
envactor 12, festate 48, frontend 41, gameloop 31, layer 58, levelselect 12,
packet 7, riderphysics 52),
all identical (a first counter reported collectionListFrontendHandler 1 /
sub_80413FC 4 — blank separator lines in diff.ts output, not instructions).
ROM compare green. Nothing resisted; no casts added.

Remaining casts seen but out of scope: display.c sub_8050A50
`(BGLayer*)(display->ptrC + offset)` through the `DisplayData` view of
UnkStruct_sub1 (frontend.c `(DisplayData*)&state->transition.unk590`),
camera.c `record != (BGLayer*)state`, envactor.c
`(BGLayer*)nullsub_12(...)`.
