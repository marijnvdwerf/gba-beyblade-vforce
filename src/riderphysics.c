#include "riderphysics.h"

#include <agb/bios.h>

#include "actor.h"
#include "ai.h"
#include "collectable.h"
#include "debug.h"
#include "effects.h"
#include "gameinit.h"
#include "geometry.h"
#include "hud.h"
#include "include_asm.h"
#include "keystate.h"
#include "levelhud.h"
#include "math.h"
#include "music.h"
#include "packet.h"
#include "rider.h"
#include "tutorial.h"
#include "unsorted.h"

void s_rider_804C4B4(RiderBase* rider, Actor* actor)
{
    unk32 unused;

    __fastMemoryClearARM(0, rider, 0x238);
    actor->unk54 = -0x1A;
    actor->unk68 = 0;
    rider->unk0 = actor;
    rider->unk4 = NULL;
    rider->unk78 = 0;
    rider->unk7C = 0;
    rider->unk80 = 0;
    rider->unk84 = 0;
    rider->unk1C1 = 0x10;
    rider->unk88 = 0;
    rider->unk10 = 0;
    rider->unk14 = 0;
    rider->unk18 = 0;
    rider->unk1C = 0;
    rider->unk24 = 0;
    rider->unk20 = 0;
    rider->unk28 = 0;
    rider->unk2C = 0;
    rider->unk30 = 0;
    rider->unk34 = 0;
    rider->unk38 = 0;
    rider->unk3C = 0;
    rider->unk6C = 0;
    rider->unk70 = 0;
    rider->unk74 = 0;
    rider->unk94 = 0;
    rider->unkA8 = 0;
    rider->unkAC = 0;
    rider->unkB0 = 0;
    rider->unkC8 = 0;
    rider->unkB4 = 0;
    rider->unkB8 = NULL;
    rider->unkBC = -1;
    rider->unkD8 = 0;
    rider->unkDC = 0;
    rider->unk98 = 0;
    rider->flags = 0;
    rider->unkA4 = 0;
    rider->unk8C = 0;
    rider->unk90 = 0;
    rider->unk8 = 0;
    rider->unk9 = 0;
    rider->unkCC = 0;
    rider->unkE0 = NULL;
    rider->unkE4 = NULL;
    rider->unkE8 = NULL;
    rider->unkEC = NULL;
    rider->unk11C = 0;
    rider->unk19C = 0x40;
    rider->unkD3 = 0;
    rider->unk140 = 0;
    rider->unk142 = 0;
    rider->unk148 = 0;
    rider->unk144 = 0;
    rider->unk154 = 0;
    rider->unk158 = 0;
    rider->unk15C = 0;
    rider->unk160 = 0;
    rider->unk164 = 0;
    rider->unk168 = 0;
    rider->unk16C = 0;
    rider->unk170 = 0;
    rider->unk174 = 0;
    rider->unk198 = 0;
    rider->unk14C = 0;
    rider->unk14E = 0;
    rider->unk150 = 0;
    rider->unk1A0 = 0;
    rider->unk1A4 = 0;
    rider->unk1A8 = rider->unk1AC = rider->unk1B0 = 0;
    rider->unk1B4 = 0;
    rider->unk1B8 = 0;
    rider->unk1BC = 0;
    rider->unk1C0 = 0;
    unused = rider->unkF4.unk0 + rider->unkF4.unk4 + rider->unkF4.unk8;
    rider->unkF4.unkD = rider->unkF4.unkE = rider->unkF4.unkF = rider->unkF4.unk10
        = rider->unkF4.unk12 = rider->unkF4.unk14 = rider->unkF4.unk18 = rider->unkF4.unk1C
        = rider->unkF4.unk20 = rider->unkF4.unk24 = 0;
    rider->unkF4.unkC_2 = rider->unkF4.unkC_1 = rider->unkF4.unkC_0 = 0;
    rider->unkF4.unk0 = rider->unkF4.unk4 = rider->unkF4.unk8 = 0;
    rider->unk1C2 = 0;
    rider->unk1C3 = 0;
    rider->unk1C4 = 0;
    rider->unk1C6 = 0;
    rider->unk1C8 = 0;
    rider->unk40 = 0;
    rider->unk44 = 0;
    rider->unk48 = 0;
    rider->unk4C = 0;
    rider->unk50 = 5;
    rider->unk52 = 5;
    rider->unk54 = 0;
    rider->unk56 = 0;
    rider->unk58 = 0;
    rider->unk5A = 0;
    rider->unk68 = NULL;
    rider->unk5C = 0;
    rider->unk5E = 0;
    rider->unk62 = 0;
    rider->unk60 = 0;
    rider->unk64 = 0;
    rider->unk1CA = 0x100;
    rider->unk1CC = 0x100;
    rider->unk1CE = 1;
    rider->unk1CF = 0;
    rider->unk1D4 = _unk3000E30[0];
    rider->unk1D8 = 0;
    rider->unk1DC = 0;
    rider->unk1E0 = 0;
    rider->unk1E4 = 0;
    rider->unk1EC = 0;
    rider->unk1EE = 0x400;
    rider->unk1F2 = 0;
    rider->unk1F4 = 0;
    rider->unk1F6 = 0;
    rider->unk1F8 = -0x1A;
    rider->unk1F0 = 6;
    rider->unk1FC = 0;
    rider->unk200 = NULL;
    rider->unk204 = 0;
    rider->unk206 = 0;
    rider->unk208 = 0xC00;
    rider->unk20C = NULL;
    rider->unk210 = 0x900;
    rider->unk21C = 0xF0;
    rider->unk21E = 0;
    rider->unk220 = 0;
    rider->unk214 = NULL;
    rider->unk218 = -1;
    rider->unk224 = 0;
    rider->unk21A = 0x100;
    rider->unk222 = 0x1E0;
    rider->unk22C = 2;
    rider->unk228 = 0x100;
    rider->unk22A = (_currentGameState->unkC64 & 2) != 0 ? 0x30 : 0x10;
    rider->unk234 = 0;
    rider->unk22E = 0;
    rider->unk230 = 0;
    SetRiderFlag(rider, 0x102);
}

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

