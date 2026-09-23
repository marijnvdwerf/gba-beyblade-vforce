#include "actor.h"

#include <agb/types.h>

#include "geometry.h"
#include "include_asm.h"
#include "layer.h"
#include "memory.h"
#include "sprite.h"
#include "system.h"
#include "unsorted.h"

void sub_80581B8(Actor*);
const ActorFrameSequence* GetSpriteSheetStructA(Actor*, unk32);
const unk16* sub_8058924(const SpriteSheet*);
void actor_80580C0(Actor*, unk16, unk16);
void ActorSetFrameSequence(Actor*, unk32);
void sub_8058838(Actor*);
void actor_8058638(Actor*);
void renderActor(Actor*, unk32);

void actor_8057C58(Actor* actor, const SpriteSheet* config, BGLayer* arg2, unk32 arg3, unk32 arg4,
    unk32 arg5, unk32 arg6)
{

    actor->unk0 = config;
    actor->unk58 = _unk3000E30[0];
    actor->unk3C = arg2;
    actor->unk70 = arg6;
    actor->x = arg3 << 8;
    actor->y = arg4 << 8;
    actor->z = arg5 << 8;
    actor->unk16 = 0;
    actor->unk12 = 0x100;
    actor->unk14 = 0x100;
    actor->unkA0 = 0;
    actor->unkA2 = 0;
    actor->unkA4 = 0;
    actor->unkA5 = 0;
    actor->unk40 = 0;
    actor->unk44 = 0;
    actor->unk48 = 0;
    actor->unk4C = 0;
    actor->unk50 = 0;
    actor->unk54 = 0;
    actor->unk68 = 0x10;
    actor->unk18 = 0;
    actor->unk64 = 0;
    actor->unk22 = 0;
    actor->unk60 |= -1;
    actor->unk1A |= -1;
    actor->unk1C = 0;
    actor->unk1E = 0;
    actor->unk20 = 0;
    actor->unk2C = 0;
    actor->unk2E |= -1;
    actor->unk10 = config->unk4;
    actor->unk11 = config->unk5;
    actor->unk30 = config->unk6;
    actor->unk2A = config->unk8;
    actor->unk38 = config->unk7;
    actor->unk28 = config->unk14;
    actor->unk31 = 0;
    actor->unk39 = 0;
    actor->unk3B = 0;
    actor->unk3A = config->unkC;
    actor->unk6C = 0;
    actor->unk74 = -1;
    actor->unk78 = NULL;
    actor->unk7C = NULL;
    actor->unk80 = NULL;
    actor->unk84 = -1;
    actor->unk88 = 0;
    actor->unk8C = 0;
    actor->unk8D = 0;
    actor->unk98 = 0;
    actor->callbacks.unk0 = NULL;
    actor->callbacks.unk4 = NULL;
    actor->unkB0 = NULL;
    actor->unkB4.lineIndex = 0;
    rider_8058614(actor, actor->unk10 >> 1, actor->unk11, 0);
    actor_80585F8(actor, 0, 0, actor->unk10, actor->unk11);
    actor->unkB8 = NULL;
    actor->unkBC = 0;
    ActorSetFrameSequence(actor, 0);
    actor->unkC0 = NULL;
}

