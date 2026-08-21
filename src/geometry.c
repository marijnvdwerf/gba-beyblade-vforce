#include "include_asm.h"
#include "ram.h"

INCLUDE_ASM("asm/dump/8057b80-debug/805b8c4-getLevelGeometryAddresses.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805b938-newCollisionDataRam.s");

void sub_805BA3C(GeometryAddressTable* arg0)
{
    if (arg0->block != NULL) {
        deallocateBlock(arg0->block);
    }
    arg0->block = NULL;
}

void StoreMetadataAddr(LevelGeometryAddresses* arg0, void* value)
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

#if 0
LineMetaObject* getLineMetaObjectBytype(
    LevelGeometryAddresses* arg0, LineMetadata* metadata, unk32 type)
{
    LineMetaObject* ptr;
    s32 index;
    unk16 count;

    index = 0;
    ptr = &metadata->objects[0];
    if (metadata != NULL) {
        count = metadata->count;
        if (index < count) {
            do {
                if (ptr->type == type) {
                    return ptr;
                }
                ptr = (LineMetaObject*)((unk8*)ptr + ptr->size);
                index++;
            } while (index < count);
        }
    }
    return NULL;
}
#endif
INCLUDE_ASM("asm/dump/8057b80-debug/805bb2c-getLineMetaObjectBytype.s");
- getLineMetaobjectByTypeAndId.s ");
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
INCLUDE_ASM("asm/dump/8057b80-debug/805db80-GetSplineAtIndex.s");
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

void sub_805E50C(unk32* arg0, unk32 arg1, unk32 arg2, unk32 arg3)
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
