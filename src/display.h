#ifndef _DISPLAY_H
#define _DISPLAY_H

#include "common.h"
#include "layer.h"

void sub_80508A4(UnkStruct_sub1*);
void sub_8050894(UnkStruct_sub1*);
void sub_80508CC(UnkStruct_sub1*, ScreenLayout*, unk8);
void newLayerManagement(UnkStruct_sub1*, BGLayer*, ScreenLayout*, unk16, unk8);

typedef struct DisplayData {
    unk8 pad0[2];
    unk16 unk2;
    unk16 unk4;
    unk32 pad8;
    unk8* ptrC;
} DisplayData;

void sub_8050A50(DisplayData*);

#endif
