#include "rider.h"

#include "actor.h"
#include "include_asm.h"
#include "memory.h"
#include "particle.h"
#include "sprite.h"

INCLUDE_ASM("asm/dump/804a388-tutorial/804b07c-initRider.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804b2cc-processRiderMetadata.s");

void sub_804B4A4(RiderBase* arg0)
{
    sub_80588A8(&arg0->unk238);
    sub_80588A8(&arg0->unk2FC);
    if (arg0->unk420 != NULL) {
        deallocateBlock(arg0->unk420);
        arg0->unk420 = NULL;
    }
    if (arg0->unk3E8 != 0) {
        sub_804EBE8(&arg0->unk3EC);
    }
    if (arg0->unk3C4 != 0) {
        sub_8060A94(arg0->unk3C4);
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804b4fc.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804b5c0.s");

void nullsub_1(void)
{
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804b624.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804b754.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804b7fc.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804b8f0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804bbf0-renderRider.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804bedc-allocFXSprite.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804bf3c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804c098.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804c0c0.s");

void sub_804C0EC(unk32 arg0, unk8 arg1)
{
    RiderTemp* rider;

    rider = (RiderTemp*)arg0;
    if (arg1 != 0) {
        rider->unk3CC |= 8;
    } else {
        rider->unk3CC &= 0xFFF7;
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804c118.s");

void nullsub_2(void)
{
}

void nullsub_3(void)
{
}

void nullsub_4(void)
{
}

asm(".align 2, 0\n");