void sub_804C8C0(RiderBase* rider, s32 arg1, s32 arg2)
{
    rider->unk1CA = (arg1 << 8) / 100;
    rider->unk1CC = (arg2 << 8) / 100;
}

void RiderAI_804C8F0(RiderBase* rider)
{
    unk16 direction;
    unk16 buttons;
    s32 dx;
    s32 dy;
    s32 targetX;
    s32 targetY;
    s32 result[6];
    LevelGeometryAddresses* geometry;

    buttons = rider->unk1C4;
    direction = 0;
    if (RiderHasFlag(rider, 0x2000000) != 0) {
        switch ((unk32)((rider->unk1C3 + 0x10) & 0xFF) >> 5) {
        case 0:
            direction = 0x20;
            break;
        case 1:
            direction = 0x60;
            break;
        case 2:
            direction = 0x40;
            break;
        case 3:
            direction = 0x50;
            break;
        case 4:
            direction = 0x10;
            break;
        case 5:
            direction = 0x90;
            break;
        case 6:
            direction = 0x80;
            break;
        case 7:
            direction = 0xA0;
            break;
        default:
            break;
        }
    } else if ((RiderHasFlag(rider, 1) != 0 || RiderHasFlag(rider, 0x40) != 0)
        && rider->unk20C != NULL) {
        dx = ((rider->unk20C->unk0->x - rider->unk0->x) >> 2) - rider->unk40;
        dy = ((rider->unk20C->unk0->y - rider->unk0->y) >> 2) - rider->unk44;
        if (RiderHasFlag(rider, 0x40) != 0) {
            dx = -dx;
            dy = -dy;
        }
        if (dx > 0) {
            direction = 0x10;
        } else if (dx < 0) {
            direction = 0x20;
        }
        if (dy > 0) {
            direction |= 0x80;
        } else if (dy < 0) {
            direction |= 0x40;
        }
        rider->unk21E--;
        if (rider->unk21E == 0) {
            UnsetRiderFlag(rider, 0x41);
        }
    } else {
        geometry = &_gameData->unk434.geometry;
        if (rider->unk214 != NULL) {
            sub_805DFD4(geometry, rider->unk218, result, rider->unk224 >> 8);
            targetX = ((result[0] << 5) - rider->unk0->x) >> 2;
            targetY = ((result[1] << 5) - rider->unk0->y) >> 2;
            if (targetX > 0x100) {
                direction |= 0x10;
            } else if (targetX < -0x100) {
                direction |= 0x20;
            }
            if (targetY > 0x100) {
                direction |= 0x80;
            } else if (targetY < -0x100) {
                direction |= 0x40;
            }
        }
    }
    if (RiderHasFlag(rider, 0x40) != 0 && RiderHasFlag(rider, 0x2000000) != 0) {
        rider->unk220 = 0;
        UnsetRiderFlag(rider, 0x40);
    }
    rider->unk1C4 = direction;
    rider->unk1C8 = direction & ~buttons;
    rider->unk1C6 = buttons & ~rider->unk1C4;
    UnsetRiderFlag(rider, 0x2000000);
}

