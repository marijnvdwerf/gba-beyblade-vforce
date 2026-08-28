#include "riderphysics.h"

#include "include_asm.h"
#include "rider.h"

INCLUDE_ASM("asm/dump/804a388-tutorial/804c4b4-s_rider_804C4B4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804c870.s");

void sub_804C888(RiderBase* rider, unk8 arg1)
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

#if 0
unk8 sub_804DA48(unk8* rider, unk8* otherRider, unk32 radius)
{
    Actor* pos0;
    Actor* pos1;
    s32 temp_r7;
    s32 x;
    s32 y;
    s32 z;
    s32 distance;
    s32 radius_squared;

    temp_r7 = radius;
    pos0 = *(Actor**)rider;
    pos1 = *(Actor**)otherRider;
    if ((RiderHasFlag((RiderBase*)otherRider, 2) << 24) != 0)
        return 0;
    x = (pos1->x - pos0->x) >> 8;
    y = (pos1->y - pos0->y) >> 8;
    z = (pos1->z - pos0->z) >> 8;
    distance = x * x + y * y + z * z;
    radius_squared = temp_r7 * temp_r7;
    if (distance < radius_squared)
        return 1;
    return 0;
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/804da48.s");

#if 0
void sub_804DAA0(RiderBase* rider0, RiderBase* rider1)
{
    unk32 flags = 0x04000000;
    RiderBase* rider;
    RiderBase* other;
    s32 dx;
    s32 dy;
    s32 dz;
    s32 distance;
    s16 value0;
    s16 value1;

    rider = rider0;
    other = rider1;
    if ((RiderHasFlag(rider, flags) << 24) == 0) {
        rider = rider1;
        other = rider0;
    }
    if ((RiderHasFlag(rider, flags) << 24) != 0
        && (RiderHasFlag(other, flags) << 24) == 0
        && (RiderHasFlag(rider, 1) << 24) == 0
        && (RiderHasFlag(rider, 0x40) << 24) == 0) {
        dx = (other->unk0->x - rider->unk0->x) >> 8;
        dy = (other->unk0->y - rider->unk0->y) >> 8;
        dz = (other->unk0->z - rider->unk0->z) >> 8;
        distance = dx * dx + dy * dy + dz * dz;
        if (distance < rider->unk210) {
            value0 = rider->unk220;
            value1 = rider->unk222;
            if (value0 > value1) {
                SetRiderFlag(rider, 0x40);
                rider->unk21E = 0x3C;
            } else {
                SetRiderFlag(rider, 1);
                rider->unk21E = rider->unk21C;
            }
            rider->unk20C = other;
        }
    }
}
#endif
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
    rider->unk10 = arg1 << 4;
    rider->unk1C = arg1 << 4;
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

unk8 RiderHasFlag(RiderBase* rider, unk32 flags)
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