void renderActor(Actor* actor, unk32 arg1)
{
    s32 position[3];
    s32 x;
    s32 y;

    if (actor->unkB0 != NULL) {
        actor->unkB0(actor, position);
        x = position[0] >> 8;
        y = position[1] >> 8;
    } else {
        x = actor->x >> 8;
        y = actor->y >> 8;
    }
    if (actor->unk3C != NULL) {
        x -= actor->unk3C->field_40 >> 8;
        y -= actor->unk3C->field_44 >> 8;
    }
    if ((actor->unk31 & 1) != 0) {
        x -= actor->unkA0 - actor->unkA4;
    } else {
        x -= actor->unkA0 + actor->unkA4;
    }
    y -= actor->unkA2 + actor->unkA5;
    if (actor->unk70 == 0 || x + ((actor->unk10 * actor->unk12) >> 8) < 0 || x > 0xEF
        || y + ((actor->unk11 * actor->unk14) >> 8) < 0 || y > 0x9F) {
        if (actor->unkB8 != NULL) {
            sub_8060A94(actor->unkB8);
            actor->unkB8 = NULL;
        }
        return;
    }
    if (actor->unkB8 == NULL) {
        actor->unkB8 = allocSprite(actor->unkBC);
        if (actor->unkB8 == NULL) {
            return;
        }
        actor->unkB8->var20 = 0;
        if ((actor->unk98 & 2) != 0) {
            actor->unkB8->var20 |= 1;
        }
        actor->unkB8->unk1A = 0xFFFF;
        actor->unkB8->unk30 = NULL;
        actor->unkB8->var24 = -1;
    }
    actor->unk16 &= 0xFF;
    actor->unkB8->unk2C = actor->unk0;
    actor->unkB8->flip_h_v = actor->unk31;
    actor->unkB8->x = x << 8;
    actor->unkB8->y = y << 8;
    actor->unkB8->frame.word = actor->unk22;
    actor->unkB8->var16 = actor->unk30;
    actor->unkB8->unk28 = (const unk8*)actor->unk0 + actor->unk0->unk10;
    actor->unkB8->unk10 = ((actor->unk38 & 3) << 14) | ((~actor->unk3A & 1) << 13) | 0x1000
        | ((actor->unk39 & 3) << 10) | ((actor->unk38 & 0xC) << 28);
    actor->unkB8->oam_attr_2 = (((actor->unk3A >> 1) & 0xF) << 12)
        | ((actor->unk3C != NULL ? sub_8059CB4(actor->unk3C) + actor->unk3B : actor->unk3B) & 3)
            << 10;
    sub_8060F64(actor->unkB8, actor->unk12, actor->unk14, actor->unk16);
    if (actor->unkB8->unk30 != NULL) {
        actor->unkB8->unk10 = (actor->unkB8->unk10 & 0xC1FFFFFF) | 0x100
            | ((actor->unkB8->unk30->oamAddr & 0x3E0) << 20);
    }
}

void sub_8057FAC(Actor* actor, const Actor* source, unk32 x, unk32 y, unk32 z)
{
    memcpy(actor, source, sizeof(Actor));
    actor->x = x << 8;
    actor->y = y << 8;
    actor->z = z;
    actor->unk6C = source;
}

s32 sub_8057FDC(Actor* actor, s32 sequenceIndex)
{
    const ActorFrameSequence* sequence;
    const SpriteSheet* sheet;
    const unk16* extras;
    unk32 frameCount;
    unk32 total;
    unk32 remaining;
    unk16 frameOffset;
    s32 sheetCount;
    const unk16* cursor;

    sheet = actor->unk0;
    sequence = GetSpriteSheetStructA(actor, sequenceIndex);
    extras = sub_8058924(sheet);
    frameCount = sequence->unk2;
    total = sequence->unk4 * frameCount;
    frameOffset = sequence->unk0;
    sheetCount = sheet->unk8;
    if (sequenceIndex >= sheetCount) {
        return 0;
    }
    if (extras != NULL && (actor->unk98 & 4) == 0 && frameCount != 0) {
        cursor = extras + frameOffset;
        for (remaining = frameCount; remaining != 0; remaining--) {
            total += *cursor++;
        }
    }
    return total;
}

ActorSequenceEntry* sub_8058038(Actor* actor, unk16 sequence)
{
    ActorSequenceEntry* entry;
    unk32 index;

    entry = (ActorSequenceEntry*)((unk8*)actor->unk0 + actor->unk0->unk18);
    for (index = 0; index < actor->unk28; index++) {
        if (entry->unk0 == sequence) {
            return entry;
        }
        entry = (ActorSequenceEntry*)((unk8*)entry + entry->size);
    }
    return NULL;
}

s32 sub_8058068(Actor* actor, unk16 sequence)
{
    ActorSequenceEntry* entry;
    unk32 total;
    unk32 index;

    total = 0;
    entry = sub_8058038(actor, sequence);
    if (entry == NULL) {
        return 0;
    }
    for (index = 0; index < entry->unk4; index++) {
        total += sub_8057FDC(actor, *(entry->frames + index)); // TODO: fakematch?
    }
    return total;
}

const ActorFrameSequence* GetSpriteSheetStructA(Actor* actor, unk32 index)
{
    const ActorFrameSequence* sequences;

    sequences = actor->unk0->sequences;
    return sequences + index;
}

