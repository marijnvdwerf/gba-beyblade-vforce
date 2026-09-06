#include "actor.h"

#include <agb/types.h>

#include "geometry.h"
#include "include_asm.h"
#include "memory.h"
#include "sprite.h"
#include "unsorted.h"

void sub_80581B8(Actor*);
void actor_80580C0(Actor*, unk16, unk16);
void ActorSetFrameSequence(Actor*, unk32);
void sub_8058838(Actor*);
void actor_8058638(Actor*);
void renderActor(Actor*, unk32);

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
#if 0
typedef struct RenderActorDraftConfig {
    unk32 unk0;
    unk8 pad4[3];
    unk8 unk7;
    unk32 unk8;
    unk8 padC[4];
    unk32 unk10;
    unk8 pad14[4];
    unk32 unk18;
} RenderActorDraftConfig;

typedef struct RenderActorDraftLayer {
    unk8 pad0[0x40];
    s32 field_40;
    s32 field_44;
} RenderActorDraftLayer;

typedef struct RenderActorDraftOamFlags {
    unk32 : 8;
    unk32 unk11_0 : 1;
    unk32 : 16;
    unk32 unk13_1 : 5;
    unk32 : 2;
} RenderActorDraftOamFlags;

typedef union RenderActorDraftOamFlagsValue {
    unk32 word;
    RenderActorDraftOamFlags bits;
} RenderActorDraftOamFlagsValue;

typedef struct RenderActorDraftSprite {
    unk8 pad0[0x10];
    RenderActorDraftOamFlagsValue unk10;
    unk16 oam_attr_2;
    unk16 var16;
    union {
        unk16 word;
        unk8 b[2];
    } frame;
    unk16 unk1A;
    unk16 flip_h_v;
    unk16 unk1E;
    unk16 var20;
    unk16 var22;
    s32 var24;
    const unk8* unk28;
    const unk8* unk2C;
    RenderActorDraftSprite* unk30;
} RenderActorDraftSprite;

typedef struct RenderActorDraft {
    RenderActorDraftConfig* unk0;
    s32 x;
    s32 y;
    s32 z;
    unk8 unk10;
    unk8 unk11;
    unk16 unk12;
    unk16 unk14;
    unk16 unk16;
    unk8 pad18[2];
    unk16 unk1A;
    unk16 unk1C;
    unk16 unk1E;
    unk16 unk20;
    unk16 unk22;
    unk8 unk24;
    unk8 unk25;
    unk16 unk26;
    unk16 unk28;
    unk8 pad2A[4];
    unk16 unk2E;
    unk8 unk30;
    unk8 unk31;
    unk8 unk32;
    unk8 unk33;
    unk16 unk34;
    unk16 unk36;
    unk8 unk38;
    unk8 unk39;
    unk8 unk3A;
    s8 unk3B;
    RenderActorDraftLayer* unk3C;
    s32 unk40;
    s32 unk44;
    s32 unk48;
    s32 unk4C;
    s32 unk50;
    s32 unk54;
    unk32 unk58;
    unk8 pad5C[0xC];
    s32 unk68;
    s32 unk6C;
    s32 unk70;
    unk8 pad74[0x24];
    unk8 unk98;
    unk8 pad99[1];
    unk16 unk9A;
    unk16 unk9C;
    unk16 unk9E;
    s16 unkA0;
    s16 unkA2;
    s8 unkA4;
    s8 unkA5;
    unk8 padA6[0xA];
    void (*unkB0)(Actor*, unk32*);
    unk32 unkB4;
    RenderActorDraftSprite* unkB8;
    unk16 unkBC;
    unk8 padBE[2];
} RenderActorDraft;

unk8 sub_8059CB4(RenderActorDraftLayer*);

