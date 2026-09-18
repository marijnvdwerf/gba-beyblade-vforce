#ifndef _GAMESTATE_H
#define _GAMESTATE_H

#include "common.h"

typedef struct LevelEffectDescriptor {
    void* unk0;
    unk32 unk4;
    unk16 unk8;
    unk16 unkA;
    unk16 unkC;
    unk16 unkE;
} LevelEffectDescriptor;

unk32 sub_80516B0(void);
s32 getSomeLevelID(void);
LevelDescription* getLevelDescription(s32);
LevelDescription* getLevelDescription2(void);
LevelState* sub_8051734(void);
LevelSlot* sub_80516E0(unk32);
LevelState* sub_8051720(s32);
unk32 GetLevelDescriptionNo(void);
void sub_8051640(unk32);
unk8 sub_80515A4(void);
unk8 sub_80515E0(void);
unk8 sub_8051558(void);
u8 sub_8051618(void);
void sub_8051488(void);
void sub_80510FC(void);
unk32 sub_805137C(void);
void sub_8051688(unk32);
void sub_8051798(unk32);
u8 sub_805162C(void);
unk8 sub_8051744(void);
void sub_805185C(s8);
unk32 sub_80518C8(s32);
unk32 sub_80518F0(void);
unk32 sub_8051820(void);
s32 sub_8051868(void);
void sub_805187C(LevelEffectDescriptor*);
unk8 sub_80517E8(unk32);

#endif
