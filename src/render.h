#ifndef _RENDER_H
#define _RENDER_H

#include "common.h"
#include "memory.h"

typedef unk8* (*RenderShortSpanFn)(void*, u8, unk32, unk32);
typedef u16* (*RenderSpanFillFn)(unk32, u8, unk32, unk32);
typedef unk32 (*RenderTriSetupFn)(void*, unk32, void*);
typedef void (*RenderTriDrawFn)(void*, unk32);
typedef void (*RenderPostProcessFn)(void*, void*, u32);
typedef void (*RenderVertexTransformFn)(void*, void*, unk32);
typedef void (*RenderBucketInsertFn)(void*, unk32, unk16);
typedef void (*RenderFaceCullFn)(void*, void*, unk32);
typedef void* (*RenderFaceDrawFn)(void*, void*, void*, void*);
typedef void (*RenderStridedCopyFn)(unk32, unk32, void*, void*);

typedef struct RenderCode {
    AllocatedBlock* block; /* 0x00 */
    RenderTriSetupFn triangleSetup; /* 0x04 — render_02 */
    RenderSpanFillFn spanFill; /* 0x08 — render_01 */
    RenderShortSpanFn shortSpan; /* 0x0C — render_00 */
    RenderBucketInsertFn bucketInsert; /* 0x10 — render_06 */
    RenderFaceCullFn faceCull; /* 0x14 — render_07 */
    RenderStridedCopyFn stridedCopyAlt; /* 0x18 — render_09 (via fallthrough) */
    RenderTriSetupFn triangleSetup2; /* 0x1C — render_02 */
    RenderTriDrawFn triangleDraw; /* 0x20 — render_03 */
    RenderStridedCopyFn stridedCopy; /* 0x24 — render_09 */
    RenderPostProcessFn postProcess; /* 0x28 — render_04 */
    RenderFaceDrawFn faceDraw; /* 0x2C — render_08 */
    RenderStridedCopyFn stridedCopy2; /* 0x30 — render_09 */
    RenderVertexTransformFn vertexTransform; /* 0x34 — render_05 */
    RenderFaceDrawFn faceDraw2; /* 0x38 — render_08 */
    RenderShortSpanFn shortSpan2; /* 0x3C — render_00 */
    unk8 unk40[4]; /* 0x40 — gap */
    RenderFaceDrawFn faceDraw3; /* 0x44 — render_08 */
    RenderStridedCopyFn stridedCopyAlt2; /* 0x48 — render_09 */
    RenderStridedCopyFn stridedCopyAlt3; /* 0x4C — render_09 */
    unk8 unk50[8]; /* 0x50 — gap */
    RenderStridedCopyFn stridedCopyAlt4; /* 0x58 — render_09 */
    RenderStridedCopyFn stridedCopyAlt5; /* 0x5C — render_09 */
    RenderStridedCopyFn stridedCopyAlt6; /* 0x60 — render_09 */
    RenderStridedCopyFn stridedCopyAlt7; /* 0x64 — render_09 */
    RenderFaceDrawFn faceDraw4; /* 0x68 — render_08 */
    RenderShortSpanFn shortSpan3; /* 0x6C — render_00 */
    void* offsetsPtr; /* 0x70 — _renderFunctionsEnd */
    RenderShortSpanFn shortSpan4; /* 0x74 — render_00 */
    RenderPostProcessFn postProcess2; /* 0x78 — render_04 */
    RenderPostProcessFn postProcess3; /* 0x7C — render_04 */
    RenderPostProcessFn postProcess4; /* 0x80 — render_04 */
} RenderCode;

RenderCode* allocateRenderCode(RenderCode*, AllocatedBlock**);

#endif /* _RENDER_H */