void renderActor(Actor* actor, unk32 arg1)
{
    RenderActorDraft* self;
    s32 x = 0, y = 0;
    s32 position[3];
    void (*callback)(Actor*, unk32*);
    unk32 oam;
    unk32 priority;
    RenderActorDraftSprite* oldSprite;
    RenderActorDraftSprite* sprite;

    self = (RenderActorDraft*)actor;
    callback = self->unkB0;
    if (callback != NULL) {
        callback(actor, position);
        x = position[0] >> 8;
        y = position[1] >> 8;
    } else {
        x = self->x >> 8;
        y = self->y >> 8;
    }
    if (self->unk3C != NULL) {
        x -= self->unk3C->field_40 >> 8;
        y -= self->unk3C->field_44 >> 8;
    }
    if ((self->unk31 & 1) != 0) {
        x -= self->unkA0 - self->unkA4;
    } else {
        x -= self->unkA0 + self->unkA4;
    }
    y -= self->unkA2 + self->unkA5;
    if (self->unk70 == 0 || x + (self->unk10 * self->unk12 >> 8) < 0 || x > 0xEF
        || y + (self->unk11 * self->unk14 >> 8) < 0 || y > 0x9F) {
        if (self->unkB8 != NULL) {
            sub_8060A94((SpriteEntry*)self->unkB8);
            self->unkB8 = NULL;
        }
        return;
    }
    oldSprite = self->unkB8;
    if (oldSprite == NULL) {
        self->unkB8 = (RenderActorDraftSprite*)allocSprite(self->unkBC);
        if (self->unkB8 == NULL)
            return;
        self->unkB8->var20 = (unk16)(unk32)oldSprite;
        if ((self->unk98 & 2) != 0)
            self->unkB8->var20 |= 1;
        self->unkB8->unk1A = 0xFFFF;
        self->unkB8->unk30 = oldSprite;
        self->unkB8->var24 = -1;
    }
    self->unk16 = self->unk16 & 0xFF;
    self->unkB8->unk2C = (const unk8*)self->unk0;
    self->unkB8->flip_h_v = self->unk31;
    self->unkB8->x = x << 8;
    self->unkB8->y = y << 8;
    self->unkB8->frame.word = self->unk22;
    self->unkB8->var16 = self->unk30;
    self->unkB8->unk28 = (const unk8*)self->unk0 + self->unk0->unk10;
    sprite = self->unkB8;
    oam = ((self->unk38 & 3) << 14) | ((~self->unk3A & 1) << 13) | ((self->unk39 & 3) << 10)
        | 0x1000 | ((self->unk38 & 0xC) << 28);
    sprite->unk10.word = oam;
    priority = (((self->unk3A >> 1) & 0xF) << 12);
    if (self->unk3C != NULL)
        priority |= ((sub_8059CB4(self->unk3C) + self->unk3B) & 3) << 10;
    else
        priority |= (self->unk3B & 3) << 10;
    sprite->oam_attr_2 = priority;
    sub_8060F64((SpriteEntry*)self->unkB8, self->unk12, self->unk14, self->unk16);
    sprite = self->unkB8;
    if (sprite->unk30 != NULL)
        sprite->unk10.word = (sprite->unk10.word & 0xC1FFFFFF)
            | ((sprite->unk30->x & 0x3E0) << 20) | 0x100;
}
#endif
INCLUDE_ASM("asm/dump/8057b80-debug/8057d88-renderActor.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8057fac.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8057fdc.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058038.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058068.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80580b4-GetSpriteSheetStructA.s");

void actor_80580C0(Actor* actor, unk16 sequence, unk16 callbackSequence)
{
    ActorConfig* config;
    ActorSequenceEntry* entry;
    unk32 index;
    unk16 offset;
    unk16 size;

    offset = 0;
    config = actor->unk0;
    entry = (ActorSequenceEntry*)((unk8*)config + config->unk18);
    index = 0;
    if (index < actor->unk28) {
        do {
            if (entry->unk0 == sequence) {
                actor->unk1C = offset;
                actor->unk1E = 0;
                actor->unk1A = sequence;
                actor->unk2E = callbackSequence;
                ActorSetFrameSequence(actor, entry->sequence);
                return;
            }
            size = entry->size;
            entry = (ActorSequenceEntry*)((unk8*)entry + size);
            offset += size;
            index++;
        } while (index < actor->unk28);
    }
}

