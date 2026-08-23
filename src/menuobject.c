#include "include_asm.h"
#include "motion.h"
#include "spritetext.h"

INCLUDE_ASM("asm/dump/8040d18/8043370.s");

typedef struct MenuObject {
    unk8 pad0[0x490];
    unk32 count;
    unk8 pad494[0x8C];
    unk8* items;
    unk32 allocation;
    unk32 timer;
    SpriteTextCleanup cleanup;
    UnkMotion motion;
} MenuObject;

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
INCLUDE_ASM("asm/dump/8040d18/804374c.s");
INCLUDE_ASM("asm/dump/8040d18/804385c.s");
INCLUDE_ASM("asm/dump/8040d18/80438cc.s");
