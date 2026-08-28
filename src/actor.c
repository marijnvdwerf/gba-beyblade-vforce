#include "actor.h"

#include <agb/types.h>

#include "geometry.h"
#include "include_asm.h"
#include "memory.h"
#include "sprite.h"
#include "unsorted.h"

void sub_8058838(Actor*);
void actor_8058638(Actor*);

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

void ActorSetFrameSequence(Actor* actor, unk32 sequence)
{
    ActorConfig* config;
    ActorFrameSequence* sequenceData;
    ActorFrame* frame;
    unk32 value;
    unk8 configFlags;
    unk8 flags;
    unk16 frameOffset;
    unk32 frameCount;
    unk32 endFrame;

    sequenceData = &actor->unk0->sequences[sequence];
    config = actor->unk0;
    value = config->unk0 << 1;
    if ((value & 2) != 0) {
        value += 2;
    }
    configFlags = config->unk7;
    if ((configFlags & 0x10) != 0) {
        frame = (ActorFrame*)((unk8*)&config->sequences[config->unk8] + value);
        if (frame != NULL) {
            frame += sequence;
            actor->unkA4 = frame->unk0;
            actor->unkA5 = frame->unk1;
        }
    }
    frameOffset = sequenceData->unk0;
    frameCount = sequenceData->unk2;
    flags = sequenceData->unk7;
    actor->unk32 = sequenceData->unk6;
    actor->unk33 = flags;
    actor->unk34 = sequenceData->unk4;
    actor->unk36 = 0;
    actor->unk58 = _unk3000E30[0];
    actor->unk26 = frameCount;
    actor->unk20 = sequence;
    actor->unk24 = 0;
    if ((flags & 2) != 0) {
        endFrame = frameCount + 0xFFFF;
        actor->unk22 = endFrame + frameOffset;
    } else {
        actor->unk22 = frameOffset;
    }
    actor->unk31 ^= (flags & 0xC) >> 2;
}

INCLUDE_ASM("asm/dump/8057b80-debug/80582d0.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805832c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058390.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80583dc-ActorSetFrame.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058478.s");

void sub_80584B8(Actor* actor)
{
    s32 xVelocity;
    s32 yVelocity;
    s32 zVelocity;
    s32 damping;
    s32 scaledX;
    s32 scaledY;
    s32 scaledZ;
    s32 adjusted;
    s32 timer;

    sub_8058838(actor);
    if (actor->unk80 != NULL) {
        if (actor->unk84 >= 0) {
            sub_805D650(actor);
        }
    }
    if (actor->unk80 == NULL && actor->unk84 == -1) {
        actor->x += actor->unk40;
        actor->y += actor->unk44;
        actor->z += actor->unk48;
    }
    xVelocity = actor->unk40 + actor->unk4C;
    actor->unk40 = xVelocity;
    yVelocity = actor->unk44 + actor->unk50;
    actor->unk44 = yVelocity;
    zVelocity = actor->unk48 + actor->unk54;
    actor->unk48 = zVelocity;
    damping = actor->unk68;
    if (damping != 0) {
        scaledX = xVelocity * damping >> 8;
        scaledY = yVelocity * damping >> 8;
        scaledZ = zVelocity * damping >> 8;
        actor->unk40 = xVelocity - scaledX;
        actor->unk44 = yVelocity - scaledY;
        actor->unk48 = zVelocity - scaledZ;
        if (scaledX == 0 && actor->unk40 != 0) {
            if (actor->unk40 > 0) {
                actor->unk40--;
            } else {
                actor->unk40++;
            }
        }
        if (scaledY == 0) {
            if (actor->unk44 != 0) {
                if (actor->unk44 > 0) {
                    actor->unk44--;
                } else {
                    actor->unk44++;
                }
            }
        }
        if (scaledZ == 0) {
            if (actor->unk48 != 0) {
                if (actor->unk48 > 0) {
                    actor->unk48--;
                } else {
                    actor->unk48++;
                }
            }
        }
    }
    timer = actor->unk70;
    if (timer > 0) {
        adjusted = timer - (_unk3000E30[0] - _unk3000E30[1]);
        actor->unk70 = adjusted;
        if (adjusted < 0) {
            actor->unk70 = 0;
        }
    }
    if (actor->unk6C == 0 && (actor->unk98 & 1) == 0) {
        actor_8058638(actor);
    }
}

void sub_80585C8(Actor* actor, unk32 arg1)
{
    unk8 value;

    value = arg1;
    if (value != actor->unk98) {
        actor->unk58 = _unk3000E30[0];
    }
    actor->unk98 = value;
}

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

void sub_8058754(Actor* actor, unk32* output)
{
    if (actor->unkB0 != NULL) {
        actor->unkB0(actor);
    } else {
        output[0] = actor->x;
        output[1] = actor->y;
        output[2] = actor->z;
    }
}

INCLUDE_ASM("asm/dump/8057b80-debug/8058778-renderActor2.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058784.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058794.s");

void sub_8058838(Actor* actor)
{
    ActorTimerEntry* entry;
    s32 index;
    s32 count;
    unk32 delta;

    count = actor->unk74;
    if (count != -1) {
        index = 0;
        while (index < count) {
            entry = &actor->unk78[index];
            if (entry->unk8 != NULL) {
                if (entry->unk0 == 0) {
                    index++;
                    continue;
                }
                if (entry->unk4 <= 0) {
                    entry->unk8(actor, entry);
                }
            }
            if (entry->unk0 > 0) {
                delta = _unk3000E30[0] - _unk3000E30[1];
                if (entry->unk4 > 0) {
                    entry->unk4 -= delta;
                } else {
                    entry->unk0 -= delta;
                }
                if (entry->unk0 < 0) {
                    entry->unk0 = 0;
                }
            }
            index++;
        }
    }
}

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
