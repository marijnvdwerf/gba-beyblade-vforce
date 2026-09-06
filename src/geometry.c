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
        key = (u16)id;
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
    unk16 nodeCount, unk16 arg5, unk32 arg6)
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
            quadTree->unk30 = (QuadTreeNode*)&nodes[arg4];
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

#if 0
typedef struct GeometryPointDraft {
    s32 x;
    s32 y;
    unk32 z;
    unk32 padC;
} GeometryPointDraft;

typedef struct GeometryLineDraft {
    unk32 point0;
    unk32 point1;
    unk8 pad8[5];
    unk8 unkD;
    unk8 padE[2];
    unk8 unk10;
    unk8 pad11[0xF];
} GeometryLineDraft;

typedef struct GeometrySplineDraft {
    s32 pointCount;
    unk8 pad4[0x1C];
    unk32 pointIndices[1];
} GeometrySplineDraft;

typedef struct GeometryTableDraft {
    unk32 pointCount;
    union {
        unk16 splineCount;
        s32 splineCountWord;
    } count;
    s32 lineCount;
} GeometryTableDraft;

typedef struct GeometryAddressesDraft {
    GeometryTableDraft* unk0;
    GeometryPointDraft* unk4;
    GeometrySplineDraft* unk8;
    GeometryLineDraft* unkC;
    unk8 pad10[4];
    GeometrySplineDraft* unk14[0x40];
} GeometryAddressesDraft;

typedef struct QuadTreeEntryDraft {
    GeometrySplineDraft* spline;
    unk16 pointIndex;
    unk16 splineIndex;
} QuadTreeEntryDraft;

typedef struct QuadTreeNodeDraft {
    struct QuadTreeNodeDraft* unk0;
    struct QuadTreeNodeDraft* unk4;
    struct QuadTreeNodeDraft* unk8;
    struct QuadTreeNodeDraft* unkC;
    GeometryLineDraft** unk10;
    QuadTreeEntryDraft* unk14;
    s32 unk18;
    s32 unk1C;
    s32 unk20;
    s32 unk24;
    unk16 unk28;
    unk16 unk2A;
} QuadTreeNodeDraft;

typedef struct QuadTreeDraft {
    unk8 pad0[0x2C];
    QuadTreeNodeDraft* unk2C;
    GeometryLineDraft** unk30;
    unk32* unk34;
    unk16 unk38;
    unk16 unk3A;
} QuadTreeDraft;

unk32 sub_805BF18(s32, s32, s32, s32, s32, s32, s32, s32);

