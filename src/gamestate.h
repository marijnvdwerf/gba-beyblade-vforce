#ifndef _GAMESTATE_H
#define _GAMESTATE_H

#include "common.h"

s32 getSomeLevelID(void);
LevelDescription* getLevelDescription(s32);
LevelDescription* getLevelDescription2(void);
LevelState* sub_8051734(void);
unk32 GetLevelDescriptionNo(void);
void sub_8051640(unk32);
void sub_8051688(void);
unk8 sub_805162C(void);
unk32 sub_8051744(void);
unk32 sub_80518F0(void);
unk32 sub_8051820(void);
unk32 sub_8051868(void);

#endif /* _GAMESTATE_H */
