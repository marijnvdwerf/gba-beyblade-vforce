#include "collision.h"

#include <agb/bios.h>

#include "collectable.h"
#include "debug.h"
#include "effects.h"
#include "event.h"
#include "gameinit.h"
#include "gamestate.h"
#include "geometry.h"
#include "include_asm.h"
#include "leveldesigns.h"
#include "music.h"
#include "ram.h"
#include "riderphysics.h"

unk32 sub_80561EC(Actor*, LevelGeometryAddresses*, GeometryLine*);
extern unk8 def_94_4_AddWithBoundingAreaMessage(Actor*, LevelGeometryAddresses*, GeometryLine*);
extern unk8 def_94_8_collision_8055F2C(Actor*, LevelGeometryAddresses*, GeometryLine*, unk16);

void sub_8055CB8(void)
{
    withBoundingAreaCount = 0;
    sub_805E50C(&_unk3000FC0, def_94_0_8055CFC, def_94_4_AddWithBoundingAreaMessage, def_94_8_collision_8055F2C);
    sub_805E514(_unk3000FD0, 0, 0, 0, 0);
}

unk8 def_94_0_8055CFC(Actor* actor, LevelGeometryAddresses* geometry, GeometryLine* line, unk16 collisionMask)
{
    RiderBase* rider;

    rider = actor->unkB4.rider;
    if (rider == NULL) {
        return 0;
    }
    if ((collisionMask & 0x99) != 0) {
        if ((collisionMask & 0x90) != 0) {
            sub_8055D64(actor, rider, geometry, line, collisionMask & 0x90, 0x40);
        }
        if ((collisionMask & 9) != 0) {
            sub_8055D64(actor, rider, geometry, line, collisionMask & 9, 0);
        }
    }
}

void sub_8055D64(Actor* actor, RiderBase* rider, LevelGeometryAddresses* geometry, GeometryLine* line, unk16 collisionMask, unk16 angle)
{
    s16 angleDelta;
    s16 direction;
    unk16 savedAngle;
    EnvironmentObject* object;
    s32 angleThreshold;
    s16 angleValue;
    s16 signedAngle;

    angleDelta = sub_804E358(angle, rider->unk8 << 4);
    direction = 0x10;
    savedAngle = angle;
    if (line->unk11_3 != 0) {
        object = GetStruct4(sub_805BAC0(geometry, line));
    }
    SetRiderFlag(rider, 0x200000);
    rider->unk1B8 = 8;
    if (angleDelta < 0) {
        angleDelta = -angleDelta;
        direction = -direction;
    }
    angleThreshold = angleDelta * 0x10000;
    if ((collisionMask & 0x90) != 0) {
        if (line->unk11_3 == 0) {
            rider->unk40 = -rider->unk40;
        } else {
            rider->unk40 = object->unk40 * 2 - rider->unk40;
        }
    } else if ((collisionMask & 9) != 0) {
        if (line->unk11_3 == 0) {
            rider->unk44 = -rider->unk44;
        } else {
            rider->unk44 = -(rider->unk44 + object->unk44 * 2);
        }
    }
    if (angleThreshold - 0x400000 >= 0) {
        signedAngle = angle;
        angleValue = signedAngle + 0x80;
        angle = angleValue + direction;
    } else {
        angleValue = angle;
        angle = angleValue - direction;
    }
    angle &= 0xFF;
    if (rider->unkB8 != NULL) {
        sub_8055F04(actor, rider, line, collisionMask, savedAngle);
    } else {
        sub_804E1FC(rider, (unk8)angle);
    }
    if (RiderHasFlag(rider, 0x04000000) == 0) {
        sub_8055734(4, NULL, NULL);
        sub_80558B8();
        sub_804ABFC(0);
        if ((_currentGameState->unkC64 & 1) == 0) {
            if (rider->unk208 > 0x100) {
                rider->unk208 -= 0x100;
            }
        }
    }
}

