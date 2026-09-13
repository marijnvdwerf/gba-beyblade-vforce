#ifndef _COLLISION_H
#define _COLLISION_H

#include "common.h"

typedef struct CollisionResult {
    unk8 pad0[8];
    s32 unk8;
    unk8 unkC;
    s8 unkD;
    s8 unkE;
    unk8 padF[5];
    unk32 unk14;
    unk32 unk18;
    unk32 unk1C;
    unk32 unk20;
    unk32 unk24;
} CollisionResult;

void nullsub_6(Actor*, RiderBase*);
unk8 def_94_0_8055CFC(Actor*, LevelGeometryAddresses*, GeometryLine*, unk16);
void sub_8055D64(Actor*, RiderBase*, LevelGeometryAddresses*, GeometryLine*, unk16, unk16);
void sub_8055F04(Actor*, RiderBase*, GeometryLine*, unk16, s16);
unk8 sub_8056B54(Actor*, LevelGeometryAddresses*, GeometryLine*);
void sub_80567E4(LevelGeometryAddresses*, GeometryLine*, Actor*, CollisionResult*);
void sub_8056910(LevelGeometryAddresses*, GeometryLine*, Actor*, CollisionResult*);
void sub_8056610(LevelGeometryAddresses*, GeometryLine*, RiderBase*, CollisionResult*);
unk8 _return_false(Actor*, LevelGeometryAddresses*, GeometryLine*, unk16);

#endif
