#include <agb/define.h>
#include <agb/memory_map.h>

#include "common.h"
#include "display.h"
#include "frontend.h"
#include "ids.h"
#include "include_asm.h"
#include "layer.h"
#include "levelrow.h"
#include "palette.h"
#include "sound.h"
#include "system.h"
#include "unsorted.h"

extern TileMapHeader Tilemap_Nintendo;
extern unk16 Pal_82567C8[];
extern TileMapHeader TileMap_Nelvana;
extern unk16 Pal_825A44C[];
extern TileMapHeader TileMap_825A64C;
extern unk16 Pal_825ABBC[];
extern unk16 Pal_825ADBC[];
extern TileMapHeader TileMap_825AFBC;
extern unk16 Pal_825B3C4[];
extern unk16 Pal_825B5C4[];
extern TileMapHeader TileMap_825B7C4;
extern TileMapHeader TileMap_82C92F8;
extern TileMapHeader TileMap_82C9BC4;
extern TileMapHeader TileMap_82CA490;
extern TileMapHeader TileMap_82CAD5C;
extern unk16 Pal_82CB628[];
extern unk16 Pal_82CB828[];
extern TileMapHeader TileMap_DRights;
extern unk16 Pal_825DBF0[];
extern TileMapHeader TileMap_825DDF0;
extern unk16 Pal_8266460[];
extern unk16 Pal_8266660[];
extern TileMapHeader TileMap_8266860;
extern unk16 Pal_826EB50[];
extern TileMapHeader TileMap_Atari;
extern unk16 Pal_82725E8[];
extern TileMapHeader TileMap_FullFat;
extern unk16 Pal_8274708[];
extern TileMapHeader TileMap_8274908;
extern TileMapHeader TileMap_8282578;
extern TileMapHeader TileMap_8282A60;

// clang-format off
ScreenLayout _806A828[] = {
    [LAYOUT_NINTENDO] = { ID_NINTENDO, { 0 }, { { &Tilemap_Nintendo } }, 0, 0, 0, 0, { 0 }, Pal_82567C8 },
    [LAYOUT_NELVANA] = { ID_NELVANA, { 0 }, { { &TileMap_Nelvana } }, 0, 0, 0, 0, { 0 }, Pal_825A44C },
    [LAYOUT_COLLECTION] = { ID_COLLECTION, { 0 }, { { &TileMap_825A64C } }, 0, 0, 0, 0, { 0 }, Pal_825ABBC, Pal_825ADBC },
    [LAYOUT_3] = { ID_UNK_1810 },
    [LAYOUT_4] = { ID_UNK_5D4C, { 0 }, { { &TileMap_825AFBC } }, 0, 0, 0, 0, { 0 }, Pal_825ABBC, Pal_825B3C4 },
    [LAYOUT_5] = { ID_UNK_9068, { 0 }, { { &TileMap_825AFBC } }, 0, 0, 0, 0, { 0 }, Pal_825ABBC, Pal_825B5C4 },
    [LAYOUT_6] = { ID_UNK_8B71 },
    [LAYOUT_WIDE_FRAME] = { ID_WIDE_FRAME, { 0 }, { { &TileMap_825B7C4 } }, 0, 0, 0, 0, { 0 }, Pal_825ABBC, Pal_825B3C4 },
    [LAYOUT_BIG_FRAME] = { ID_BIG_FRAME },
    [LAYOUT_SMALL_FRAME] = { ID_SMALL_FRAME, { 0 }, { { &TileMap_825AFBC } }, 0, 0, 0, 0, { 0 }, Pal_825ABBC, Pal_825B3C4 },
    [LAYOUT_DIALOG] = { ID_DIALOG, { 0 }, { { &TileMap_82C92F8 }, { &TileMap_82C9BC4 }, { &TileMap_82CA490 }, { &TileMap_82CAD5C } }, 0, 0, 0, 0, { 0 }, Pal_82CB628, Pal_82CB828 },
    [LAYOUT_11] = { ID_UNK_640B, { 0 }, { { 0 } }, 0, 0, 0, 0, { 0 }, Pal_825ABBC, Pal_825B3C4 },
    [LAYOUT_12] = { ID_UNK_BBA4, { 0 }, { { 0 } }, 0, 0, 0, 0, { 0 }, Pal_825ABBC },
    [LAYOUT_13] = { ID_UNK_A694, { 0 }, { { 0 } }, 0, 0, 0, 0, { 0 }, Pal_825ABBC, Pal_825B3C4 },
    [LAYOUT_DRIGHTS] = { ID_DRIGHTS, { 0 }, { { &TileMap_DRights } }, 0, 0, 0, 0, { 0 }, Pal_825DBF0 },
    [LAYOUT_PRESS_START] = { ID_PRESS_START, { 0, 0, 0, 0, 0x10 }, { { &TileMap_825DDF0, 0, 0, 0xC } }, 0, 0, 0, 0, { 0 }, Pal_8266460, Pal_825B3C4 },
    [LAYOUT_LANGUAGE] = { ID_LANGUAGE, { 0, 0, 0, 0, 0x10 }, { { 0 } }, 0, 0, 0, 0, { 0 }, Pal_825ABBC, Pal_8266660 },
    [LAYOUT_LEGALS] = { ID_LEGALS, { 0, 0, 0, 0, 0x10 }, { { &TileMap_8266860, 0, 0, 0xC } }, 0, 0, 0, 0, { 0 }, Pal_826EB50 },
    [LAYOUT_PUBLISHER] = { ID_PUBLISHER, { 0, 0, 0, 0, 0x10 }, { { &TileMap_Atari, 0, 0, 0xC } }, 0, 0, 0, 0, { 0 }, Pal_82725E8 },
    [LAYOUT_FULLFAT] = { ID_FULLFAT, { 0, 0, 0, 0, 0x10 }, { { &TileMap_FullFat, 0, 0, 0xC } }, 0, 0, 0, 0, { 0 }, Pal_8274708 },
    [LAYOUT_20] = { ID_UNK_8F7D, { 0 }, { { &TileMap_8274908 }, { &TileMap_8282578 }, { &TileMap_8282A60 } }, 3, 2, 1, 0, { 0 }, Pal_825ABBC, Pal_825B3C4 },
};
// clang-format on