void sub_804CB08(RiderBase* rider, Actor* actor)
{
    s32 inputMagnitude;
    s32 limit;
    s32 steerX;
    s32 steerY;
    s32 moveX;
    s32 moveY;
    s32 rotateX;
    s32 rotateY;
    s32 cosine;
    s32 sine;
    s32 angle;
    unk16 heldInput;
    unk16 pressedInput;
    s16* timer0;
    s16* timer1;
    unk8 moving;

    (void)actor;
    inputMagnitude = rider->unk22A;
    limit = 0x100;
    if (rider->unk208 <= 0x1FF) {
        limit = rider->unk208 - 0x100;
        if (limit < 0) {
            limit = 0;
        }
        if (limit > 0x100) {
            limit = 0x100;
        }
        inputMagnitude = (inputMagnitude * limit) >> 8;
    }
    if (RiderHasFlag(rider, 0x100) != 0 || RiderHasFlag(rider, 0x2000) != 0) {
        return;
    }
    if (RiderHasFlag(rider, 0x4000000) == 0) {
        heldInput = _keyInput;
        pressedInput = _unk3005DA0;
    } else {
        RiderAI_804C8F0(rider);
        heldInput = rider->unk1C4;
        pressedInput = rider->unk1C8;
    }
    if (RiderHasFlag(rider, 2) == 0) {
        moving = 0;
        moveX = 0;
        moveY = 0;
        steerX = 0;
        steerY = 0;
        if ((pressedInput & 1) != 0 && rider->unk22E == 0 && rider->unk208 > 0x1FF) {
            moving = 1;
        }
        if ((heldInput & 0x20) != 0) {
            if (moving != 0) {
                steerX -= 0x1CC;
                moveX = -0x1CC;
                rider->unk22E = 0x3C;
            } else {
                steerX -= inputMagnitude;
            }
        }
        if ((heldInput & 0x10) != 0) {
            if (moving != 0) {
                steerX += 0x1CC;
                moveX = 0x1CC;
                rider->unk22E = 0x3C;
            } else {
                steerX += inputMagnitude;
            }
        }
        if ((heldInput & 0x40) != 0) {
            if (moving != 0) {
                steerY += 0x1CC;
                moveY = 0x1CC;
                rider->unk22E = 0x3C;
            } else {
                steerY += inputMagnitude;
            }
        }
        if ((heldInput & 0x80) != 0) {
            if (moving != 0) {
                steerY -= 0x1CC;
                moveY = -0x1CC;
                rider->unk22E = 0x3C;
            } else {
                steerY -= inputMagnitude;
            }
        }
        if (_currentGameState->unkC68 != 0 && RiderHasFlag(rider, 0x4000000) == 0) {
            cosine = SinTable[0x60];
            sine = SinTable[0x20];
            rider->unk40 += (steerX * cosine - steerY * sine) >> 8;
            rider->unk44 += (steerX * sine + steerY * cosine) >> 8;
            rotateX = moveX * cosine - moveY * sine;
            rotateY = (moveX * sine + moveY * cosine) >> 8;
            moveX = rotateX >> 8;
            moveY = rotateY;
        } else {
            rider->unk40 += steerX;
            rider->unk44 += steerY;
        }
        if (moving != 0 && rider->unk22E != 0) {
            sub_805582C(0, 0, moveX * 4, -moveY * 4, 0);
            if ((_currentGameState->unkC64 & 1) == 0) {
                rider->unk208 -= 0xF0;
            }
            sub_804ABFC(0x13);
        }
        if ((pressedInput & 2) != 0 && rider->unk230 == 0) {
            rider->unk230 = 0x10;
        }
        if (((heldInput & 2) != 0 || rider->unk230 != 0) && rider->unk208 > 0x1FF) {
            SetRiderFlag(rider, 0x80000);
            if (rider->unk230 != 0) {
                rider->unk230--;
            }
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
            if (RiderHasFlag(rider, 0x80000) != 0) {
                sub_8055734(7, NULL, NULL);
            } else {
                sub_805589C();
            }
        }
        if (sub_804A504() != 0) {
            *timer1 = 0x24;
            *timer0 = 0x24;
        }
        angle = (rider->unk208 >> 2) + 0x154;
        if (rider->unk208 <= 0x8FF) {
            rider->unk40
                -= (((SinTable[(unk8)((rider->unk1FC * angle) >> 8)] + 0x1F) >> 6) * limit) >> 8;
            rider->unk44
                += (((SinTable[(unk8)((rider->unk1FC * angle) >> 8) + 0x40] + 0x1F) >> 6) * limit)
                >> 8;
        }
    } else if (RiderHasFlag(rider, 0x4000000) == 0) {
        rider->unk52 = 5;
        rider->unk50 = 5;
    }
}

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
            if (RiderHasFlag(rider, 8) == 0) {
                rider->unk208 = 0x208 - 8;
            } else {
                rider->unk208 >>= 1;
            }
            break;
        case 1:
            rider->unk208 += -0x600;
            if (rider->unk208 <= 0x1FF) {
                rider->unk208 = 0x200;
            }
            rider->unk0->unk40 = (((sub_8057C40() >> 4) & 0xF) - 8) << 6;
            rider->unk0->unk44 = ((((sub_8057C40() >> 4) + 0xC8) & 0xF) - 8) << 6;
            rider->unk0->unk48 = 0x500;
            rider->unk0->z += 0x400;
            SetRiderFlag(rider, 2);
            break;
        case 2:
            rider->unk208 += -0x600;
            if (rider->unk208 <= 0x1FF) {
                rider->unk208 = 0x200;
            }
            rider->unk21E = 0x258;
            SetRiderFlag(rider, 0x40);
            break;
        case 3:
            break;
        case 4:
            rider->unk208 += -0x600;
            if (rider->unk208 <= 0x1FF) {
                rider->unk208 = 0x200;
            }
            rider->unk22C = 0;
            break;
        }
    }
}

void sub_804D048(RiderBase* rider)
{
    GeometryLine* line;
    LevelGeometryAddresses* geometry;
    Actor* actor;
    GeometryPoint* point;

    line = rider->unk200;
    geometry = &_gameData->unk434.geometry;
    actor = rider->unk0;
    if (line != NULL) {
        point = &geometry->unk4[line->point0];
        actor->x = point->x << 5;
        actor->y = point->y << 5;
        actor->z = (point->z << 5) + 0x8000;
        actor->unk40 = 0;
        actor->unk44 = 0;
        actor->unk48 = 0;
        rider->unk40 = 0;
        rider->unk44 = 0;
        rider->unk208 = 0xC00;
        rider->unk1FC = 0;
        rider->unk234 = 0;
        sub_804C888(rider, 1);
        if (_gameData->unk1618 != 0) {
            if (_currentGameState->unk6A4 == 2) {
                SetRiderFlag(rider, 0x20000);
                _gameData->unk434.unk224 = 0;
            } else {
                initGameloop2();
            }
        } else {
            initGameloop2();
        }
    }
}

