#include <agb/define.h>
#include <agb/memory_map.h>

#include "common.h"
#include "display.h"
#include "frontend.h"
#include "include_asm.h"
#include "layer.h"
#include "levelrow.h"
#include "palette.h"
#include "sound.h"
#include "system.h"
#include "unsorted.h"

typedef struct {
    Palette paletteA; // 0x00
    Palette paletteB; // 0x14
    unk8 pad28[0x38]; // 0x28
    unk32* var60; // 0x60
} BackgroundPaletteState;

typedef struct {
    unk8 pad000[0x650]; // 0x000
    unk32 var650; // 0x650
    unk8 pad654[0x50]; // 0x654
    BackgroundPaletteState palettes; // 0x6A4
    unk32 var708; // 0x708
    unk8 pad70C[0x100]; // 0x70C
    unk8 var80C; // 0x80C
    unk8 var810[11]; // 0x810
    unk32 var818; // 0x810
    unk8 pad80D[964]; // 0x80D
    UnkStruct_sub1 varBE0; // 0xBE0
    unk8 pad[30064]; // 0xBF8
    unk32* varC94; // 0xC94

} UnkStruct;

extern UnkStruct _3000000;

extern ScreenLayout _806A828[];

void Background_80498D8(void)
{
    *(vu16*)REG_BLDCNT
        = BLD_BG1_1ST | BLD_A_BLEND_MODE | BLD_BG0_2ND | BLD_BG1_2ND | BLD_BG2_2ND | BLD_BG3_2ND;
    *(vu16*)REG_BLDALPHA = (12 << 8) | (6 << 0);
}

void Background_80498F8(void)
{
    sub_80508A4(&_3000000.varBE0);

    if (_806A828[_3000000.palettes.var60[0]].bgPalette != NULL) {
        loadPalette(_806A828[_3000000.palettes.var60[0]].bgPalette);
    }

    if (_806A828[_3000000.palettes.var60[0]].spritePalette != NULL) {
        loadPalette2(_806A828[_3000000.palettes.var60[0]].spritePalette);
    }
}

void Background_8049950(void)
{
    UnkStruct_sub1* arg0;
    void* pInt;
    unk32* arg1;

    sub_8049344(0);
    *(vu16*)REG_BLDY = 0;

    arg0 = &_3000000.varBE0;
    arg1 = &(_3000000.var708);
    pInt = &_3000000.var650;

    newLayerManagement(arg0, arg1, &_806A828[_3000000.palettes.var60[0]], 4160, 1);
    sub_8050894(arg0);
    VBlankIntrWait();
    sub_804A280(pInt);
    sub_80627F0();
}

void Background_80499BC(void)
{
    UnkStruct_sub1* arg0;
    void* pInt;
    unk32* arg1;

    sub_8049344(0);
    *(vu16*)REG_BLDY = 0;
    *(vu16*)REG_DISPCNT = 0;

    arg0 = &_3000000.varBE0;
    arg1 = &(_3000000.var708);
    pInt = &_3000000.var650;

    newLayerManagement(arg0, arg1, &_806A828[_3000000.palettes.var60[0]], 4160, 1);
    VBlankIntrWait();
    sub_804A280(pInt);
    sub_80627F0();
}

void Background_8049A24(void)
{
    sub_8049344(0);
    *(vu16*)REG_BLDY = 0;

    sub_80508A4(&_3000000.varBE0);

    sub_80508CC(&_3000000.varBE0, &_806A828[_3000000.palettes.var60[0]], 0);

    if (_806A828[_3000000.palettes.var60[0]].spritePalette != NULL) {
        loadPalette2(_806A828[_3000000.palettes.var60[0]].spritePalette);
    }
}