INCLUDE_ASM("asm/dump/8057b80-debug/8058110.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058144.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805816c.s");

void sub_80581B8(Actor* actor)
{
    ActorConfig* config;
    unk16* frameTable;
    unk16 nextFrame;
    s32 currentFrame;
    s32 frameCount;
    s32 frame;
    void (*callback)(Actor*, s32);

    config = actor->unk0;
    frameTable = (unk16*)((unk8*)config + config->unk18 + actor->unk1C);
    currentFrame = actor->unk1E;
    frameCount = frameTable[2] - 1;
    if (currentFrame >= frameCount) {
        nextFrame = 0;
        if (actor->unk2E != -1) {
            frame = actor->unk1A;
            actor_80580C0(actor, actor->unk2E, 0xFFFF);
            callback = actor->unkC0;
            if (callback != NULL) {
                callback(actor, frame);
            }
            return;
        }
    } else {
        nextFrame = actor->unk1E + 1;
    }
    actor->unk1E = nextFrame;
    ActorSetFrameSequence(actor, frameTable[nextFrame + 4]);
}

void ActorSetFrameSequence(Actor* actor, unk32 sequence)
{
    ActorConfig* config;
    ActorFrameSequence* sequenceData;
    ActorFrame* frame;
    unk32 value;
    unk8 configFlags;
    unk8 flags;
    unk16 frameOffset;
    unk16 frameCount;
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

#if 0
void actor_8058638(Actor* actor)
{
    ActorFrameSequence* sequence;
    unk16 frameCount;
    unk16* frames;
    unk16 frameOffset;
    ActorConfig* config;
    unk32 baseValue;
    unk32 frameValue;
    unk16 effectiveFrameValue;

    config = actor->unk0;
    sequence = &config->sequences[actor->unk20];
    if ((actor->unk98 & 4) != 0) {
        frames = NULL;
    } else {
        frames = config->frameValues + config->unk8;
        if (frames == config->frameValuesEnd) {
            frames = NULL;
        }
    }
    baseValue = actor->unk34 + actor->unk36;
    frameValue = (frames != NULL ? baseValue + frames[actor->unk22] : baseValue) << 16;
    effectiveFrameValue = frameValue >> 16;
    if (effectiveFrameValue < _unk3000E30[2]) {
        effectiveFrameValue = _unk3000E30[2];
    }
    if (_unk3000E30[0] - actor->unk58 < effectiveFrameValue) {
        return;
    }
    actor->unk58 += effectiveFrameValue;
    frameOffset = sequence->unk0;
    frameCount = sequence->unk2;
    actor->unk60 = actor->unk22;
    if ((actor->unk33 & 2) != 0) {
        actor->unk22--;
    } else {
        actor->unk22++;
    }
    if (actor->unk22 > frameOffset + (frameCount - 1)) {
        if ((sequence->flag & 1) != 0) {
            sequence->flag ^= 2;
            actor->unk22 = frameOffset + (frameCount - 2);
        } else {
            actor->unk22 = frameOffset;
        }
        actor->unk24++;
    }
    if (actor->unk22 < frameOffset) {
        if ((sequence->flag & 1) != 0) {
            sequence->flag ^= 2;
            actor->unk22 = frameOffset + 1;
        } else {
            actor->unk22 = frameOffset + (frameCount - 1);
        }
        actor->unk24++;
    }
    if (actor->unk32 != 0 && actor->unk24 >= actor->unk32) {
        sub_80581B8(actor);
    }
}

#endif
INCLUDE_ASM("asm/dump/8057b80-debug/8058638-actor_8058638.s");

void sub_8058754(Actor* actor, unk32* output)
{
    if (actor->unkB0 != NULL) {
        actor->unkB0(actor, output);
    } else {
        output[0] = actor->x;
        output[1] = actor->y;
        output[2] = actor->z;
    }
}

void renderActor2(Actor* actor)
{
    renderActor(actor, 0);
}

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