void Background_80498D8(void)
{
    *(vu16*)REG_BLDCNT
        = BLD_BG1_1ST | BLD_A_BLEND_MODE | BLD_BG0_2ND | BLD_BG1_2ND | BLD_BG2_2ND | BLD_BG3_2ND;
    *(vu16*)REG_BLDALPHA = (12 << 8) | (6 << 0);
}

void Background_80498F8(void)
{
    sub_80508A4(&_unk3000650.transition.unk590);

    if (_806A828[_unk3000650.unkB4->unk0].bgPalette != NULL) {
        loadPalette(_806A828[_unk3000650.unkB4->unk0].bgPalette);
    }

    if (_806A828[_unk3000650.unkB4->unk0].spritePalette != NULL) {
        loadPalette2(_806A828[_unk3000650.unkB4->unk0].spritePalette);
    }
}

void Background_8049950(void)
{
    UnkStruct_sub1* arg0;
    void* pInt;
    BGLayer* arg1;

    sub_8049344(0);
    *(vu16*)REG_BLDY = 0;

    arg0 = &_unk3000650.transition.unk590;
    arg1 = _unk3000650.bgLayers;
    pInt = &_unk3000650.unk0;

    newLayerManagement(arg0, arg1, &_806A828[_unk3000650.unkB4->unk0], 4160, 1);
    sub_8050894(arg0);
    VBlankIntrWait();
    sub_804A280(pInt);
    sub_80627F0();
}

void Background_80499BC(void)
{
    UnkStruct_sub1* arg0;
    void* pInt;
    BGLayer* arg1;

    sub_8049344(0);
    *(vu16*)REG_BLDY = 0;
    *(vu16*)REG_DISPCNT = 0;

    arg0 = &_unk3000650.transition.unk590;
    arg1 = _unk3000650.bgLayers;
    pInt = &_unk3000650.unk0;

    newLayerManagement(arg0, arg1, &_806A828[_unk3000650.unkB4->unk0], 4160, 1);
    VBlankIntrWait();
    sub_804A280(pInt);
    sub_80627F0();
}

void Background_8049A24(void)
{
    sub_8049344(0);
    *(vu16*)REG_BLDY = 0;

    sub_80508A4(&_unk3000650.transition.unk590);

    sub_80508CC(&_unk3000650.transition.unk590, &_806A828[_unk3000650.unkB4->unk0], 0);

    if (_806A828[_unk3000650.unkB4->unk0].spritePalette != NULL) {
        loadPalette2(_806A828[_unk3000650.unkB4->unk0].spritePalette);
    }
}

