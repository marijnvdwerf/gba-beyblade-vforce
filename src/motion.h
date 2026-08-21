#ifndef _MOTION_H
#define _MOTION_H

#include "common.h"
#include "memory.h"

typedef struct MotionGroup {
    unk32* block; /* 0x00 */
    unk32* sourceBlock; /* 0x04 */
    unk32* motions; /* 0x08 */
    s16 count; /* 0x0C */
    unk16 mode; /* 0x0E */
    unk32 unk10; /* 0x10 */
    unk32 unk14; /* 0x14 */
} MotionGroup;

void sub_8050384(UnkMotion*);
void sub_80504E4(MotionGroup*, s32, s32, s32, s32);
void sub_805052C(MotionGroup*, s32, s32, s32, s32);
void sub_8050574(UnkMotion*, unk16);
void sub_8050578(unk32*, unk32, s16);
void sub_8050584(UnkMotion*);

#endif /* _MOTION_H */
