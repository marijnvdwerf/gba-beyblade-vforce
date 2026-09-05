#include "particle.h"

#include "common.h"
#include "include_asm.h"
#include "memory.h"
#include "sprite.h"

#if 0
void allocateParticleSystem(
    ParticleSystem* arg0, unk32 arg1, const void* arg2, unk32 arg3, unk32 arg4)
{
    AllocatedBlock* block;
    unk8* particle;
    unk32 bytes;
    unk32 i;
    unk32 zero;
    SpriteEntry* sprite;

    arg4 <<= 24;
    bytes = arg1 * 0x24;
    if (arg4 != 0) {
        block = fastAllocate(bytes);
    } else {
        block = slowAllocate(bytes);
    }
    if (block == NULL) {
        printf((const unk8*)Str_8727018, bytes);
    }
    arg0->unk30 = block;
    arg0->unk6 = 0;
    arg0->count = arg1;
    arg0->unk0 = (unk32)arg2;
    particle = NULL;
    if (block != NULL) {
        particle = block->address;
    }
    arg0->particles = (Particle*)particle;
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
        i = arg1 - 1;
        if (arg1 != 0) {
            do {
                zero = 0;
                sprite = allocSprite(0x80);
                *(SpriteEntry**)particle = sprite;
                *(unk16*)(particle + 0x22) = zero;
                *(unk16*)(particle + 0x20) = zero;
                *(unk16*)(particle + 0x1E) = zero;
                *(unk16*)(particle + 0x1C) = zero;
                *(unk16*)(particle + 0x1A) = zero;
                *(unk16*)(particle + 0x14) = zero;
                *(unk16*)(particle + 0x12) = zero;
                *(unk16*)(particle + 0x10) = zero;
                *(unk32*)(particle + 0xC) = zero;
                *(unk32*)(particle + 0x8) = zero;
                *(unk32*)(particle + 0x4) = zero;
                if (sprite != NULL) {
                    LoadSpriteSheet(sprite, arg2, 0, 0xA000, 0, 0, 0, 0);
                }
                particle += 0x24;
            } while (i-- != 0);
        }
    }
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/804e468-allocateParticleSystem.s");

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
void sub_804E594(ParticleSystem* arg0, unk32 arg1, unk32 arg2, unk16 arg3, unk16 arg6, unk32 arg7)
{
    Particle* particle;
    SpriteEntry* previous;
    s32 tableIndex;
    s32 scale;
    s32 x;
    s32 y;
    s32 z;
    u16 spriteFrame;
    s16 arg1s;
    s16 arg2s;
    const s16* table;
    const s16* tableBase;
    const unk16* frameData;
    s16 index;

    index = arg0->unk6;
    particle = &arg0->particles[index];
    table = (const s16*)(const unk8*)0x8074D64;
    table += 0;
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
    arg7 = (arg7 << 16) >> 13;
    arg7 += 0x20;
    frameData = (const unk16*)(arg0->unk0 + arg7);
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
    spriteFrame = frameData[0];
    particle->unk1C = spriteFrame;
    particle->unk1E = frameData[1];
    if (previous != NULL) {
        previous->frame.word = spriteFrame;
    }
    arg0->unk6++;
    if (arg0->unk6 >= (u16)arg0->count) {
        arg0->unk6 = 0;
    }
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/804e594.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e6a4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e7d4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e910.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804ea88.s");

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