void sub_8055F04(Actor* actor, RiderBase* rider, GeometryLine* line, unk16 collisionMask, s16 angle)
{
    s16 angleDelta;
    s32 angleThreshold;

    angleDelta = sub_804E358(angle, rider->unk10 >> 4);
    if (angleDelta < 0) {
        angleDelta = -angleDelta;
    }
    angleThreshold = angleDelta * 0x10000; // TODO: fakematch?
    sub_804E154(rider, 0, 0);
}

unk8 def_94_8_collision_8055F2C(Actor* actor, LevelGeometryAddresses* geometry, GeometryLine* line, unk16 collisionMask)
{
    CollisionResult result;
    RiderBase* rider;
    GeometryPoint* point0;
    GeometryPoint* point1;
    GeometryPoint* lower;
    GeometryPoint* upper;
    unk16 distance;
    unk32 lineIndex;
    LineMetadata* metadata;
    LineMetaObject* event;

    rider = actor->unkB4.rider;
    point0 = &geometry->unk4[line->point0];
    point1 = &geometry->unk4[line->point1];
    lower = point0->z < point1->z ? point0 : point1;
    upper = point0->z > point1->z ? point0 : point1;
    if (rider == NULL || (collisionMask & line->unk10) == 0) {
        return 1;
    }
    switch (line->unkF) {
    case 0x8C: {
        s16 height;

        height = line->unk16;
        if (RiderHasFlag(rider, 0x4000000)) {
            return 0;
        }
        if ((collisionMask & line->unk10) == 0) {
            return 0;
        }
        if (height == 0 && upper->z != 0 && actor->z > (upper->z << 5)) {
            return 0;
        }
        if (height > 0) {
            if (actor->z < ((lower->z - (height << 3)) << 5)) {
                return 0;
            }
            if (actor->z > ((lower->z + (height << 3)) << 5)) {
                return 0;
            }
        }
        if (height < 0 && actor->z > ((lower->z - (height << 3)) << 5)) {
            return 0;
        }
        lineIndex = sub_805BAC0(geometry, line);
        if (lineIndex == -1) {
            return 0;
        }
        metadata = GetLineMetaData(geometry, lineIndex);
        if (metadata == NULL) {
            return 0;
        }
        event = getLineMetaObjectBytype(geometry, metadata, 6);
        if (event == NULL) {
            return 0;
        }
        SetRiderGlobal(rider);
        processMetadata_6(geometry, line, lineIndex, metadata, event);
        return 0;
    }
    case 0x9A: {
        s16 height;

        height = line->unk16;
        if ((collisionMask & line->unk10) == 0) {
            return 0;
        }
        if (height == 0 && upper->z != 0 && actor->z > (upper->z << 5)) {
            return 0;
        }
        if (height > 0) {
            if (actor->z < ((lower->z - (height << 3)) << 5)) {
                return 0;
            }
            if (actor->z > ((lower->z + (height << 3)) << 5)) {
                return 0;
            }
        }
        if (height < 0 && actor->z > ((lower->z - (height << 3)) << 5)) {
            return 0;
        }
        lineIndex = sub_805BAC0(geometry, line);
        if (lineIndex == -1) {
            return 0;
        }
        metadata = GetLineMetaData(geometry, lineIndex);
        if (metadata == NULL) {
            return 0;
        }
        event = getLineMetaObjectBytype(geometry, metadata, 6);
        if (event == NULL) {
            return 0;
        }
        SetRiderGlobal(rider);
        processMetadata_6(geometry, line, lineIndex, metadata, event);
        return 0;
    }
    case 0x8D:
        distance = line->unk16;
        if (actor->z < ((lower->z - (distance << 3)) << 5)) {
            return 0;
        }
    default:
        if ((collisionMask & 0x66) != 0) {
            if ((upper->z << 5) - actor->z > -0x300) {
                rider->unk88 = 0xDC;
                actor->z = upper->z << 5;
            }
            return 0;
        }
        if (point0->z != 0 || point1->z != 0) {
            if (line->unk11_2 == 0) {
                sub_80567E4(geometry, line, actor, &result);
            } else {
                sub_8056910(geometry, line, actor, &result);
            }
            if (result.unk8 - 0xC00 < actor->z) {
                return 0;
            }
        }
        return 1;
    case 0x8E:
    case 0x90:
        return 0;
    }
}

