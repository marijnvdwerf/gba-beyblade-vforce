#include "actor.h"

#include <agb/types.h>

#include "include_asm.h"
#include "memory.h"
#include "unsorted.h"

void sub_8060A94(void* spriteEntry);

INCLUDE_ASM("asm/dump/8057b80-debug/8057c58-actor_8057C58.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8057d88-renderActor.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8057fac.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8057fdc.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058038.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058068.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80580b4-GetSpriteSheetStructA.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80580c0-actor_80580C0.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058110.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058144.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805816c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80581b8.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058220-ActorSetFrameSequence.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80582d0.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805832c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058390.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80583dc-ActorSetFrame.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058478.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80584b8.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80585c8.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80585e8.s");

void actor_80585F0(UnkActor* arg0, unk8 arg1)
{
    arg0->unk8D = arg1;
}

INCLUDE_ASM("asm/dump/8057b80-debug/80585f8-actor_80585F8.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058614-rider_8058614.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058624-ActorSetSpriteOffset.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058630.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058638-actor_8058638.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058754.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058778-renderActor2.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058784.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058794.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058838.s");

void sub_80588A8(Actor* arg0)
{
    if (arg0->unkB8 != NULL) {
        sub_8060A94(arg0->unkB8);
        arg0->unkB8 = NULL;
    }
    if (arg0->unk7C != NULL) {
        deallocateBlock(arg0->unk7C);
    }
    arg0->unk74 = -1;
    arg0->unk78 = 0;
    arg0->unk7C = NULL;
}

INCLUDE_ASM("asm/dump/8057b80-debug/80588dc.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058914-nullsub_49.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058918-nullsub_50.s");

void nullsub_11(void)
{
}

INCLUDE_ASM("asm/dump/8057b80-debug/8058920-nullsub_51.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058924.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805893c.s");
