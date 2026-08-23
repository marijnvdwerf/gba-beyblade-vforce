#include "include_asm.h"
#include "keystate.h"
#include "motion.h"
#include "spritetext.h"

INCLUDE_ASM("asm/dump/8040d18/8043370.s");

typedef struct MenuObject {
    unk8 pad0[0x478];
    unk8 state[0x18];
    unk8 pad490[0x0];
    unk32 count;
    unk8 pad494[0x8C];
    unk8* items;
    unk32 allocation;
    unk32 timer;
    SpriteTextCleanup cleanup;
    UnkMotion motion;
} MenuObject;

extern u16 _unk3005DA0;
extern unk32 sub_8043720(FrontendState*);
extern void sub_80490CC(unk32, unk32);
extern void sub_805AFBC(void*, unk32);
extern unk32 sub_805B210(void*);
extern void sub_805B050(void*, unk32);

void sub_80434EC(FrontendState* arg0)
{
    MenuObject* base;
    unk32 count;
    unk8* item;
    unk32* timer;

    base = (MenuObject*)arg0;
    count = base->count;
    if (count != 0) {
        item = base->items;
        count--;
        while (count != (unk32)-1) {
            sub_805041C((UnkMotion*)item);
            item += 0x18;
            count--;
        }
    }
    timer = &base->timer;
    if (*timer != 0) {
        item = (unk8*)&base->motion;
        sub_805041C((UnkMotion*)item);
        *timer = *timer - 1;
        if (*timer == 0) {
            sub_8050584((UnkMotion*)item);
            sub_8061204(&base->cleanup);
        }
    }
}

INCLUDE_ASM("asm/dump/8040d18/8043558.s");
INCLUDE_ASM("asm/dump/8040d18/8043604.s");
INCLUDE_ASM("asm/dump/8040d18/80436b0.s");
INCLUDE_ASM("asm/dump/8040d18/8043720.s");

void sub_804374C(FrontendState* arg0)
{
    register unk32 current;
    register unk32 next;

    if (((MenuObject*)arg0)->count != 0) {
        current = sub_8043720((FrontendState*)arg0);
        if ((_unk3005DA0 & 0xF0) != 0) {
            if ((_unk3005DA0 & 0x40) != 0) {
                sub_805AFBC(((MenuObject*)arg0)->state, 0);
            } else if ((_unk3005DA0 & 0x80) != 0) {
                sub_805AFBC(((MenuObject*)arg0)->state, 1);
            }
            if ((_unk3005DA0 & 0x20) != 0) {
                unk8* state;

                state = ((MenuObject*)arg0)->state;
                if (sub_805B210(state) != (unk32)-1) {
                    sub_80490CC(9, sub_8043720((FrontendState*)arg0));
                }
                sub_805B050(state, 0);
            } else if ((_unk3005DA0 & 0x10) != 0) {
                unk8* state;

                state = ((MenuObject*)arg0)->state;
                if (sub_805B210(state) != (unk32)-1) {
                    next = sub_8043720((FrontendState*)arg0) | 0x80000000;
                    sub_80490CC(9, next);
                }
                sub_805B050(state, 1);
            }
            next = sub_8043720((FrontendState*)arg0);
            if (current != next) {
                sub_80490CC(4, next);
            }
        }
        if ((_unk3005DA0 & 1) != 0) {
            sub_80490CC(5, sub_8043720((FrontendState*)arg0));
        } else if ((_unk3005DA0 & 2) != 0) {
            sub_80490CC(6, 0);
        }
    }
}

INCLUDE_ASM("asm/dump/8040d18/804385c.s");
INCLUDE_ASM("asm/dump/8040d18/80438cc.s");
