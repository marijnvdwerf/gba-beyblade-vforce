#ifndef IWRAM_H
#define IWRAM_H

#include "common.h"

typedef struct UnkStruct_87569F4 {
    unk8 pad0[0x24];
    unk32 unk24;
} UnkStruct_87569F4;

unk32 ARM_sub_87569F4(UnkStruct_87569F4*, unk32);
void ARM_sub_8756A84(SpriteEntry*, unk16, s32);
void oam_8756CC0(void);
void sub_8756FC0(void);
void sub_8757380(BGLayer*, unk32, unk32, unk32, unk32);
void sub_8757494(void);
void sub_8757574(void);
void sub_87576D8(const unk32*, unk32, unk32, unk32, RiderTile*, const unk32*);
void sub_87577B4(void);
void sound_8757A64(void*, s32, s32);
void fastMemoryClearARM(unk32, void*, unk32);
void fastMemoryCopyARM(const void*, void*, unk32);
void fastMemoryClear16ARM(unk32, void*, unk32);
void fastMemoryCopy16ARM(const void*, void*, unk32);
void sub_8757CD0(void);
void sub_8757D24(void);
void sub_8757E4C(void);
void sub_8757FCC(void);

#endif
