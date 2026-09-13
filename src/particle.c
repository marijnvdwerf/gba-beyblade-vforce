#include "particle.h"

#include "common.h"
#include "debug.h"
#include "include_asm.h"
#include "memory.h"
#include "ram.h"
#include "sprite.h"

extern const s16 word_8074D64[];
extern const unk8 Str_8727018[];

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
        printf(Str_8727018, bytes);
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

INCLUDE_ASM("asm/dump/804a388-tutorial/804e57c.s");

void sub_804E584(ParticleSystem* arg0, unk32 arg1, unk32 arg2, unk32 arg3)
{
    arg0->unk24 = arg1;
    arg0->unk10 = arg1;
    arg0->unk28 = arg2;
    arg0->unk14 = arg2;
    arg0->unk2C = arg3;
    arg0->unk18 = arg3;
}

#if 0
void sub_804E594(ParticleSystem* arg0, unk32 arg1, unk32 arg2, unk16 arg3, unk16 arg6, s16 arg7)
{
    Particle* particle;
    SpriteEntry* previous;
    s32 tableIndex;
    s32 scale;
    s32 x;
    s32 y;
    s32 z;
    unk16 spriteFrame;
    s16 arg1s;
    s16 arg2s;
    const s16* table;
    const s16* tableBase;
    const ParticleFrameData* frameData;
    s16 index;
    unk16 count;

    index = arg0->unk6;
    particle = &arg0->particles[index];
    table = word_8074D64;
    tableBase = table;
    tableIndex = (_unk3000E30[0] >> 3) + index;
    tableIndex &= 0x1F;
    arg1s = arg1;
    arg2s = arg2;
    scale = ((s32)tableBase[tableIndex] * arg2s) >> 8;
    x = scale;
    scale = ((s32)tableBase[tableIndex + 1] * arg2s) >> 8;
    y = scale;
    scale = ((s32)tableBase[tableIndex + 2] * arg2s) >> 8;
    z = scale;
    previous = particle->sprite;
    frameData = &arg0->unk0[arg7 + 4];
    particle->unk1A = arg3;
    particle->unkC = 0;
    particle->unk8 = 0;
    particle->unk4 = 0;
    particle->unk16 = arg0->unk1C;
    particle->unk18 = arg0->unk20;
    particle->x = x + (((arg0->unk10 - arg0->unk24) * arg1s) >> 8);
    particle->y = y + (((arg0->unk14 - arg0->unk28) * arg1s) >> 8);
    particle->z = z + (((arg0->unk18 - arg0->unk2C) * arg1s) >> 8);
    particle->unk22 = arg6;
    particle->unk20 = arg6;
    spriteFrame = frameData->frame0;
    particle->unk1C = spriteFrame;
    particle->unk1E = frameData->frame1;
    if (previous != NULL) {
        previous->frame.word = spriteFrame;
    }
    arg0->unk6++;
    count = arg0->count;
    if (arg0->unk6 >= count) {
        arg0->unk6 = 0;
    }
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/804e594.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e6a4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e7d4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e910.s");

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
