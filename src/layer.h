#ifndef _LAYER_H
#define _LAYER_H

#include "common.h"

typedef union LayerTransformValue {
    unk32 word;
    s16 half;
} LayerTransformValue;

typedef struct Struct3000CA0 {
    unk32 var00;
    unk32 var04;
    unk32 var08;
    unk32 var0C;
    unk32 var10;
    unk32 var14;
} Struct3000CA0;

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

typedef struct BGLayer {
    s32 columnCount;
    s32 rowCount;
    Struct3000CA0* var8;
    unk32 field_C;
    s32 field_10;
    s32 field_14;
    s32 field_18;
    s32 field_1C;
    s32 field_20;
    s32 field_24;
    s32 field_28;
    s32 field_2C;
    s32 field_30;
    s32 field_34;
    s32 field_38;
    s32 field_3C;
    s32 field_40;
    s32 field_44;
    s16 field_48;
    s16 field_4A;
    s32 field_4C;
    s32 field_50;
    unk32 field_54;
    unk32 field_58;
    unk8 screenBaseBlock;
    unk8 characterBaseBlock;
    unk8 layerIndex;
    unk8 field_5F;
    unk8 field_60;
    unk8 field_61;
    unk8 pad62[2];
    unk16 var64;
    TileMapHeader* var68;
    void* tileAddr;
    void* mapAddr;
    u32 tileBytes;
    unk32 mapBytes;
    unk8 field_7C;
    unk32 field_80;
    unk32 field_84;
} BGLayer;

typedef BGLayer DisplayRecord;

extern Struct3000CA0 _unk3000CA0[4];
extern LayerTransformRecord _unk3000D00[2];

void sub_8058968(DisplayRecord*, u8, TileMapHeader*, unk16, unk16, s32, s32);
void sub_8058EF4(DisplayRecord*);
void sub_8059934(void);
void sub_8058F60(DisplayRecord*);
void sub_80596AC(void*, unk32, unk32);
vu16* GetBGLayerCntPtr(u8 layer);
void SetBGOffset(u8 layer, s32 x, s32 y);
void sub_8059B00(u8, u8, u16, u16);
void sub_8059C18(u8, u8, u8, u8);

#endif
