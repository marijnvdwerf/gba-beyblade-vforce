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

typedef struct CollisionResultDraft {
    unk8 pad0[8];
    s32 unk8;
    unk8 padC[0x1C];
} CollisionResultDraft;

typedef struct CollisionScratchDraft {
    CollisionResultDraft scratch;
    CollisionResultDraft result80;
    CollisionResultDraft result92;
    s32 maxX;
    s32 maxY;
    unk8 flags;
} CollisionScratchDraft;

typedef struct CollisionRiderDraft {
    unk8 pad0[0x68];
    CollisionLineDraft* unk68;
    unk8 pad6C[0x88];
    CollisionResultDraft unkF4;
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

void sub_80567E4(LevelGeometryAddresses*, CollisionLineDraft*, CollisionActorDraft*, CollisionResultDraft*);
void sub_8056910(LevelGeometryAddresses*, CollisionLineDraft*, CollisionActorDraft*, CollisionResultDraft*);
void sub_8056610(LevelGeometryAddresses*, CollisionLineDraft*, CollisionRiderDraft*, CollisionResultDraft*);
void SetRiderFlag(CollisionRiderDraft*, unk32);
unk8 RiderHasFlag(CollisionRiderDraft*, unk32);
void sub_8056EC0(void);
void sub_804ABFC(unk32);
void sub_8053E18(unk8);
s32 sub_805BAC0(LevelGeometryAddresses*, CollisionLineDraft*);

unk32 sub_80561EC(CollisionActorDraft* actor, LevelGeometryAddresses* geometry, CollisionLineDraft* line)
{
    CollisionScratchDraft local;
    CollisionRiderDraft* rider;
    GeometryPoint* point0;
    GeometryPoint* point1;
    s32 minX;
    s32 minY;
    CollisionResultDraft* result;
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
INCLUDE_ASM("asm/dump/804a388-tutorial/8056610.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80567e4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056910.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056adc.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056b54.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056c08-_return_false.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056c0c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056c80.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056cfc.s");
