#ifndef _SPRITE_H
#define _SPRITE_H

#include "common.h"

struct SpriteEntry {
    SpriteEntry* prev;
    SpriteEntry* next;
    unk32 x;
    unk32 y;
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

#endif /* _SPRITE_H */