void sub_804D104(RiderBase* rider)
{
    rider->unk48 = rider->unk40;
    rider->unk4C = rider->unk44;
}

void sub_804D110(RiderBase* rider, Actor* other)
{
    GeometrySplineLine* line;
    s32 delta;
    unk32 value;
    unk32 direction;
    s32 angularVelocity;
    s8 oldDirection;

    oldDirection = rider->unk8;
    UnsetRiderFlag(rider, 0x1000004);
    rider->unk1C0 = 0;
    delta = rider->unk20 - rider->unk24;
    rider->unk1C += delta;
    rider->unkC = (rider->unkC + (delta >> 4)) & 0xFF;
    rider->unk24 = rider->unk20;
    if (other->z > rider->unk1BC) {
        rider->unk1BC = other->z;
    }
    rider->unk1C &= 0xFFF;
    rider->unk74 &= 0xFFF;
    if (RiderHasFlag(rider, 0x12) == 0) {
        rider->unk14 = sub_804E258(rider->unk10, rider->unk1C, 0xFFF, 0x40, 0x10, 0x50);
    }
    rider->unk98 = 0;
    if (rider->unk22E != 0) {
        rider->unk22E--;
    }
    if (RiderHasFlag(rider, 0x4000000) == 0) {
        if ((_currentGameState->unkC64 & 1) == 0) {
            if (RiderHasFlag(rider, 0x80000) != 0 && RiderHasFlag(rider, 2) == 0) {
                rider->unk208 -= 8;
            } else {
                rider->unk208--;
            }
        }
        if (rider->unk208 <= 0x100) {
            sub_804C0EC(rider->unk4, (sub_8057C40() >> 6) & 1);
        }
        sub_804F824(rider->unk208 * 21);
        if (rider->unk208 <= 0xFF && sub_804AD60() == 0) {
            sub_804ABFC(0xF);
        }
        if (RiderHasFlag(rider, 0x20000) == 0 && (rider->unk208 <= 0 || other->z < -0x10000)) {
            sub_804FAD4();
            sub_80556C4();
            SetRiderFlag(rider, 0x8000000);
            sub_804D048(rider);
        }
    } else if (RiderHasFlag(rider, 0x4000000) != 0) {
        if (rider->unk208 > 0x200 && rider->unk208 <= 0xBFF) {
            rider->unk208 += rider->unk22C;
        }
        if (rider->unk208 <= 0x200) {
            rider->unk208 -= 3;
            SetRiderFlag(rider, 0x2000);
            if (rider->unk208 <= 0x100) {
                sub_804C0EC(rider->unk4, (sub_8057C40() >> 6) & 1);
            }
        }
        if (rider->unk208 < 0) {
            rider->unk208 = 0;
        }
        if (rider->unk208 == 0) {
            sub_804C0C0(rider->unk4);
        }
        if (other->z < -0x10000 || rider->unk208 == 0) {
            if (RiderHasFlag(rider, 8) != 0) {
                SetRiderFlag(&_gameData->base, 0x20000);
                sub_8056EC0();
                sub_8053E18(0);
                UnsetRiderFlag(rider, 8);
            }
            if (RiderHasFlag(rider, 0x1000) == 0) {
                SetRiderFlag(rider, 0x1000);
                sub_804C118(rider->unk4);
                sub_8053920();
                sub_804C0C0(rider->unk4);
            }
        }
    }
    if (RiderHasFlag(rider, 0x20000) != 0 || RiderHasFlag(rider, 0x2000) != 0) {
        rider->unk52 = 0x28;
        rider->unk50 = 0x28;
    }
    if (RiderHasFlag(rider, 0x100) != 0 && RiderHasFlag(rider, 2) == 0) {
        UnsetRiderFlag(rider, 0x100);
    }
    if (RiderHasFlag(rider, 0x100) == 0 && RiderHasFlag(rider, 0x400) == 0) {
        rider->unk234++;
    }
    rider->unk14 += rider->unk18;
    value = rider->unk10 + rider->unk14;
    rider->unk6C = (rider->unk6C + rider->unk70) & 0xFFF;
    rider->unk10 = value & 0xFFF;
    rider->unk2C = sub_804E224(rider->unk28, rider->unk30, 0xDC, 0x400);
    rider->unk28 += rider->unk2C;
    rider->unk38 = sub_804E224(rider->unk34, rider->unk3C, 0xDC, 0x400);
    rider->unk34 += rider->unk38;
    direction = ((rider->unk10 + 0x7F) & 0xFFF) >> 8;
    rider->unk8 = direction;
    if (direction != oldDirection) {
        rider->unk98 |= 1;
    }
    if (RiderHasFlag(rider, 0x4000000) != 0 && rider->unk220 != 0) {
        rider->unk220--;
    }
    if (rider->unk218 >= 0 && rider->unk214 == NULL) {
        rider->unk214 = _gameData->unk434.geometry.unk14[rider->unk218];
    }
    if (RiderHasFlag(rider, 0x4000000) != 0 && rider->unk214 != NULL) {
        line = sub_805DCFC(&_gameData->unk434.geometry, rider->unk214, rider->unk224 >> 18);
        angularVelocity = rider->unk21A;
        rider->unk224 += ((line->unkC >> 2) * angularVelocity) >> 8;
        if ((rider->unk224 >> 18) >= rider->unk214->pointCount - 1) {
            rider->unk224 = 0;
        }
    }
    if (RiderHasFlag(rider, 2) == 0) {
        sub_804D8D8(rider);
    }
    rider->unk1FC++;
    if (RiderHasFlag(rider, 0x4000000) == 0) {
        sub_804D710(rider);
    }
    if (RiderHasFlag(rider, 0x200000) != 0) {
        rider->unk1B8--;
    }
    if (rider->unk1B8 == 0) {
        UnsetRiderFlag(rider, 0x200000);
    }
    if (RiderHasFlag(rider, 2) != 0) {
        rider->unk198++;
    } else {
        rider->unk19C++;
    }
    if (RiderHasFlag(rider, 2) == 0 && sub_804E454(rider, 2) != 0) {
        rider->unk98 |= 8;
        sub_804DFF4(rider);
    }
    if (RiderHasFlag(rider, 2) == 0) {
        rider->unkEC = rider->unkE4;
    }
    if (RiderHasFlag(rider, 2) == 0) {
        rider->unk9 = rider->unk8;
    }
    if (RiderHasFlag(rider, 2) != 0 && sub_804E454(rider, 2) == 0) {
        rider->unk98 |= 0x10;
        sub_804E090(rider);
    }
    if (RiderHasFlag(rider, 0x200) != 0 && rider->unkCC == 0) {
        sub_804E1DC(rider);
    }
    sub_804DDF8(rider, other);
    sub_804D754(rider);
    rider->unk1A0 = other->unk40;
    rider->unk1A4 = other->unk44;
    rider->unkA4 = (rider->flags ^ rider->unkA0) & (rider->flags | rider->unkA0);
    rider->unkB0 = (rider->unkA8 ^ rider->unkAC) & (rider->unkA8 | rider->unkAC);
    rider->unk15C = (rider->unk154 ^ rider->unk158) & (rider->unk154 | rider->unk158);
    rider->unkA0 = rider->flags;
    rider->unkAC = rider->unkA8;
    rider->unk158 = rider->unk154;
    SetRiderFlag(rider, 2);
    rider->unk88 = 0;
}

