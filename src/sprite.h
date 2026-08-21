#ifndef _SPRITE_H
#define _SPRITE_H

#include "common.h"

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
