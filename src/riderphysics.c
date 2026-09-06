#include "riderphysics.h"

#include <agb/bios.h>

#include "debug.h"
#include "effects.h"
#include "include_asm.h"
#include "keystate.h"
#include "music.h"
#include "packet.h"
#include "rider.h"
#include "tutorial.h"

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
void sub_804CB08(RiderBase* rider, Actor* actor)
{
    typedef struct RiderDraft {
        Actor* unk0; /* 0x00 */
        RiderTemp* unk4; /* 0x04 */
        unk8 pad8[0x38]; /* 0x08 */
        unk32 unk40; /* 0x40 */
        unk32 unk44; /* 0x44 */
        unk8 pad48[8]; /* 0x48 */
        unk16 unk50; /* 0x50 */
        unk16 unk52; /* 0x52 */
        unk8 pad54[0x170]; /* 0x54 */
        unk16 unk1C4; /* 0x1C4 */
        unk8 pad1C6[2]; /* 0x1C6 */
        unk16 unk1C8; /* 0x1C8 */
        unk8 pad1CA[0x32]; /* 0x1CA */
        unk32 unk1FC; /* 0x1FC */
        unk8 pad200[8]; /* 0x200 */
        s32 unk208; /* 0x208 */
        unk8 pad20C[0x1E]; /* 0x20C */
        unk16 unk22A; /* 0x22A */
        unk8 pad22C[2]; /* 0x22C */
        unk16 unk22E; /* 0x22E */
        unk16 unk230; /* 0x230 */
    } RiderDraft;
    RiderDraft* r = (RiderDraft*)rider;
    s32 inputMagnitude;
    s32 limit;
    s32 steerX;
    s32 steerY;
    s32 moveX;
    s32 moveY;
    s32 rotateY;
    s32 angle;
    unk16 aiInput;
    unk16* timer0;
    unk16* timer1;
    unk8 moving;

    (void)actor;
    inputMagnitude = r->unk22A;
    limit = 0x100;
    if (r->unk208 <= 0x1FF) {
        limit = r->unk208 - 0x100;
        if (limit < 0)
            limit = 0;
        if (limit > 0x100)
            limit = 0x100;
        inputMagnitude = (inputMagnitude * limit) >> 8;
    }
    if (RiderHasFlag(rider, 0x100) != 0 || RiderHasFlag(rider, 0x2000) != 0)
        return;
    if (RiderHasFlag(rider, 0x4000000) == 0) {
        aiInput = _unk3005DA0;
    } else {
        RiderAI_804C8F0(rider);
        aiInput = r->unk1C8;
    }
    if (RiderHasFlag(rider, 2) != 0) {
        if (RiderHasFlag(rider, 0x4000000) == 0) {
            r->unk52 = 5;
            r->unk50 = 5;
        }
        return;
    }
    moving = 0;
    moveX = 0;
    moveY = 0;
    steerX = 0;
    steerY = 0;
    if (((RiderHasFlag(rider, 0x4000000) == 0 ? _keyInput : r->unk1C4) & 1) != 0
        && r->unk22E == 0 && r->unk208 > 0x1FF)
        moving = 1;
    if ((aiInput & 0x20) != 0) {
        if (moving != 0) {
            steerX -= 0x1CC;
            moveX = -0x1CC;
            r->unk22E = 0x3C;
        } else {
            steerX -= inputMagnitude;
        }
    }
    if ((aiInput & 0x10) != 0) {
        if (moving != 0) {
            steerX += 0x1CC;
            moveX = 0x1CC;
            r->unk22E = 0x3C;
        } else {
            steerX += inputMagnitude;
        }
    }
    if ((aiInput & 0x40) != 0) {
        if (moving != 0) {
            steerY += 0x1CC;
            moveY = 0x1CC;
            r->unk22E = 0x3C;
        } else {
            steerY += inputMagnitude;
        }
    }
    if ((aiInput & 0x80) != 0) {
        if (moving != 0) {
            steerY -= 0x1CC;
            moveY = -0x1CC;
            r->unk22E = 0x3C;
        } else {
            steerY -= inputMagnitude;
        }
    }
    if (_currentGameState->unkC68 != 0 && RiderHasFlag(rider, 0x4000000) == 0) {
        r->unk40 += (steerX * Unk_874CC3C[0x60] - steerY * Unk_874CC3C[0x20]) >> 8;
        r->unk44 += (steerX * Unk_874CC3C[0x20] + steerY * Unk_874CC3C[0x60]) >> 8;
        rotateY = moveX * Unk_874CC3C[0x20] + moveY * Unk_874CC3C[0x60];
        moveX = (moveX * Unk_874CC3C[0x60] - moveY * Unk_874CC3C[0x20]) >> 8;
        moveY = rotateY >> 8;
    } else {
        r->unk40 += steerX;
        r->unk44 += steerY;
    }
    if (moving != 0 && r->unk22E != 0) {
        sub_805582C(0, 0, moveX * 4, -moveY * 4, 0);
        if ((_currentGameState->unkC64 & 1) == 0)
            r->unk208 -= 0xF0;
        sub_804ABFC(0x13);
    }
    if ((aiInput & 2) != 0 && r->unk230 == 0)
        r->unk230 = 0x10;
    if (((aiInput & 2) != 0 || r->unk230 != 0) && r->unk208 > 0x1FF) {
        SetRiderFlag(rider, 0x80000);
        if (r->unk230 != 0)
            r->unk230--;
        r->unk52 = 0x16;
        r->unk50 = 0x16;
        timer1 = &r->unk52;
        timer0 = &r->unk50;
    } else {
        UnsetRiderFlag(rider, 0x80000);
        r->unk52 = 5;
        r->unk50 = 5;
        timer1 = &r->unk52;
        timer0 = &r->unk50;
    }
    if (sub_804E440(rider, 0x80000) != 0) {
        if (RiderHasFlag(rider, 0x80000) != 0)
            sub_8055734(7, NULL, NULL);
        else
            sub_805589C();
    }
    if (sub_804A504() != 0) {
        *timer1 = 0x24;
        *timer0 = 0x24;
    }
    if (r->unk208 <= 0x8FF) {
        angle = (r->unk1FC * ((r->unk208 >> 2) + 0x154)) >> 8;
        steerX = (Unk_874CC3C[angle & 0xFF] + 0x1F) >> 6;
        steerY = (Unk_874CC3C[(angle & 0xFF) + 0x40] + 0x1F) >> 6;
        r->unk40 -= (steerX * limit) >> 8;
        r->unk44 += (steerY * limit) >> 8;
    }
}

