#include "particle.h"

#include "common.h"
#include "include_asm.h"
#include "memory.h"
#include "sprite.h"

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

INCLUDE_ASM("asm/dump/804a388-tutorial/804e560.s");
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
