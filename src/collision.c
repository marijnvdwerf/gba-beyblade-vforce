#include "include_asm.h"
#include "ram.h"

extern unk32 withBoundingAreaCount;
extern void sub_805E50C(void*, void*, void*, void*);
extern void sub_805E514(void*, unk32, unk32, unk32, unk32);
extern void def_94_0_8055CFC(void*, void*, void*, unk32);
extern void def_94_4_AddWithBoundingAreaMessage(void*, unk32, void*);
extern unk32 def_94_8_collision_8055F2C(void*, void*, void*, unk32);

void sub_8055CB8(void)
{
    withBoundingAreaCount = 0;
    sub_805E50C(
        _unk3000FC0,
        (void*)def_94_0_8055CFC,
        (void*)def_94_4_AddWithBoundingAreaMessage,
        (void*)def_94_8_collision_8055F2C);
    sub_805E514(_unk3000FD0, 0, 0, 0, 0);
}
INCLUDE_ASM("asm/dump/804a388-tutorial/8055cfc-def_94_0_8055CFC.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055d64.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055f04.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055f2c-def_94_8_collision_8055F2C.s");

void nullsub_6(void)
{
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8056158.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805616c-def_94_4_AddWithBoundingAreaMessage.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80561a0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80561ec.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056610.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80567e4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056910.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056adc.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056b54.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056c08-_return_false.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056c0c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056c80.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056cfc.s");