void sub_804D710(RiderBase* rider)
{
    if (rider->unk19C == 4) {
        sub_804ABFC(2);
    }
    if (sub_804E440(rider, 0x80000) != 0 && RiderHasFlag(rider, 0x80000) != 0) {
        sub_804ABFC(0x11);
    }
}

void sub_804D754(RiderBase* rider)
{
    Actor* actor;
    s32 current;
    s32 target;
    unk32 direction;
    unk32 category;
    s32 motion;
    s32 callbackSequence;

    actor = rider->unk0;
    current = rider->unk204;
    target = rider->unk206;
    direction = 0;
    motion = -1;
    if (rider->unk48 > 0xC) {
        direction = 1;
    } else if (rider->unk48 < -0xC) {
        direction = 2;
    }
    if (rider->unk4C > 0xC) {
        direction |= 4;
    } else if (rider->unk4C < -0xC) {
        direction |= 8;
    }
    switch (direction) {
    case 1:
        motion = 2;
        break;
    case 5:
        motion = 1;
        break;
    case 9:
        motion = 3;
        break;
    case 2:
        motion = 6;
        break;
    case 10:
        motion = 5;
        break;
    case 6:
        motion = 7;
        break;
    case 4:
        motion = 0;
        break;
    case 8:
        motion = 4;
        break;
    }
    category = 0;
    if (rider->unk208 <= 0x8FF) {
        category = 1;
    }
    if (rider->unk208 <= 0x3FF) {
        category = 2;
    }
    if (rider->unk208 <= 0x1FF) {
        category = 3;
    }
    if (rider->unk208 <= 0xFF) {
        actor->unk36 = (0x100 - rider->unk208) >> 1;
        category = 4;
    }
    if (category != current) {
        // TODO: fakematch
        if (category <= 1 || category == 0x400) {
            callbackSequence = -1;
            if (callbackSequence != category) {
                callbackSequence = category;
            }
        }
        actor->unk31 = 0;
        actor_80580C0(actor, category, category);
        rider->unk204 = category;
        rider->unk206 = -1;
    }
    if (category <= 1 && motion != target) {
        if (motion >= 0) {
            actor->unk31 = 0;
            sub_8058390(actor, 5, motion, 0);
            rider->unk206 = motion;
        } else {
            actor->unk31 = 0;
            actor_80580C0(actor, category, category);
            rider->unk204 = category;
            rider->unk206 = -1;
        }
    }
}

