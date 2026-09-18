#ifndef _TEXT_H
#define _TEXT_H

#include "common.h"

typedef struct TilemapTextRenderer {
    BGLayer* layer;
    const unk8* unk4;
    const SpriteSheet* font;
    unk8 unkC;
    unk8 lineHeight;
    unk16 unkE;
} TilemapTextRenderer;

void sub_805B244(TilemapTextRenderer*, BGLayer*, const SpriteSheet*, const unk8*, unk32);
void sub_805B260(TilemapTextRenderer*, const SpriteSheet*, const unk8*, unk32);
unk32 sub_805B41C(TilemapTextRenderer*, s32, s32, unk8*, unk8);

#endif