void Background_8049A84(void)
{
    UnkStruct_sub1* arg0;
    void* pInt;
    BGLayer* arg1;

    arg0 = &_unk3000650.transition.unk590;
    arg1 = _unk3000650.bgLayers;
    pInt = &_unk3000650.unk0;

    newLayerManagement(arg0, arg1, &_806A828[_unk3000650.unkB4->unk0], 4160, 0);
    sub_8050894(arg0);
    __fastMemoryClearARM(0x7FFF7FFF, (void*)0x5000000, 0x400);
    VBlankIntrWait();
    sub_804A280(pInt);
    sub_80627F0();
}

void Background_8049AF8(void)
{
    UnkStruct_sub1* arg0;
    void* pInt;
    BGLayer* arg1;

    arg0 = &_unk3000650.transition.unk590;
    arg1 = _unk3000650.bgLayers;
    pInt = &_unk3000650.unk0;

    newLayerManagement(arg0, arg1, &_806A828[_unk3000650.unkB4->unk0], 4160, 0);
    sub_8050894(arg0);
    __fastMemoryClearARM(0, (void*)0x5000000, 0x400);
    VBlankIntrWait();
    sub_804A280(pInt);
    sub_80627F0();
}

void Background_8049B68(void)
{
    UnkStruct_sub1* arg0;
    void* pInt;
    BGLayer* arg1;

    *(vu16*)REG_BLDY = 0;

    arg0 = &_unk3000650.transition.unk590;
    arg1 = _unk3000650.bgLayers;
    pInt = &_unk3000650.unk0;

    newLayerManagement(arg0, arg1, &_806A828[_unk3000650.unkB4->unk0], 4160, 0);
    sub_8050894(arg0);
    _unk3000650.bgLayers[1].field_7C |= 3;
    __fastMemoryClearARM(0, (void*)0x5000000, 0x400);
    Background_80498D8();
    VBlankIntrWait();
    sub_804A280(pInt);
    sub_80627F0();
}

void Background_8049BF8(void)
{
    void* pInt;

    sub_8049344(0);
    *(vu16*)REG_BLDY = 0;
    sub_80508A4(&_unk3000650.transition.unk590);

    pInt = &_unk3000650.unk0;

    sub_80508CC(&_unk3000650.transition.unk590, &_806A828[_unk3000650.unkB4->unk0], 1);
    sub_80596AC(&_unk3000650.bgLayers[2], 0x800, 0x6000);
    Background_80498D8();
    VBlankIntrWait();
    sub_804A280(pInt);
    sub_80627F0();
}

void Background_8049C70(void)
{
    void* pInt;

    sub_8049344(0);
    *(vu16*)REG_BLDY = 0;
    sub_80508A4(&_unk3000650.transition.unk590);

    pInt = &_unk3000650.unk0;

    sub_80508CC(&_unk3000650.transition.unk590, &_806A828[_unk3000650.unkB4->unk0], 1);
    sub_80596AC(&_unk3000650.bgLayers[2], -0x10000, 0);
    Background_80498D8();
    VBlankIntrWait();
    sub_804A280(pInt);
    sub_80627F0();
}

void sub_8049CE8(FrontendState* arg0, u32 arg1)
{
    switch (arg1) {
    case 2:
        sub_80637E4(
            &_unk3000650.paletteA, _806A828[_unk3000650.unkB4->unk0].bgPalette, 0, 0x100, 0x10);
        sub_80637E4(
            &_unk3000650.paletteB, _806A828[_unk3000650.unkB4->unk0].spritePalette, 0, 0x100, 0x10);
        arg0->transition.value = 0x3E;
        arg0->transition.unk585 = 0xFE;
        arg0->transition.unk586 = 0;
        break;
    case 1:
        deallocate_80637CC(&_unk3000650.paletteB);
        deallocate_80637CC(&_unk3000650.paletteA);
        break;
    case 4:
        sub_8063830(
            &_unk3000650.paletteA, BG_PLTT_PTR, arg0->transition.value >> 1, 0x1F, 0x1F, 0x1F);
        sub_8063830(
            &_unk3000650.paletteB, OBJ_PLTT_PTR, arg0->transition.value >> 1, 0x1F, 0x1F, 0x1F);
        break;
    }
}

