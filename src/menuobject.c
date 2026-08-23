#include "menuobject.h"

#include "frontend.h"
#include "include_asm.h"
#include "keystate.h"
#include "motion.h"
#include "ram.h"
#include "spritetext.h"

INCLUDE_ASM("asm/dump/8040d18/8043370.s");

void sub_80434EC(MenuObject* object)
{
    unk32 count;
    UnkMotion* item;

    count = object->state.objectCount;
    if (count != 0) {
        item = object->state.objectItems;
        count--;
        while (count != (unk32)-1) {
            sub_805041C(item);
            item++;
            count--;
        }
    }
    if (object->state.timer != 0) {
        item = &object->state.motion;
        sub_805041C(item);
        object->state.timer = object->state.timer - 1;
        if (object->state.timer == 0) {
            sub_8050584(item);
            sub_8061204(&object->state.cleanup);
        }
    }
}

INCLUDE_ASM("asm/dump/8040d18/8043558.s");
INCLUDE_ASM("asm/dump/8040d18/8043604.s");
INCLUDE_ASM("asm/dump/8040d18/80436b0.s");

unk32 sub_8043720(MenuObject* object)
{
    unk32 high;
    unk32 low;

    high = sub_805B240(&object->state);
    low = sub_805B210(&object->state);
    return (high << 16) | (low & 0xFFFF);
}

void sub_804374C(MenuObject* object)
{
    unk32 current;
    unk32 next;

    if (object->state.objectCount != 0) {
        current = sub_8043720(object);
        if ((_unk3005DA0 & 0xF0) != 0) {
            if ((_unk3005DA0 & 0x40) != 0) {
                sub_805AFBC(&object->state, 0);
            } else if ((_unk3005DA0 & 0x80) != 0) {
                sub_805AFBC(&object->state, 1);
            }
            if ((_unk3005DA0 & 0x20) != 0) {
                if (sub_805B210(&object->state) != (unk32)-1) {
                    sub_80490CC(9, sub_8043720(object));
                }
                sub_805B050(&object->state, 0);
            } else if ((_unk3005DA0 & 0x10) != 0) {
                if (sub_805B210(&object->state) != (unk32)-1) {
                    next = sub_8043720(object) | 0x80000000;
                    sub_80490CC(9, next);
                }
                sub_805B050(&object->state, 1);
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