void nullsub_6(Actor* actor, RiderBase* rider)
{
}

unk8 sub_8056158(Actor* actor, LevelGeometryAddresses* geometry, GeometryLine* line, unk16 collisionMask)
{
    if (actor->z + actor->unk48 <= 0) {
        actor->z = 0;
        actor->unk48 = 0;
    }
}

unk8 def_94_4_AddWithBoundingAreaMessage(Actor* actor, LevelGeometryAddresses* geometry, GeometryLine* line)
{
    if (withBoundingAreaCount > 0x1F) {
        printf("Error adding withinBoundingArea message to list\n");
    } else {
        withBoundingAreas[withBoundingAreaCount] = line;
        withBoundingAreaCount++;
    }
}

void sub_80561A0(Actor* actor, LevelGeometryAddresses* geometry)
{
    s32 i;

    for (i = 0; i < withBoundingAreaCount; i++) {
        sub_80561EC(actor, geometry, withBoundingAreas[i]);
    }
    withBoundingAreaCount = 0;
}

unk32 sub_80561EC(Actor* actor, LevelGeometryAddresses* geometry, GeometryLine* line)
{
    CollisionResult scratch;
    CollisionResult result80;
    CollisionResult result92;
    s32 maxX;
    s32 maxY;
    RiderBase* rider;
    GeometryPoint* point0;
    GeometryPoint* point1;
    GeometryPoint* lowerC;
    GeometryPoint* lowerD;
    GeometryPoint* firstC;
    GeometryPoint* secondC;
    GeometryPoint* firstD;
    GeometryPoint* secondD;
    s32 minX;
    s32 minY;
    CollisionResult* result;
    s32 difference;
    s32 minDifference;
    s32 maxDifference;
    s32 swap;
    s32 lowerZC;
    s32 upperZ;
    s32 lowerZD;
    s32 lineIndex;
    LineMetadata* metadata;
    unk16 height;

    rider = actor->unkB4.rider;
    point0 = &geometry->unk4[line->point0];
    point1 = &geometry->unk4[line->point1];
    if (point0->x < point1->x) {
        minX = point0->x << 5;
        maxX = point1->x << 5;
    } else {
        minX = point1->x << 5;
        maxX = point0->x << 5;
    }
    if (point0->y < point1->y) {
        minY = point0->y << 5;
        maxY = point1->y << 5;
    } else {
        minY = point1->y << 5;
        maxY = point0->y << 5;
    }
    if (line->unk11_3) {
        if (actor->x <= minX || actor->x >= maxX || actor->y <= minY || actor->y >= maxY) {
            return;
        }
    }
    result = &scratch;
    if (rider != NULL) {
        result = &rider->unkF4;
    }
    switch (line->unkF) {
    case 0x80:
        sub_80567E4(geometry, line, actor, &result80);
        if (actor->x > maxX || actor->y > maxY) {
            break;
        }
        if (actor->z > result80.unk8 && (point0->z != 0 || point1->z != 0)) {
            break;
        }
        if (line->unkD > rider->unk1C0) {
            rider->unk1C0 = line->unkD;
            SetRiderFlag(rider, 4);
        } else if (line->unk16 > rider->unk1C0) {
            rider->unk1C0 = line->unk16;
            SetRiderFlag(rider, 0x1000000);
        }
        break;
    case 0x92:
        sub_80567E4(geometry, line, actor, &result92);
        if (actor->x > maxX || actor->y > maxY) {
            break;
        }
        if (actor->z > result92.unk8 && (point0->z != 0 || point1->z != 0)) {
            break;
        }
        difference = actor->x - actor->y;
        minDifference = (point0->x - point0->y) << 5;
        maxDifference = (point1->x - point1->y) << 5;
        if (minDifference > maxDifference) {
            swap = minDifference;
            minDifference = maxDifference;
            maxDifference = swap;
        }
        minDifference -= 0x1000;
        maxDifference += 0x1000;
        if (line->unkD > rider->unk1C0 && difference >= minDifference && difference < maxDifference) {
            rider->unk1C0 = line->unkD;
            SetRiderFlag(rider, 4);
        }
        break;
    case 0x8A:
        if (line->unk11_2 == 0) {
            sub_80567E4(geometry, line, actor, result);
        } else {
            sub_8056910(geometry, line, actor, result);
        }
        sub_8056610(geometry, line, rider, result);
        break;
    case 0x8B:
        if (actor->z > (((point0->z < point1->z) ? point0 : point1)->z << 5)) {
            break;
        }
        if (RiderHasFlag(rider, 0x4000000)) {
            break;
        }
        if (RiderHasFlag(rider, 0x400)) {
            break;
        }
        sub_8056EC0();
        sub_804ABFC(10);
        if (_gameData->unkC6C == -1) {
            SetRiderFlag(rider, 0x800);
        }
        actor->unk48 = 0;
        SetRiderFlag(rider, 0x20000);
        sub_8053E18(0);
        break;
    case 0x8C:
        firstC = &geometry->unk4[line->point0];
        secondC = &geometry->unk4[line->point1];
        if (firstC->z < secondC->z) {
            lowerC = firstC;
        } else {
            lowerC = secondC;
        }
        lowerZC = (lowerC->z - (line->unk16 << 3)) << 5;
        upperZ = lowerC->z << 5;
        if (!RiderHasFlag(rider, 0x4000000)) {
            height = line->unk16;
            if (height == 0 || line->unk10 == 0) {
                break;
            }
            if ((actor->z < lowerZC && actor->z + actor->unk48 > lowerZC) || (actor->z > upperZ && actor->z + actor->unk48 < upperZ)) {
                lineIndex = sub_805BAC0(geometry, line);
                if (lineIndex != -1) {
                    metadata = GetLineMetaData(geometry, lineIndex);
                    if (metadata != NULL && getLineMetaObjectBytype(geometry, metadata, 6) != NULL) {
                        break;
                    }
                }
            } else {
                break;
            }
        }
        return 0;
    case 0x8D:
        firstD = &geometry->unk4[line->point0];
        secondD = &geometry->unk4[line->point1];
        if (firstD->z < secondD->z) {
            lowerD = firstD;
        } else {
            lowerD = secondD;
        }
        height = line->unk16;
        lowerZD = (lowerD->z - (height << 3)) << 5;
        if (actor->z <= lowerZD) {
            if (actor->z + actor->unk48 > lowerZD) {
                actor->unk48 = 0;
                actor->z = lowerZD;
            }
            break;
        }
        if (line->unk11_2 == 0) {
            sub_80567E4(geometry, line, actor, result);
        } else {
            sub_8056910(geometry, line, actor, result);
        }
        sub_8056610(geometry, line, rider, result);
        break;
    case 0x97:
        rider->unk68 = line;
        break;
    case 0x94:
        if (RiderHasFlag(rider, 0x4000000)) {
            SetRiderFlag(rider, 0x2000000);
            rider->unk1C3 = line->unk8;
        }
        break;
    case 0x86:
    case 0x87:
    case 0x89:
    case 0x8E:
    case 0x90:
    case 0x91:
    case 0x98:
        break;
    default:
        if (line->unk11_2 == 0) {
            sub_80567E4(geometry, line, actor, result);
        } else {
            sub_8056910(geometry, line, actor, result);
        }
        sub_8056610(geometry, line, rider, result);
        break;
    }
}

