#ifndef _LEVELSELECT_H
#define _LEVELSELECT_H

#include "common.h"

typedef struct LevelSelectState {
    SpriteEntry* sprite;
    SpriteTextCleanup* rows[6];
    unk8 pad1C;
    s8 index;
    unk8 state;
    unk8 pad1F;
} LevelSelectState;

void sub_80413FC(FrontendState*, unk32);
void sub_8041078(LevelSelectState*);
void sub_8041188(LevelSelectState*, LevelDescription*, LevelState*, unk32);
void sub_8041324(unk32);
void sub_8041344(LevelSelectState*, unk32);
void sub_8041364(LevelSelectState*);

#endif
