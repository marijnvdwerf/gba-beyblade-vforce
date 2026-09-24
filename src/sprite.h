#ifndef _SPRITE_H
#define _SPRITE_H

#include "common.h"

struct SpriteEntry {
    SpriteEntry* prev;
    SpriteEntry* next;
    s32 x;
    s32 y;
    s32 unk10;
    u16 oam_attr_2;
    u16 var16;

    u16 frame;

    unk16 unk1A;
    unk16 flip_h_v;
    unk16 unk1E;
    unk16 var20;
    u16 var22;
    s32 var24;
    const unk8* unk28;
    const SpriteSheet* unk2C;
    SpriteRotationScaleEntry* unk30;
};

struct SpriteRotationScaleEntry {
    SpriteRotationScaleEntry* prev;
    SpriteRotationScaleEntry* next;
    unk32 oamAddr;
    unk16 unkC[4];
    u16 unk14;
    u16 unk16;
    u8 unk18;
    u8 unk19;
    unk8 pad1A[2];
};

extern unk16 word_807D90C[16];
extern unk32 (*off_807D930)(const char*, ...);
extern s32 (*off_807D934)(s32);
extern void (*off_807D938)(s32, s32);

void SpriteVRamFree(u32, u32);
void* allocSprite(u16);
void sub_8060A94(SpriteEntry*);
void sub_8060A60(SpriteEntry*);
void sub_8061078(SpriteEntry*, unk16);
unk32 sub_80610EC(SpriteEntry*);
unk32 sub_8061110(SpriteEntry*);
void sub_8060F64(SpriteEntry*, u16, u16, u8);
void sub_8060CDC(SpriteTextBlock*);
SpriteEntry* resizeSpriteBlock(SpriteTextBlock*, u16, u16);
void LoadSpriteSheet(SpriteEntry*, const SpriteSheet*, unk32, unk32, unk8, unk8, unk8, unk16);
void sub_8060B38(SpriteRotationScaleEntry*);
SpriteEntry* sub_8060C1C(SpriteTextBlock*, unk16, unk16);
SpriteRotationScaleEntry* sub_8060E8C(SpriteRotationScaleEntry*, u16, u16, u8);
void sub_806100C(SpriteEntry*, unk16, unk16);
void sub_8061158(SpriteRotationScaleEntry*);
void sub_8061130(SpriteEntry*, u8);
void sub_8061160(SpriteRotationScaleEntry*);
void sub_8061168(SpriteEntry*, u8);

#endif