void sub_8056610(LevelGeometryAddresses* geometry, GeometryLine* line, RiderBase* rider, CollisionResult* result)
{
    Actor* actor;
    s32 direction;

    actor = rider->unk0;
    if (result->unk8 > rider->unk1B4) {
        rider->unk1B4 = result->unk8;
    }
    if (result->unkC_1 == 0) {
        rider->unkE4 = NULL;
        return;
    }
    if (actor->z + actor->unk48 > result->unk8) {
        rider->unkE4 = NULL;
        return;
    }
    if (line != rider->unkE8) {
        rider->unkE8 = rider->unkE4;
    }
    rider->unkE4 = line;
    rider->unkF0 = _unk3000E30[0];
    rider->unk94 = actor->unk48;
    switch (line->unkF) {
    case 0x81:
        rider->unk170 = result->unk18;
        rider->unk174 = result->unk1C;
        rider->unk16C = result->unk14;
        rider->unk30 = result->unk20;
        rider->unk3C = result->unk24;
        break;
    case 0x85:
        rider->unk170 = result->unk18;
        rider->unk174 = result->unk1C;
        rider->unk16C = result->unk14;
        break;
    default:
        if (result->unkC_0 != 0) {
            if (result->unkD >= 0) {
                rider->unk170 = result->unkD;
                rider->unk174 = rider->unk28 >> 8;
                rider->unk16C = 0;
            } else {
                rider->unk170 = -result->unkD;
                rider->unk174 = (-rider->unk28) >> 8;
                rider->unk16C = 0x80;
            }
        } else {
            direction = -result->unkE;
            if (direction >= 0) {
                rider->unk170 = direction;
                rider->unk174 = (-rider->unk34) >> 8;
                rider->unk16C = 0x40;
            } else {
                rider->unk170 = result->unkE;
                rider->unk174 = rider->unk34 >> 8;
                rider->unk16C = 0xC0;
            }
        }
        rider->unk30 = result->unkD << 8;
        rider->unk3C = result->unkE << 8;
        break;
    }
    rider->unk74 = 0;
    rider->unkE0 = line;
    if (actor->unk48 < -0x300) {
        actor->unk48 = -((0x56 * actor->unk48) >> 8);
        sub_804ABFC(3);
        if (RiderHasFlag(rider, 0x04000000) == 0) {
            sub_80558B8();
        }
    } else {
        UnsetRiderFlag(rider, 2);
    }
    actor->z = result->unk8;
    if (RiderHasFlag(rider, 2) == 0) {
        actor->unk48 = 0;
        sub_804E124(rider, line);
    }
}

