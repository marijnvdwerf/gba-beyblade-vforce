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
    u8 pad00[0x10]; // 0x00
    AllocatedBlock* var10; // 0x10
} UnkStruct_sub2;

typedef struct {
    u8 pad000[0x650]; // 0x000
    u32 var650; // 0x650
    u8 pad654[0x50]; // 0x654
    UnkStruct_sub2 var6A4; // 0x6A4
    UnkStruct_sub2 var6B8; // 0x6B8
    u8 pad6CC[0x38]; // 0x6CC
    u32* var704; // 0x704
    u32 var708; // 0x708
    u8 pad70C[0x100]; // 0x70C
    u8 var80C; // 0x80C
    u8 var810[11]; // 0x810
    u32 var818; // 0x810
    u8 pad80D[964]; // 0x80D
    UnkStruct_sub1 varBE0; // 0xBE0
    u8 pad[30064]; // 0xBF8
    u32* varC94; // 0xC94

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

    if (_806A828[_3000000.var704[0]].bgPalette != NULL) {
        loadPalette(_806A828[_3000000.var704[0]].bgPalette);
    }

    if (_806A828[_3000000.var704[0]].spritePalette != NULL) {
        loadPalette2(_806A828[_3000000.var704[0]].spritePalette);
    }
}

void Background_8049950(void)
{
    UnkStruct_sub1* arg0;
    void* pInt;
    u32* arg1;

    sub_8049344(0);
    *(vu16*)REG_BLDY = 0;

    arg0 = &_3000000.varBE0;
    arg1 = &(_3000000.var708);
    pInt = &_3000000.var650;

    newLayerManagement(arg0, arg1, &_806A828[_3000000.var704[0]], 4160, 1);
    sub_8050894(arg0);
    VBlankIntrWait();
    sub_804A280(pInt);
    sub_80627F0();
}

void Background_80499BC(void)
{
    UnkStruct_sub1* arg0;
    void* pInt;
    u32* arg1;

    sub_8049344(0);
    *(vu16*)REG_BLDY = 0;
    *(vu16*)REG_DISPCNT = 0;

    arg0 = &_3000000.varBE0;
    arg1 = &(_3000000.var708);
    pInt = &_3000000.var650;

    newLayerManagement(arg0, arg1, &_806A828[_3000000.var704[0]], 4160, 1);
    VBlankIntrWait();
    sub_804A280(pInt);
    sub_80627F0();
}

void Background_8049A24(void)
{
    sub_8049344(0);
    *(vu16*)REG_BLDY = 0;

    sub_80508A4(&_3000000.varBE0);

    sub_80508CC(&_3000000.varBE0, &_806A828[_3000000.var704[0]], 0);

    if (_806A828[_3000000.var704[0]].spritePalette != NULL) {
        loadPalette2(_806A828[_3000000.var704[0]].spritePalette);
    }
}

void Background_8049A84(void)
{
    UnkStruct_sub1* arg0;
    void* pInt;
    u32* arg1;

    arg0 = &_3000000.varBE0;
    arg1 = &(_3000000.var708);
    pInt = &_3000000.var650;

    newLayerManagement(arg0, arg1, &_806A828[_3000000.var704[0]], 4160, 0);
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
    u32* arg1;

    arg0 = &_3000000.varBE0;
    arg1 = &(_3000000.var708);
    pInt = &_3000000.var650;

    newLayerManagement(arg0, arg1, &_806A828[_3000000.var704[0]], 4160, 0);
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
    u32* arg1;

    *(vu16*)REG_BLDY = 0;

    arg0 = &_3000000.varBE0;
    arg1 = &(_3000000.var708);
    pInt = &_3000000.var650;

    newLayerManagement(arg0, arg1, &_806A828[_3000000.var704[0]], 4160, 0);
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

    sub_80508CC(&_3000000.varBE0, &_806A828[_3000000.var704[0]], 1);
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

    sub_80508CC(&_3000000.varBE0, &_806A828[_3000000.var704[0]], 1);
    sub_80596AC(&_3000000.var818, -0x10000, 0);
    Background_80498D8();
    VBlankIntrWait();
    sub_804A280(pInt);
    sub_80627F0();
}

INCLUDE_ASM("asm/dump/8040d18/8049ce8.s");
INCLUDE_ASM("asm/dump/8040d18/8049de0.s");

void sub_8049F58(FrontendState* arg0, unk32 arg1)
{
    if (arg1 != 3) {
        if (arg1 <= 3) {
            if (arg1 == 2) {
                arg0->unk585 = 0xFC;
                arg0->unk586 = 0;
            }
        }
    } else {
        arg0->unk585 = 4;
        arg0->unk586 = 0x40;
    }
}

void sub_8049F9C(FrontendState* arg0, unk32 arg1)
{
    switch (arg1) {
    case 2:
        arg0->unk584 = 0x40;
        arg0->unk585 = 0xFC;
        arg0->unk586 = 0;
        break;
    case 3:
        arg0->unk584 = 0;
        arg0->unk585 = 2;
        arg0->unk586 = 0x40;
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
        deallocate_80637CC(&_3000000.var6B8);
        deallocate_80637CC(&_3000000.var6A4);
        break;

    case 4:
        sub_8063830(&_3000000.var6A4, (u16*)0x5000000, arg0->unk584 /2, 0x1F, 0x1F, 0x1F);
        sub_8063830(&_3000000.var6B8, (u16*)0x5000200, arg0->unk584 /2, 0x1F, 0x1F, 0x1F);
        break;
    }
}
#endif
