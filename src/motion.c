#include "motion.h"

#include <agb/types.h>

#include "include_asm.h"
#include "memory.h"
#include "sprite.h"
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

void newMotionGroup(MotionGroup* arg0, SpriteTextBlock* arg1, unk16 arg2)
{
    unk32 size;
    AllocatedBlock* block;
    MotionEntry* target;
    SpriteEntry* source;
    s32 i;

    size = arg1->count * sizeof(MotionEntry);
    if (size == 0) {
        printf(Str_8727080);
        return;
    }
    block = slowAllocate(size);
    arg0->block = block;
    if (block == NULL) {
        printf(Str_87270B8, size, arg1->count);
        return;
    }
    target = block->address;
    arg0->motions = target;
    arg0->count = arg1->count;
    arg0->sourceBlock = arg1;
    arg0->unk10 = 0;
    arg0->unk14 = 0x80;
    arg0->mode = arg2;
    source = arg1->prev;
    i = 0;
    while (i < arg0->count) {
        target->unkC = 0;
        target->unk8 = 0;
        target->unk14 = 0;
        target->unk10 = 0;
        target->x = source->x;
        target->y = source->y;
        source = source->next;
        target++;
        i++;
    }
}

#if 0
void sub_805041C(UnkMotion* group)
{
    MotionEntry* motion;
    SpriteEntry* sprite;
    unk16 mode;
    s32 i;
    unk32 mode3;
    unk32 axisFlag;
    unk32 reflect;
    s32 horizontal;
    s32 vertical;
    s32 boundary;
    s32 delta;

    motion = group->motions;
    sprite = group->sourceBlock->prev;
    mode = group->mode;
    i = 0;
    if (i < group->count) {
        mode3 = mode & 3;
        axisFlag = mode & 1;
        reflect = mode & 4;
        do {
            motion->x += motion->unk8;
            motion->y += motion->unkC;
            motion->unk8 += motion->unk10;
            motion->unkC += motion->unk14;
            sprite->x = motion->x;
            sprite->y = motion->y;
            if (mode3 != 0) {
                if (axisFlag != 0) {
                    horizontal = motion->x;
                    vertical = motion->unk8;
                } else {
                    horizontal = motion->y;
                    vertical = motion->unkC;
                }
                boundary = horizontal - group->unk10;
                delta = horizontal + vertical - group->unk10;
                if ((boundary <= 0 || delta < 0) && (boundary >= 0 || delta > 0)) {
                    if (reflect != 0)
                        vertical = -(group->unk14 * vertical) >> 8;
                    else
                        vertical = 0;
                    if (axisFlag != 0) {
                        motion->x = group->unk10;
                        motion->unk8 = vertical;
                    } else {
                        motion->y = group->unk10;
                        motion->unkC = vertical;
                    }
                }
            }
            sprite = sprite->next;
            motion++;
            i++;
        } while (i < group->count);
    }
}
#endif
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
