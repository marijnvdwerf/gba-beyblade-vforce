#ifndef _GEOMETRY_H
#define _GEOMETRY_H

#include "common.h"
#include "ram.h"

typedef unk8 (*QuadTreeLineFilter)(LevelGeometryAddresses*, GeometryLine*);

LevelGeometryTable* loadLevelGeometry(u16);
LineMetadata** getLevelMetadata(u16);
void getLevelGeometryAddresses(LevelGeometryAddresses*, LevelGeometryTable*);
void StoreMetadataAddr(LevelGeometryAddresses*, LineMetadata**);
void newCollisionDataRam(LevelGeometryAddresses*, LevelGeometryTable*, unk16);
void initQuadTree(QuadTree*, LevelGeometryAddresses*, unk16, unk16, unk16, unk16);
void allocQuadTree(
    QuadTree*, LevelGeometryAddresses*, unk16, unk16, unk16, unk16, QuadTreeLineFilter);
void allocateDynamicBoundingAreas(QuadTree*, LevelGeometryAddresses*);
QuadTreeNode* initQuadTreeNode(QuadTree*, QuadTreeNode*, s32, s32, s32, s32, QuadTreeLineFilter);
QuadTreeNode* GetQuadTreeNodeForPos(QuadTree*, s32, s32);
void sub_805BDBC(QuadTree*, LevelGeometryAddresses*);
LineMetadata* GetLineMetaData(LevelGeometryAddresses*, unk32);
unk32 sub_805BAC0(LevelGeometryAddresses*, GeometryLine*);
LineMetaObject* getLineMetaAtIndex(LevelGeometryAddresses*, LineMetadata*, s32);
LineMetaObject* getLineMetaObjectBytype(LevelGeometryAddresses*, LineMetadata*, unk32);
LineMetaObject* getLineMetaobjectByTypeAndId(LevelGeometryAddresses*, LineMetadata*, unk32, unk32);
s32 GetLineIndexOfType(LevelGeometryAddresses*, unk8, unk16);
unk32 sub_805BAC0(LevelGeometryAddresses*, GeometryLine*);
void sub_805BA3C(LevelGeometryAddresses*);
void deallocateQuadTree(QuadTree*);
void sub_805E50C(
    ActorCollisionFunctions*, ActorCollisionResponse, ActorCollisionOverlap, ActorCollisionFilter);
unk32* sub_805E514(unk32*, unk32, unk32, unk32, unk32);
GeometrySpline* GetSplineAtIndex(LevelGeometryAddresses*, s32);
GeometryPoint* GetPointAtIndex(LevelGeometryAddresses*, s32);
GeometryPoint* GetPointAtSplineIndex(LevelGeometryAddresses*, s32, s32);
void sub_805C3BC(LevelGeometryAddresses*, Actor*, unk32, unk32);
GeometrySplineLine* sub_805DCFC(LevelGeometryAddresses*, GeometrySpline*, s32);
s32* sub_805DFD4(LevelGeometryAddresses*, unk32, s32*, s32);
unk32 actor_805C48C(Actor*, LevelGeometryAddresses*, GeometryLine**, unk16);
unk32 sub_805C9A4(Actor*, LevelGeometryAddresses*, GeometryLine**, unk16, QuadTreeNode*);
void sub_805D650(Actor*);
unk32 sub_805DBF0(LevelGeometryAddresses*, SplineConnection*, GeometrySpline*, unk16, unk32);
s32* sub_805DD18(LevelGeometryAddresses*, unk32, s32*, s32);
s32* sub_805E068(LevelGeometryAddresses*, unk32, s32*, s32, s32);
void sub_805D610(Actor*);

unk16 sub_805CEB8(Actor*, LevelGeometryAddresses*, unk32*, unk16, unk32**);
unk8 call_rider_94_8(Actor*, LevelGeometryAddresses*, GeometryLine*, unk16);

#endif
