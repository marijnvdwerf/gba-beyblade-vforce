#include "common.h"
#include "include_asm.h"
#include "memory.h"

void sub_8060A94(void* spriteEntry);

INCLUDE_ASM("asm/dump/804a388-tutorial/804e468-allocateParticleSystem.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e530.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e560.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e57c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e584.s");
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

asm(".align 2, 0\n");
