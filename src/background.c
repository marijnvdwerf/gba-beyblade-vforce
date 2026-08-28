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

extern ScreenLayout _806A828[];

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
    unk32* arg1;

    sub_8049344(0);
    *(vu16*)REG_BLDY = 0;

    arg0 = &_unk3000650.transition.unk590;
    arg1 = &(_unk3000650.unkB8.unk0);
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
    unk32* arg1;

    sub_8049344(0);
    *(vu16*)REG_BLDY = 0;
    *(vu16*)REG_DISPCNT = 0;

    arg0 = &_unk3000650.transition.unk590;
    arg1 = &(_unk3000650.unkB8.unk0);
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
    unk32* arg1;

    arg0 = &_unk3000650.transition.unk590;
    arg1 = &(_unk3000650.unkB8.unk0);
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
    unk32* arg1;

    arg0 = &_unk3000650.transition.unk590;
    arg1 = &(_unk3000650.unkB8.unk0);
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
    unk32* arg1;

    *(vu16*)REG_BLDY = 0;

    arg0 = &_unk3000650.transition.unk590;
    arg1 = &(_unk3000650.unkB8.unk0);
    pInt = &_unk3000650.unk0;

    newLayerManagement(arg0, arg1, &_806A828[_unk3000650.unkB4->unk0], 4160, 0);
    sub_8050894(arg0);
    _unk3000650.unk140.unk7C |= 3;
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
    sub_80596AC(&_unk3000650.unk1C8, 0x800, 0x6000);
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
    sub_80596AC(&_unk3000650.unk1C8, -0x10000, 0);
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
