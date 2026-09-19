#include "particle.h"

#include "common.h"
#include "debug.h"
#include "include_asm.h"
#include "memory.h"
#include "ram.h"
#include "sprite.h"

extern const s16 word_8074D64[];

void allocateParticleSystem(
    ParticleSystem* arg0, s32 arg1, const SpriteSheet* arg2, BGLayer* arg3, unk32 arg4)
{
    AllocatedBlock* block;
    Particle* particle;
    unk32 bytes;
    unk32 count;

    arg4 <<= 24;
    bytes = arg1 * 0x24;
    if (arg4 != 0) {
        block = fastAllocate(bytes);
    } else {
        block = slowAllocate(bytes);
    }
    if (block == NULL) {
        printf("Error allocating %i bytes for particle System\n", bytes);
    }
    arg0->unk30 = block;
    arg0->unk6 = 0;
    count = arg1;
    arg0->count = arg1;
    arg0->unk0 = arg2;
    particle = NULL;
    if (block != NULL) {
        particle = block->address;
    }
    arg0->particles = particle;
    arg0->unkC = arg3;
    arg0->unk20 = 0;
    arg0->unk1C = 0;
    arg0->unk2C = 0;
    arg0->unk28 = 0;
    arg0->unk24 = 0;
    arg0->unk18 = 0;
    arg0->unk14 = 0;
    arg0->unk10 = 0;
    if (particle != NULL) {
        arg1--;
        if (count != 0) {
            do {
                particle->sprite = allocSprite(0x80);
                particle->unk22 = 0;
                particle->unk20 = 0;
                particle->unk1E = 0;
                particle->unk1C = 0;
                particle->unk1A = 0;
                particle->unk14 = 0;
                particle->unk12 = 0;
                particle->unk10 = 0;
                particle->unkC = 0;
                particle->unk8 = 0;
                particle->unk4 = 0;
                if (particle->sprite != NULL) {
                    LoadSpriteSheet(particle->sprite, arg2, 0, 0xA000, 0, 0, 0, 0);
                }
                particle++;
            } while (arg1-- != 0);
        }
    }
}

void sub_804E530(ParticleSystem* arg0, unk32 arg1)
{
    Particle* particle;
    s32 count;

    count = arg0->count;
    particle = arg0->particles;
    if (count-- != 0) {
        do {
            if (particle->sprite != NULL) {
                sub_8061078(particle->sprite, arg1);
            }
            particle++;
        } while (count-- != 0);
    }
}

void sub_804E560(ParticleSystem* arg0, unk32 arg1, unk32 arg2, unk32 arg3)
{
    arg0->unk24 = arg0->unk10;
    arg0->unk28 = arg0->unk14;
    arg0->unk2C = arg0->unk18;
    arg0->unk10 = arg1;
    arg0->unk14 = arg2;
    arg0->unk18 = arg3;
}

void sub_804E57C(ParticleSystem* arg0, unk32 arg1, unk32 arg2)
{
    arg0->unk1C = arg1;
    arg0->unk20 = arg2;
}

void sub_804E584(ParticleSystem* arg0, unk32 arg1, unk32 arg2, unk32 arg3)
{
    arg0->unk24 = arg1;
    arg0->unk10 = arg1;
    arg0->unk28 = arg2;
    arg0->unk14 = arg2;
    arg0->unk2C = arg3;
    arg0->unk18 = arg3;
}

