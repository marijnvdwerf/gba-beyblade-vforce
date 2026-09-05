#include "riderphysics.h"

#include <agb/bios.h>

#include "debug.h"
#include "effects.h"
#include "include_asm.h"
#include "keystate.h"
#include "music.h"
#include "packet.h"
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

#if 0
extern u16 _keyInput;

void RiderAI_804C8F0(RiderBase*);
void sub_805582C(unk32, unk32, unk32, unk32, unk32);
void sub_805589C(void);
unk32 sub_804A504(void);

void sub_804CB08(RiderBase* rider)
{
    s32 inputMagnitude;
    s32 limit;
    s32 steerX;
    s32 steerY;
    s32 moveX;
    s32 moveY;
    s32 rotateY;
    s32 angle;
    unk16 input;
    unk16 aiInput;
    unk16* aiInputPtr;
    unk16* timer0;
    unk16* timer1;
    unk8 moving;

    inputMagnitude = rider->unk22A;
    limit = 0x100;
    if (rider->unk208 <= 0x1FF) {
        limit = rider->unk208 - 0x100;
        if (limit < 0)
            limit = 0;
        if (limit > 0x100)
            limit = 0x100;
        inputMagnitude = (inputMagnitude * limit) >> 8;
    }
    if (RiderHasFlag(rider, 0x100) != 0 || RiderHasFlag(rider, 0x2000) != 0)
        return;
    if (RiderHasFlag(rider, 0x4000000) == 0) {
        input = _keyInput;
        aiInputPtr = &_unk3005DA0;
    } else {
        RiderAI_804C8F0(rider);
        input = rider->unk1C4;
        aiInputPtr = &rider->unk1C8;
    }
    aiInput = *aiInputPtr;
    if (RiderHasFlag(rider, 2) != 0) {
        if (RiderHasFlag(rider, 0x4000000) == 0) {
            rider->unk52 = 5;
            rider->unk50 = 5;
        }
        return;
    }
    moving = 0;
    moveX = 0;
    moveY = 0;
    steerX = 0;
    steerY = 0;
    if ((input & 1) != 0 && rider->unk22E == 0 && rider->unk208 > 0x1FF)
        moving = 1;
    if ((aiInput & 0x20) != 0) {
        if (moving != 0) {
            steerX -= 0x1CC;
            moveX = -0x1CC;
            rider->unk22E = 0x3C;
        } else {
            steerX -= inputMagnitude;
        }
    }
    if ((aiInput & 0x10) != 0) {
        if (moving != 0) {
            steerX += 0x1CC;
            moveX = 0x1CC;
            rider->unk22E = 0x3C;
        } else {
            steerX += inputMagnitude;
        }
    }
    if ((aiInput & 0x40) != 0) {
        if (moving != 0) {
            steerY += 0x1CC;
            moveY = 0x1CC;
            rider->unk22E = 0x3C;
        } else {
            steerY += inputMagnitude;
        }
    }
    if ((aiInput & 0x80) != 0) {
        if (moving != 0) {
            steerY -= 0x1CC;
            moveY = -0x1CC;
            rider->unk22E = 0x3C;
        } else {
            steerY -= inputMagnitude;
        }
    }
    if (_currentGameState->unkC68 != 0 && RiderHasFlag(rider, 0x4000000) == 0) {
        rider->unk40 += (steerX * Unk_874CC3C[0x60] - steerY * Unk_874CC3C[0x20]) >> 8;
        rider->unk44 += (steerX * Unk_874CC3C[0x20] + steerY * Unk_874CC3C[0x60]) >> 8;
        rotateY = moveX * Unk_874CC3C[0x20] + moveY * Unk_874CC3C[0x60];
        moveX = (moveX * Unk_874CC3C[0x60] - moveY * Unk_874CC3C[0x20]) >> 8;
        moveY = rotateY >> 8;
    } else {
        rider->unk40 += steerX;
        rider->unk44 += steerY;
    }
    if (moving != 0 && rider->unk22E != 0) {
        sub_805582C(0, 0, moveX * 4, -moveY * 4, 0);
        if ((_currentGameState->unkC64 & 1) == 0)
            rider->unk208 -= 0xF0;
        sub_804ABFC(0x13);
    }
    if ((aiInput & 2) != 0 && rider->unk230 == 0)
        rider->unk230 = 0x10;
    if (((aiInput & 2) != 0 || rider->unk230 != 0) && rider->unk208 > 0x1FF) {
        SetRiderFlag(rider, 0x80000);
        if (rider->unk230 != 0)
            rider->unk230--;
        rider->unk52 = 0x16;
        rider->unk50 = 0x16;
        timer1 = &rider->unk52;
        timer0 = &rider->unk50;
    } else {
        UnsetRiderFlag(rider, 0x80000);
        rider->unk52 = 5;
        rider->unk50 = 5;
        timer1 = &rider->unk52;
        timer0 = &rider->unk50;
    }
    if (sub_804E440(rider, 0x80000) != 0) {
        if (RiderHasFlag(rider, 0x80000) != 0)
            sub_8055734(7, 0, 0);
        else
            sub_805589C();
    }
    if (sub_804A504() != 0) {
        *timer1 = 0x24;
        *timer0 = 0x24;
    }
    if (rider->unk208 <= 0x8FF) {
        angle = (rider->unk1FC * ((rider->unk208 >> 2) + 0x154)) >> 8;
        steerX = (Unk_874CC3C[angle & 0xFF] + 0x1F) >> 6;
        steerY = (Unk_874CC3C[(angle & 0xFF) + 0x40] + 0x1F) >> 6;
        rider->unk40 -= (steerX * limit) >> 8;
        rider->unk44 += (steerY * limit) >> 8;
    }
}

#endif
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

