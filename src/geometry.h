#ifndef _GEOMETRY_H
#define _GEOMETRY_H

#include "common.h"
#include "ram.h"

LevelGeometryTable* loadLevelGeometry(u16);
LineMetadata** getLevelMetadata(u16);
void getLevelGeometryAddresses(LevelGeometryAddresses*, LevelGeometryTable*);
void StoreMetadataAddr(LevelGeometryAddresses*, LineMetadata**);
LineMetadata* GetLineMetaData(LevelGeometryAddresses*, s32);
LineMetaObject* getLineMetaObjectBytype(LevelGeometryAddresses*, LineMetadata*, unk32);
LineMetaObject* getLineMetaobjectByTypeAndId(LevelGeometryAddresses*, LineMetadata*, unk32, unk32);
void sub_805BA3C(GeometryAddressTable*);
void deallocateQuadTree(QuadTree*);

#endif /* _GEOMETRY_H */
