#include "common.h"
#include "io_reg.h"
#include "sound.h"
#include "unsorted.h"

typedef struct {
    u8 var00; // 0x00
    u8 var01; // 0x01
    u16 var02; // 0x02
    u16 var04; // 0x04
    u16 var06; // 0x06
    u16 var08; // 0x08
    u32 var0C; // 0x0C
    u32 var10; // 0x10
    u32 var14; // 0x14
} UnkStruct_sub1;

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

typedef struct {
    void* var00[30];
    u16 (*bgPalette)[16][16];
    u16 (*spritePalette)[16][16];
    u32 var80;
} ScreenLayout;

typedef struct {
    u8 pad000[0x584]; // 0x000
    u8 var584; // 0x584
} UnkStructA;

extern UnkStruct _3000000;

extern ScreenLayout _806A828[];

extern void sub_80508A4(UnkStruct_sub1*);
extern void loadPalette(void*);
extern void loadPalette2(void*);

extern void sub_8049344(int);
extern void sub_804A280(void*);
extern void sub_8050894(void*);

extern void newLayerManagement(void* arg0, void* arg1, ScreenLayout* arg2, u16 arg3, u8 sp0);

void deallocate_80637CC(UnkStruct_sub2*);
void sub_8063830(UnkStruct_sub2* arg0, u16* arg1, int arg2, int arg3, int sp0, int sp4);

void sub_80508CC(void*, ScreenLayout*, int);

typedef void(ClearFn)(int, void*, int);
extern ClearFn* __fastMemoryClearARM;

void sub_80596AC(void*, int, int);

/**
 *
  Bit   Expl.
  0     BG0 1st Target Pixel (Background 0)
  1     BG1 1st Target Pixel (Background 1)
  2     BG2 1st Target Pixel (Background 2)
  3     BG3 1st Target Pixel (Background 3)
  4     OBJ 1st Target Pixel (Top-most OBJ pixel)
  5     BD  1st Target Pixel (Backdrop)
  6-7   Color Special Effect (0-3, see below)
         0 = None                (Special effects disabled)
         1 = Alpha Blending      (1st+2nd Target mixed)
         2 = Brightness Increase (1st Target becomes whiter)
         3 = Brightness Decrease (1st Target becomes blacker)
  8     BG0 2nd Target Pixel (Background 0)
  9     BG1 2nd Target Pixel (Background 1)
  10    BG2 2nd Target Pixel (Background 2)
  11    BG3 2nd Target Pixel (Background 3)
  12    OBJ 2nd Target Pixel (Top-most OBJ pixel)
  13    BD  2nd Target Pixel (Backdrop)
  14-15 Not used
 */

#define BLDCNT_BG0 (1 << 0)
#define BLDCNT_BG1 (1 << 1)
#define BLDCNT_BG2 (1 << 2)
#define BLDCNT_BG3 (1 << 3)
#define BLDCNT_TOPMOST_OBJ (1 << 4)
#define BLDCNT_BACKDROP (1 << 5)

#define BLDCNT_EFFECT_NONE (0)
#define BLDCNT_EFFECT_ALPHA (1)
#define BLDCNT_EFFECT_LIGHTEN (2)
#define BLDCNT_EFFECT_DARKEN (3)

#define BLDCNT_TARGET_1(val) ((val) << 0)
#define BLDCNT_EFFECT(val) ((val) << 6)
#define BLDCNT_TARGET_2(val) ((val) << 8)

void sub_80498D8(void)
{
    REG_BLDCNT = BLDCNT_TARGET_1(BLDCNT_BG1) | BLDCNT_EFFECT(BLDCNT_EFFECT_ALPHA)
        | BLDCNT_TARGET_2(BLDCNT_BG0 | BLDCNT_BG1 | BLDCNT_BG2 | BLDCNT_BG3);
    REG_BLDALPHA = (12 << 8) | (6 << 0);
}

void sub_80498F8(void)
{
    sub_80508A4(&_3000000.varBE0);

    if (_806A828[_3000000.var704[0]].bgPalette != NULL) {
        loadPalette(_806A828[_3000000.var704[0]].bgPalette);
    }

    if (_806A828[_3000000.var704[0]].spritePalette != NULL) {
        loadPalette2(_806A828[_3000000.var704[0]].spritePalette);
    }
}

