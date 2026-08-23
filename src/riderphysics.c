#include "riderphysics.h"

#include "include_asm.h"
#include "rider.h"

INCLUDE_ASM("asm/dump/804a388-tutorial/804c4b4-s_rider_804C4B4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804c870.s");

void sub_804C888(RiderBase* rider, u8 arg1)
{
    if (arg1 != 0) {
        SetRiderFlag(rider, 0x102);
        rider->unk0->unk54 = 0;
        sub_804C0EC(rider->unk4, 1);
        return;
    }
    rider->unk0->unk54 = -0x1A;
    sub_804C0EC(rider->unk4, 0);
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804c8c0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804c8f0-RiderAI_804C8F0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804cb08.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804cef4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804d048.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804d104.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804d110.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804d710.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804d754.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804d8d8.s");

void nullsub_5(void)
{
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804da48.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804daa0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804db94-rider_vs_rider_collision_804DB94.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804ddf8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804df88.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804dff4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e090.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e124.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e154.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e1dc.s");

void sub_804E1FC(RiderBase* rider, u8 arg1)
{
    unk32 value;

    value = arg1 << 4;
    rider->unk10 = value;
    rider->unk1C = value;
    rider->unk14 = 0;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804e20c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e224.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e258.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e2a4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e328.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e358.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e3b0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804e3e4-convert3DCoordsto2DCoords.s");

void SetRiderFlag(RiderBase* rider, unk32 flags)
{
    rider->flags |= flags;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804e40c-UnsetRiderFlag.s");

unk32 RiderHasFlag(RiderBase* rider, unk32 flags)
{
    if ((rider->flags & flags) == flags)
        return 1;
    return 0;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804e42c-RiderHasSomeFlags.s");

unk32 sub_804E440(RiderBase* rider, unk32 flags)
{
    if ((rider->unkA4 & flags) != 0)
        return 1;
    return 0;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804e454.s");
