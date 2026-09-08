#include "collision.h"

#include "debug.h"
#include "effects.h"
#include "geometry.h"
#include "include_asm.h"
#include "music.h"
#include "ram.h"
#include "riderphysics.h"

void sub_80561EC(unk32, unk32, unk32);
extern const unk8 Str_87297D0[];
extern unk8 def_94_4_AddWithBoundingAreaMessage(Actor*, LevelGeometryAddresses*, GeometryLine*);
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

void sub_8055D64(Actor* actor, RiderBase* rider, LevelGeometryAddresses* geometry,
    GeometryLine* line, unk16 collisionMask, unk16 angle)
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
    if (line->unk11_3 != 0)
        object = GetStruct4(sub_805BAC0(geometry, line));
    SetRiderFlag(rider, 0x200000);
    rider->unk1B8 = 8;
    if (angleDelta < 0) {
        angleDelta = -angleDelta;
        direction = -direction;
    }
    angleThreshold = angleDelta * 0x10000;
    if ((collisionMask & 0x90) != 0) {
        if (line->unk11_3 == 0)
            rider->unk40 = -rider->unk40;
        else
            rider->unk40 = object->unk40 * 2 - rider->unk40;
    } else if ((collisionMask & 9) != 0) {
        if (line->unk11_3 == 0)
            rider->unk44 = -rider->unk44;
        else
            rider->unk44 = -(rider->unk44 + object->unk44 * 2);
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
            if (rider->unk208 > 0x100)
                rider->unk208 -= 0x100;
        }
    }
}