void sub_80567E4(LevelGeometryAddresses* geometry, GeometryLine* line, Actor* actor, CollisionResult* result)
{
    GeometryPoint* point0;
    GeometryPoint* point1;
    s32 start;
    s32 end;
    s32 position;
    s32 other0;
    s32 other1;
    s32 z0;
    s32 z1;
    s32 range;
    s32 relative;
    s32 temp;

    point0 = GetPointAtIndex(geometry, line->point0);
    point1 = GetPointAtIndex(geometry, line->point1);
    if (point0 == NULL || point1 == NULL) {
        return;
    }
    if (line->unk11_1 == 0) {
        start = point0->y << 5;
        end = point1->y << 5;
        position = actor->y + (actor->unk9C << 8) + actor->unk44;
        other0 = point0->x << 5;
        other1 = point1->x << 5;
        result->unk4 = position - start;
        result->unkC_0 = 0;
        result->unkD = 0;
        result->unkE = line->unk18;
    } else {
        start = point0->x << 5;
        end = point1->x << 5;
        position = actor->x + (actor->unk9A << 8) + actor->unk40;
        other0 = point0->y << 5;
        other1 = point1->y << 5;
        result->unk0 = position - start;
        result->unkC_0 = 1;
        result->unkD = line->unk18;
        result->unkE = 0;
    }
    result->unkF = line->unk18;
    if (start < end) {
        z0 = point0->z << 5;
        z1 = point1->z << 5;
    } else {
        z1 = point0->z << 5;
        z0 = point1->z << 5;
        temp = start;
        start = end;
        end = temp;
    }
    if (other0 > other1) {
        temp = other0;
        other0 = other1;
        other1 = temp;
    }
    range = end - start;
    relative = position - start;
    if (relative < 0) {
        result->unk8 = z0;
    } else if (relative >= range) {
        result->unk8 = z1;
    } else {
        result->unk8 = z0 + ((line->unk12 * relative) >> 8);
    }
    if (relative >= 0 && relative <= range) {
        result->unkC_1 = 1;
    } else {
        result->unkC_1 = 0;
    }
}