#if 0
void sub_804D110(unk8 *rider, unk8 *other)
{
    s32 delta;
    s32 value;
    s32 angle;
    s32 speed;
    s16 timer;
    u8 oldDirection;
    unk8 *state;

    state = *(unk8 **)rider;
    oldDirection = *(u8 *)(rider + 8);
    UnsetRiderFlag(rider, 0x1000004);
    *(unk8 *)(rider + 0x1c0) = 0;
    delta = *(s32 *)(rider + 0x20) - *(s32 *)(rider + 0x24);
    *(s32 *)(rider + 0x1c) += delta;
    *(s32 *)(rider + 0xc) = (*(s32 *)(rider + 0xc) + (delta >> 4)) & 0xff;
    *(s32 *)(rider + 0x24) = *(s32 *)(rider + 0x20);
    if (*(s32 *)(other + 0xc) > *(s32 *)(rider + 0x1b8))
        *(s32 *)(rider + 0x1b8) = *(s32 *)(other + 0xc);
    *(s32 *)(rider + 0x1c) &= 0xfff;
    *(s32 *)(rider + 0x74) &= 0xfff;
    if ((RiderHasFlag(rider, 0x12) << 24) == 0)
        *(s32 *)(rider + 0x14) = sub_804E258(*(s32 *)(rider + 0x10), *(s32 *)(rider + 0x1c), 0x40, 0xfff, 0x10, 0x50);
    *(s16 *)(rider + 0x98) = 0;
    timer = *(s16 *)(rider + 0x22e);
    if (timer != 0)
        *(s16 *)(rider + 0x22e) = timer - 1;
    if ((RiderHasFlag(rider, 0x4000000) << 24) == 0) {
        value = *(s32 *)(rider + 0x208);
        if (*(s32 *)((unk8 *)_currentGameState + 0xc64) & 1) {
            if ((RiderHasFlag(rider, 0x80000) << 24) != 0 &&
                (RiderHasFlag(rider, 2) << 24) == 0 && value > 0x1ff)
                value -= 8;
        } else if ((RiderHasFlag(rider, 0x80000) << 24) != 0 &&
                   (RiderHasFlag(rider, 2) << 24) == 0 && value > 0x1ff)
            value -= 1;
        *(s32 *)(rider + 0x208) = value;
        if (value <= 0)
            sub_804C0C0(*(unk32 *)(rider + 4));
    } else {
        value = *(s32 *)(rider + 0x208);
        value += *(s16 *)(rider + 0x22c);
        if (value < 0)
            value = 0;
        if (value > 0x200)
            value = 0x200;
        *(s32 *)(rider + 0x208) = value;
    }
    if ((RiderHasFlag(rider, 8) << 24) != 0) {
        SetRiderFlag(*(unk32 *)((unk8 *)_gameData + 0x65c), 0x400);
        sub_8056EC0();
        sub_8053E18(0);
        UnsetRiderFlag(rider, 8);
    }
    if ((RiderHasFlag(rider, 0x20) << 24) == 0) {
        SetRiderFlag(rider, 0x20);
        sub_804C118(*(unk32 *)(rider + 4));
        sub_8053920();
        sub_804C0C0(*(unk32 *)(rider + 4));
    }
    if ((RiderHasFlag(rider, 0x400) << 24) != 0 ||
        (RiderHasFlag(rider, 0x40) << 24) != 0) {
        *(s16 *)(rider + 0x52) = 0x28;
        *(s16 *)(rider + 0x50) = 0x28;
    }
    if ((RiderHasFlag(rider, 2) << 24) == 0)
        sub_804D8D8(rider);
    *(s32 *)(rider + 0x1fc) += 1;
    if ((RiderHasFlag(rider, 0x400000) << 24) == 0)
        sub_804D710(rider);
    if ((RiderHasFlag(rider, 0x2000) << 24) != 0) {
        timer = *(s16 *)(rider + 0x1b8) - 1;
        *(s16 *)(rider + 0x1b8) = timer;
        if (timer == 0)
            UnsetRiderFlag(rider, 0x2000);
    }
    if ((RiderHasFlag(rider, 2) << 24) != 0)
        *(s32 *)(rider + 0x198) += 1;
    else
        *(s32 *)(rider + 0x19c) += 1;
    if ((RiderHasFlag(rider, 2) << 24) == 0) {
        if ((sub_804E454(rider, 2) << 24) != 0)
            sub_804DFF4(rider);
        *(s32 *)(rider + 0xec) = *(s32 *)(rider + 0xe4);
        *(unk8 *)(rider + 9) = *(unk8 *)(rider + 8);
    }
    if ((RiderHasFlag(rider, 2) << 24) != 0) {
        if ((sub_804E454(rider, 2) << 24) == 0)
            sub_804E090(rider);
    }
    if ((RiderHasFlag(rider, 4) << 24) != 0 && *(s32 *)(rider + 0xcc) == 0)
        sub_804E1DC(rider);
    sub_804DDF8(rider, other);
    sub_804D754(rider);
    *(s32 *)(rider + 0x1a0) = *(s32 *)(other + 0x40);
    *(s32 *)(rider + 0x1a4) = *(s32 *)(other + 0x44);
    *(s32 *)(rider + 0x9c) = (*(s32 *)(rider + 0x9c) ^ *(s32 *)(rider + 0xa0)) & (*(s32 *)(rider + 0x9c) | *(s32 *)(rider + 0xa0));
    *(s32 *)(rider + 0xa8) = (*(s32 *)(rider + 0xa8) ^ *(s32 *)(rider + 0xac)) & (*(s32 *)(rider + 0xa8) | *(s32 *)(rider + 0xac));
    SetRiderFlag(rider, 2);
    *(s32 *)(rider + 0x88) = 0;
}
#endif
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
