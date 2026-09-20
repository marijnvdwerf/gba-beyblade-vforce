#ifndef _MOTION_H
#define _MOTION_H

#include "common.h"
#include "memory.h"

typedef struct Motion {
    unk32 unk0; /* 0x00 */
    unk32 unk4; /* 0x04 */
    unk32 unk8; /* 0x08 */
    unk32 unkC; /* 0x0C */
    unk32 unk10; /* 0x10 */
    unk32 unk14; /* 0x14 */
    unk32 unk18; /* 0x18 */
    s32 unk1C; /* 0x1C */
    unk16 unk20; /* 0x20 */
} Motion;

void sub_80502A4(Motion*);

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