#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/804cb08.s");

void sub_804CEF4(RiderBase* rider, unk32 action)
{
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
            rider->unk0->unk40 = (((sub_8057C40() >> 4) & 0xF) - 8) << 6;
            rider->unk0->unk44 = ((((sub_8057C40() >> 4) + 0xC8) & 0xF) - 8) << 6;
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
void sub_804D110(RiderBase* rider, Actor* other)
{
    typedef struct GeometrySplineLine {
        unk8 pad0[0xC]; /* 0x00 */
        unk32 unkC; /* 0x0C */
    } GeometrySplineLine;
    GeometrySplineLine* sub_805DCFC(LevelGeometryAddresses*, GeometrySpline*, unk32);
    typedef struct RiderDraft {
        Actor* unk0; /* 0x00 */
        RiderTemp* unk4; /* 0x04 */
        unk8 unk8; /* 0x08 */
        unk8 unk9; /* 0x09 */
        unk8 padA[2]; /* 0x0A */
        unk32 unkC; /* 0x0C */
        unk32 unk10; /* 0x10 */
        unk32 unk14; /* 0x14 */
        unk32 unk18; /* 0x18 */
        unk32 unk1C; /* 0x1C */
        unk32 unk20; /* 0x20 */
        unk32 unk24; /* 0x24 */
        unk32 unk28; /* 0x28 */
        unk32 unk2C; /* 0x2C */
        unk8 pad30[0x3C]; /* 0x30 */
        unk32 unk6C; /* 0x6C */
        unk32 unk70; /* 0x70 */
        unk32 unk74; /* 0x74 */
        unk8 pad78[0x10]; /* 0x78 */
        unk32 unk88; /* 0x88 */
        unk8 pad8C[0xC]; /* 0x8C */
        unk16 unk98; /* 0x98 */
        unk8 pad9A[2]; /* 0x9A */
        unk32 flags; /* 0x9C */
        unk32 unkA0; /* 0xA0 */
        unk32 unkA4; /* 0xA4 */
        unk32 unkA8; /* 0xA8 */
        unk32 unkAC; /* 0xAC */
        unk32 unkB0; /* 0xB0 */
        unk8 padB4[0x18]; /* 0xB4 */
        unk32 unkCC; /* 0xCC */
        unk8 padD0[0x14]; /* 0xD0 */
        unk32 unkE4; /* 0xE4 */
        unk8 padE8[4]; /* 0xE8 */
        unk32 unkEC; /* 0xEC */
        unk8 padF0[0x64]; /* 0xF0 */
        unk32 unk154; /* 0x154 */
        unk32 unk158; /* 0x158 */
        unk32 unk15C; /* 0x15C */
        unk8 pad160[0x38]; /* 0x160 */
        unk32 unk198; /* 0x198 */
        unk32 unk19C; /* 0x19C */
        unk32 unk1A0; /* 0x1A0 */
        unk32 unk1A4; /* 0x1A4 */
        unk8 pad1A8[0x10]; /* 0x1A8 */
        unk16 unk1B8; /* 0x1B8 */
        unk8 pad1BA[2]; /* 0x1BA */
        unk32 unk1BC; /* 0x1BC */
        unk8 unk1C0; /* 0x1C0 */
        unk8 pad1C1[0x3B]; /* 0x1C1 */
        unk32 unk1FC; /* 0x1FC */
        unk8 pad200[8]; /* 0x200 */
        s32 unk208; /* 0x208 */
        unk8 pad20C[4]; /* 0x20C */
        unk8 pad210[4]; /* 0x210 */
        GeometrySpline* unk214; /* 0x214 */
        unk16 unk218; /* 0x218 */
        unk16 unk21A; /* 0x21A */
        unk8 pad21C[4]; /* 0x21C */
        unk16 unk220; /* 0x220 */
        unk8 pad222[2]; /* 0x222 */
        unk32 unk224; /* 0x224 */
        unk8 pad228[4]; /* 0x228 */
        unk16 unk22C; /* 0x22C */
        unk16 unk22E; /* 0x22E */
        unk16 unk230; /* 0x230 */
        unk8 pad232[2]; /* 0x232 */
        unk32 unk234; /* 0x234 */
    } RiderDraft;
    RiderDraft* r = (RiderDraft*)rider;
    GeometrySplineLine* line;
    s32 delta;
    s32 value;
    s16 splineIndex;
    s16 angularVelocity;
    unk8 oldDirection;

    oldDirection = r->unk8;
    UnsetRiderFlag(rider, 0x1000004);
    r->unk1C0 = 0;
    delta = r->unk20 - r->unk24;
    r->unk1C += delta;
    r->unkC = (r->unkC + (delta >> 4)) & 0xFF;
    r->unk24 = r->unk20;
    if (other->z > r->unk1BC)
        r->unk1BC = other->z;
    r->unk1C &= 0xFFF;
    r->unk74 &= 0xFFF;
    if (RiderHasFlag(rider, 0x12) == 0)
        r->unk14 = sub_804E258(r->unk10, r->unk1C, 0x40, 0xFFF, 0x10, 0x50);
    r->unk98 = 0;
    if (r->unk22E != 0)
        r->unk22E--;
    if (RiderHasFlag(rider, 0x4000000) == 0) {
        if ((_currentGameState->unkC64 & 1) == 0) {
            if (RiderHasFlag(rider, 0x80000) != 0 && RiderHasFlag(rider, 2) == 0
                && r->unk208 > 0x1FF)
                r->unk208 -= 8;
            else
                r->unk208--;
        }
        if (r->unk208 <= 0x100) {
            value = sub_8057C40();
            sub_804C0EC(r->unk4, (value >> 6) & 1);
        }
        sub_804F824(r->unk208 * 21);
        if (r->unk208 <= 0xFF && sub_804AD60() == 0)
            sub_804ABFC(0xF);
        if (RiderHasFlag(rider, 0x20000) == 0 &&
            (r->unk208 <= 0 || other->z < -0x10000)) {
            sub_804FAD4();
            sub_80556C4();
            SetRiderFlag(rider, 0x2000000);
            sub_804D048(rider);
        }
    } else {
        if (r->unk208 <= 0xBFF)
            r->unk208 += r->unk22C;
        if (r->unk208 <= 0x200) {
            r->unk208 -= 3;
            SetRiderFlag(rider, 0x2000);
            if (r->unk208 <= 0x80) {
                value = sub_8057C40();
                sub_804C0EC(r->unk4, (value >> 6) & 1);
            }
        }
        if (r->unk208 < 0)
            r->unk208 = 0;
        if (r->unk208 == 0)
            sub_804C0C0(r->unk4);
        if (other->z < -0x10000 || r->unk208 == 0) {
            if (RiderHasFlag(rider, 8) != 0) {
                SetRiderFlag(&_gameData->base, 0x20000);
                sub_8056EC0();
                sub_8053E18(0);
                UnsetRiderFlag(rider, 8);
            }
            if (RiderHasFlag(rider, 0x20) == 0) {
                SetRiderFlag(rider, 0x20);
                sub_804C118(r->unk4);
                sub_8053920();
                sub_804C0C0(r->unk4);
            }
        }
    }
    if (RiderHasFlag(rider, 0x20000) != 0 || RiderHasFlag(rider, 0x2000) != 0) {
        r->unk52 = 0x28;
        r->unk50 = 0x28;
    }
    if (RiderHasFlag(rider, 0x100) != 0 && RiderHasFlag(rider, 2) == 0)
        UnsetRiderFlag(rider, 0x100);
    if (RiderHasFlag(rider, 0x100) == 0 && RiderHasFlag(rider, 0x400) == 0)
        r->unk234++;
    r->unk14 += r->unk18;
    r->unk6C = (r->unk6C + r->unk70) & 0xFFF;
    r->unk10 = (r->unk10 + r->unk14) & 0xFFF;
    r->unk2C = sub_804E224(r->unk28, r->unk30, 0xDC, 0x400);
    r->unk28 += r->unk2C;
    r->unk38 = sub_804E224(r->unk34, r->unk3C, 0xDC, 0x400);
    r->unk34 += r->unk38;
    r->unk8 = ((r->unk10 + 0x7F) & 0xFFF) >> 8;
    if (r->unk8 != (s8)oldDirection)
        r->unk98 |= 1;
    if (RiderHasFlag(rider, 0x4000000) != 0 && r->unk220 != 0)
        r->unk220--;
    splineIndex = r->unk218;
    if (splineIndex >= 0 && r->unk214 == NULL)
        r->unk214 = _gameData->unk65C.unk14[splineIndex];
    if (RiderHasFlag(rider, 0x4000000) != 0 && r->unk214 != NULL) {
        line = sub_805DCFC(&_gameData->unk65C, r->unk214, r->unk224 >> 18);
        angularVelocity = r->unk21A;
        r->unk224 += ((line->unkC >> 2) * angularVelocity) >> 8;
        if ((r->unk224 >> 18) >= r->unk214->pointCount - 1)
            r->unk224 = 0;
    }
    if (RiderHasFlag(rider, 2) == 0)
        sub_804D8D8(rider);
    r->unk1FC++;
    if (RiderHasFlag(rider, 0x4000000) == 0)
        sub_804D710(rider);
    if (RiderHasFlag(rider, 0x200000) != 0) {
        r->unk1B8--;
        if (r->unk1B8 == 0)
            UnsetRiderFlag(rider, 0x200000);
    }
    if (RiderHasFlag(rider, 2) != 0)
        r->unk198++;
    else
        r->unk19C++;
    if (RiderHasFlag(rider, 2) == 0) {
        if (sub_804E454(rider, 2) != 0) {
            r->unk98 |= 8;
            sub_804DFF4(rider);
        }
        r->unkEC = r->unkE4;
        r->unk9 = r->unk8;
    }
    if (RiderHasFlag(rider, 2) == 0) {
        if (sub_804E454(rider, 2) == 0) {
            r->unk98 |= 0x10;
            sub_804E090(rider);
        }
    }
    if (RiderHasFlag(rider, 4) != 0 && r->unkCC == 0)
        sub_804E1DC(rider);
    sub_804DDF8(rider, other);
    sub_804D754(rider);
    r->unk1A0 = other->unk40;
    r->unk1A4 = other->unk44;
    r->unkA4 = (r->flags ^ r->unkA0) & (r->flags | r->unkA0);
    r->unkB0 = (r->unkA8 ^ r->unkAC) & (r->unkA8 | r->unkAC);
    r->unk15C = (r->unk154 ^ r->unk158) & (r->unk154 | r->unk158);
    r->unkA0 = r->flags;
    r->unkAC = r->unkA8;
    r->unk158 = r->unk154;
    SetRiderFlag(rider, 2);
    r->unk88 = 0;
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

unk8 sub_804E454(RiderBase* rider, unk32 flags)
{
    if ((rider->unkA0 & flags) == flags)
        return 1;
    return 0;
}

ASM_ZEROPAD
