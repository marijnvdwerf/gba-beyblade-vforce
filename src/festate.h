#ifndef _FESTATE_H
#define _FESTATE_H

#include "common.h"
#include "ram.h"

void initBBCollectionSprite(FrontendBladeState*);
void sub_804703C(FrontendBladeState*);
void sub_8047080(FrontendBladeState*, unk32);
void sub_80470C8(FrontendBladeState*);
void sub_804712C(FrontendBladeState*);

void sub_8043DB8(SpriteTextCleanup**, LevelState*, CurrentGameStateTail*, unk32);
void sub_8043F40(SpriteTextCleanup**, CurrentGameStateTail*, s32);
void sub_8048A74(FrontendSpriteTriple*, s32);

#endif