#if 0
void sub_8055F04(Actor* actor, RiderBase* rider, GeometryLine* line, unk16 collisionMask, s16 angle)
{
    sub_804E358(angle, rider->unk10 >> 4);
    sub_804E154(rider, 0, 0);
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/8055f04.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055f2c-def_94_8_collision_8055F2C.s");

void nullsub_6(Actor* actor, RiderBase* rider)
{
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8056158.s");

unk8 def_94_4_AddWithBoundingAreaMessage(
    Actor* actor, LevelGeometryAddresses* geometry, GeometryLine* line)
{
    if (withBoundingAreaCount > 0x1F) {
        printf(Str_87297D0);
    } else {
        withBoundingAreas[withBoundingAreaCount] = (unk32)line;
        withBoundingAreaCount++;
    }
}

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

#if 0
typedef struct CollisionLineDraft {
    s32 point0;
    s32 point1;
    unk16 unk8;
    unk8 padA[3];
    unk8 unkD;
    unk8 padE;
    unk8 unkF;
    unk8 unk10;
    unk8 unk11;
    unk8 pad12[4];
    s16 unk16;
    unk8 pad18[8];
} CollisionLineDraft;

typedef struct CollisionScratchDraft {
    CollisionResult scratch;
    CollisionResult result80;
    CollisionResult result92;
    s32 maxX;
    s32 maxY;
    unk8 flags;
} CollisionScratchDraft;

typedef struct CollisionRiderDraft {
    unk8 pad0[0x68];
    CollisionLineDraft* unk68;
    unk8 pad6C[0x88];
    CollisionResult unkF4;
    unk8 pad11C[0xA4];
    unk8 unk1C0;
    unk8 pad1C1[2];
    unk8 unk1C3;
} CollisionRiderDraft;

typedef struct CollisionActorDraft {
    unk8 pad0[4];
    s32 x;
    s32 y;
    s32 z;
    unk8 pad10[0x38];
    s32 unk48;
    unk8 pad4C[0x68];
    CollisionRiderDraft* unkB4;
} CollisionActorDraft;

void sub_80567E4(LevelGeometryAddresses*, CollisionLineDraft*, CollisionActorDraft*, CollisionResult*);
void sub_8056910(LevelGeometryAddresses*, CollisionLineDraft*, CollisionActorDraft*, CollisionResult*);
void sub_8056610(LevelGeometryAddresses*, CollisionLineDraft*, CollisionRiderDraft*, CollisionResult*);
void SetRiderFlag(CollisionRiderDraft*, unk32);
unk8 RiderHasFlag(CollisionRiderDraft*, unk32);
void sub_8056EC0(void);
void sub_804ABFC(unk32);
void sub_8053E18(unk8);
unk32 sub_80561EC(CollisionActorDraft* actor, LevelGeometryAddresses* geometry, CollisionLineDraft* line)
{
    CollisionScratchDraft local;
    CollisionRiderDraft* rider;
    GeometryPoint* point0;
    GeometryPoint* point1;
    s32 minX;
    s32 minY;
    CollisionResult* result;
    s32 difference;
    s32 minDifference;
    s32 maxDifference;
    s32 swap;
    GeometryPoint* lowerB;
    GeometryPoint* firstC;
    GeometryPoint* secondC;
    GeometryPoint* lowerC;
    GeometryPoint* lowerD;
    s32 lowerZC;
    s32 lowerZD;
    s32 upperZ;
    unk8 active;
    s32 lineIndex;
    LineMetadata* metadata;
    unk16 height;

    rider = actor->unkB4;
    point0 = &geometry->unk4[line->point0];
    point1 = &geometry->unk4[line->point1];
    if (point0->x < point1->x) {
        minX = point0->x << 5;
        local.maxX = point1->x << 5;
    } else {
        minX = point1->x << 5;
        local.maxX = point0->x << 5;
    }
    if (point0->y < point1->y) {
        minY = point0->y << 5;
        local.maxY = point1->y << 5;
    } else {
        minY = point1->y << 5;
        local.maxY = point0->y << 5;
    }
    local.flags = line->unk11;
    if ((local.flags & 8)) {
        if (actor->x <= minX || actor->x >= local.maxX || actor->y <= minY || actor->y >= local.maxY)
            return;
    }
    result = &local.scratch;
    if (rider != NULL)
        result = &rider->unkF4;
    switch (line->unkF) {
    case 0x80:
        sub_80567E4(geometry, line, actor, &local.result80);
        if (actor->x > local.maxX || actor->y > local.maxY)
            break;
        if (actor->z > local.result80.unk8 && (point0->z != 0 || point1->z != 0))
            break;
        if (line->unkD > rider->unk1C0) {
            rider->unk1C0 = line->unkD;
            SetRiderFlag(rider, 4);
        } else if (line->unk16 > rider->unk1C0) {
            rider->unk1C0 = line->unk16;
            SetRiderFlag(rider, 0x1000000);
        }
        break;
    case 0x92:
        sub_80567E4(geometry, line, actor, &local.result92);
        if (actor->x > local.maxX || actor->y > local.maxY)
            break;
        if (actor->z > local.result92.unk8 && (point0->z != 0 || point1->z != 0))
            break;
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
        if ((local.flags & 4) == 0)
            sub_80567E4(geometry, line, actor, result);
        else
            sub_8056910(geometry, line, actor, result);
        sub_8056610(geometry, line, rider, result);
        break;
    case 0x8B:
        lowerB = point0->z < point1->z ? point0 : point1;
        if (actor->z > (lowerB->z << 5))
            break;
        if (RiderHasFlag(rider, 0x4000000))
            break;
        active = RiderHasFlag(rider, 0x400);
        if (active != 0)
            break;
        sub_8056EC0();
        sub_804ABFC(10);
        if (_gameData->unkC6C == -1)
            SetRiderFlag(rider, 0x800);
        actor->unk48 = active;
        SetRiderFlag(rider, 0x20000);
        sub_8053E18(0);
        break;
    case 0x8C:
        firstC = &geometry->unk4[line->point0];
        secondC = &geometry->unk4[line->point1];
        lowerC = secondC;
        if (firstC->z < secondC->z)
            lowerC = firstC;
        lowerZC = (lowerC->z - (line->unk16 << 3)) << 5;
        upperZ = lowerC->z << 5;
        if (!RiderHasFlag(rider, 0x4000000)) {
            if (line->unk16 == 0 || line->unk10 == 0)
                break;
            if ((actor->z < lowerZC && actor->z + actor->unk48 > lowerZC)
                || (actor->z > upperZ && actor->z + actor->unk48 < upperZ)) {
                lineIndex = sub_805BAC0(geometry, line);
                if (lineIndex != -1) {
                    metadata = GetLineMetaData(geometry, lineIndex);
                    if (metadata != NULL && getLineMetaObjectBytype(geometry, metadata, 6) != NULL)
                        break;
                }
            } else {
                break;
            }
        }
        return 0;
    case 0x8D:
        point0 = &geometry->unk4[line->point0];
        point1 = &geometry->unk4[line->point1];
        lowerD = point1;
        if (point0->z < point1->z)
            lowerD = point0;
        height = line->unk16;
        lowerZD = (lowerD->z - (height << 3)) << 5;
        if (actor->z <= lowerZD) {
            if (actor->z + actor->unk48 > lowerZD) {
                actor->unk48 = 0;
                actor->z = lowerZD;
            }
            break;
        }
        if ((local.flags & 4) == 0)
            sub_80567E4(geometry, line, actor, result);
        else
            sub_8056910(geometry, line, actor, result);
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
        if ((local.flags & 4) == 0)
            sub_80567E4(geometry, line, actor, result);
        else
            sub_8056910(geometry, line, actor, result);
        sub_8056610(geometry, line, rider, result);
        break;
    }
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/80561ec.s");
#if 0
typedef struct CollisionLine6610Draft {
    unk8 pad0[0xD];
    s8 unkD;
    s8 unkE;
    unk8 unkF;
    unk8 pad10[0x10];
} CollisionLine6610Draft;

typedef struct CollisionResult6610Draft {
    unk8 pad0[8];
    s32 unk8;
    unk8 unkC;
    unk8 padD[7];
    unk32 unk14;
    unk32 unk18;
    unk32 unk1C;
    unk32 unk20;
    unk32 unk24;
} CollisionResult6610Draft;

typedef struct CollisionRider6610Draft CollisionRider6610Draft;

struct CollisionRider6610Draft {
    Actor* unk0;
    unk8 pad4[0x24];
    s32 unk28;
    unk8 pad2C[4];
    unk32 unk30;
    s32 unk34;
    unk32 unk3C;
    unk8 pad40[0x34];
    unk32 unk74;
    unk8 pad78[0x1C];
    unk32 unk94;
    unk8 pad98[0x48];
    CollisionLine6610Draft* unkE0;
    CollisionLine6610Draft* unkE4;
    CollisionLine6610Draft* unkE8;
    unk8 padEC[4];
    unk32 unkF0;
    unk8 padF4[0x78];
    unk32 unk16C;
    unk32 unk170;
    unk32 unk174;
    unk8 pad178[0x3C];
    s32 unk1B4;
};

void sub_804ABFC(unk32);
unk8 RiderHasFlag(CollisionRider6610Draft*, unk32);
void UnsetRiderFlag(CollisionRider6610Draft*, unk32);
void sub_80558B8(void);
void sub_8056610(LevelGeometryAddresses* geometry, CollisionLine6610Draft* line,
    CollisionRider6610Draft* rider, CollisionResult6610Draft* result)
{
    Actor* actor;
    unk32 value;
    s32 direction;
    s32 lineValue;

    actor = rider->unk0;
    if (result->unk8 > rider->unk1B4)
        rider->unk1B4 = result->unk8;
    if ((result->unkC & 2) == 0) {
        rider->unkE4 = NULL;
        return;
    }
    if (actor->z + actor->unk48 > result->unk8) {
        rider->unkE4 = NULL;
        return;
    }
    if (line != rider->unkE8)
        rider->unkE8 = rider->unkE4;
    rider->unkE4 = line;
    rider->unkF0 = _unk3000E30[0];
    rider->unk94 = actor->unk48;
    switch (line->unkF) {
    case 0x81:
        rider->unk170 = result->unk18;
        rider->unk174 = result->unk1C;
        rider->unk16C = result->unk14;
        rider->unk30 = result->unk20;
        value = result->unk24;
        rider->unk3C = value;
        break;
    case 0x85:
        rider->unk170 = result->unk18;
        rider->unk174 = result->unk1C;
        rider->unk16C = result->unk14;
        break;
    default:
        if ((result->unkC & 1) != 0) {
            if (line->unkD >= 0) {
                rider->unk170 = line->unkD;
                rider->unk174 = rider->unk28 >> 8;
                rider->unk16C = 0;
            } else {
                rider->unk170 = -line->unkD;
                rider->unk174 = (-rider->unk28) >> 8;
                rider->unk16C = 0x80;
            }
        } else {
            lineValue = line->unkE;
            direction = -lineValue;
            if (direction >= 0) {
                rider->unk170 = direction;
                rider->unk174 = (-rider->unk34) >> 8;
                rider->unk16C = 0x40;
            } else {
                rider->unk170 = lineValue;
                rider->unk174 = rider->unk34 >> 8;
                rider->unk16C = 0xC0;
            }
        }
        rider->unk30 = line->unkD << 8;
        rider->unk3C = line->unkE << 8;
        break;
    }
    rider->unk74 = 0;
    rider->unkE0 = line;
    if (actor->unk48 < -0x300) {
        actor->unk48 = -((0x56 * actor->unk48) >> 8);
        sub_804ABFC(3);
        if (RiderHasFlag(rider, 0x04000000) == 0)
            sub_80558B8();
    } else {
        UnsetRiderFlag(rider, 2);
    }
    actor->z = result->unk8;
    if (RiderHasFlag(rider, 2) == 0) {
        actor->unk48 = 0;
        sub_804E124(rider, line);
    }
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/8056610.s");

#if 0
typedef struct CollisionResult80567E4Draft {
    s32 unk0;
    s32 unk4;
    s32 unk8;
    unk8 unkC;
    unk8 unkD;
    unk8 unkE;
    unk8 unkF;
    unk8 pad10[0x18];
} CollisionResult80567E4Draft;

void sub_80567E4(
    LevelGeometryAddresses* geometry, GeometryLine* line, Actor* actor, CollisionResult80567E4Draft* result)
{
    GeometryPoint* point0;
    GeometryPoint* point1;
    unk8 direction;
    s32 point0Coord;
    s32 point1Coord;
    s32 actorCoord;
    s32 point0Other;
    s32 point1Other;
    s32 point0Z;
    s32 point1Z;
    s32 range;
    s32 relative;
    s32 temp;
    unk8 flags;

    point0 = GetPointAtIndex(geometry, line->point0);
    point1 = GetPointAtIndex(geometry, line->point1);
    if (point0 == NULL || point1 == NULL)
        return;
    direction = line->unk11_0 & 2;
    if (direction == 0) {
        s32 mask;
        point0Coord = point0->y << 5;
        point1Coord = point1->y << 5;
        actorCoord = actor->y + (actor->unk9C << 8) + actor->unk44;
        point0Other = point0->x << 5;
        point1Other = point1->x << 5;
        result->unk4 = actorCoord - point0Coord;
        mask = 2;
        mask = -mask;
        result->unkC &= mask;
        result->unkD = direction;
        result->unkE = line->unk18;
    } else {
        point0Coord = point0->x << 5;
        point1Coord = point1->x << 5;
        actorCoord = actor->x + (actor->unk9A << 8) + actor->unk40;
        point0Other = point0->y << 5;
        point1Other = point1->y << 5;
        result->unk0 = actorCoord - point0Coord;
        result->unkC |= 1;
        result->unkD = line->unk18;
        result->unkE = 0;
    }
    result->unkF = line->unk18;
    if (point0Coord < point1Coord) {
        point0Z = point0->z << 5;
        point1Z = point1->z << 5;
    } else {
        point0Z = point1->z << 5;
        point1Z = point0->z << 5;
        temp = point0Coord;
        point0Coord = point1Coord;
        point1Coord = temp;
    }
    range = point1Coord - point0Coord;
    relative = actorCoord - point0Coord;
    if (relative < 0)
        result->unk8 = point0Z;
    else if (relative >= range)
        result->unk8 = point1Z;
    else
        result->unk8 = point0Z + ((line->unk12 * relative) >> 8);
    if (relative >= 0 && relative <= range)
        flags = 2 | result->unkC;
    else {
        s32 mask;
        mask = 3;
        mask = -mask;
        flags = mask & result->unkC;
    }
    result->unkC = flags;
}

#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/80567e4.s");

#if 0
typedef struct CollisionResult8056910Draft {
    s32 unk0;
    s32 unk4;
    s32 unk8;
    unk8 unkC;
    unk8 unkD;
    unk8 unkE;
    unk8 unkF;
    unk8 pad10[0x18];
} CollisionResult8056910Draft;

void sub_8056910(
    LevelGeometryAddresses* geometry, GeometryLine* line, Actor* actor, CollisionResult8056910Draft* result)
{
    GeometryPoint* point0;
    GeometryPoint* point1;
    GeometryPoint* lowerPoint;
    GeometryPoint* upperPoint;
    unk8 direction;
    s32 point0Coord;
    s32 point1Coord;
    s32 point0Other;
    s32 point1Other;
    s32 actorCoordinate;
    s32 originalDifference;
    s32 originalRelative;
    s32 sortedDifference;
    s32 sortedRelative;
    s32 point0Z;
    s32 point1Z;
    s32 interpolation;
    s32 p0;
    s32 p1;
    s32 p2;
    s32 p3;
    s32 temp;
    unk16 value;
    unk8 flags;

    point0 = GetPointAtIndex(geometry, line->point0);
    point1 = GetPointAtIndex(geometry, line->point1);
    direction = line->unk11_0 & 2;
    if (direction == 0) {
        point0Coord = point0->y << 5;
        point1Coord = point1->y << 5;
        actorCoordinate = actor->y + (actor->unk9C << 8) + actor->unk44;
        point0Other = point0->x << 5;
        point1Other = point1->x << 5;
    } else {
        point0Coord = point0->x << 5;
        point1Coord = point1->x << 5;
        actorCoordinate = actor->x + (actor->unk9A << 8) + actor->unk40;
        point0Other = point0->y << 5;
        point1Other = point1->y << 5;
    }
    originalDifference = point1Coord - point0Coord;
    originalRelative = actorCoordinate - point0Coord;
    if (direction == 0) {
        if (point0->y < point1->y) {
            lowerPoint = point0;
            upperPoint = point1;
            point0Z = point0Coord;
            point1Z = point1Coord;
        } else {
            lowerPoint = point1;
            upperPoint = point0;
            point0Z = point1Coord;
            point1Z = point0Coord;
        }
    } else if (point0->x < point1->x) {
        lowerPoint = point0;
        upperPoint = point1;
        point0Z = point0Coord;
        point1Z = point1Coord;
    } else {
        lowerPoint = point1;
        upperPoint = point0;
        point0Z = point1Coord;
        point1Z = point0Coord;
    }
    sortedDifference = point1Z - point0Z;
    sortedRelative = actorCoordinate - point0Z;
    point0Z = lowerPoint->z << 5;
    point1Z = upperPoint->z << 5;
    interpolation = (originalRelative * line->unk1A) >> 16;
    if (originalDifference < 0)
        interpolation = -interpolation;
    value
        = line->unk18 + (((line->unk19 - line->unk18) * interpolation) >> 10);
    if (originalDifference < 0)
        value = -value;
    if (direction == 0) {
        result->unkD = direction;
        result->unkE = value;
        flags = -2 & result->unkC;
    } else {
        result->unkD = value;
        result->unkE = 0;
        flags = 1 | result->unkC;
    }
    result->unkC = flags;
    result->unkF = value;
    if (sortedRelative < 0) {
        result->unk8 = point0Z;
        result->unkC &= -3;
    } else if (sortedRelative >= sortedDifference) {
        result->unk8 = point1Z;
        result->unkC &= -3;
    } else {
        p0 = point0Z;
        p1 = p0 + (line->unk1C << 5);
        p2 = point1Z + (line->unk12 << 5);
        p3 = point1Z;
        temp = p1 + (((p2 - p1) * interpolation) >> 10);
        p0 = p0 + (((p1 - p0) * interpolation) >> 10);
        p2 = p2 + (((p3 - p2) * interpolation) >> 10);
        p1 = p0 + (((temp - p0) * interpolation) >> 10);
        p2 = temp + (((p2 - temp) * interpolation) >> 10);
        result->unk8 = p1 + (((p2 - p1) * interpolation) >> 10);
        result->unkC |= 2;
    }
}

#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/8056910.s");

INCLUDE_ASM("asm/dump/804a388-tutorial/8056adc.s");

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
        if (line->unk11_2 == 0)
            sub_80567E4(geometry, line, actor, &result);
        else
            sub_8056910(geometry, line, actor, &result);
        break;
    }
    if (object->unk12 < (result.unk8 >> 8))
        object->unk12 = result.unk8 >> 8;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8056c08-_return_false.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056c0c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056c80.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056cfc.s");
