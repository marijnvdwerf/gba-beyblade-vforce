#ifndef _MOTION_H
#define _MOTION_H

#include "common.h"
#include "memory.h"

extern const unk8 Str_8727080[];
extern const unk8 Str_87270B8[];

typedef UnkMotion MotionGroup;

void newMotionGroup(MotionGroup*, SpriteTextBlock*, unk16);
void sub_8050384(UnkMotion*);
void sub_805041C(UnkMotion*);
void sub_80504E4(MotionGroup*, s32, s32, s32, s32);
void sub_805052C(MotionGroup*, s32, s32, s32, s32);
void sub_8050574(UnkMotion*, unk16);
void sub_8050578(MotionGroup*, unk32, s16);
void sub_8050584(UnkMotion*);

#endif
