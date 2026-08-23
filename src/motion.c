#include "motion.h"

#include <agb/types.h>

#include "include_asm.h"
#include "memory.h"
#include "unsorted.h"

void sub_8050284(unk32* arg0, unk32 arg1, unk32 arg2, unk16 arg3)
{
    arg0[6] = 0;
    arg0[7] = 0x80;
    arg0[3] = 0;
    arg0[2] = 0;
    arg0[5] = 0;
    arg0[4] = 0;
    arg0[0] = arg1;
    arg0[1] = arg2;
    *(unk16*)&arg0[8] = arg3;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/80502a4.s");

void sub_805032C(unk32* arg0, unk32 arg1, unk32 arg2)
{
    arg0[4] = arg1;
    arg0[5] = arg2;
}

void sub_8050334(unk32* arg0, unk32 arg1, unk32 arg2)
{
    arg0[2] = arg1;
    arg0[3] = arg2;
}

void sub_805033C(unk32* arg0, unk16 arg1)
{
    *(unk16*)&arg0[8] = arg1;
}

void sub_8050340(unk32* arg0, unk32 arg1, s16 arg2)
{
    arg0[6] = arg1;
    arg0[7] = arg2;
}

void sub_805034C(unk32* arg0)
{
    arg0[6] = 0;
    arg0[7] = 0x80;
    arg0[3] = 0;
    arg0[2] = 0;
    arg0[5] = 0;
    arg0[4] = 0;
    arg0[1] = 0;
    arg0[0] = 0;
    *(unk16*)&arg0[8] = 0;
}

void sub_8050364(unk32* arg0, unk32* arg1)
{
    arg0[4] = arg1[2];
    arg0[5] = arg1[3];
    arg0[2] = arg1[0];
    arg0[3] = arg1[1];
    *(unk16*)&arg0[8] = *(unk16*)&arg1[6];
    arg0[6] = arg1[4];
    arg0[7] = arg1[5];
}

void sub_8050384(UnkMotion* arg0)
{
    arg0->sourceBlock = 0;
    arg0->mode = 0;
    arg0->motions = 0;
    arg0->count = 0;
    arg0->unk14 = 0;
    arg0->unk10 = 0;
}

// TODO: split?

INCLUDE_ASM("asm/dump/804a388-tutorial/8050394-newMotionGroup.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805041c.s");

void sub_80504E4(MotionGroup* arg0, s32 arg1, s32 arg2, s32 arg3, s32 arg4)
{
    s32* motion;
    s32 valueY;
    s32 valueX;
    s32 i;

    valueY = 0x100;
    valueX = 0x100;
    motion = (s32*)arg0->motions;
    i = 0;
    while (i < arg0->count) {
        motion[4] = (arg1 * valueX) >> 8;
        motion[5] = (arg2 * valueY) >> 8;
        valueX += arg3;
        valueY += arg4;
        motion += 6;
        i++;
    }
}

void sub_805052C(MotionGroup* arg0, s32 arg1, s32 arg2, s32 arg3, s32 arg4)
{
    s32* motion;
    s32 valueY;
    s32 valueX;
    s32 i;

    valueY = 0x100;
    valueX = 0x100;
    motion = (s32*)arg0->motions;
    i = 0;
    while (i < arg0->count) {
        motion[2] = (arg1 * valueY) >> 8;
        motion[3] = (arg2 * valueX) >> 8;
        valueY += arg3;
        valueX += arg4;
        motion += 6;
        i++;
    }
}

void sub_8050574(UnkMotion* arg0, unk16 arg1)
{
    arg0->mode = arg1;
}

void sub_8050578(MotionGroup* arg0, unk32 arg1, s16 arg2)
{
    arg0->unk10 = arg1;
    arg0->unk14 = arg2;
}

void sub_8050584(UnkMotion* arg0)
{
    if (arg0->block != NULL) {
        deallocateBlock(arg0->block);
        arg0->block = NULL;
    }
    sub_8050384(arg0);
}

asm(".align 2, 0");