void sub_804D8D8(RiderBase* rider)
{
    s32 x;
    s32 y;
    s32 maxX;
    s32 defaultMaxX;
    s32 maxY;
    s32 alternateMaxX;
    s32 dirX;
    s32 dirY;
    unk16 length;
    s32 speedX;
    s32 speedY;

    speedX = rider->unk50;
    speedY = rider->unk52;
    defaultMaxX = rider->unk54;
    alternateMaxX = rider->unk58;
    x = rider->unk40;
    y = rider->unk44;
    dirX = (x * speedX) >> 8;
    dirY = (y * speedY) >> 8;
    if (RiderHasFlag(rider, 0x100000) != 0) {
        maxX = alternateMaxX;
    } else {
        maxX = defaultMaxX;
    }
    if (RiderHasFlag(rider, 0x400000) != 0) {
        maxY = rider->unk5A;
    } else {
        maxY = rider->unk56;
    }
    if (maxX > (x < 0 ? -x : x)) {
        dirX = x;
        UnsetRiderFlag(rider, 0x100000);
    } else {
        SetRiderFlag(rider, 0x100000);
    }
    if (maxY > (y < 0 ? -y : y)) {
        dirY = y;
        UnsetRiderFlag(rider, 0x400000);
    } else {
        SetRiderFlag(rider, 0x400000);
    }
    if (dirX == 0 && x != 0) {
        dirX = 1;
        if (x < 0) {
            dirX = -1;
        }
    }
    if (dirY == 0 && y != 0) {
        dirY = 1;
        if (y < 0) {
            dirY = -1;
        }
    }
    x -= dirX;
    y -= dirY;
    rider->unk8C = y;
    rider->unk60 = x;
    rider->unk40 = x;
    rider->unk44 = y;
    rider->unk48 -= x;
    rider->unk4C -= y;
    length = Sqrt(x * x + y * y);
    rider->unk5C = (rider->unk40 << 8) / length;
    rider->unk5E = (rider->unk44 << 8) / length;
    rider->unk62 = sub_8057878(rider->unk5C, rider->unk5E);
    rider->unk64 = length;
    rider->unk68 = NULL;
}

void nullsub_5(RiderBase* rider)
{
}

unk8 sub_804DA48(RiderBase* rider, RiderBase* otherRider, s32 radius)
{
    Actor* pos0;
    Actor* pos1;
    s32 x0;
    s32 y0;
    s32 z0;
    s32 x1;
    s32 y1;
    s32 z1;
    s32 x;
    s32 y;
    s32 z;

    pos0 = rider->unk0;
    pos1 = otherRider->unk0;
    if (RiderHasFlag(otherRider, 2)) {
        return 0;
    }
    x0 = pos0->x;
    y0 = pos0->y;
    z0 = pos0->z;
    x1 = pos1->x;
    y1 = pos1->y;
    z1 = pos1->z;
    x = (x1 - x0) >> 8;
    y = (y1 - y0) >> 8;
    z = (z1 - z0) >> 8;
    if (x * x + y * y + z * z < radius * radius) {
        return 1;
    }
    return 0;
}

