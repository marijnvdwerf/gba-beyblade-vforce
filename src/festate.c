#include "common.h"
#include "frontend.h"
#include "include_asm.h"
#include "ram.h"

extern void sub_80439A0(void*);

INCLUDE_ASM("asm/dump/8040d18/8043a0c.s");
INCLUDE_ASM("asm/dump/8040d18/8043a58.s");
INCLUDE_ASM("asm/dump/8040d18/8043aa0.s");
INCLUDE_ASM("asm/dump/8040d18/8043cf8.s");
INCLUDE_ASM("asm/dump/8040d18/8043d84.s");
INCLUDE_ASM("asm/dump/8040d18/8043db8.s");
INCLUDE_ASM("asm/dump/8040d18/8043f40.s");
INCLUDE_ASM("asm/dump/8040d18/8044054.s");
INCLUDE_ASM("asm/dump/8040d18/804423c.s");
INCLUDE_ASM("asm/dump/8040d18/8044314.s");
INCLUDE_ASM("asm/dump/8040d18/804444c.s");
INCLUDE_ASM("asm/dump/8040d18/80448f4.s");
INCLUDE_ASM("asm/dump/8040d18/8044c48.s");
INCLUDE_ASM("asm/dump/8040d18/8044ed4.s");
INCLUDE_ASM("asm/dump/8040d18/8045160.s");
INCLUDE_ASM("asm/dump/8040d18/80453d8.s");
INCLUDE_ASM("asm/dump/8040d18/804541c.s");
INCLUDE_ASM("asm/dump/8040d18/8045638.s");
INCLUDE_ASM("asm/dump/8040d18/804566c.s");
INCLUDE_ASM("asm/dump/8040d18/804568c.s");
INCLUDE_ASM("asm/dump/8040d18/8045848.s");
INCLUDE_ASM("asm/dump/8040d18/8045a7c.s");
INCLUDE_ASM("asm/dump/8040d18/8045cb4.s");
INCLUDE_ASM("asm/dump/8040d18/80461d8.s");

void sub_8046424(FrontendState* arg0, unk32 arg1)
{
    switch (arg1) {
    case 0:
        sub_8049168();
        break;
    case 1:
        sub_80439A0(arg0->unkB8);
        break;
    case 2:
        if (_unk3005DA0 == 2) {
            sub_80490F8(0xA);
        }
        break;
    case 5:
        sub_80490F8(0xF);
        break;
    }
}

INCLUDE_ASM("asm/dump/8040d18/8046468.s");
INCLUDE_ASM("asm/dump/8040d18/80464c0.s");
INCLUDE_ASM("asm/dump/8040d18/8046500.s");
INCLUDE_ASM("asm/dump/8040d18/8046814.s");
INCLUDE_ASM("asm/dump/8040d18/8046a0c.s");
INCLUDE_ASM("asm/dump/8040d18/8046b94.s");
INCLUDE_ASM("asm/dump/8040d18/8046cc4.s");
INCLUDE_ASM("asm/dump/8040d18/8046f2c-initBBCollectionSprite.s");
INCLUDE_ASM("asm/dump/8040d18/804703c.s");
INCLUDE_ASM("asm/dump/8040d18/8047080.s");
INCLUDE_ASM("asm/dump/8040d18/80470c8.s");
INCLUDE_ASM("asm/dump/8040d18/804712c.s");
INCLUDE_ASM("asm/dump/8040d18/8047494.s");
INCLUDE_ASM("asm/dump/8040d18/80475e0-selectBladeFrontendHandler.s");
INCLUDE_ASM("asm/dump/8040d18/8047e5c.s");
INCLUDE_ASM("asm/dump/8040d18/80480ec.s");
INCLUDE_ASM("asm/dump/8040d18/8048310.s");
INCLUDE_ASM("asm/dump/8040d18/804868c.s");
INCLUDE_ASM("asm/dump/8040d18/8048a74.s");
INCLUDE_ASM("asm/dump/8040d18/8048ae8.s");
INCLUDE_ASM("asm/dump/8040d18/8048d8c.s");
