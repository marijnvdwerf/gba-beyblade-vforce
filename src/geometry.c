#include "geometry.h"

#include "debug.h"
#include "include_asm.h"
#include "ram.h"
#include "system.h"
#include "unsorted.h"

extern const unk8 Str_87553D0[];
extern const unk8 Str_875540C[];
extern const unk8 Str_8755440[];
extern const unk8 Str_8755474[];
extern const unk8 Str_87554B4[];
extern const unk8 Str_87554F0[];
extern const unk8 Str_87554F4[];
extern const unk8 Str_8755530[];
extern const unk8 Str_875557C[];
extern const unk8 Str_87555A8[];
extern const unk8 Str_87555F0[];

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
    arg0->block = NULL;
    arg0->unk118 = 0;
}

void newCollisionDataRam(
    LevelGeometryAddresses* addresses, LevelGeometryTable* geometry, unk16 flags)
{
    unk32 pointBytes;
    unk32 lineBytes;
    unk32 bytes;
    unk16 normalizedFlags;
    unk16 count;
    s16 i;
    unk8* cursor;

    normalizedFlags = flags;
    pointBytes = geometry->pointCount << 4;
    lineBytes = geometry->lineCount << 5;
    bytes = 0;
    cursor = NULL;
    addresses->unk0 = geometry;
    addresses->unk4 = (GeometryPoint*)((unk8*)geometry + geometry->pointOffset);
    addresses->unk8 = (GeometrySpline*)((unk8*)geometry + geometry->splineOffset);
    addresses->unkC = (GeometryLine*)((unk8*)geometry + geometry->lineOffset);
    addresses->unk118 = normalizedFlags;
    if ((normalizedFlags & 1) != 0) {
        bytes = pointBytes;
    }
    if ((normalizedFlags & 2) != 0) {
        bytes += lineBytes;
    }
    if (bytes != 0) {
        addresses->block = slowAllocate(bytes);
    } else {
        addresses->block = NULL;
    }
    if (addresses->block == NULL) {
        printf(Str_875540C, bytes);
    } else {
        cursor = addresses->block->address;
        if ((normalizedFlags & 1) != 0) {
            __fastMemoryCopyARM(addresses->unk4, cursor, pointBytes);
            addresses->unk4 = (GeometryPoint*)cursor;
            cursor += pointBytes;
        }
        if ((normalizedFlags & 2) != 0) {
            __fastMemoryCopyARM(addresses->unkC, cursor, lineBytes);
            addresses->unkC = (GeometryLine*)cursor;
        }
    }
    count = addresses->unk0->count.splineCount;
    if (addresses->unk0->count.splineCount > 0x40) {
        count = 0x40;
        nullsub_8(Str_87553D0);
    }
    for (i = 0; i < (s16)count; i++) {
        addresses->unk14[i] = GetSplineAtIndex(addresses, i);
    }
    addresses->unk114 = NULL;
}

void sub_805BA3C(LevelGeometryAddresses* arg0)
{
    if (arg0->block != NULL) {
        deallocateBlock(arg0->block);
    }
    arg0->block = NULL;
}

void StoreMetadataAddr(LevelGeometryAddresses* geometry, LineMetadata** value)
{
    geometry->unk114 = value;
}

LineMetadata* GetLineMetaData(LevelGeometryAddresses* arg0, unk32 index)
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