void sub_8056910(LevelGeometryAddresses* geometry, GeometryLine* line, Actor* actor, CollisionResult* result)
{
    GeometryPoint* point0;
    GeometryPoint* point1;
    GeometryPoint* lower;
    GeometryPoint* upper;
    s32 y0;
    s32 y1;
    s32 x0;
    s32 x1;
    s32 difference;
    s32 relative;
    s32 min;
    s32 max;
    s32 range;
    s32 position;
    s32 t;
    s16 value;
    s32 p0;
    s32 p1;
    s32 p2;
    s32 p3;
    s32 d1;
    s32 d2;
    s32 q0;
    s32 q1;
    s32 q2;
    s32 r0;

    point0 = GetPointAtIndex(geometry, line->point0);
    point1 = GetPointAtIndex(geometry, line->point1);
    if (line->unk11_1 == 0) {
        y1 = point1->y << 5;
        y0 = point0->y << 5;
        difference = y1 - y0;
        relative = actor->y + (actor->unk9C << 8) + actor->unk44 - (point0->y << 5);
        if (point0->y < point1->y) {
            min = y0;
            max = y1;
            lower = point0;
            upper = point1;
        } else {
            min = y1;
            max = y0;
            lower = point1;
            upper = point0;
        }
        position = actor->y + (actor->unk9C << 8) + actor->unk44 - min;
    } else {
        x1 = point1->x << 5;
        x0 = point0->x << 5;
        difference = x1 - x0;
        relative = actor->x + (actor->unk9A << 8) + actor->unk40 - (point0->x << 5);
        if (point0->x < point1->x) {
            min = x0;
            max = x1;
            lower = point0;
            upper = point1;
        } else {
            min = x1;
            max = x0;
            lower = point1;
            upper = point0;
        }
        position = actor->x + (actor->unk9A << 8) + actor->unk40 - min;
    }
    range = max - min;
    p0 = point0->z << 5;
    p3 = point1->z << 5;
    t = (relative * line->unk1A) >> 16;
    if (difference < 0) {
        t = -t;
    }
    value = line->unk18 + (((line->unk19 - line->unk18) * t) >> 10);
    if (difference < 0) {
        value = -value;
    }
    if (line->unk11_1 == 0) {
        result->unkD = 0;
        result->unkE = value;
        result->unkC_0 = 0;
    } else {
        result->unkD = value;
        result->unkE = 0;
        result->unkC_0 = 1;
    }
    result->unkF = value;
    if (position < 0) {
        result->unk8 = lower->z << 5;
        result->unkC_1 = 0;
    } else if (position >= range) {
        result->unk8 = upper->z << 5;
        result->unkC_1 = 0;
    } else {
        d1 = line->unk1C << 5;
        p1 = p0 + d1;
        d2 = line->unk12 << 5;
        p2 = p3 + d2;
        q0 = p0 + ((d1 * t) >> 10);
        q1 = p1 + (((p2 - p1) * t) >> 10);
        q2 = p2 + ((-d2 * t) >> 10);
        r0 = q0 + (((q1 - q0) * t) >> 10);
        result->unk8 = r0 + ((((q1 + (((q2 - q1) * t) >> 10)) - r0) * t) >> 10);
        result->unkC_1 = 1;
    }
}

unk32 sub_8056ADC(LevelGeometryAddresses* geometry, GeometryLine* line, s32 t)
{
    GeometryPoint* point0;
    GeometryPoint* point1;
    s32 z0;
    s32 z3;
    s32 a;
    s32 b;
    s32 c;
    s32 d1;
    s32 d2;

    point0 = GetPointAtIndex(geometry, line->point0);
    point1 = GetPointAtIndex(geometry, line->point1);
    z0 = point0->z << 5;
    z3 = point1->z << 5;
    d1 = line->unk1C << 5;
    b = z0 + d1;
    d2 = line->unk12 << 5;
    c = z3 + d2;
    a = z0 + ((d1 * t) >> 10);
    b = b + (((c - b) * t) >> 10);
    c = c + ((-d2 * t) >> 10);
    a = a + (((b - a) * t) >> 10);
    b = b + (((c - b) * t) >> 10);
    return a + (((b - a) * t) >> 10);
}

