# GetLineIndexOfType — matched 2026-09-07

Address: `0x0805E83C`; translation unit: `src/geometry.c`.

The mainLoop callgraph includes this function. The three calls in initRiders
use types 0x86/0x99 and a halfword start index, and test the signed word return
against -1 or zero. The target signed comparisons prove the signed line count;
the byte type and halfword index retain the existing unk8/unk16 declarations.
The existing GeometryLine.unkF field and 0x20-byte layout needed no changes.
The m2c draft confirmed the cursor scan but incorrectly inferred a halfword
return; caller evidence establishes s32.

## Controlled experiments

Offsets below are relative to the function. Instruction size excludes padding.

| Change | First divergence | Size delta |
| --- | --- | --- |
| Enable original parked draft, cached count | +0x08: normalized index in r3 instead of r2; missing count copy | -2 bytes |
| Remove count local; use addresses->unk0->lineCount in loop test | +0x08: index/scratch r2 and r3 swapped | 0 |
| Separate startIndex argument and index local, assign index before pointer | +0x08: same swap | 0 |
| Initialize pointer from startIndex instead of index | +0x08: same swap | 0 |
| Move index = startIndex after pointer initialization | None | 0 |
| Format and compare without explicit end padding | Instructions match; ROM SHA1 differs | 0 |
| Restore file-scope zero alignment | None; full ROM SHA1 matches | 0 |

The allocation dump for the direct-bound version showed the initial scaled
offset locally allocated to r2, excluding the live running index from r2.
Keeping the starting index alive through pointer initialization and only then
assigning the running index recovers the original allocation. The separate
running index is byte-required: folding it into the parameter is the tested
second row. The cursor is reused for the field read and increment; there are
no single-use cached aliases to retain. Removing the count cache also restores
the target copy of the bound after the first comparison.

Final source:

```c
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
```

The function ends the translation unit, so file-scope `asm(".align 2, 0\n");`
preserves the original dump zero padding rather than Thumb NOP padding.
`cmake --build build --target compare` passes with SHA1
`cd527c8c24e20e33913fc45199e64b3e6138a6e5`.


# allocateDynamicBoundingAreas — matched 2026-09-07

Address: `0x0805BFE8`; translation unit: `src/geometry.c`.

Reachable from mainLoop through allocQuadTree. The caller allocates the output
array with unk44 * 4 bytes and initializes unk4C from that allocation. This
function scans the geometry line array, appends indices whose unk11 has bit 3
set, and writes the number appended to unk48. It preserves the original
store-before-capacity-check behavior, including the strict count > max check.
Existing QuadTree, LevelGeometryAddresses, and GeometryLine layouts suffice;
the old parked scratch structs were removed without adding header fields.
m2c supplied the semantic draft. The raw-decomp version pins registers and
uses raw offsets; neither technique was carried over.

## Controlled experiments

| Change | First divergence | Size delta including pool/padding |
| --- | --- | --- |
| Enable typed parked draft, unk32 index | +0x06: limit in r3 instead of r5; remaining/index also differ | 0 |
| Halfword max local | +0x06: unchanged register cycle | 0 |
| for loop with shared index/cursor updates | +0x06: unchanged | 0 |
| Early continue for unselected lines and count <= max | +0x06: unchanged | 0 |
| Move printf after loop with count > max guard | +0x02: extra high-register save and changed control flow | +0x1C |
| Increment index in output assignment; increment separately in else | +0x38: index increment appears before count increment | 0 |
| Move selected-branch index increment after overflow check | None | 0 |
| Hoist shared index increment and combine ++count with comparison | +0x06: original register cycle returns | 0 |
| Change remaining to unk32 | +0x1C: decrement compares against -1 instead of old value against zero | 0 |
| Restore s32 remaining; clang-format | None; full ROM SHA1 passes | 0 |

The allocator dump for the first draft ranks remaining above max above index;
index has 7 references across 46 instructions. Branch-local index increments
change its allocation to r2, remaining to r3, and max to r5, matching the target.

Flagged source shape: the index increments deliberately remain in both arms.
Hoisting them is semantically simpler but changes bytes. No register pinning,
volatile, barriers, or raw offset accesses were used. All temporaries are reused;
there are no single-use aliases. The signed count/max comparison is required by
ble. The signed remaining local is independently required by the measured
unsigned test above. Index and stored values retain the default unk32 type.

Final source:

```c
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
        if ((record->unk11 & 8) != 0) {
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
```

The function is internal to the translation unit; its literal-pool zero padding
matches without an added alignment directive. Full ROM SHA1 compare passes:
`cd527c8c24e20e33913fc45199e64b3e6138a6e5`.


# sub_805BDBC — matched 2026-09-07

Address: `0x0805BDBC`; translation unit: `src/geometry.c`.

The mainLoop callgraph reaches this function through allocQuadTree, immediately
after dynamic bounding areas are collected. For each populated quadtree node,
it tests spline segment bounding rectangles against the node and appends
8-byte records containing the spline pointer and two halfword indices.
The initial output region follows unk3A four-byte line pointers at unk30.