void sub_8049DE0(FrontendState* arg0, u32 arg1)
{
    switch (arg1) {
    case 2:
        sub_80637E4(
            &_unk3000650.paletteA, _806A828[_unk3000650.unkB4->unk0].bgPalette, 0, 0x100, 0x10);
        sub_80637E4(
            &_unk3000650.paletteB, _806A828[_unk3000650.unkB4->unk0].spritePalette, 0, 0x100, 0x10);
        arg0->transition.value = 0x3E;
        arg0->transition.unk585 = 0xFE;
        arg0->transition.unk586 = 0;
        break;
    case 3:
        sub_80637E4(
            &_unk3000650.paletteA, _806A828[_unk3000650.unkB4->unk0].bgPalette, 0, 0x100, 0x10);
        sub_80637E4(
            &_unk3000650.paletteB, _806A828[_unk3000650.unkB4->unk0].spritePalette, 0, 0x100, 0x10);
        arg0->transition.value = 0;
        arg0->transition.unk585 = 2;
        arg0->transition.unk586 = 0x40;
        break;
    case 1:
        deallocate_80637CC(&_unk3000650.paletteB);
        deallocate_80637CC(&_unk3000650.paletteA);
        break;
    case 4:
        sub_8063830(&_unk3000650.paletteA, BG_PLTT_PTR, arg0->transition.value >> 1, 0, 0, 0);
        sub_8063830(&_unk3000650.paletteB, OBJ_PLTT_PTR, arg0->transition.value >> 1, 0, 0, 0);
        break;
    }
}

void sub_8049F58(FrontendState* arg0, u32 arg1)
{
    switch (arg1) {
    case 2:
        arg0->transition.unk585 = 0xFC;
        arg0->transition.unk586 = 0;
        break;
    case 3:
        arg0->transition.unk585 = 4;
        arg0->transition.unk586 = 0x40;
        break;
    case 4:
        break;
    default:
        break;
    }
}

void sub_8049F9C(FrontendState* arg0, unk32 arg1)
{
    switch (arg1) {
    case 2:
        arg0->transition.value = 0x40;
        arg0->transition.unk585 = 0xFC;
        arg0->transition.unk586 = 0;
        break;
    case 3:
        arg0->transition.value = 0;
        arg0->transition.unk585 = 2;
        arg0->transition.unk586 = 0x40;
        break;
    }
}

void sub_8049FF8(FrontendState* state, unk32 command)
{
    s32 blend;
    s32 result;
    s32 value;
    s32 high;

    blend = 6;
    switch (command) {
    case 2:
        state->transition.value = 0x40;
        state->transition.unk585 = -2;
        state->transition.unk586 = 0;
        break;
    case 3:
        state->transition.value = 0;
        state->transition.unk585 = 2;
        state->transition.unk586 = 0x40;
        *(vu16*)REG_BLDCNT = 0xF42;
        *(vu16*)REG_BLDALPHA = 0x1000;
        *(vu16*)REG_DISPCNT |= 0x200;
        break;
    case 4:
        value = state->transition.value;
        result = value;
        result *= blend;
        blend = result >> 6;
        high = 16 - (value >> 4);
        *(vu16*)REG_BLDALPHA = blend | (high << 8);
        break;
    case 1:
        if (state->transition.value == 0) {
            *(vu16*)REG_DISPCNT &= 0xFDFF;
        }
        if ((unk8)state->transition.value == 0x40) {
            Background_80498D8();
        }
        break;
    }
}

#if 0
void sub_8049CE8(FrontendState* arg0, unk32 arg1) {
    switch (arg1) {
    case 2:
        break;

    case 1:
        deallocate_80637CC(&_unk3000650.paletteB);
        deallocate_80637CC(&_unk3000650.paletteA);
        break;

    case 4:
        sub_8063830(
            &_unk3000650.paletteA, BG_PLTT_PTR, arg0->transition.value / 2, 0x1F, 0x1F, 0x1F);
        sub_8063830(
            &_unk3000650.paletteB, OBJ_PLTT_PTR, arg0->transition.value / 2, 0x1F, 0x1F, 0x1F);
        break;
    }
}
#endif