void Background_8049A84(void)
{
    UnkStruct_sub1* arg0;
    void* pInt;
    unk32* arg1;

    arg0 = &_3000000.varBE0;
    arg1 = &(_3000000.var708);
    pInt = &_3000000.var650;

    newLayerManagement(arg0, arg1, &_806A828[_3000000.palettes.var60[0]], 4160, 0);
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
    unk32* arg1;

    arg0 = &_3000000.varBE0;
    arg1 = &(_3000000.var708);
    pInt = &_3000000.var650;

    newLayerManagement(arg0, arg1, &_806A828[_3000000.palettes.var60[0]], 4160, 0);
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
    unk32* arg1;

    *(vu16*)REG_BLDY = 0;

    arg0 = &_3000000.varBE0;
    arg1 = &(_3000000.var708);
    pInt = &_3000000.var650;

    newLayerManagement(arg0, arg1, &_806A828[_3000000.palettes.var60[0]], 4160, 0);
    sub_8050894(arg0);
    _3000000.var80C |= 3;
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
    sub_80508A4(&_3000000.varBE0);

    pInt = &_3000000.var650;

    sub_80508CC(&_3000000.varBE0, &_806A828[_3000000.palettes.var60[0]], 1);
    sub_80596AC(&_3000000.var818, 0x800, 0x6000);
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
    sub_80508A4(&_3000000.varBE0);

    pInt = &_3000000.var650;

    sub_80508CC(&_3000000.varBE0, &_806A828[_3000000.palettes.var60[0]], 1);
    sub_80596AC(&_3000000.var818, -0x10000, 0);
    Background_80498D8();
    VBlankIntrWait();
    sub_804A280(pInt);
    sub_80627F0();
}

void sub_8049CE8(FrontendState* arg0, u32 arg1)
{
    switch (arg1) {
    case 2:
        sub_80637E4(&_3000000.palettes.paletteA, _806A828[_3000000.palettes.var60[0]].bgPalette, 0,
            0x100, 0x10);
        sub_80637E4(&_3000000.palettes.paletteB, _806A828[_3000000.palettes.var60[0]].spritePalette,
            0, 0x100, 0x10);
        arg0->transition.value = 0x3E;
        arg0->transition.unk585 = 0xFE;
        arg0->transition.unk586 = 0;
        break;
    case 1:
        deallocate_80637CC(&_3000000.palettes.paletteB);
        deallocate_80637CC(&_3000000.palettes.paletteA);
        break;
    case 4:
        sub_8063830(&_3000000.palettes.paletteA, BG_PLTT_PTR, arg0->transition.value >> 1, 0x1F,
            0x1F, 0x1F);
        sub_8063830(&_3000000.palettes.paletteB, OBJ_PLTT_PTR, arg0->transition.value >> 1, 0x1F,
            0x1F, 0x1F);
        break;
    }
}

void sub_8049DE0(FrontendState* arg0, u32 arg1)
{
    switch (arg1) {
    case 2:
        sub_80637E4(&_3000000.palettes.paletteA, _806A828[_3000000.palettes.var60[0]].bgPalette, 0,
            0x100, 0x10);
        sub_80637E4(&_3000000.palettes.paletteB, _806A828[_3000000.palettes.var60[0]].spritePalette,
            0, 0x100, 0x10);
        arg0->transition.value = 0x3E;
        arg0->transition.unk585 = 0xFE;
        arg0->transition.unk586 = 0;
        break;
    case 3:
        sub_80637E4(&_3000000.palettes.paletteA, _806A828[_3000000.palettes.var60[0]].bgPalette, 0,
            0x100, 0x10);
        sub_80637E4(&_3000000.palettes.paletteB, _806A828[_3000000.palettes.var60[0]].spritePalette,
            0, 0x100, 0x10);
        arg0->transition.value = 0;
        arg0->transition.unk585 = 2;
        arg0->transition.unk586 = 0x40;
        break;
    case 1:
        deallocate_80637CC(&_3000000.palettes.paletteB);
        deallocate_80637CC(&_3000000.palettes.paletteA);
        break;
    case 4:
        sub_8063830(&_3000000.palettes.paletteA, BG_PLTT_PTR, arg0->transition.value >> 1, 0, 0, 0);
        sub_8063830(
            &_3000000.palettes.paletteB, OBJ_PLTT_PTR, arg0->transition.value >> 1, 0, 0, 0);
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

INCLUDE_ASM("asm/dump/8040d18/8049ff8.s");

#if 0
void sub_8049CE8(FrontendState* arg0, int arg1) {
    switch (arg1) {
    case 2:
        break;

    case 1:
        deallocate_80637CC(&_3000000.palettes.paletteB);
        deallocate_80637CC(&_3000000.palettes.paletteA);
        break;

    case 4:
        sub_8063830(
            &_3000000.palettes.paletteA, BG_PLTT_PTR, arg0->transition.value / 2, 0x1F, 0x1F, 0x1F);
        sub_8063830(
            &_3000000.palettes.paletteB, OBJ_PLTT_PTR, arg0->transition.value / 2, 0x1F, 0x1F, 0x1F);
        break;
    }
}
#endif
