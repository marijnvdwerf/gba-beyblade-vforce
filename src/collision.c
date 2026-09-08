#include "collision.h"

#include "geometry.h"
#include "include_asm.h"
#include "ram.h"

void sub_80561EC(unk32, unk32, unk32);
extern void def_94_4_AddWithBoundingAreaMessage(Actor*, LevelGeometryAddresses*, GeometryLine*);
extern unk8 def_94_8_collision_8055F2C(Actor*, LevelGeometryAddresses*, GeometryLine*, unk16);

void sub_8055CB8(void)
{
    withBoundingAreaCount = 0;
    sub_805E50C(&_unk3000FC0, def_94_0_8055CFC, def_94_4_AddWithBoundingAreaMessage,
        def_94_8_collision_8055F2C);
    sub_805E514(_unk3000FD0, 0, 0, 0, 0);
}

unk8 def_94_0_8055CFC(
    Actor* actor, LevelGeometryAddresses* geometry, GeometryLine* line, unk16 collisionMask)
{
    RiderBase* rider;

    rider = actor->unkB4.rider;
    if (rider == NULL)
        return 0;
    if ((collisionMask & 0x99) != 0) {
        if ((collisionMask & 0x90) != 0)
            sub_8055D64(actor, rider, geometry, line, collisionMask & 0x90, 0x40);
        if ((collisionMask & 9) != 0)
            sub_8055D64(actor, rider, geometry, line, collisionMask & 9, 0);
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8055d64.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055f04.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055f2c-def_94_8_collision_8055F2C.s");

void nullsub_6(void)
{
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8056158.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805616c-def_94_4_AddWithBoundingAreaMessage.s");

void sub_80561A0(unk32 arg0, unk32 arg1)
{
    s32 i;

    i = 0;
    if (i < withBoundingAreaCount) {
        do {
            sub_80561EC(arg0, arg1, withBoundingAreas[i]);
            i++;
        } while (i < withBoundingAreaCount);
    }
    withBoundingAreaCount = 0;
}

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
