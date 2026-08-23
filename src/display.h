#ifndef _DISPLAY_H
#define _DISPLAY_H

#include "common.h"
#include "layer.h"

typedef struct UnkStruct_sub1 {
    u8 var00;
    u8 var01;
    u16 var02;
    u16 var04;
    u16 var06;
    u16 var08;
    u32 var0C;
    u32 var10;
    u32 var14;
} UnkStruct_sub1;

typedef struct ScreenLayout {
    void* var00[30];
    u16 (*bgPalette)[16][16];
    u16 (*spritePalette)[16][16];
    u32 var80;
} ScreenLayout;

void sub_80508A4(UnkStruct_sub1*);
void sub_8050894(void*);
void sub_80508CC(void*, ScreenLayout*, int);
void newLayerManagement(void*, void*, ScreenLayout*, u16, u8);

typedef struct DisplayData {
    unk8 pad0[2];
    unk16 unk2;
    unk16 unk4;
    unk32 pad8;
    DisplayRecord* ptrC;
} DisplayData;

void sub_8050A50(DisplayData*);

#endif /* _DISPLAY_H */
