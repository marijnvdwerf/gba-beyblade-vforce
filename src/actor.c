#include "actor.h"

#include <agb/types.h>

#include "include_asm.h"
#include "memory.h"
#include "sprite.h"
#include "unsorted.h"

#if 0
void actor_8057C58(
    Actor* actor, ActorConfig* config, void* arg2, unk32 arg3, unk32 arg4, unk32 arg5, unk32 arg6)
{
    unk16 zero;
    unk8 zero8;
    unk32 minusOne;
    unk32 scale;

    actor->unk0 = config;
    actor->unk58 = _unk3000E30[0];
    actor->unk3C = arg2;
    actor->unk70 = arg6;
    actor->x = arg3 << 8;
    actor->y = arg4 << 8;
    actor->z = arg5 << 8;
    zero8 = 0;
    zero = 0;
    actor->unk16 = zero;
    scale = 0x100;
    actor->unk12 = scale;
    actor->unk14 = scale;
    actor->unkA0 = zero;
    actor->unkA2 = zero;
    actor->unkA4 = zero8;
    actor->unkA5 = zero8;
    actor->unk40 = zero;
    actor->unk44 = zero;
    actor->unk48 = zero;
    actor->unk4C = zero;
    actor->unk50 = zero;
    actor->unk54 = zero;
    actor->unk68 = 0x10;
    actor->unk18 = zero;
    actor->unk64 = zero;
    actor->unk22 = zero;
    actor->unk60 |= 0xFFFF;
    actor->unk1A |= 0xFFFF;
    actor->unk1C = zero;
    actor->unk1E = zero;
    actor->unk20 = zero;
    actor->unk2C = zero;
    actor->unk2E |= 0xFFFF;
    actor->unk10 = config->unk4;
    actor->unk11 = config->unk5;
    actor->unk30 = config->unk6;
    actor->unk2A = config->unk8;
    actor->unk38 = config->unk7;
    actor->unk28 = config->unk14;
    actor->unk31 = zero8;
    actor->unk39 = zero8;
    actor->unk3B = zero8;
    actor->unk3A = config->unkC;
    actor->unk6C = zero;
    minusOne = -1;
    actor->unk74 = minusOne;
    actor->unk78 = zero;
    actor->unk7C = NULL;
    actor->unk80 = zero;
    actor->unk84 = minusOne;
    actor->unk88 = zero;
    actor->unk8C = zero8;
    actor->unk8D = zero8;
    actor->unk98 = zero8;
    actor->unk90 = zero;
    actor->unk94 = zero;
    actor->unkB0 = zero;
    actor->unkB4 = zero;
    rider_8058614(actor, actor->unk10 >> 1, actor->unk11, 0);
    actor_80585F8((EnvironmentActorSlot*)actor, 0, 0, actor->unk10, actor->unk11);
    actor->unkB8 = NULL;
    actor->unkBC = zero;
    ActorSetFrameSequence(actor, 0);
    actor->unkC0 = zero;
}
#endif
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

void actor_80585F8(EnvironmentActorSlot* actor, unk16 arg1, unk16 arg2, unk16 arg3, unk16 arg4)
{
    actor->unkA8 = arg1;
    actor->unkAA = arg2;
    actor->unkAC = arg3;
    actor->unkAE = arg4;
}

void rider_8058614(Actor* actor, unk16 arg1, unk16 arg2, unk16 arg3)
{
    actor->unk9A = arg1;
    actor->unk9C = arg2;
    actor->unk9E = arg3;
}

void ActorSetSpriteOffset(EnvironmentActorSlot* actor, unk16 arg1, unk16 arg2)
{
    actor->unkA0 = arg1;
    actor->unkA2 = arg2;
}

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