The parked draft and m2c established the scan semantics. Replaced the parked
scratch layouts with the shared QuadTree/QuadTreeNode/GeometrySpline types.
Added only accessed fields: node unk14/unk2A, tree unk34, and the 8-byte
QuadTreeSplineEntry record with unk0/unk4/unk6. Corrected tree unk30 to
GeometryLine** and updated its allocation assignment. GeometrySpline.pointCount
is signed, proven by the signed bge/blt comparisons against point indices.
The overlap helper sub_805BF18 returns unk8: its caller tests a byte-normalized
return (lsl #24); changing both declaration and definition preserves the
already-matched helper bytes.

## Controlled experiments

| Change | First divergence | Function size delta |
| --- | --- | --- |
| Typed parked draft, corrected helper return and spline count | +0x26: r5 instead of r4; point loop entry differs | -4 |
| Explicit point-loop entry test and do/while; point cursor initialized inside guard | +0x26: Y-bound register swap; count load after next spline index | 0 |
| Fold final maxY padding into call argument | +0x26 remains; fewer Y-load/move instructions | -2 |
| Compute maxY + 0x10 in each branch | +0x80: point-count load follows index advance | 0 |
| Stage pointCount before nextSplineIndex assignment | None; ROM SHA1 passes | 0 |
| Remove splineCount temporary | +0x52: spline-count load moves after successor setup | +2 |
| Replace nextNode with node++ at end | +0x40: stack slot changes, successor calculation moves | 0 |
| Replace nextSplineIndex with splineIndex++ | +0x86: successor index and point cursor stack slots swap | 0 |
| Fold nodeIndex into outerIndex | +0x24: loop index gets spilled early | +2 |
| Restore byte-required temporaries and format | None; ROM SHA1 passes | 0 |

The pointCount temporary is also byte-required: folding it into the entry
comparison is the third-to-last pre-match state, with the load following the
nextSplineIndex assignment. Each single-use successor/count temporary was
therefore tested independently rather than removed on stylistic grounds.
Other locals are reused through the loops or bounds calculations.

The compiler shares the branch-local maxY padding into one add after the join,
but its allocation differs from an explicit shared maxY += 0x10 statement.
Computing the complete bound in each branch matches and keeps the source
symmetric with the X-bound calculation. No register pinning, volatile, raw
offset dereferences, or artificial branches are needed.

Layout checks compiled for arm-none-eabi confirm entry size 8, entry offsets
0/4/6, node size 0x2C and fields 0x14/0x2A, tree size 0x58 and fields
0x30/0x34, and spline pointIndices at 0x20. No existing layout size changed.

Final source:

```c
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
```

Instruction diff is exact and full ROM SHA1 compare passes:
`cd527c8c24e20e33913fc45199e64b3e6138a6e5`.


# initQuadTreeNode — matched 2026-09-07

Address: `0x0805C040`; translation unit: `src/geometry.c`.

Reachable through mainLoop -> allocQuadTree and recursively through itself.
Read all four allocQuadTree calls and the recursive calls. The outer calls
supply a tree, node, four signed bounds, and an optional callback. The callback
receives LevelGeometryAddresses*, not its underlying LevelGeometryTable*,
and returns a byte (the target normalizes the return with lsl #24). Added
QuadTreeLineFilter and propagated it through allocQuadTree and the public
prototype. The callback invocation now uses the geometry wrapper directly.

Recovered behavior: scan non-dynamic lines, test expanded line bounds against
the node, collect line pointers, and recursively split crowded nodes if they
are larger than 0x7F in both dimensions. Children belong to node->unk0/4/8/C,
not quadTree->unk14; the parked draft used the wrong owner. Child allocation
uses four post-increments of the halfword node count, retaining the target's
halfword wrap at each index. The local dynamicIndex is s32 (signed comparison
and unnormalized increments), narrowed only when stored to quadTree->unk3A.

Corrected GeometryLine.point0 and point1 to s32, as the target explicitly
rejects negative indices. Added only node->unk10, a GeometryLine** field
previously covered by padding. The remaining fields and layouts already exist.
All four point coordinates are loaded before either axis is sorted, following
the target's load order. Flags initialize after padding the bounds, not before
the callback. The initial loop entry compares selectedCount, which is zero,
against lineCount; subsequent iterations compare lineIndex.

## Controlled experiments

| Change | First divergence | Result |
| --- | --- | --- |
| Typed draft with the semantic, signedness, coordinate-order and child-allocation corrections above | +0x1AA: centerY add operands reversed; return paths also merged/reversed | Same function size; ROM differs |
| Write centerY as minY + half-height and end with zero-count early return | None | Full ROM SHA1 passes |
| Fold width into the split condition | +0x0A: stack allocation 40 instead of 48 bytes | Rejected |
| Fold height into the split condition | +0x0A: stack allocation 44 instead of 48 bytes | Rejected |
| Restore both byte-required locals and format | None | Full ROM SHA1 passes |

The width and height locals each have one use but preserve values computed
before the scan, and independently removing either breaks the match. Other
locals are reused; no additional single-use aliases remain. No artificial
branches, register pinning, volatile, or raw offset accesses are needed.

ARM-target layout checks confirm node size 0x2C, node line/entry pointers at
0x10/0x14, halfword counts at 0x28/0x2A, GeometryLine size 0x20 with point
indices at 0/4, and QuadTree size 0x58. Signedness and callback prototype
corrections preserve all previously matched bytes under the full ROM check.

Final source:

```c
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
            if ((line->unk11 & 8) == 0 && (callback == NULL || callback(geometry, line) != 0)
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
```

Instruction diff is exact; full-ROM SHA1 compare passes:
`cd527c8c24e20e33913fc45199e64b3e6138a6e5`.