LineMetaObject* getLineMetaAtIndex(LevelGeometryAddresses* arg0, LineMetadata* metadata, s32 index)
{
    LineMetaObject* object;
    s32 count;
    s32 i;

    i = 0;
    object = metadata->objects;
    if (metadata == NULL) {
        return NULL;
    }
    count = metadata->count;
    if (index >= count) {
        return NULL;
    }
    if (i < index) {
        i = index;
        do {
            object = (LineMetaObject*)((unk8*)object + object->size);
            i--;
        } while (i != 0);
    }
    return object;
}

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
    u16 key;

    index = 0;
    ptr = metadata->objects;
    if (metadata == NULL) {
        return NULL;
    }
    count = metadata->count;
    if (index < count) {
        key = id;
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

void initQuadTree(QuadTree* quadTree, LevelGeometryAddresses* geometry, unk16 arg2, unk16 arg3,
    unk16 arg4, unk16 arg5)
{
    allocQuadTree(quadTree, geometry, arg2, arg3, arg4, arg5, 0);
}

void allocQuadTree(QuadTree* quadTree, LevelGeometryAddresses* geometry, unk16 arg2, unk16 arg3,
    unk16 nodeCount, unk16 arg5, QuadTreeLineFilter arg6)
{
    AllocatedBlock* block;
    unk8* nodes;
    GeometryPoint* point;
    s32 count;
    s32 minX;
    s32 minY;
    s32 maxX;
    s32 maxY;
    s32 centerX;
    s32 centerY;
    s32 arg4;
    s32 entryBytes;
    s32 allocationSize;

    minX = 0xFF00;
    minY = 0xFF00;
    maxX = -0xFF00;
    maxY = -0xFF00;
    arg4 = nodeCount * sizeof(QuadTreeNode);
    entryBytes = arg3 << 2;
    point = geometry->unk4;
    quadTree->unk10 = geometry;
    quadTree->unk3E = nodeCount;
    quadTree->unk40 = arg3;
    quadTree->unk50 = 0;
    quadTree->unk4C = 0;
    quadTree->unk48 = 0;
    quadTree->unk4A = 0;
    quadTree->unk44 = arg5;
    quadTree->unk46 = 0;
    count = geometry->unk0->pointCount;
    if (count > 0) {
        do {
            if (point->x < minX)
                minX = point->x;
            if (point->y < minY)
                minY = point->y;
            if (point->x > maxX)
                maxX = point->x;
            if (point->y > maxY)
                maxY = point->y;
            point++;
            count--;
        } while (count != 0);
    }
    quadTree->unk0 = minX;
    quadTree->unk8 = maxX;
    quadTree->unk4 = minY;
    quadTree->unkC = maxY;
    allocationSize = arg4 + entryBytes;
    block = slowAllocate(allocationSize);
    quadTree->block24 = block;
    if (block == NULL) {
        printf(Str_8755440, allocationSize);
    } else {
        __fastMemoryClearARM(0, block->address, block->size);
        allocationSize = arg5 << 2;
        quadTree->block28 = slowAllocate(allocationSize);
        if (quadTree->block28 == NULL) {
            printf(Str_8755474, allocationSize);
        } else {
            quadTree->unk4C = quadTree->block28->address;
            nodes = quadTree->block24->address;
            quadTree->unk2C = (QuadTreeNode*)nodes;
            quadTree->unk30 = (GeometryLine**)&nodes[arg4];
            quadTree->unk14[0] = (QuadTreeNode*)nodes;
            quadTree->unk14[1] = quadTree->unk14[0] + 1;
            quadTree->unk14[2] = quadTree->unk14[1] + 1;
            quadTree->unk14[3] = quadTree->unk14[2] + 1;
            quadTree->unk38 = 4;
            quadTree->unk3A = 0;
            quadTree->unk3C = arg2;
            centerX = minX + ((maxX - minX) >> 1);
            centerY = minY + ((maxY - minY) >> 1);
            quadTree->unk14[0] = initQuadTreeNode(
                quadTree, quadTree->unk14[0], minX, minY, centerX, centerY, arg6);
            quadTree->unk14[1] = initQuadTreeNode(
                quadTree, quadTree->unk14[1], centerX, minY, maxX, centerY, arg6);
            quadTree->unk14[2] = initQuadTreeNode(
                quadTree, quadTree->unk14[2], minX, centerY, centerX, maxY, arg6);
            quadTree->unk14[3] = initQuadTreeNode(
                quadTree, quadTree->unk14[3], centerX, centerY, maxX, maxY, arg6);
            if (quadTree->unk3A >= quadTree->unk40)
                nullsub_10(Str_87554B4, quadTree->unk40, Str_87554F0, quadTree->unk3A);
            if (quadTree->unk38 >= quadTree->unk3E)
                nullsub_9(Str_87554F4, quadTree->unk38);
            allocateDynamicBoundingAreas(quadTree, geometry);
            quadTree->unk42 = (quadTree->unk40 - quadTree->unk3A) >> 1;
            sub_805BDBC(quadTree, geometry);
        }
    }
}

unk8 sub_805BF18(s32, s32, s32, s32, s32, s32, s32, s32);

void sub_805BDBC(QuadTree* quadTree, LevelGeometryAddresses* geometry)
{
    QuadTreeNode* node;
    s32 splineIndex;
    s32 pointIndex;
    s32 entryCount;
    QuadTreeSplineEntry* output;
    QuadTreeNode* nextNode;
    s32 nodeIndex;
    s32 outerIndex;
    s32 nextSplineIndex;
    s32 splineCount;
    s32 pointCount;
    unk32* pointIndices;
    GeometrySpline* spline;
    GeometryPoint* previous;
    GeometryPoint* point;
    s32 minX;
    s32 minY;
    s32 maxX;
    s32 maxY;

    node = quadTree->unk2C;
    quadTree->unk34 = (QuadTreeSplineEntry*)(quadTree->unk30 + quadTree->unk3A);
    output = quadTree->unk34;
    outerIndex = 0;
    if (outerIndex < quadTree->unk38) {
        do {
            if (node->unk28 == 0) {
                node->unk14 = NULL;
                node->unk2A = 0;
                node++;
                nodeIndex = outerIndex + 1;
            } else {
                node->unk14 = output;
                entryCount = 0;
                splineIndex = 0;
                splineCount = geometry->unk0->count.splineCountWord;
                nextNode = node + 1;
                nodeIndex = outerIndex + 1;
                if (entryCount < splineCount) {
                    do {
                        spline = geometry->unk14[splineIndex];
                        previous = geometry->unk4 + spline->pointIndices[0];
                        pointIndex = 1;
                        pointCount = spline->pointCount;
                        nextSplineIndex = splineIndex + 1;
                        if (pointIndex < pointCount) {
                            pointIndices = spline->pointIndices + 1;
                            do {
                                point = geometry->unk4 + *pointIndices;
                                if (previous->x < point->x) {
                                    minX = previous->x - 0x10;
                                    maxX = point->x + 0x10;
                                } else {
                                    minX = point->x - 0x10;
                                    maxX = previous->x + 0x10;
                                }
                                if (previous->y < point->y) {
                                    minY = previous->y - 0x10;
                                    maxY = point->y + 0x10;
                                } else {
                                    minY = point->y - 0x10;
                                    maxY = previous->y + 0x10;
                                }
                                if (sub_805BF18(node->unk18, node->unk1C, node->unk20, node->unk24,
                                        minX, minY, maxX, maxY)
                                    != 0) {
                                    output->unk0 = spline;
                                    output->unk4 = pointIndex - 1;
                                    output->unk6 = splineIndex;
                                    output += 1;
                                    entryCount += 1;
                                }
                                previous = point;
                                pointIndices += 1;
                                pointIndex += 1;
                            } while (pointIndex < spline->pointCount);
                        }
                        splineIndex = nextSplineIndex;
                    } while (splineIndex < geometry->unk0->count.splineCountWord);
                }
                node->unk2A = entryCount;
                node = nextNode;
            }
            outerIndex = nodeIndex;
        } while (outerIndex < quadTree->unk38);
    }
}

unk8 sub_805BF18(s32 arg0, s32 arg1, s32 arg2, s32 arg3, s32 arg4, s32 arg5, s32 arg6, s32 arg7)
{
    s32 temp;
    unk16 flags;

    flags = 0;
    if (arg4 > arg6) {
        temp = arg6;
        arg6 = arg4;
        arg4 = temp;
    }
    if (arg5 > arg7) {
        temp = arg7;
        arg7 = arg5;
        arg5 = temp;
    }
    if (arg4 >= arg0 && arg4 < arg2) {
        flags = 1;
    }
    if (arg6 >= arg0 && arg6 < arg2) {
        flags |= 1;
    }
    if (arg5 >= arg1 && arg5 < arg3) {
        flags |= 2;
    }
    if (arg7 >= arg1 && arg7 < arg3) {
        flags |= 2;
    }
    if (arg4 < arg0 && arg6 >= arg2 && (flags & 2) != 0) {
        flags = 3;
    }
    if (arg5 < arg1 && arg7 >= arg3 && (flags & 1) != 0) {
        flags = 3;
    }
    if (arg4 < arg0 && arg6 >= arg2 && arg5 < arg1 && arg7 >= arg3) {
        flags = 3;
    }
    if (flags == 3) {
        return 1;
    }
    return 0;
}

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

void allocateDynamicBoundingAreas(QuadTree* quadTree, LevelGeometryAddresses* geometry)
{
    s32 count;
    s32 max;
    s32 remaining;
    unk32 index;
    GeometryLine* record;
    unk32* output;

    max = quadTree->unk44;
    count = 0;
    remaining = geometry->unk0->lineCount;
    index = 0;
    record = geometry->unkC;
    output = quadTree->unk4C;
    while (remaining-- != 0) {
        if (record->unk11_3 != 0) {
            *output++ = index;
            count += 1;
            if (count > max) {
                printf(Str_8755530, max);
                break;
            }
            index++;
        } else {
            index++;
        }
        record++;
    }
    quadTree->unk48 = count;
}

QuadTreeNode* initQuadTreeNode(QuadTree* quadTree, QuadTreeNode* node, s32 minX, s32 minY, s32 maxX,
    s32 maxY, QuadTreeLineFilter callback)
{
    LevelGeometryAddresses* geometry;
    GeometryLine* line;
    GeometryPoint* points;
    GeometryPoint* point0;
    GeometryPoint* point1;
    s32 width;
    s32 height;
    s32 lineIndex;
    s32 selectedCount;
    s32 dynamicIndex;
    s32 containedCount;
    s32 left;
    s32 right;
    s32 top;
    s32 bottom;
    unk16 flags;
    s32 i;

    geometry = quadTree->unk10;
    line = geometry->unkC;
    points = geometry->unk4;
    selectedCount = 0;
    dynamicIndex = quadTree->unk3A;
    containedCount = 0;
    node->unk18 = minX;
    node->unk20 = maxX;
    node->unk1C = minY;
    node->unk24 = maxY;
    width = maxX - minX;
    height = maxY - minY;
    lineIndex = 0;
    if (selectedCount < geometry->unk0->lineCount) {
        do {
            point0 = &points[line->point0];
            point1 = &points[line->point1];
            if (line->unk11_3 == 0 && (callback == NULL || callback(geometry, line) != 0)
                && line->point0 >= 0 && line->point1 >= 0) {
                left = point0->x;
                top = point0->y;
                right = point1->x;
                bottom = point1->y;
                if (left > right) {
                    i = right;
                    right = left;
                    left = i;
                }
                if (top > bottom) {
                    i = bottom;
                    bottom = top;
                    top = i;
                }
                left -= 0x10;
                right += 0x10;
                top -= 0x10;
                bottom += 0x10;
                flags = 0;
                if (left >= minX && left <= maxX) {
                    flags = 1;
                }
                if (right >= minX && right <= maxX) {
                    flags |= 1;
                }
                if (top >= minY && top <= maxY) {
                    flags |= 2;
                }
                if (bottom >= minY && bottom <= maxY) {
                    flags |= 2;
                }
                if (left <= minX && right >= maxX && (flags & 2) != 0) {
                    flags = 3;
                }
                if (top <= minY && bottom >= maxY && (flags & 1) != 0) {
                    flags = 3;
                }
                if (left <= minX && right >= maxX && top <= minY && bottom >= maxY) {
                    flags = 3;
                    containedCount += 1;
                }
                if (flags == 3) {
                    if (dynamicIndex < quadTree->unk40) {
                        quadTree->unk30[dynamicIndex] = line;
                        dynamicIndex += 1;
                    } else {
                        printf(Str_875557C);
                    }
                    selectedCount += 1;
                }
            }
            line++;
            lineIndex += 1;
        } while (lineIndex < geometry->unk0->lineCount);
    }
    if (selectedCount > quadTree->unk3C && containedCount < quadTree->unk3C && width > 0x7F
        && height > 0x7F) {
        s32 centerX;
        s32 centerY;

        centerX = ((maxX - minX) >> 1) + minX;
        centerY = minY + ((maxY - minY) >> 1);
        node->unk10 = NULL;
        node->unk14 = NULL;
        node->unk28 = 0;
        node->unk2A = 0;
        if (quadTree->unk38 + 4 >= quadTree->unk3E) {
            printf(Str_87555A8);
        }
        node->unk0 = &quadTree->unk2C[quadTree->unk38++];
        node->unk4 = &quadTree->unk2C[quadTree->unk38++];
        node->unk8 = &quadTree->unk2C[quadTree->unk38++];
        node->unkC = &quadTree->unk2C[quadTree->unk38++];
        node->unk0 = initQuadTreeNode(quadTree, node->unk0, minX, minY, centerX, centerY, callback);
        node->unk4 = initQuadTreeNode(quadTree, node->unk4, centerX, minY, maxX, centerY, callback);
        node->unk8 = initQuadTreeNode(quadTree, node->unk8, minX, centerY, centerX, maxY, callback);
        node->unkC = initQuadTreeNode(quadTree, node->unkC, centerX, centerY, maxX, maxY, callback);
        return node;
    }
    node->unk28 = selectedCount;
    node->unk2A = 0;
    node->unk14 = NULL;
    node->unk10 = quadTree->unk30 + quadTree->unk3A;
    quadTree->unk3A = dynamicIndex;
    if (selectedCount > 0x20) {
        printf(Str_87555F0, selectedCount, 0x20);
    }
    if (selectedCount == 0) {
        return NULL;
    }
    return node;
}

QuadTreeNode* GetQuadTreeNodeForPos(QuadTree* quadTree, s32 x, s32 y)
{
    s32 minX;
    s32 maxX;
    s32 minY;
    s32 maxY;
    s32 midX;
    s32 midY;
    s32 quadrant;
    QuadTreeNode* node;
    QuadTreeNode* current;

    quadrant = 0;
    minX = quadTree->unk0;
    maxX = quadTree->unk8;
    minY = quadTree->unk4;
    maxY = quadTree->unkC;
    midX = minX + ((maxX - minX) >> 1);
    midY = minY + ((maxY - minY) >> 1);
    if (x > midX)
        quadrant = 1;
    if (y > midY)
        quadrant |= 2;
    switch (quadrant) {
    case 0:
        node = quadTree->unk14[0];
        break;
    case 1:
        node = quadTree->unk14[1];
        break;
    case 2:
        node = quadTree->unk14[2];
        break;
    case 3:
        node = quadTree->unk14[3];
        break;
    }
    while (node != NULL) {
        current = node;
        if (node->unk28 != 0)
            break;
        minX = node->unk18;
        maxX = node->unk20;
        minY = node->unk1C;
        maxY = node->unk24;
        midX = minX + ((maxX - minX) >> 1);
        midY = minY + ((maxY - minY) >> 1);
        quadrant = 0;
        if (x > midX)
            quadrant = 1;
        if (y > midY)
            quadrant |= 2;
        switch (quadrant) {
        case 0:
            node = current->unk0;
            break;
        case 1:
            node = current->unk4;
            break;
        case 2:
            node = current->unk8;
            break;
        case 3:
            node = current->unkC;
            break;
        }
    }
    return node;
}

INCLUDE_ASM("asm/dump/8057b80-debug/805c3bc.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805c444.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805c48c-actor_805C48C.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805c9a4.s");
#if 0
typedef struct CollisionRiderDraft CollisionRiderDraft;
typedef struct GeometryLineDraft GeometryLineDraft;
typedef unk32 (*CollisionCallback3)(
    CollisionRiderDraft*, LevelGeometryAddresses*, GeometryLineDraft*);
typedef unk32 (*CollisionCallback4)(
    CollisionRiderDraft*, LevelGeometryAddresses*, GeometryLineDraft*, unk16, unk32*);

typedef struct CollisionCallbackTableDraft {
    CollisionCallback4 callback4;
    CollisionCallback3 callback3;
} CollisionCallbackTableDraft;

typedef struct CollisionCallbacksDraft {
    unk32* unk0;
    CollisionCallbackTableDraft* unk4;
} CollisionCallbacksDraft;

struct GeometryLineDraft {
    s32 point0;
    s32 point1;
    unk8 unk8;
    unk8 pad9[4];
    unk8 unkD;
    unk8 padE;
    unk8 unkF;
    unk8 unk10;
    unk8 unk11_0 : 3;
    unk8 unk11_3 : 1;
    unk8 unk11_4 : 4;
    unk8 pad12[0xE];
};

struct CollisionRiderDraft {
    unk8 pad0[4];
    s32 x;
    s32 y;
    unk8 padC[0x34];
    s32 unk40;
    s32 unk44;
    unk8 pad48[4];
    s32 unk4C;
    unk16 unk50;
    unk8 pad52[0x3E];
    CollisionCallbacksDraft callbacks;
    unk8 pad98[0x10];
    s16 unkA8;
    s16 unkAA;
    s16 unkAC;
    s16 unkAE;
};

unk32 call_rider_94_8(CollisionRiderDraft*, LevelGeometryAddresses*, GeometryLineDraft*, unk16);

unk32 sub_805CEB8(CollisionRiderDraft* rider, LevelGeometryAddresses* geometry, unk32* lineIndices,
    unk16 lineCount, unk32** filtered)
{
    GeometryLineDraft* line;
    GeometryPoint* point0;
    GeometryPoint* point1;
    unk32* object;
    CollisionCallback3 callback3;
    CollisionCallback4 callback4;
    unk16 collisionMask;
    s32 i;
    s32 lineMinY;
    s32 rectMinY;
    s32 rectMaxY;
    s32 broadY0;
    s32 lineMinX;
    s32 lineMaxX;
    unk32 objectX;
    unk32 objectY;
    s32 xStart;
    s32 xExtent;
    s32 yStart;
    s32 yExtent;
    unk8 responseFlags;
    unk8 overlapMask;
    unk32 callbackDone;
    unk8 lineFlags;
    unk32 callbackMask;
    s32 lineMaxY;
    s32 y0;
    s32 broadY1;
    s32 rectMinX;
    s32 rectMaxX;
    s32 temp;
    s32 magnitude;
    s32 yNegativeOffset;
    s32 yPositiveOffset;
    s32 yMargin;
    s32 xNegativeOffset;
    s32 xPositiveOffset;
    s16* xNegativeField;
    s16* yNegativeField;
    s16* xPositiveField;
    s16* yPositiveField;
    collisionMask = 0;
    i = 0;
    if (i < lineCount) {
        do {
            overlapMask = 0;
            responseFlags = 0;
            line = (GeometryLineDraft*)&geometry->unkC[lineIndices[i]];
            object = filtered[i];
            lineFlags = line->unk10;
            callbackDone = 0;
            callbackMask = 0;
            point0 = &geometry->unk4[line->point0];
            point1 = &geometry->unk4[line->point1];
            if (object != NULL) {
                objectX = object[0];
                objectY = object[1];
            } else {
                objectY = 0;
                objectX = 0;
            }
            xStart = rider->x + objectX - rider->unk40;
            xExtent = rider->unk40 - objectX;
            yStart = rider->y + objectY - rider->unk44;
            yExtent = rider->unk44 - objectY;
            if (point0->x < point1->x) {
                lineMinX = point0->x << 5;
                lineMaxX = point1->x << 5;
            } else {
                lineMinX = point1->x << 5;
                lineMaxX = point0->x << 5;
            }
            if (point0->y < point1->y) {
                lineMinY = point0->y << 5;
                lineMaxY = point1->y << 5;
            } else {
                lineMinY = point1->y << 5;
                lineMaxY = point0->y << 5;
            }
            yNegativeOffset = rider->unkAA << 8;
            yPositiveOffset = rider->unkAE << 8;
            yMargin = rider->unk50;
            yNegativeField = &rider->unkAA;
            yPositiveField = &rider->unkAE;
            if (yExtent > 0) {
                rectMinY = yStart + yPositiveOffset;
                rectMaxY = rectMinY + yExtent + yMargin;
                broadY0 = rectMaxY;
                broadY1 = yStart + yNegativeOffset;
            } else {
                rectMaxY = yStart + yNegativeOffset;
                broadY1 = rectMaxY + yExtent + yMargin;
                rectMinY = broadY1;
                broadY0 = yStart + yPositiveOffset;
            }
            xNegativeOffset = rider->unkA8 << 8;
            xPositiveOffset = rider->unkAC << 8;
            xNegativeField = &rider->unkA8;
            xPositiveField = &rider->unkAC;
            if (xExtent > 0) {
                rectMinX = xStart + xPositiveOffset;
                rectMaxX = rectMinX + xExtent + rider->unk4C;
            } else {
                rectMaxX = xStart + xNegativeOffset;
                rectMinX = rectMaxX + xExtent + rider->unk4C;
            }
            if (rectMaxX < lineMinX || lineMaxX < rectMinX) {
                if (broadY0 < lineMinY || lineMaxY < broadY1)
                    continue;
            }
            if (rectMaxX <= lineMinX || lineMaxX <= rectMinX) {
            } else {
                overlapMask |= 1;
                if (rectMinY <= lineMinY && rectMaxY >= lineMinY && (lineFlags & 3) != 0) {
                    if (callbackDone == 0) {
                        if (yExtent > 0)
                            callbackMask |= 1;
                        else
                            callbackMask |= 2;
                        if (call_rider_94_8(rider, geometry, line, callbackMask) == 0)
                            lineFlags = 0;
                        callbackDone = 1;
                    }
                    if (yExtent > 0) {
                        if ((lineFlags & 1) != 0) {
                            rider->y = lineMinY - (*yPositiveField << 8) + objectY;
                            broadY0 = lineMinY;
                            responseFlags = 1;
                            collisionMask |= 1;
                        }
                    } else if ((lineFlags & 2) != 0) {
                        rider->y = lineMinY - (*yNegativeField << 8) + objectY + 0x80;
                        rectMaxY = lineMinY;
                        responseFlags = 1;
                        collisionMask |= 2;
                    }
                }
                if (rectMinY <= lineMaxY && rectMaxY >= lineMaxY && (lineFlags & 0xC) != 0) {
                    if (callbackDone == 0) {
                        if (yExtent > 0)
                            callbackMask |= 4;
                        else
                            callbackMask |= 8;
                        if (call_rider_94_8(rider, geometry, line, callbackMask) == 0)
                            lineFlags = 0;
                        callbackDone = 1;
                    }
                    if (yExtent > 0) {
                        if ((lineFlags & 4) != 0) {
                            rider->y = lineMaxY - (*yPositiveField << 8) + objectY;
                            y0 = lineMaxY;
                            responseFlags = 1;
                            collisionMask |= 4;
                        }
                    } else if ((lineFlags & 8) != 0) {
                        rider->y = lineMaxY - (*yNegativeField << 8) + objectY + 0x80;
                        rectMaxY = lineMaxY;
                        responseFlags = 1;
                        collisionMask |= 8;
                    }
                }
            }
            if (broadY0 <= rectMinY || rectMaxY <= broadY1)
                continue;
            overlapMask |= 2;
            if (rectMinX <= lineMinX && rectMaxX >= lineMinX && (lineFlags & 0x30) != 0) {
                if (callbackDone == 0) {
                    if (xExtent > 0)
                        callbackMask |= 0x10;
                    else
                        callbackMask |= 0x20;
                    if (call_rider_94_8(rider, geometry, line, callbackMask) == 0)
                        lineFlags = 0;
                    callbackDone = 1;
                }
                if (xExtent > 0) {
                    if ((lineFlags & 0x10) != 0) {
                        rider->x = lineMinX - (*xPositiveField << 8) + objectX;
                        responseFlags |= 2;
                        collisionMask |= 0x10;
                    }
                } else if ((lineFlags & 0x20) != 0) {
                    rider->x = lineMinX - (*xNegativeField << 8) + objectX + 0x80;
                    responseFlags |= 2;
                    collisionMask |= 0x20;
                }
            }
            if (rectMinX <= lineMaxX && rectMaxX >= lineMaxX && (lineFlags & 0xC0) != 0) {
                if (callbackDone == 0) {
                    if (xExtent > 0)
                        callbackMask |= 0x40;
                    else
                        callbackMask |= 0x80;
                    if (call_rider_94_8(rider, geometry, line, callbackMask) == 0)
                        lineFlags = 0;
                }
                if (xExtent > 0) {
                    if ((lineFlags & 0x40) != 0) {
                        rider->x = lineMaxX - (*xPositiveField << 8);
                        responseFlags |= 2;
                        collisionMask |= 0x40;
                    }
                } else if ((lineFlags & 0x80) != 0) {
                    rider->x = lineMaxX - (*xNegativeField << 8) + objectX;
                    responseFlags |= 2;
                    collisionMask |= 0x80;
                }
            }
            if (overlapMask == 3 && rider->callbacks.unk4 != NULL) {
                callback3 = rider->callbacks.unk4->callback3;
                if (callback3 != NULL)
                    callback3(rider, geometry, line);
            }
            if ((responseFlags & 1) != 0) {
                temp = (line->unkD * yExtent) >> 7;
                magnitude = temp;
                if (temp < 0)
                    magnitude = -temp;
                if (magnitude <= 0xFF)
                    temp = 0;
                rider->unk44 = -temp;
            }
            if ((responseFlags & 2) != 0) {
                temp = (line->unkD * xExtent) >> 7;
                magnitude = temp;
                if (temp < 0)
                    magnitude = -temp;
                if (magnitude <= 0xFF)
                    temp = 0;
                rider->unk40 = -temp;
            }
            if (responseFlags != 0 && rider->callbacks.unk4 != NULL) {
                callback4 = rider->callbacks.unk4->callback4;
                if (callback4 != NULL)
                    callback4(rider, geometry, line, collisionMask, &callbackDone);
            }
            i++;
        } while (i < lineCount);
    }
    return 0;
}

#endif
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

GeometryPoint* GetPointAtIndex(LevelGeometryAddresses* arg0, s32 arg1)
{
    GeometryPoint* points;

    points = arg0->unk4;
    if (arg1 < arg0->unk0->pointCount) {
        return &points[arg1];
    }
    return NULL;
}

GeometryPoint* GetPointAtSplineIndex(LevelGeometryAddresses* arg0, s32 splineIndex, s32 pointIndex)
{
    GeometrySpline* spline;
    unk32* offsets;

    spline = GetSplineAtIndex(arg0, splineIndex);
    if (spline != NULL) {
        offsets = spline->pointIndices;
        if (pointIndex < spline->pointCount) {
            return &arg0->unk4[offsets[pointIndex]];
        }
    }
    return NULL;
}

INCLUDE_ASM("asm/dump/8057b80-debug/805dbf0.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805dcd4-GetSplineLineAtIndex.s");

GeometrySplineLine* sub_805DCFC(LevelGeometryAddresses* arg0, GeometrySpline* spline, s32 index)
{
    GeometrySplineLine* lines;
    s32 count;

    if (spline == NULL) {
        return NULL;
    }
    count = spline->pointCount;
    lines = (GeometrySplineLine*)&spline->pointIndices[count];
    if (index >= count) {
        return NULL;
    }
    return &lines[index];
}

INCLUDE_ASM("asm/dump/8057b80-debug/805dd18.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805df04.s");

s32* sub_805DFD4(LevelGeometryAddresses* addresses, unk32 splineIndex, s32* result, s32 position)
{
    GeometrySpline* spline;
    unk32* pointIndices;
    GeometryPoint* point0;
    GeometryPoint* point1;
    s32 index;

    spline = GetSplineAtIndex(addresses, splineIndex);
    pointIndices = spline->pointIndices;
    if (position < 0) {
        position = 0;
    }
    if ((position >> 10) >= spline->pointCount) {
        position = ((spline->pointCount - 1) << 10) | (position & 0x3FF);
    }
    index = position >> 10;
    point0 = GetPointAtIndex(addresses, pointIndices[index]);
    point1 = GetPointAtIndex(addresses, pointIndices[index + 1]);
    result[0] = point0->x + ((point1->x - point0->x) * (position & 0x3FF) >> 10);
    result[1] = point0->y + ((point1->y - point0->y) * (position & 0x3FF) >> 10);
    result[2] = point0->z + ((point1->z - point0->z) * (position & 0x3FF) >> 10);
    result[3] = position & 0x3FF;
    result[4] = index;
    return result;
}

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

s32 GetLineIndexOfType(LevelGeometryAddresses* addresses, unk8 type, unk16 startIndex)
{
    unk16 index;
    GeometryLine* line;

    line = addresses->unkC + startIndex;
    index = startIndex;
    for (; index < addresses->unk0->lineCount; line++, index++) {
        if (line->unkF == type) {
            return index;
        }
    }
    return -1;
}

ASM_ZEROPAD
