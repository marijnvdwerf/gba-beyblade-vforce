#ifndef _COLLISION_H
#define _COLLISION_H

#include "common.h"

void nullsub_6(Actor*, RiderBase*);
unk8 def_94_0_8055CFC(Actor*, LevelGeometryAddresses*, GeometryLine*, unk16);
void sub_8055D64(Actor*, RiderBase*, LevelGeometryAddresses*, GeometryLine*, unk16, unk16);
void sub_8055F04(Actor*, RiderBase*, GeometryLine*, unk16, s16);
unk8 sub_8056B54(Actor*, LevelGeometryAddresses*, GeometryLine*);
void sub_80567E4(LevelGeometryAddresses*, GeometryLine*, Actor*, CollisionResult*);
void sub_8056910(LevelGeometryAddresses*, GeometryLine*, Actor*, CollisionResult*);
void sub_8056610(LevelGeometryAddresses*, GeometryLine*, RiderBase*, CollisionResult*);
unk8 _return_false(Actor*, LevelGeometryAddresses*, GeometryLine*, unk16);
GeometryLine* sub_8056C0C(GeometryPoint*);
GeometryLine* sub_8056C80(GeometryPoint*, unk16);
unk16 sub_8056CFC(Actor*, LevelGeometryAddresses*, GeometryLine*);

#endif
