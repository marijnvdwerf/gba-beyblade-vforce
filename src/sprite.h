#ifndef _SPRITE_H
#define _SPRITE_H

#include "common.h"

struct SpriteEntry {
    SpriteEntry* prev;
    SpriteEntry* next;
    s32 x;
    s32 y;
    s32 unk10;
    unk16 oam_attr_2;
    unk16 var16;
    unk8 frame;
    unk8 unk19;
    unk16 unk1A;
    unk16 flip_h_v;
    unk16 unk1E;
    unk16 var20;
    unk16 var22;
    s32 var24;
    const u8* unk28;
    const u8* unk2C;
    SpriteEntry* unk30;
};

typedef struct SpriteRotationScaleEntry SpriteRotationScaleEntry;

struct SpriteRotationScaleEntry {
    SpriteRotationScaleEntry* prev;
    SpriteRotationScaleEntry* next;
    unk32 oamAddr;
    unk8 unkC[0x10];
};

void SpriteVRamFree(u32, u32);
void* allocSprite(u16);
void sub_8060A94(SpriteEntry*);
void sub_8060F64(SpriteEntry*, u16, u16, u8);
void sub_8060CDC(SpriteTextBlock*);
SpriteEntry* resizeSpriteBlock(SpriteTextBlock*, unk16, unk16);
void LoadSpriteSheet(SpriteEntry*, const void*, unk32, unk32, unk32, s32, unk32, unk32);
void sub_8060B38(SpriteEntry*);
void sub_8061130(SpriteEntry*, u8);
void sub_8061160(SpriteEntry*);
void sub_8061168(SpriteEntry*, u8);

#endif /* _SPRITE_H */