// TODO: reduce casts
void actor_80580C0(Actor* actor, unk16 sequence, unk16 callbackSequence)
{
    const ActorSequenceEntry* entry;
    unk32 index;
    unk16 offset;
    unk16 size;

    offset = 0;
    entry = (const ActorSequenceEntry*)((const unk8*)actor->unk0 + actor->unk0->unk18);
    for (index = 0; index < actor->unk28; index++) {
        if (entry->unk0 == sequence) {
            actor->unk1C = offset;
            actor->unk1E = 0;
            actor->unk1A = sequence;
            actor->unk2E = callbackSequence;
            ActorSetFrameSequence(actor, entry->frames[0]);
            return;
        }
        size = entry->size;
        entry = (const ActorSequenceEntry*)((const unk8*)entry + size);
        offset += size;
    }
}

const ActorFrameSequence* sub_8058110(Actor* actor, unk32 sequence)
{
    const ActorSequenceEntry* entry;
    unk32 index;

    entry = (const ActorSequenceEntry*)((const unk8*)actor->unk0 + actor->unk0->unk18);
    for (index = 0; index < actor->unk28; index++) {
        if (entry->unk0 == sequence) {
            return GetSpriteSheetStructA(actor, entry->frames[0]);
        }
        entry = (const ActorSequenceEntry*)((const unk8*)entry + entry->size);
    }
    return NULL;
}

s32 sub_8058144(Actor* actor)
{
    const ActorSequenceEntry* frameTable;

    frameTable
        = (const ActorSequenceEntry*)((const unk8*)actor->unk0 + actor->unk0->unk18 + actor->unk1C);
    return actor->unk22 - GetSpriteSheetStructA(actor, frameTable->frames[0])->unk0;
}

void sub_805816C(Actor* actor, unk16 sequence)
{
    const ActorSequenceEntry* entry;
    unk32 index;
    unk16 offset;
    unk16 size;

    offset = 0;
    entry = (const ActorSequenceEntry*)((const unk8*)actor->unk0 + actor->unk0->unk18);
    for (index = 0; index < actor->unk28; index++) {
        if (entry->unk0 == sequence) {
            actor->unk1C = offset;
            actor->unk1E = 0;
            actor->unk1A = sequence;
            actor->unk2E = -1;
            ActorSetFrameSequence(actor, entry->frames[0]);
            return;
        }
        size = entry->size;
        entry = (const ActorSequenceEntry*)((const unk8*)entry + size);
        offset += size;
    }
}

