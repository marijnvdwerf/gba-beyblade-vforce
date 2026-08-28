#ifndef _LAYER_H
#define _LAYER_H

#include "common.h"

typedef union LayerTransformValue {
    unk32 word;
    s16 half;
} LayerTransformValue;

typedef struct LayerTransformRecord {
    unk8 unk0;
    unk8 pad1;
    unk16 unk2;
    unk16 unk4;
    unk8 pad6[2];
    LayerTransformValue unk8;
    LayerTransformValue unkC;
    LayerTransformValue unk10;
    LayerTransformValue unk14;
} LayerTransformRecord;

typedef struct DisplayRecord {
    unk8 pad0[0x14];
    s32 unk14;
    s32 unk18;
    s32 unk1C;
    s32 unk20;
    s32 unk24;
    s32 unk28;
    s32 unk2C;
    s32 unk30;
    s32 unk34;
    s32 unk38;
    s32 unk3C;
    unk8 pad40[8];
    s16 unk48;
    s16 unk4A;
    s32 unk4C;
    s32 unk50;
    unk32 unk54;
    unk32 unk58;
    unk8 pad5C[2];
    unk8 unk5E;
    unk8 pad5F[5];
    unk16 unk64;
    unk8 pad66[0x22];
} DisplayRecord;

extern LayerTransformRecord _unk3000D00[2];

void sub_8058EF4(DisplayRecord*);
void sub_8058F60(DisplayRecord*);
void sub_80596AC(void*, unk32, unk32);
vu16* GetBGLayerCntPtr(u8 layer);
void SetBGOffset(u8 layer, s32 x, s32 y);
void sub_8059B00(u8, u8, u16, u16);

#endif