void sub_805BDBC(QuadTreeDraft* quadTree, GeometryAddressesDraft* geometry)
{
    QuadTreeNodeDraft* node;
    s32 splineIndex;
    s32 pointIndex;
    s32 entryCount;
    QuadTreeEntryDraft* output;
    QuadTreeNodeDraft* nextNode;
    s32 nodeIndex;
    s32 outerIndex;
    s32 nextSplineIndex;
    s32 splineCount;
    unk32* pointIndices;
    GeometrySplineDraft* spline;
    GeometryPointDraft* previous;
    GeometryPointDraft* point;
    s32 minX;
    s32 minY;
    s32 maxX;
    s32 maxY;

    node = quadTree->unk2C;
    quadTree->unk34 = quadTree->unk30 + quadTree->unk3A;
    output = (QuadTreeEntryDraft*)quadTree->unk34;
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
                        nextSplineIndex = splineIndex + 1;
                        previous = geometry->unk4 + spline->pointIndices[0];
                        pointIndex = 1;
                        pointIndices = spline->pointIndices + 1;
                        while (pointIndex < spline->pointCount) {
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
                                maxY = point->y;
                            } else {
                                minY = point->y - 0x10;
                                maxY = previous->y;
                            }
                            maxY += 0x10;
                            if (sub_805BF18(node->unk18, node->unk1C, node->unk20, node->unk24,
                                    minX, minY, maxX, maxY)
                                != 0) {
                                output->spline = spline;
                                output->pointIndex = pointIndex - 1;
                                output->splineIndex = splineIndex;
                                output += 1;
                                entryCount += 1;
                            }
                            previous = point;
                            pointIndices += 1;
                            pointIndex += 1;
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
#endif
INCLUDE_ASM("asm/dump/8057b80-debug/805bdbc.s");

unk32 sub_805BF18(s32 arg0, s32 arg1, s32 arg2, s32 arg3, s32 arg4, s32 arg5, s32 arg6, s32 arg7)
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

#if 0
typedef struct GeometryTableAllocDraft {
    unk8 pad0[8];
    s32 lineCount;
} GeometryTableAllocDraft;

typedef struct GeometryLineAllocDraft {
    unk8 pad0[0x11];
    unk8 unk11;
    unk8 pad12[0xE];
} GeometryLineAllocDraft;

typedef struct GeometryAddressesAllocDraft {
    GeometryTableAllocDraft* unk0;
    unk8 pad4[8];
    GeometryLineAllocDraft* unkC;
} GeometryAddressesAllocDraft;

typedef struct QuadTreeAllocDraft {
    unk8 pad0[0x44];
    unk16 unk44;
    unk8 pad46[2];
    unk16 unk48;
    unk8 pad4A[2];
    unk32* unk4C;
} QuadTreeAllocDraft;

extern const unk8 Str_8755530[];

void allocateDynamicBoundingAreas(QuadTreeAllocDraft* quadTree, GeometryAddressesAllocDraft* geometry)
{
    s32 count;
    s32 max;
    s32 remaining;
    s32 index;
    GeometryLineAllocDraft* record;
    unk32* output;

    max = quadTree->unk44;
    count = 0;
    remaining = geometry->unk0->lineCount;
    index = 0;
    record = geometry->unkC;
    output = quadTree->unk4C;
    while (remaining-- != 0) {
        if ((record->unk11 & 8) != 0) {
            *output++ = index;
            count += 1;
            if (count > max) {
                printf(Str_8755530, max);
                break;
            }
        }
        index += 1;
        record++;
    }
    quadTree->unk48 = count;
}
#endif
INCLUDE_ASM("asm/dump/8057b80-debug/805bfe8-allocateDynamicBoundingAreas.s");

#if 0
typedef struct InitGeometryTableDraft {
    unk32 pointCount;
    union {
        unk16 splineCount;
        s32 splineCountWord;
    } count;
    s32 lineCount;
    unk8 padC[0x10];
} InitGeometryTableDraft;

typedef struct InitGeometryPointDraft {
    s32 x;
    s32 y;
    unk32 z;
    unk32 padC;
} InitGeometryPointDraft;

typedef struct InitGeometryLineDraft {
    unk32 point0;
    unk32 point1;
    unk8 unk8;
    unk8 pad9[7];
    unk8 unk10;
    unk8 unk11;
    unk8 pad12[0xE];
} InitGeometryLineDraft;

typedef struct InitGeometryAddressesDraft {
    InitGeometryTableDraft* unk0;
    InitGeometryPointDraft* unk4;
    unk8 pad8[4];
    InitGeometryLineDraft* unkC;
} InitGeometryAddressesDraft;

typedef struct InitGeometryEntryDraft {
    unk8 data[8];
} InitGeometryEntryDraft;

typedef struct InitQuadTreeNodeDraft {
    struct InitQuadTreeNodeDraft* unk0;
    struct InitQuadTreeNodeDraft* unk4;
    struct InitQuadTreeNodeDraft* unk8;
    struct InitQuadTreeNodeDraft* unkC;
    InitGeometryLineDraft** unk10;
    InitGeometryEntryDraft* unk14;
    s32 unk18;
    s32 unk1C;
    s32 unk20;
    s32 unk24;
    unk16 unk28;
    unk16 unk2A;
} InitQuadTreeNodeDraft;

typedef struct InitQuadTreeDraft {
    unk8 pad0[0x10];
    InitGeometryAddressesDraft* unk10;
    InitQuadTreeNodeDraft* unk14[4];
    unk8 pad24[8];
    InitQuadTreeNodeDraft* unk2C;
    InitGeometryLineDraft** unk30;
    unk8 pad34[4];
    unk16 unk38;
    unk16 unk3A;
    unk16 unk3C;
    unk16 unk3E;
    unk16 unk40;
} InitQuadTreeDraft;

typedef unk32 (*InitQuadTreeCallbackDraft)(InitGeometryTableDraft*, InitGeometryLineDraft*);

extern const unk8 Str_875557C[];
extern const unk8 Str_87555A8[];
extern const unk8 Str_87555F0[];
InitQuadTreeNodeDraft* initQuadTreeNode(InitQuadTreeDraft* quadTree, InitQuadTreeNodeDraft* node, s32 minX, s32 minY,
    s32 maxX, s32 maxY, InitQuadTreeCallbackDraft callback)
{
    InitGeometryAddressesDraft* geometry;
    InitGeometryLineDraft* line;
    InitGeometryPointDraft* points;
    InitGeometryPointDraft* point0;
    InitGeometryPointDraft* point1;
    s32 width;
    s32 height;
    s32 lineIndex;
    s32 selectedCount;
    unk16 dynamicIndex;
    s32 containedCount;
    s32 left;
    s32 right;
    s32 top;
    s32 bottom;
    unk16 flags;
    unk16 nextNode;
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
    if (lineIndex < geometry->unk0->lineCount) {
        do {
            point0 = &points[line->point0];
            point1 = &points[line->point1];
            flags = 0;
            if ((line->unk11 & 8) == 0
                && (callback == NULL || (callback(geometry->unk0, line) << 24) != 0)
                && line->point0 >= 0 && line->point1 >= 0) {
                left = point0->x;
                right = point1->x;
                if (left > right) {
                    i = right;
                    right = left;
                    left = i;
                }
                top = point0->y;
                bottom = point1->y;
                if (top > bottom) {
                    i = bottom;
                    bottom = top;
                    top = i;
                }
                left -= 0x10;
                right += 0x10;
                top -= 0x10;
                bottom += 0x10;
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
        centerY = ((maxY - minY) >> 1) + minY;
        node->unk10 = NULL;
        node->unk14 = NULL;
        node->unk28 = 0;
        node->unk2A = 0;
        if (quadTree->unk38 + 4 >= quadTree->unk3E) {
            printf(Str_87555A8);
        }
        nextNode = quadTree->unk38;
        quadTree->unk14[0] = &quadTree->unk2C[nextNode + 0];
        quadTree->unk14[1] = &quadTree->unk2C[nextNode + 1];
        quadTree->unk14[2] = &quadTree->unk2C[nextNode + 2];
        quadTree->unk38 = nextNode + 4;
        quadTree->unk14[3] = &quadTree->unk2C[nextNode + 3];
        node->unk0 = initQuadTreeNode(quadTree, quadTree->unk14[0], minX, minY, centerX, centerY, callback);
        node->unk4 = initQuadTreeNode(quadTree, quadTree->unk14[1], centerX, minY, maxX, centerY, callback);
        node->unk8 = initQuadTreeNode(quadTree, quadTree->unk14[2], minX, centerY, centerX, maxY, callback);
        node->unkC = initQuadTreeNode(quadTree, quadTree->unk14[3], centerX, centerY, maxX, maxY, callback);
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
    if (selectedCount != 0) {
        return node;
    }
    return NULL;
}
#endif
INCLUDE_ASM("asm/dump/8057b80-debug/805c040-initQuadTreeNode.s");

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
#if 0
unk32 GetLineIndexOfType(LevelGeometryAddresses* addresses, unk8 type, unk16 index)
{
    s32 count;
    s32 current;
    GeometryLine* line;

    type = (unk8)type;
    index = (unk16)index;
    line = addresses->unkC + index;
    count = addresses->unk0->lineCount;
    if (index >= count) {
        return -1;
    }
    current = count;
    while (index < current) {
        if (line->unkF == type) {
            return index;
        }
        line++;
        index++;
    }
    return -1;
}
#else
INCLUDE_ASM("asm/dump/8057b80-debug/805e83c-GetLineIndexOfType.s");
#endif
