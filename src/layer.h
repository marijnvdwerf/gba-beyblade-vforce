#ifndef _LAYER_H
#define _LAYER_H

#include "common.h"

typedef union LayerTransformValue {
    unk32 word;
    s16 half;
} LayerTransformValue;

struct Struct3000CA0 {
    s32 var00;
    s32 var04;
    s32 var08;
    s32 var0C;
    s32 var10;
    s32 var14;
};

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

typedef struct BGControl {
    unk32 unk0_0 : 2;
    unk32 unk0_2 : 30;
} BGControl;

extern Struct3000CA0 _unk3000CA0[4];
extern LayerTransformRecord _unk3000D00[2];

void sub_8058968(BGLayer*, u8, TileMapHeader*, unk16, unk16, s32, s32);
void sub_8058A28(BGLayer*, u8, TileMapHeader*, u16, u16);
void sub_8058EF4(BGLayer*);
void sub_8059934(void);
void sub_8058F60(BGLayer*);
void sub_80596AC(BGLayer*, s32, s32);
vu16* GetBGLayerCntPtr(u8 layer);
unk8 sub_8059CB4(BGLayer*);
void SetBGOffset(u8 layer, s32 x, s32 y);
void sub_8059B00(u8, u8, u16, u16);
void sub_8059C18(unk8, unk8, unk8, unk8);

#endif
