#ifndef _DISPLAY_H
#define _DISPLAY_H

#include "common.h"
#include "layer.h"

typedef struct ScreenLayout {
    void* var00[30];
    unk16* bgPalette;
    unk16* spritePalette;
    unk32 var80;
} ScreenLayout;

void sub_80508A4(UnkStruct_sub1*);
void sub_8050894(void*);
void sub_80508CC(void*, ScreenLayout*, unk32);
void newLayerManagement(void*, void*, ScreenLayout*, unk16, unk8);

typedef struct DisplayData {
    unk8 pad0[2];
    unk16 unk2;
    unk16 unk4;
    unk32 pad8;
    DisplayRecord* ptrC;
} DisplayData;

void sub_8050A50(DisplayData*);

#endif
