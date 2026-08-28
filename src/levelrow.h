#ifndef _LEVELROW_H
#define _LEVELROW_H

#include "common.h"

typedef struct LevelRows {
    unk8 pad0[4];
    unk32* var4;
    unk8 pad8[0xC];
    s32 count14;
    s16* rows18;
} LevelRows;

typedef SpriteTextCleanup LevelRowSprite;

void sub_804A110(void);
void sub_804A280(FrontendState*);

#endif
