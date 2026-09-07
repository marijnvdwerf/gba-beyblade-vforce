#ifndef _LEVELSELECT_H
#define _LEVELSELECT_H

#include "common.h"

typedef struct LevelSelectState {
    SpriteEntry* sprite;
    SpriteTextCleanup* rows[6];
    unk8 pad1C[4];
} LevelSelectState;

typedef struct LevelSelectSpriteData {
    unk32 unk0;
    unk32 unk4;
    unk32 unk8;
    unk16 unkC;
    unk8 padE[2];
} LevelSelectSpriteData;

extern const LevelSelectSpriteData _8068710[];

void sub_8041078(LevelSelectState*);
void sub_8041188(LevelSelectState*, LevelDescription*, LevelState*, unk32);
void sub_8041324(unk32);
void sub_8041344(LevelSelectState*, unk32);
void sub_8041364(LevelSelectState*);

#endif