unk8 sub_8056B54(Actor* actor, LevelGeometryAddresses* geometry, GeometryLine* line)
{
    EnvironmentObject* object;
    CollisionResult result;

    object = GetStruct4(actor->unkB4.lineIndex);
    result.unk8 = 0;
    switch (line->unkF) {
    case 0x80:
    case 0x82:
    case 0x86:
    case 0x87:
    case 0x89:
    case 0x8B:
    case 0x8C:
    case 0x8D:
    case 0x8E:
    case 0x90:
    case 0x91:
    case 0x92:
        break;
    default:
        if (line->unk11_2 == 0) {
            sub_80567E4(geometry, line, actor, &result);
        } else {
            sub_8056910(geometry, line, actor, &result);
        }
        break;
    }
    if (object->unk12 < (result.unk8 >> 8)) {
        object->unk12 = result.unk8 >> 8;
    }
}

unk8 _return_false(Actor* actor, LevelGeometryAddresses* geometry, GeometryLine* line, unk16 collisionMask)
{
    return 0;
}

GeometryLine* sub_8056C0C(GeometryPoint* point)
{
    LevelGeometryAddresses addresses;
    GeometryLine* line;
    GeometryLine* cursor;
    GeometryPoint* point0;
    LevelGeometryTable* geometry;
    s32 levelNo;
    s32 i;

    line = NULL;
    levelNo = GetLevelDescriptionNo();
    geometry = LevelDesigns[levelNo].geometry;
    if (geometry != NULL) {
        getLevelGeometryAddresses(&addresses, geometry);
    }
    cursor = addresses.unkC;
    for (i = 0; i < addresses.unk0->lineCount; i++) {
        if (cursor->unkF == 0x86) {
            line = cursor;
            break;
        }
        cursor++;
    }
    if (line != NULL) {
        point0 = &addresses.unk4[line->point0];
        point->x = point0->x >> 3;
        point->y = point0->y >> 3;
        point->z = point0->z >> 3;
    }
    return line;
}

GeometryLine* sub_8056C80(GeometryPoint* point, unk16 id)
{
    LevelGeometryAddresses addresses;
    GeometryLine* line;
    GeometryLine* cursor;
    GeometryPoint* point0;
    LevelGeometryTable* geometry;
    s32 levelNo;
    s32 i;

    line = NULL;
    levelNo = GetLevelDescriptionNo();
    geometry = LevelDesigns[levelNo].geometry;
    if (geometry != NULL) {
        getLevelGeometryAddresses(&addresses, geometry);
    }
    cursor = addresses.unkC;
    for (i = 0; i < addresses.unk0->lineCount; i++) {
        if (cursor->unkF == 0x86 && cursor->unk14 == id) {
            line = cursor;
            break;
        }
        cursor++;
    }
    if (line != NULL) {
        point0 = &addresses.unk4[line->point0];
        point->x = point0->x >> 3;
        point->y = point0->y >> 3;
        point->z = point0->z >> 3;
    }
    return line;
}

unk16 sub_8056CFC(Actor* actor, LevelGeometryAddresses* geometry, GeometryLine* line)
{
    GeometryPoint* point0;
    GeometryPoint* point1;
    s32 x;
    s32 y;

    point0 = &geometry->unk4[line->point0];
    point1 = &geometry->unk4[line->point1];
    x = (point0->x + point1->x) << 4;
    y = (point0->y + point1->y) << 4;
    x -= actor->x;
    x >>= 8;
    y -= actor->y;
    y >>= 8;
    return Sqrt(x * x + y * y);
}

ASM_ZEROPAD