void sub_80581B8(Actor* actor)
{
    const unk16* frameTable;
    unk16 nextFrame;
    s32 currentFrame;
    s32 frame;
    void (*callback)(Actor*, s32);

    frameTable = (const unk16*)((const unk8*)actor->unk0 + actor->unk0->unk18 + actor->unk1C);
    currentFrame = actor->unk1E;
    if (currentFrame >= frameTable[2] - 1) {
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
    const SpriteSheet* config;
    const ActorFrameSequence* sequenceData;
    const ActorFrame* frame;
    unk32 value;
    unk8 flags;
    unk16 frameOffset;
    unk16 frameCount;

    sequenceData = &actor->unk0->sequences[sequence];
    config = actor->unk0;
    value = config->unk0 << 1;
    if ((value & 2) != 0) {
        value += 2;
    }
    if ((config->unk7 & 0x10) != 0) {
        frame = (const ActorFrame*)((const unk8*)&config->sequences[config->unk8] + value);
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
        actor->unk22 = frameCount + 0xFFFF + frameOffset;
    } else {
        actor->unk22 = frameOffset;
    }
    actor->unk31 ^= (flags & 0xC) >> 2;
}

void sub_80582D0(Actor* actor, unk16 sequence, unk16 frame, unk16 callbackSequence)
{
    const ActorSequenceEntry* entry;
    unk32 index;
    unk16 offset;
    unk16 size;
    const unk16* frames;

    offset = 0;
    entry = (const ActorSequenceEntry*)((const unk8*)actor->unk0 + actor->unk0->unk18);
    for (index = 0; index < actor->unk28; index++) {
        if (entry->unk0 == sequence && frame < entry->unk4) {
            actor->unk1C = offset;
            actor->unk1E = frame;
            actor->unk1A = sequence;
            actor->unk2E = callbackSequence;
            frames = entry->frames;
            ActorSetFrameSequence(actor, frames[frame]);
            return;
        }
        size = entry->size;
        entry = (const ActorSequenceEntry*)((const unk8*)entry + size);
        offset += size;
    }
}

void sub_805832C(
    Actor* actor, unk16 sequence, unk16 frame, unk16 callbackSequence, unk16 frameSequence)
{
    const ActorSequenceEntry* entry;
    unk32 index;
    unk16 offset;
    unk16 size;
    const unk16* frames;

    offset = 0;
    entry = (const ActorSequenceEntry*)((const unk8*)actor->unk0 + actor->unk0->unk18);
    for (index = 0; index < actor->unk28; index++) {
        if (entry->unk0 == sequence && frame < entry->unk4) {
            actor->unk1C = offset;
            actor->unk1E = 0;
            actor->unk1A = sequence;
            actor->unk2E = callbackSequence;
            frames = entry->frames;
            ActorSetFrame(actor, frames[frame], frameSequence);
            return;
        }
        size = entry->size;
        entry = (const ActorSequenceEntry*)((const unk8*)entry + size);
        offset += size;
    }
}

void sub_8058390(Actor* actor, unk16 sequence, unk16 frame, unk16 callbackSequence)
{
    const unk16* frames;
    const unk8* cursor;
    unk32 index;

    cursor = (const unk8*)actor->unk0 + actor->unk0->unk18;
    for (index = 0; index < actor->unk28; index++) {
        if (((const ActorSequenceEntry*)cursor)->unk0 == sequence
            && frame < ((const ActorSequenceEntry*)cursor)->unk4) {
            actor->unk2E = callbackSequence;
            frames = ((const ActorSequenceEntry*)cursor)->frames;
            ActorSetFrameSequence(actor, frames[frame]);
            return;
        }
        cursor += ((const ActorSequenceEntry*)cursor)->size;
    }
}

void ActorSetFrame(Actor* actor, unk32 sequence, unk16 frameIndex)
{
    const SpriteSheet* config;
    const ActorFrameSequence* sequenceData;
    const ActorFrame* frameData;
    unk32 value;
    unk8 flags;
    unk16 frameOffset;
    unk16 frameCount;

    sequenceData = GetSpriteSheetStructA(actor, sequence);
    config = actor->unk0;
    value = config->unk0 << 1;
    if ((value & 2) != 0) {
        value += 2;
    }
    if ((config->unk7 & 0x10) != 0) {
        frameData = (const ActorFrame*)((const unk8*)&config->sequences[config->unk8] + value);
        if (frameData != NULL) {
            frameData += sequence;
            actor->unkA4 = frameData->unk0;
            actor->unkA5 = frameData->unk1;
        }
    }
    frameOffset = sequenceData->unk0;
    frameCount = sequenceData->unk2;
    if (frameIndex < frameCount) {
        flags = sequenceData->unk7;
        actor->unk32 = sequenceData->unk6;
        actor->unk33 = flags;
        actor->unk34 = sequenceData->unk4;
        actor->unk36 = 0;
        actor->unk26 = frameCount;
        actor->unk20 = sequence;
        actor->unk24 = 0;
        actor->unk22 = frameOffset + frameIndex;
        actor->unk31 = (flags & 0xC) >> 2;
    }
}

void sub_8058478(Actor* actor, unk32 sequence)
{
    const ActorFrameSequence* currentSequence;
    const ActorFrameSequence* sequenceData;
    s32 frame;

    currentSequence = GetSpriteSheetStructA(actor, actor->unk20);
    sequenceData = GetSpriteSheetStructA(actor, sequence);
    frame = actor->unk22 - currentSequence->unk0;
    if (frame < sequenceData->unk2) {
        ActorSetFrame(actor, sequence, frame);
    } else {
        ActorSetFrameSequence(actor, sequence);
    }
}

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

void sub_80585E8(Actor* actor, unk8 arg1)
{
    actor->unk8C = arg1;
}

void actor_80585F0(Actor* arg0, unk8 arg1)
{
    arg0->unk8D = arg1;
}

void actor_80585F8(Actor* actor, s16 arg1, s16 arg2, s16 arg3, s16 arg4)
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

void ActorSetSpriteOffset(Actor* actor, s32 arg1, s32 arg2)
{
    actor->unkA0 = arg1;
    actor->unkA2 = arg2;
}

void sub_8058630(Actor* actor, void (*callback)(Actor*, s32))
{
    actor->unkC0 = callback;
}

void actor_8058638(Actor* actor)
{
    const ActorFrameSequence* sequence;
    const unk16* frames;
    s32 baseDelay;
    unk16 delay;
    unk16 frameCount;
    unk16 frameOffset;

    sequence = &actor->unk0->sequences[actor->unk20];
    if ((actor->unk98 & 4) != 0) {
        frames = NULL;
    } else if ((const unk16*)&actor->unk0->sequences[actor->unk0->unk8]
        == (const unk16*)((const unk8*)actor->unk0 + actor->unk0->unk18)) {
        frames = NULL;
    } else {
        frames = (const unk16*)&actor->unk0->sequences[actor->unk0->unk8];
    }
    baseDelay = actor->unk34 + actor->unk36;
    delay = frames != NULL ? frames[actor->unk22] + baseDelay : baseDelay;
    if (delay < _unk3000E30[2]) {
        delay = _unk3000E30[2];
    }
    if (_unk3000E30[0] - actor->unk58 < delay) {
        return;
    }
    actor->unk58 += delay;
    frameOffset = sequence->unk0;
    frameCount = sequence->unk2;
    actor->unk60 = actor->unk22;
    if ((actor->unk33 & 2) != 0) {
        actor->unk22--;
    } else {
        actor->unk22++;
    }
    if (actor->unk22 > frameOffset + (frameCount - 1)) {
        if ((actor->unk33 & 1) != 0) {
            actor->unk33 ^= 2;
            actor->unk22 = frameOffset + (frameCount - 2);
        } else {
            actor->unk22 = frameOffset;
        }
        actor->unk24++;
    }
    if (actor->unk22 < frameOffset) {
        if ((actor->unk33 & 1) != 0) {
            actor->unk33 ^= 2;
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

void sub_8058784(Actor* actor, unk8 arg1)
{
    actor->unk31 ^= arg1;
}

void sub_8058794(Actor* actor, ActorTimerCallback callback, unk32 arg2, unk32 arg3, unk32 arg4)
{
    AllocatedBlock* block;
    ActorTimerEntry* entries;
    ActorTimerEntry* cursor;
    ActorTimerEntry* entry;
    s32 firstFree;
    s32 freeCount;
    s32 index;

    if (actor->unk74 == -1) {
        actor->unk74 = 0;
        block = slowAllocate(sizeof(ActorTimerEntry) * 4);
        if (block == NULL) {
            nullsub_8("Error allocating memory for actor motion modifiers\n");
            return;
        }
        actor->unk7C = block;
        actor->unk78 = block->address;
    }
    if (actor->unk74 > 3) {
        firstFree = -1;
        freeCount = 0;
        index = 0;
        entries = actor->unk78;
        cursor = entries;
        while (index <= 3) {
            if (cursor->unk0 == 0) {
                if (firstFree < 0) {
                    firstFree = index;
                }
                freeCount++;
            }
            cursor++;
            index++;
        }
        if (firstFree == -1) {
            entry = entries;
        } else {
            entry = &entries[firstFree];
        }
        if (freeCount == 4) {
            actor->unk74 = 0;
            entry = entries;
        }
    } else {
        entry = &actor->unk78[actor->unk74];
    }
    entry->unk8 = callback;
    entry->unk0 = arg3;
    entry->unk4 = arg4;
    entry->unkC = arg2;
    actor->unk74++;
}

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

void sub_80588DC(Actor* actor)
{
    s32 count;
    s16 index;
    ActorTimerEntry* entry;

    count = actor->unk74;
    if (count != -1) {
        for (index = 0; index < count; index++) {
            entry = &actor->unk78[index];
            entry->unk0 = 0;
        }
        actor->unk74 = 0;
    }
}

void nullsub_49(void)
{
}

void nullsub_50(void)
{
}

void nullsub_11(void)
{
}

void nullsub_51(void)
{
}

const unk16* sub_8058924(const SpriteSheet* spriteSheet)
{
    const unk16* frameTable;

    frameTable = &spriteSheet->sequences[spriteSheet->unk8].unk0;
    if (frameTable == (const unk16*)((const unk8*)spriteSheet + spriteSheet->unk18)) {
        return NULL;
    }
    return frameTable;
}

const unk8* sub_805893C(Actor* actor)
{
    const SpriteSheet* config;
    unk32 value;

    config = actor->unk0;
    value = config->unk0 << 1;
    if ((value & 2) != 0) {
        value += 2;
    }
    if ((config->unk7 & 0x10) == 0) {
        return NULL;
    }
    return (const unk8*)&config->sequences[config->unk8] + value;
}

ASM_ZEROPAD
