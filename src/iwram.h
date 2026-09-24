#ifndef IWRAM_H
#define IWRAM_H

#include "common.h"
#include "sound.h"

typedef struct UnkStruct_87569F4 {
    unk8 pad0[0x24];
    unk32 unk24;
} UnkStruct_87569F4;

unk32 ARM_sub_87569F4(UnkStruct_87569F4*, unk32);
s32 ARM_sub_8756A84(SpriteEntry*, unk16, s32);
void oam_8756CC0(void);
typedef void CopyFn(const void*, void*, unk32);
typedef void ClearFn(unk32, void*, unk32);

extern CopyFn* __fastMemoryCopyARM;
extern ClearFn* __fastMemoryClearARM;
extern void (*__oam_8756CC0)(void);
extern void (*__sub_8756FC0)(BGLayer*, s32, s32, unk32, s32, s32, s32);
extern void (*__sub_8757380)(BGLayer*, unk32, s32, unk32, s32);
extern void (*__sub_8757494)(const s16*, s32, unk32, s32, unk16*, unk16);
extern void (*__sub_87576D8)(const unk32*, unk32, unk32, unk32, Tile4bpp*, const unk32*);
extern void (*__sub_87577B4)(SoundStructA*, unk32, unk32);
extern s32 (*__sound_8757A64)(unk8*, s32, s32);
extern unk32 (*off_807D96C)(const char*, ...);
extern void (*__sub_8757CD0)(void);
extern void (*__sub_8757D24)(void);
extern void (*__sub_8757E4C)(void);
extern void (*__sub_8757FCC)(void);

void sub_8756FC0(BGLayer*, s32, s32, unk32, s32, s32, s32);
void sub_8757380(BGLayer*, unk32, s32, unk32, s32);
void sub_8757494(const s16*, s32, unk32, s32, unk16*, unk16);
void sub_8757574(const unk32*, const unk16*, Tile4bpp*, s32);
void sub_87576D8(const unk32*, unk32, unk32, unk32, Tile4bpp*, const unk32*);
void sub_87577B4(SoundStructA*, unk32, unk32);
s32 sound_8757A64(unk8*, s32, s32);
void fastMemoryClearARM(unk32, void*, unk32);
void fastMemoryCopyARM(const void*, void*, unk32);
void fastMemoryClear16ARM(unk32, void*, unk32);
void fastMemoryCopy16ARM(const void*, void*, unk32);
void sub_8757CD0(void);
void sub_8757D24(void);
void sub_8757E4C(void);
void sub_8757FCC(void);

#endif
