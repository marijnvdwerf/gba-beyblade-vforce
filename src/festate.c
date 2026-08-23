#include "common.h"
#include "frontend.h"
#include "include_asm.h"
#include "ram.h"

void sub_8043A0C(FrontendState* state, unk32 arg1, unk32 arg2)
{
    s8 value;

    switch (arg1) {
    case 0:
        sub_8049168();
        break;
    case 8:
        value = state->unk584;
        if (value == 0 && (((_unk3005DA0 & 9) != 0 && arg2 > 0x7C) || arg2 == 0xF0)) {
            sub_80490F8(state->unk0 + 1);
        }
        break;
    }
}

void sub_8043A58(FrontendState* state, unk32 arg1, unk32 arg2)
{
    s8 value;

    switch (arg1) {
    case 0:
        sub_8049168();
        break;
    case 8:
        value = state->unk584;
        if (value == 0 && (((_unk3005DA0 & 9) != 0 && arg2 > 0x7C) || arg2 == 0xF0)) {
            sub_80490F8(7);
        }
        break;
    }
}

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
INCLUDE_ASM("asm/dump/8040d18/8046424.s");
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