void sub_804E594(ParticleSystem* system, s16 arg1, s16 arg2, unk16 arg3, unk16 arg4, s16 arg5)
{
    Particle* particle;
    SpriteEntry* sprite;
    const ActorFrameSequence* frame;
    s32 tableIndex;
    s32 x;
    s32 y;
    s32 z;

    particle = &system->particles[system->unk6];
    tableIndex = ((_unk3000E30[0] >> 3) + system->unk6) & 0x1F;
    x = (word_8074D64[tableIndex] * arg2) >> 8;
    y = (word_8074D64[tableIndex + 1] * arg2) >> 8;
    z = (word_8074D64[tableIndex + 2] * arg2) >> 8;
    sprite = particle->sprite;
    frame = &system->unk0->sequences[arg5];
    particle->unk1A = arg3;
    particle->unkC = 0;
    particle->unk8 = 0;
    particle->unk4 = 0;
    particle->unk16 = system->unk1C;
    particle->unk18 = system->unk20;
    particle->unk10 = x + (((system->unk10 - system->unk24) * arg1) >> 8);
    particle->unk12 = y + (((system->unk14 - system->unk28) * arg1) >> 8);
    particle->unk14 = z + (((system->unk18 - system->unk2C) * arg1) >> 8);
    particle->unk22 = arg4;
    particle->unk20 = arg4;
    particle->unk1C = frame->unk0;
    particle->unk1E = frame->unk2;
    if (sprite != NULL) {
        sprite->frame.word = particle->unk1C;
    }
    if (++system->unk6 >= system->count) {
        system->unk6 = 0;
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804e6a4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e7d4.s");

void sub_804E910(ParticleSystem* system, s16 scale, unk16 velocity, unk16 spread, unk16 lifetime,
    unk16 timer, s16 sequence)
{
    s32 count;
    Particle* particle;
    s32 index;
    s32 dx, dy, dz;
    const ActorFrameSequence* frame;
    SpriteEntry* sprite;
    s32 x, y, z;
    s32 lifetimeValue;

    count = system->count;
    particle = system->particles;
    index = (_unk3000E30[0] >> 3) & 0x1F;
    dx = ((system->unk10 - system->unk24) * scale) >> 8;
    dy = ((system->unk14 - system->unk28) * scale) >> 8;
    dz = ((system->unk18 - system->unk2C) * scale) >> 8;
    frame = &system->unk0->sequences[sequence];
    while (count-- != 0) {
        sprite = particle->sprite;
        x = (word_8074D64[index++] * (s16)velocity) >> 8;
        y = (word_8074D64[index++] * (s16)velocity) >> 8;
        z = (word_8074D64[index++] * (s16)velocity) >> 8;
        index &= 0x1F;
        lifetimeValue = (unk16)word_8074D64[index] + (s16)lifetime;
        particle->unk1A = lifetimeValue;
        particle->unk4 = ((s16)spread * word_8074D64[index++]) >> 8;
        particle->unk8 = ((s16)spread * word_8074D64[index++]) >> 8;
        particle->unkC = ((s16)spread * word_8074D64[index++]) >> 8;
        index &= 0x1F;
        particle->unk10 = x + dx;
        particle->unk12 = y + dy;
        particle->unk14 = z + dz;
        particle->unk20 = particle->unk22 = timer;
        particle->unk1C = frame->unk0;
        particle->unk1E = frame->unk2;
        if (sprite != NULL) {
            sprite->frame.word = particle->unk1C;
        }
        particle++;
    }
}

void sub_804EA88(ParticleSystem* arg0)
{
    s32 count;
    Particle* particle;
    BGLayer* aux;
    unk32 systemX;
    unk32 systemY;
    unk32 systemZ;
    unk32 dx;
    unk32 dy;
    unk32 dz;

    count = arg0->count;
    particle = arg0->particles;
    aux = arg0->unkC;
    systemX = arg0->unk10;
    systemY = arg0->unk14;
    systemZ = arg0->unk18;
    dx = arg0->unk24 - systemX;
    dy = arg0->unk28 - systemY;
    dz = arg0->unk2C - systemZ;
    while (count-- != 0) {
        SpriteEntry* sprite;

        if (particle->unk1A != 0) {
            particle->unk4 += dx;
            particle->unk8 += dy;
            particle->unkC += dz;
            sprite = particle->sprite;
            if (sprite != NULL) {
                s32 x;
                s32 y;
                unk32 z;
                s32 screenX;
                s32 screenY;
                unk32 timer;

                particle->unk4 += particle->unk10;
                particle->unk8 += particle->unk12;
                particle->unkC += particle->unk14;
                x = particle->unk4 + systemX;
                y = particle->unk8 + systemY;
                z = particle->unkC + systemZ;
                if (aux != NULL) {
                    screenX = (x - y) + (particle->unk16 << 8);
                    screenY = (((x + y) >> 1) - z) + (particle->unk18 << 8);
                } else {
                    screenX = x + (particle->unk16 << 8);
                    screenY = y + (particle->unk18 << 8);
                }
                if (aux != NULL) {
                    screenX -= aux->field_40 & 0xFFFFFF00;
                    screenY -= aux->field_44 & 0xFFFFFF00;
                }
                particle->unk1A--;
                if (screenX > -0x400 && screenX <= 0xF3FF && screenY > -0x400 && screenY <= 0xA3FF
                    && particle->unk1A != 0) {
                    sprite->x = screenX - 0x400;
                    sprite->y = screenY - 0x400;
                } else {
                    sprite->y = 0xA000;
                }
                timer = particle->unk20;
                if (timer > 0x10) {
                    particle->unk20 = timer - 0x10;
                } else {
                    particle->unk20 = timer + (particle->unk22 - 0x10);
                    sprite->frame.word++;
                    if (sprite->frame.word >= particle->unk1C + particle->unk1E) {
                        sprite->frame.word = particle->unk1C;
                    }
                }
            }
        }
        particle++;
    }
}

void sub_804EBE8(ParticleSystem* arg0)
{
    s32 count;
    Particle* particle;

    count = arg0->count;
    particle = arg0->particles;
    if (arg0->unk30 != NULL) {
        deallocateBlock(arg0->unk30);
    }
    while (count-- != 0) {
        sub_8060A94(particle->sprite);
        particle++;
    }
}

ASM_ZEROPAD
