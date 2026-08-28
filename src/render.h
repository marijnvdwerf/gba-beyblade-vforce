#ifndef _RENDER_H
#define _RENDER_H

#include "common.h"
#include "memory.h"

typedef unk8* (*RenderShortSpanFn)(void*, unk8, unk32, unk32);
typedef unk16* (*RenderSpanFillFn)(unk32, unk8, unk32, unk32);
typedef unk32 (*RenderTriSetupFn)(void*, unk32, void*);
typedef void (*RenderTriDrawFn)(void*, unk32);
typedef void (*RenderPostProcessFn)(void*, void*, unk32);
typedef void (*RenderVertexTransformFn)(void*, void*, unk32);
typedef void (*RenderBucketInsertFn)(void*, unk32, unk16);
typedef void (*RenderFaceCullFn)(void*, void*, unk32);
typedef void* (*RenderFaceDrawFn)(void*, void*, void*, void*);
typedef void (*RenderStridedCopyFn)(unk32, unk32, void*, void*);

typedef struct RenderCode {
    AllocatedBlock* block; /* 0x00 */
    RenderTriSetupFn triangleSetup; /* 0x04 */
    RenderSpanFillFn spanFill; /* 0x08 */
    RenderShortSpanFn shortSpan; /* 0x0C */
    RenderBucketInsertFn bucketInsert; /* 0x10 */
    RenderFaceCullFn faceCull; /* 0x14 */
    RenderStridedCopyFn stridedCopyAlt; /* 0x18 */
    RenderTriSetupFn triangleSetup2; /* 0x1C */
    RenderTriDrawFn triangleDraw; /* 0x20 */
    RenderStridedCopyFn stridedCopy; /* 0x24 */
    RenderPostProcessFn postProcess; /* 0x28 */
    RenderFaceDrawFn faceDraw; /* 0x2C */
    RenderStridedCopyFn stridedCopy2; /* 0x30 */
    RenderVertexTransformFn vertexTransform; /* 0x34 */
    RenderFaceDrawFn faceDraw2; /* 0x38 */
    RenderShortSpanFn shortSpan2; /* 0x3C */
    unk8 unk40[4]; /* 0x40 */
    RenderFaceDrawFn faceDraw3; /* 0x44 */
    RenderStridedCopyFn stridedCopyAlt2; /* 0x48 */
    RenderStridedCopyFn stridedCopyAlt3; /* 0x4C */
    unk8 unk50[8]; /* 0x50 */
    RenderStridedCopyFn stridedCopyAlt4; /* 0x58 */
    RenderStridedCopyFn stridedCopyAlt5; /* 0x5C */
    RenderStridedCopyFn stridedCopyAlt6; /* 0x60 */
    RenderStridedCopyFn stridedCopyAlt7; /* 0x64 */
    RenderFaceDrawFn faceDraw4; /* 0x68 */
    RenderShortSpanFn shortSpan3; /* 0x6C */
    void* offsetsPtr; /* 0x70 */
    RenderShortSpanFn shortSpan4; /* 0x74 */
    RenderPostProcessFn postProcess2; /* 0x78 */
    RenderPostProcessFn postProcess3; /* 0x7C */
    RenderPostProcessFn postProcess4; /* 0x80 */
} RenderCode;

RenderCode* allocateRenderCode(RenderCode*, AllocatedBlock**);

#endif
