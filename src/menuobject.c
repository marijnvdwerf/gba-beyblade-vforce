#include "menuobject.h"

#include "frontend.h"
#include "include_asm.h"
#include "keystate.h"
#include "motion.h"
#include "ram.h"
#include "spritetext.h"

INCLUDE_ASM("asm/dump/8040d18/8043370.s");

void sub_80434EC(FrontendState* object)
{
    unk32 count;
    UnkMotion* item;

    count = object->menuState.objectCount;
    if (count != 0) {
        item = object->menuState.objectItems;
        count--;
        while (count != (unk32)-1) {
            sub_805041C(item);
            item++;
            count--;
        }
    }
    if (object->menuState.timer != 0) {
        item = &object->menuState.motion;
        sub_805041C(item);
        object->menuState.timer = object->menuState.timer - 1;
        if (object->menuState.timer == 0) {
            sub_8050584(item);
            sub_8061204(&object->menuState.cleanup);
        }
    }
}

extern const unk32 _8068868[];

void sub_8043558(FrontendState* object)
{
    s32 i;
    unk32 odd;
    unk32 direction;
    const unk32* table;
    UnkMotion* motion;
    UnkMenuItem* item;

    if (object->menuState.objectCount != 0) {
        table = _8068868;
        motion = object->menuState.objectItems;
        item = object->menuState.items;
        i = 0;
        while (i < (s32)object->menuState.objectCount) {
            odd = i & 1;
            direction = (unk32)-1;
            if (odd != 0)
                direction = 1;
            sub_8050584(motion);
            newMotionGroup(motion, &item->text.unk14, 0);
            sub_80504E4(motion, table[0] * direction, table[1], table[2], table[3]);
            sub_805052C(motion, table[4] * direction, table[5], table[6], table[7]);
            sub_8050574(motion, 0);
            item++;
            motion++;
            i++;
        }
    }
}

INCLUDE_ASM("asm/dump/8040d18/8043604.s");

void sub_80436B0(FrontendState* object)
{
    unk32 count;
    UnkMotion* item;

    item = object->menuState.objectItems;
    count = object->menuState.objectCount;
    if (count == 0)
        return;
    while (count-- != 0) {
        sub_8050584(item);
        item++;
    }
    if (object->menuState.timer != 0) {
        sub_8050584(&object->menuState.motion);
        sub_8061204(&object->menuState.cleanup);
    }
    deallocateBlock(object->menuState.block);
    sub_805AD9C(&object->menuState);
}

unk32 sub_8043720(FrontendState* object)
{
    unk32 high;
    unk32 low;

    high = sub_805B240(&object->menuState);
    low = sub_805B210(&object->menuState);
    return (high << 16) | (low & 0xFFFF);
}

void sub_804374C(FrontendState* object)
{
    unk32 current;
    unk32 next;

    if (object->menuState.objectCount != 0) {
        current = sub_8043720(object);
        if ((_unk3005DA0 & 0xF0) != 0) {
            if ((_unk3005DA0 & 0x40) != 0) {
                sub_805AFBC(&object->menuState, 0);
            } else if ((_unk3005DA0 & 0x80) != 0) {
                sub_805AFBC(&object->menuState, 1);
            }
            if ((_unk3005DA0 & 0x20) != 0) {
                if (sub_805B210(&object->menuState) != (unk32)-1) {
                    sub_80490CC(9, sub_8043720(object));
                }
                sub_805B050(&object->menuState, 0);
            } else if ((_unk3005DA0 & 0x10) != 0) {
                if (sub_805B210(&object->menuState) != (unk32)-1) {
                    next = sub_8043720(object) | 0x80000000;
                    sub_80490CC(9, next);
                }
                sub_805B050(&object->menuState, 1);
            }
            next = sub_8043720(object);
            if (current != next) {
                sub_80490CC(4, next);
            }
        }
        if ((_unk3005DA0 & 1) != 0) {
            sub_80490CC(5, sub_8043720(object));
        } else if ((_unk3005DA0 & 2) != 0) {
            sub_80490CC(6, 0);
        }
    }
}

INCLUDE_ASM("asm/dump/8040d18/804385c.s");
INCLUDE_ASM("asm/dump/8040d18/80438cc.s");
