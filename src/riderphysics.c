#include "riderphysics.h"

#include <agb/bios.h>

#include "debug.h"
#include "effects.h"
#include "include_asm.h"
#include "music.h"
#include "rider.h"

INCLUDE_ASM("asm/dump/804a388-tutorial/804c4b4-s_rider_804C4B4.s");

void sub_804C870(RiderBase* rider, s32 arg1)
{
    rider->unk208 = (arg1 * 0xC0 >> 8) + 0x600;
}

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

void sub_804CEF4(RiderBase* rider, unk32 action)
{
    s32 random;

    rider->unk21E = 0x3C;
    SetRiderFlag(rider, 0x40);
    rider->unk0->unk48 = 0x300;
    rider->unk0->z += 0x400;
    SetRiderFlag(rider, 2);
    if (action <= 4) {
        switch (action) {
        case 0:
            if (RiderHasFlag(rider, 8) == 0)
                rider->unk208 = 0x208 - 8;
            else
                rider->unk208 >>= 1;
            break;
        case 1:
            rider->unk208 += -0x600;
            if (rider->unk208 <= 0x1FF)
                rider->unk208 = 0x200;
            random = sub_8057C40();
            rider->unk0->unk40 = (((random >> 4) & 0xF) - 8) << 6;
            random = sub_8057C40();
            rider->unk0->unk44 = ((((random >> 4) + 0xC8) & 0xF) - 8) << 6;
            rider->unk0->unk48 = 0x500;
            rider->unk0->z += 0x400;
            SetRiderFlag(rider, 2);
            break;
        case 2:
            rider->unk208 += -0x600;
            if (rider->unk208 <= 0x1FF)
                rider->unk208 = 0x200;
            rider->unk21E = 0x258;
            SetRiderFlag(rider, 0x40);
            break;
        case 3:
            break;
        case 4:
            rider->unk208 += -0x600;
            if (rider->unk208 <= 0x1FF)
                rider->unk208 = 0x200;
            rider->unk22C = 0;
            break;
        }
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804d048.s");

void sub_804D104(RiderBase* rider)
{
    rider->unk48 = rider->unk40;
    rider->unk4C = rider->unk44;
}

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

unk32 rider_vs_rider_collision_804DB94(RiderBase* rider0, RiderBase* rider1)
{
    Actor* pos0;
    Actor* pos1;
    s32 x0;
    s32 y0;
    s32 z0;
    s32 x1;
    s32 y1;
    s32 z1;
    s32 dx;
    s32 dy;
    s32 dz;
    u16 magnitude;
    s32 magnitudeSigned;
    s32 sepX;
    s32 sepY;
    s32 sepZ;
    u16 scale;

    pos0 = rider0->unk0;
    pos1 = rider1->unk0;
    x0 = pos0->x;
    y0 = pos0->y;
    z0 = pos0->z;
    x1 = pos1->x;
    y1 = pos1->y;
    z1 = pos1->z;
    dx = (x1 - x0) >> 8;
    dy = (y1 - y0) >> 8;
    dz = (z1 - z0) >> 8;
    magnitude = Sqrt(dx * dx + dy * dy + dz * dz);
    magnitudeSigned = magnitude;
    if (magnitudeSigned <= 0x15) {
        dx = (dx << 8) / magnitude;
        dy = (dy << 8) / magnitude;
        dz = (dz << 8) / magnitude;
        sepX = pos0->unk40 - pos1->unk40;
        sepY = pos0->unk44 - pos1->unk44;
        sepZ = pos0->unk48 - pos1->unk48;
        scale = Sqrt(sepX * sepX + sepY * sepY + sepZ * sepZ);
        dx = ((dx * scale) << 8) >> 16;
        dy = ((dy * scale) << 8) >> 16;
        dz = ((dz * scale) << 8) >> 16;
        if (RiderHasFlag(rider0, 2) != 0) {
            pos0->unk40 -= (rider0->unk228 * dx) >> 8;
            pos0->unk44 -= (rider0->unk228 * dy) >> 8;
            pos0->unk48 -= (rider0->unk228 * dz) >> 8;
        } else {
            rider0->unk40 -= (rider0->unk228 * dx) >> 8;
            rider0->unk44 += (rider0->unk228 * dy) >> 8;
        }
        if (RiderHasFlag(rider1, 2) != 0) {
            pos1->unk40 += (rider1->unk228 * dx) >> 8;
            pos1->unk44 += (rider1->unk228 * dy) >> 8;
            pos1->unk48 += (rider1->unk228 * dz) >> 8;
        } else {
            rider1->unk40 += (rider1->unk228 * dx) >> 8;
            rider1->unk44 -= (rider1->unk228 * dy) >> 8;
        }
        if (RiderHasFlag(rider0, 0x4000000) == 0) {
            sub_8055734(4, 0, 0);
            sub_80558B8();
            sub_80558E8(0);
            sub_804ABFC(1);
        }
        if (RiderHasFlag(rider0, 0x4000000) != 0 && RiderHasFlag(rider1, 0x4000000) == 0) {
            if (rider1->unk208 > 0x1FF)
                rider0->unk208 += -0x200;
            rider0->unk220 += 0xF0;
        }
        if (RiderHasFlag(rider1, 0x4000000) != 0 && RiderHasFlag(rider0, 0x4000000) == 0) {
            if (rider1->unk208 > 0x1FF) {
                rider1->unk208 += -0x200;
                if (rider1->unk208 <= 0x1FF)
                    rider1->unk208 = 0x200;
            }
            rider1->unk220 += 0xF0;
        }
    }
    return 0;
}

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

void convert3DCoordsto2DCoords(Actor* actor, unk32* output)
{
    s32 value1;
    s32 value2;

    value1 = actor->x;
    value2 = actor->y;
    output[0] = value1 - value2;
    output[1] = (value1 + value2) >> 1;
    output[1] -= actor->z;
}

void SetRiderFlag(RiderBase* rider, unk32 flags)
{
    rider->flags |= flags;
}

void UnsetRiderFlag(RiderBase* rider, unk32 flags)
{
    rider->flags &= ~flags;
}

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
