#include "geometry.h"

#include "include_asm.h"
#include "ram.h"
#include "system.h"

extern const u8 Str_87553D0[];

void getLevelGeometryAddresses(LevelGeometryAddresses* arg0, LevelGeometryTable* geometry)
{
    s16 count;
    s16 i;

    arg0->unk0 = geometry;
    arg0->unk4 = (GeometryPoint*)((unk8*)geometry + geometry->pointOffset);
    arg0->unk8 = (GeometrySpline*)((unk8*)geometry + geometry->splineOffset);
    arg0->unkC = (GeometryLine*)((unk8*)geometry + geometry->lineOffset);
    count = geometry->count.splineCount;
    if (geometry->count.splineCount > 0x40) {
        count = 0x40;
        nullsub_8(Str_87553D0);
    }
    for (i = 0; i < count; i++) {
        arg0->unk14[i] = GetSplineAtIndex(arg0, i);
    }
    arg0->unk114 = NULL;
    arg0->unk10 = NULL;
    arg0->unk118 = 0;
}

INCLUDE_ASM("asm/dump/8057b80-debug/805b938-newCollisionDataRam.s");

void sub_805BA3C(GeometryAddressTable* arg0)
{
    if (arg0->block != NULL) {
        deallocateBlock(arg0->block);
    }
    arg0->block = NULL;
}

void StoreMetadataAddr(LevelGeometryAddresses* arg0, LineMetadata** value)
{
    arg0->unk114 = value;
}

LineMetadata* GetLineMetaData(LevelGeometryAddresses* arg0, s32 index)
{
    LineMetadata** metadata;

    metadata = arg0->unk114;
    if (metadata == NULL) {
        return NULL;
    }
    return metadata[index];
}

INCLUDE_ASM("asm/dump/8057b80-debug/805ba7c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805bac0.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805bad8-getLineMetaAtIndex.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805bafc.s");

LineMetaObject* getLineMetaObjectBytype(
    LevelGeometryAddresses* arg0, LineMetadata* metadata, unk32 type)
{
    LineMetaObject* ptr;
    s32 index;

    index = 0;
    ptr = metadata->objects;
    if (metadata == NULL) {
        return NULL;
    }
    for (; index < metadata->count; index++) {
        if (ptr->type == type) {
            return ptr;
        }
        ptr = (LineMetaObject*)((unk8*)ptr + ptr->size);
    }
    return NULL;
}

LineMetaObject* getLineMetaobjectByTypeAndId(
    LevelGeometryAddresses* arg0, LineMetadata* metadata, unk32 type, unk32 id)
{
    s32 index;
    s32 count;
    s32 limit;
    LineMetaObject* ptr;
    unk16 key;

    index = 0;
    ptr = metadata->objects;
    if (metadata == NULL) {
        return NULL;
    }
    count = metadata->count;
    if (index < count) {
        key = (unk16)id;
        limit = count;
        for (; index < limit; index++) {
            if (ptr->type == type && ptr->id == key) {
                return ptr;
            }
            ptr = (LineMetaObject*)((unk8*)ptr + ptr->size);
        }
    }
    return NULL;
}

INCLUDE_ASM("asm/dump/8057b80-debug/805bb9c-initQuadTree.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805bbc8-allocQuadTree.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805bdbc.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805bf18.s");

void deallocateQuadTree(QuadTree* arg0)
{
    if (arg0->block24 != NULL) {
        deallocateBlock(arg0->block24);
    }
    arg0->block24 = NULL;
    if (arg0->block28 != NULL) {
        deallocateBlock(arg0->block28);
    }
    arg0->block28 = NULL;
}

INCLUDE_ASM("asm/dump/8057b80-debug/805bfe8-allocateDynamicBoundingAreas.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805c040-initQuadTreeNode.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805c308-GetQuadTreeNodeForPos.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805c3bc.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805c444.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805c48c-actor_805C48C.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805c9a4.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805ceb8.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805d400-call_rider_94_8.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805d430.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805d488.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805d548.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805d610.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805d650.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805db6c.s");

GeometrySpline* GetSplineAtIndex(LevelGeometryAddresses* arg0, s32 arg1)
{
    GeometrySpline* spline;
    s32 index;
    s32 count;
    s32 limit;

    spline = arg0->unk8;
    index = 0;
    count = arg0->unk0->count.splineCountWord;
    if (index < count) {
        limit = count;
        do {
            if (index != arg1) {
                spline = (GeometrySpline*)((unk8*)spline + spline->size);
                index += 1;
            } else {
                return spline;
            }
        } while (index < limit);
    }
    return NULL;
}

INCLUDE_ASM("asm/dump/8057b80-debug/805dbac-GetPointAtIndex.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805dbc0-GetPointAtSplineIndex.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805dbf0.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805dcd4-GetSplineLineAtIndex.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805dcfc.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805dd18.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805df04.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805dfd4.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805e068.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805e0d8.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805e18c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805e320.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805e474.s");

void sub_805E50C(void** arg0, void* arg1, void* arg2, void* arg3)
{
    arg0[0] = arg1;
    arg0[1] = arg2;
    arg0[2] = arg3;
}

unk32* sub_805E514(unk32* arg0, unk32 arg1, unk32 arg2, unk32 arg3, unk32 arg4)
{
    arg0[0] = arg1;
    arg0[1] = arg2;
    arg0[3] = arg4;
    arg0[2] = arg3;
    return arg0;
}

INCLUDE_ASM("asm/dump/8057b80-debug/805e528.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805e648.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805e77c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805e7c0.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805e804.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805e83c-GetLineIndexOfType.s");