void sub_8049950(void)
{
    UnkStruct_sub1* arg0;
    u32* pInt;
    u32* arg1;

    sub_8049344(0);
    REG_BLDY = 0;

    arg0 = &_3000000.varBE0;
    arg1 = &(_3000000.var708);
    pInt = &_3000000.var650;

    newLayerManagement(arg0, arg1, &_806A828[_3000000.var704[0]], 4160, 1);
    sub_8050894(arg0);
    VBlankIntrWait();
    sub_804A280(pInt);
    sub_80627F0();
}

void sub_80499BC(void)
{
    UnkStruct_sub1* arg0;
    u32* pInt;
    u32* arg1;

    sub_8049344(0);
    REG_BLDY = 0;
    REG_DISPCNT = 0;

    arg0 = &_3000000.varBE0;
    arg1 = &(_3000000.var708);
    pInt = &_3000000.var650;

    newLayerManagement(arg0, arg1, &_806A828[_3000000.var704[0]], 4160, 1);
    VBlankIntrWait();
    sub_804A280(pInt);
    sub_80627F0();
}

void sub_8049A24(void)
{
    sub_8049344(0);
    REG_BLDY = 0;

    sub_80508A4(&_3000000.varBE0);

    sub_80508CC(&_3000000.varBE0, &_806A828[_3000000.var704[0]], 0);

    if (_806A828[_3000000.var704[0]].spritePalette != NULL) {
        loadPalette2(_806A828[_3000000.var704[0]].spritePalette);
    }
}

void sub_8049A84(void)
{
    UnkStruct_sub1* arg0;
    u32* pInt;
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

void sub_8049AF8(void)
{
    UnkStruct_sub1* arg0;
    u32* pInt;
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

void sub_8049B68(void)
{
    UnkStruct_sub1* arg0;
    u32* pInt;
    u32* arg1;

    REG_BLDY = 0;

    arg0 = &_3000000.varBE0;
    arg1 = &(_3000000.var708);
    pInt = &_3000000.var650;

    newLayerManagement(arg0, arg1, &_806A828[_3000000.var704[0]], 4160, 0);
    sub_8050894(arg0);
    _3000000.var80C |= 3;
    __fastMemoryClearARM(0, (void*)0x5000000, 0x400);
    sub_80498D8();
    VBlankIntrWait();
    sub_804A280(pInt);
    sub_80627F0();
}

void sub_8049BF8(void)
{
    u32* pInt;

    sub_8049344(0);
    REG_BLDY = 0;
    sub_80508A4(&_3000000.varBE0);

    pInt = &_3000000.var650;

    sub_80508CC(&_3000000.varBE0, &_806A828[_3000000.var704[0]], 1);
    sub_80596AC(&_3000000.var818, 0x800, 0x6000);
    sub_80498D8();
    VBlankIntrWait();
    sub_804A280(pInt);
    sub_80627F0();
}

void sub_8049C70(void)
{
    u32* pInt;

    sub_8049344(0);
    REG_BLDY = 0;
    sub_80508A4(&_3000000.varBE0);

    pInt = &_3000000.var650;

    sub_80508CC(&_3000000.varBE0, &_806A828[_3000000.var704[0]], 1);
    sub_80596AC(&_3000000.var818, -0x10000, 0);
    sub_80498D8();
    VBlankIntrWait();
    sub_804A280(pInt);
    sub_80627F0();
}

#if 0
void sub_8049CE8(UnkStructA* arg0, int arg1) {
    switch (arg1) {
    case 2:
        break;

    case 1:
        deallocate_80637CC(&_3000000.var6B8);
        deallocate_80637CC(&_3000000.var6A4);
        break;

    case 4:
        sub_8063830(&_3000000.var6A4, (u16*)0x5000000, arg0->var584 /2, 0x1F, 0x1F, 0x1F);
        sub_8063830(&_3000000.var6B8, (u16*)0x5000200, arg0->var584 /2, 0x1F, 0x1F, 0x1F);
        break;
    }
}
#endif