void sub_804DAA0(RiderBase* rider, RiderBase* other)
{
    RiderBase* temp;
    Actor* pos0;
    Actor* pos1;
    s32 x0, y0, z0;
    s32 x1, y1, z1;
    s32 dx;
    s32 dy;
    s32 dz;

    if (RiderHasFlag(rider, 0x04000000) == 0) {
        temp = rider;
        rider = other;
        other = temp;
    }
    if (RiderHasFlag(rider, 0x04000000) != 0 && RiderHasFlag(other, 0x04000000) == 0
        && RiderHasFlag(rider, 1) == 0 && RiderHasFlag(rider, 0x40) == 0) {
        pos0 = rider->unk0;
        pos1 = other->unk0;
        x0 = pos0->x;
        y0 = pos0->y;
        z0 = pos0->z;
        x1 = pos1->x;
        y1 = pos1->y;
        z1 = pos1->z;
        dx = (x1 - x0) >> 8;
        dy = (y1 - y0) >> 8;
        dz = (z1 - z0) >> 8;
        if (dx * dx + dy * dy + dz * dz < rider->unk210) {
            if (rider->unk220 > rider->unk222) {
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
            if (rider1->unk208 > 0x1FF) {
                rider0->unk208 += -0x200;
            }
            rider0->unk220 += 0xF0;
        }
        if (RiderHasFlag(rider1, 0x4000000) != 0 && RiderHasFlag(rider0, 0x4000000) == 0) {
            if (rider1->unk208 > 0x1FF) {
                rider1->unk208 += -0x200;
                if (rider1->unk208 <= 0x1FF) {
                    rider1->unk208 = 0x200;
                }
            }
            rider1->unk220 += 0xF0;
        }
    }
    return 0;
}

void sub_804DDF8(RiderBase* rider, Actor* other)
{
    s32 matrix[9];
    s32 vec0[4];
    s32 vec1[4];
    s32 vec2[4];
    s32 vec3[4];
    unk32 angle0;
    unk32 angle1;
    unk32 angle2;
    unk32 q0;
    unk32 q1;
    unk32 q2;
    unk32 q3;
    unk32 q4;
    unk32 q5;
    unk32 mask;
    const s16* table;
    s32 x;
    s32 y;
    unk32 z;
    unk32 offset;

    mask = 0xFF;
    table = SinTable;
    angle0 = (0 - rider->unk16C) & mask;
    angle0 >>= 1;
    q0 = table[angle0];
    angle0 += 0x40;
    q1 = table[angle0];
    angle1 = (unk8)(rider->unk170 >> 1);
    q2 = table[angle1];
    angle1 += 0x40;
    q3 = table[angle1];
    angle2 = (unk8)(rider->unk16C >> 1);
    q4 = table[angle2];
    angle2 += 0x40;
    q5 = table[angle2];
    sub_8059FF8(vec0, 0, q0, 0, q1);
    sub_8059FF8(vec1, 0, 0, q2, q3);
    sub_8059FF8(vec2, 0, q4, 0, q5);
    sub_805A148(vec0, vec1, vec3);
    sub_805A148(vec3, vec2, rider->unk178);
    sub_805A1DC(rider->unk178, matrix);

    if (sub_804E440(rider, 2) != 0 && RiderHasFlag(rider, 2) == 0) {
        rider->unk40 = other->unk40;
        rider->unk44 = -other->unk44;
    }
    if (RiderHasFlag(rider, 2) == 0) {
        x = rider->unk40 << 8;
        y = rider->unk44 << 8;
        rider->unk78 = (matrix[0] * x + matrix[6] * y) >> 16;
        rider->unk80 = (-(matrix[1] * x + matrix[7] * y)) >> 16;
        rider->unk7C = (-(matrix[2] * x + matrix[8] * y)) >> 16;
    }
    if (RiderHasFlag(rider, 2) == 0) {
        other->unk40 = rider->unk78;
        other->unk44 = rider->unk7C;
        z = rider->unk80 + other->unk54;
        offset = rider->unk88 - 0x78;
        other->unk48 = z + offset;
    } else if (rider->unk88 != 0) {
        other->unk48 += rider->unk88;
    }
}

void sub_804DF88(RiderBase* rider, Actor* actor)
{
    rider->unk1A0 = actor->unk40;
    rider->unk1A4 = actor->unk44;
    if ((rider->unk150 & 1) != 0) {
        switch (rider->unk14C) {
        case 1000:
            actor->unk68 = 0x10;
            break;
        case 1001:
            actor->unk68 = 0x10;
            break;
        case 1002:
            actor->unk68 = 0x10;
            break;
        case 1003:
            actor->unk68 = 0x10;
            break;
        case 1004:
            actor->unk68 = 0x10;
            break;
        case 1005:
            actor->unk68 = 0x10;
            break;
        }
    }
}

void sub_804DFF4(RiderBase* rider)
{
    s32 speed;

    // TODO: fakematch?
    speed = rider->unk70;
    if (speed < 0) {
        speed = -speed;
    }

    rider->unk19C = 0;
    rider->unk1BC = 0;
    UnsetRiderFlag(rider, 0x8000);
    rider->unk1C = rider->unk10;
    rider->unk14 = 0;
    rider->unk144 = 0;
    rider->unk168 = 0;
    if (rider->unkB8 != NULL && RiderHasFlag(rider, 0x4000000) == 0) {
        sub_804E154(rider, 0, 0);
    }
    UnsetRiderFlag(rider, 0x20);
    rider->unkD2 = 0;
    if (RiderHasFlag(rider, 0x4000000) == 0 && rider->unk198 > 8) {
        sub_80558B8();
    }
    UnsetRiderFlag(rider, 0x4010);
}

void sub_804E090(RiderBase* rider)
{
    s32 value;
    s32 angle;
    s16 result;
    s32 delta;

    rider->unk19C = 0;
    rider->unk198 = 0;
    rider->unkBC = -1;
    value = rider->unk170;
    UnsetRiderFlag(rider, 0x40000);
    if (value > 0 && rider->unk80 > 0) {
        if (rider->unkEC != NULL && rider->unkEC->unkF == 0x81) {
            angle = (0x80 - rider->unk16C) & 0xFF;
            angle &= 0x7F;
            result = sub_804E358(angle, rider->unk10 >> 4);
            angle = rider->unk10 >> 4;
            delta = result * 2;
            delta -= 0x80;
            angle -= delta;
            rider->unkC = (unk16)angle & 0xFF;
        } else {
            rider->unk90 = rider->unk0->z;
        }
    }
}

void sub_804E124(RiderBase* rider, GeometryLine* line)
{
    if (line->unk11_1 != 0) {
        rider->unk40 -= (line->unk18 * 5) >> 3;
    } else {
        rider->unk44 += (line->unk18 * 5) >> 3;
    }
}

void sub_804E154(RiderBase* rider, unk32 arg1, unk32 arg2)
{
    unk16 value;

    value = arg2;
    UnsetRiderFlag(rider, 0x40000);
    if (RiderHasFlag(rider, 0x4000000) == 0) {
        rider->unk1EE -= 0x400;
        if (rider->unk1EE < 0) {
            rider->unk1EE = 0;
        }
        rider->unk1F2 -= 0x200;
        if (rider->unk1F2 < 0) {
            rider->unk1F2 = 0;
        }
    }
    rider->unk144 = 0;
    SetRiderFlag(rider, 0x200);
    rider->unkCC = 0xA0;
    rider->unk6C = 0;
    rider->unk74 = 0;
    rider->unk70 = 0;
    rider->unk30 = 0;
    rider->unk3C = 0;
    rider->unk150 = value;
}

void sub_804E1DC(RiderBase* rider)
{
    Actor* actor;

    actor = rider->unk0;
    UnsetRiderFlag(rider, 0x200);
    actor->unk4C = 0;
    actor->unk50 = 0;
    rider->unk1C = rider->unk10;
}

void sub_804E1FC(RiderBase* rider, u8 arg1)
{
    rider->unk10 = arg1 << 4;
    rider->unk1C = arg1 << 4;
    rider->unk14 = 0;
}

void sub_804E20C(RiderBase* rider, unk32 arg1, unk32 arg2)
{
    s16 value1;
    s16 value2;

    rider->unk2C = 0;
    value1 = arg1 << 8;
    rider->unk28 = rider->unk30 = value1;
    rider->unk38 = 0;
    value2 = arg2 << 8;
    rider->unk34 = rider->unk3C = value2;
}

s32 sub_804E224(s32 arg0, s32 arg1, unk8 arg2, s32 limit)
{
    s32 delta;
    s32 magnitude;
    s32 result;

    delta = arg1 - arg0;
    magnitude = delta;
    if (delta < 0) {
        magnitude = -delta;
    }
    result = (magnitude * arg2) >> 8;
    if (result == 0 && magnitude != 0) {
        result = magnitude;
    }
    if (result > limit) {
        result = limit;
    }
    if (delta < 0) {
        result = -result;
    }
    return result;
}

s32 sub_804E258(s32 arg0, s32 arg1, s32 period, unk8 scale, unk32 unused, s32 limit)
{
    s32 delta;
    s32 magnitude;
    s32 result;
    s32 scaled;

    delta = arg1 - arg0;
    magnitude = delta;
    if (delta < 0) {
        magnitude = -delta;
    }
    if (magnitude > (period >> 1)) {
        magnitude -= period;
    }
    result = (magnitude * scale) >> 8;
    scaled = result;
    if (result < 0) {
        result = -result;
    }
    if (scaled == 0 && magnitude != 0) {
        result = magnitude;
    }
    if (result > limit) {
        result = limit;
    }
    if (scaled < 0) {
        result = -result;
    }
    if (delta < 0) {
        result = -result;
    }
    return result;
}

unk32 sub_804E3B0(unk32 arg0, unk32 arg1, unk32 arg2);

s32 sub_804E2A4(s32 arg0, s32 arg1, s32 period, s16 scale, unk32 unused, s32 limit)
{
    s32 delta;
    s32 adjusted;
    s32 magnitude;
    s16 scaleValue;
    s32 result;

    if (scale == 0) {
        return sub_804E258(arg0, arg1, period, scale, unused, limit);
    }
    delta = sub_804E3B0(arg0, arg1, period);
    if (scale > 0 && delta < 0) {
        adjusted = delta + 1;
        delta = period + adjusted;
    }
    if (scale < 0 && delta > 0) {
        adjusted = delta - 1;
        delta = adjusted - period;
    }
    if (delta < 0) {
        magnitude = -delta;
        scaleValue = -scale;
    } else {
        magnitude = delta;
        scaleValue = scale;
    }
    result = (scaleValue * magnitude) >> 8;
    if (magnitude == 0 && delta != 0) {
        result = 0;
    }
    if (result > limit) {
        result = limit;
    }
    if (delta < 0) {
        result = -result;
    }
    return result;
}

s16 sub_804E328(unk8 arg0, unk8 arg1)
{
    s16 delta;
    unk16 result;

    delta = sub_804E358(arg0, arg1);
    if (delta > 0x3F) {
        result = -((delta - 0x40) << 1);
    } else {
        result = (0x40 - delta) << 1;
    }
    return result;
}

s16 sub_804E358(unk8 arg0, unk8 arg1)
{
    s16 delta;
    s16 magnitude;
    s16 result;

    delta = arg1 - arg0;
    if (delta < 0) {
        magnitude = -delta;
    } else {
        magnitude = delta;
    }
    if (magnitude > 0x80) {
        result = 0x100 - magnitude;
    } else {
        result = magnitude;
    }
    if (delta < 0 || magnitude > 0x80) {
        result = -result;
    }
    return result;
}

unk32 sub_804E3B0(unk32 arg0, unk32 arg1, unk32 arg2)
{
    s32 delta;
    unk32 magnitude;
    unk32 result;
    unk32 difference;
    unk32 half;
    unk32 threshold;
    unk32 threshold_copy;

    magnitude = arg1 - arg0;
    delta = magnitude;
    if (delta < 0) {
        magnitude = -magnitude;
    }
    threshold = arg2 + 1;
    half = threshold >> 1;
    threshold_copy = threshold; // TODO: fakematch?
    if (magnitude > half) {
        difference = magnitude - 1;
        result = arg2 - difference;
    } else {
        result = magnitude;
    }
    if (delta < 0 || magnitude > (threshold_copy >> 1)) {
        result = -result;
    }
    return result;
}

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
    if ((rider->flags & flags) == flags) {
        return 1;
    }
    return 0;
}

unk8 RiderHasSomeFlags(RiderBase* rider, unk32 flags)
{
    if ((rider->flags & flags) != 0) {
        return 1;
    }
    return 0;
}

unk8 sub_804E440(RiderBase* rider, unk32 flags)
{
    if ((rider->unkA4 & flags) != 0) {
        return 1;
    }
    return 0;
}

unk8 sub_804E454(RiderBase* rider, unk32 flags)
{
    if ((rider->unkA0 & flags) == flags) {
        return 1;
    }
    return 0;
}

ASM_ZEROPAD
