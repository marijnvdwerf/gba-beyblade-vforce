#include "render.h"

#include <agb/define.h>
#include <agb/macro.h>
#include <agb/memory_map.h>

#include "system.h"

extern const unk8 Str_8755644[];

extern unk8 render_00[];
extern unk8 _renderFunctionsEnd[];
extern unk32 _renderFunctionOffsets[];

enum RenderFunctionIndex {
    RENDER_TRIANGLE_SETUP = 0, /* 0x1AC — render_02 */
    RENDER_SPAN_FILL = 1, /* 0x060 — render_01 */
    RENDER_SHORT_SPAN = 2, /* 0x000 — render_00 */
    RENDER_BUCKET_INSERT = 3, /* 0xA80 — render_06 */
    RENDER_FACE_CULL = 4, /* 0xAD4 — render_07 */
    RENDER_STRIDED_COPY_ALT = 5, /* 0xC98 — render_09 (via fallthrough) */
    RENDER_TRIANGLE_SETUP_2 = 6, /* 0x1AC — render_02 */
    RENDER_TRIANGLE_DRAW = 7, /* 0x698 — render_03 */
    RENDER_STRIDED_COPY = 8, /* 0xC9C — render_09 */
    RENDER_POST_PROCESS = 9, /* 0x85C — render_04 */
    RENDER_FACE_DRAW = 10, /* 0xC28 — render_08 */
    RENDER_STRIDED_COPY_2 = 11, /* 0xC9C — render_09 */
    RENDER_VERTEX_TRANSFORM = 12, /* 0x944 — render_05 */
    RENDER_FACE_DRAW_2 = 13, /* 0xC28 — render_08 */
    RENDER_SHORT_SPAN_2 = 14, /* 0x000 — render_00 */
    /* 15: gap (unk40 padding) */
    RENDER_FACE_DRAW_3 = 16, /* 0xC28 — render_08 */
    RENDER_STRIDED_COPY_ALT_2 = 17, /* 0xC98 — render_09 (via fallthrough) */
    RENDER_STRIDED_COPY_ALT_3 = 18, /* 0xC98 — render_09 (via fallthrough) */
    /* 19-20: gap (unk50 padding) */
    RENDER_STRIDED_COPY_ALT_4 = 21, /* 0xC98 — render_09 (via fallthrough) */
    RENDER_STRIDED_COPY_ALT_5 = 22, /* 0xC98 — render_09 (via fallthrough) */
    RENDER_STRIDED_COPY_ALT_6 = 23, /* 0xC98 — render_09 (via fallthrough) */
    RENDER_STRIDED_COPY_ALT_7 = 24, /* 0xC98 — render_09 (via fallthrough) */
    RENDER_FACE_DRAW_4 = 25, /* 0xC28 — render_08 */
    RENDER_SHORT_SPAN_3 = 26, /* 0x000 — render_00 */
    RENDER_OFFSETS_PTR = 27, /* 0xD24 — _renderFunctionsEnd (data) */
    RENDER_SHORT_SPAN_4 = 28, /* 0x000 — render_00 */
    RENDER_POST_PROCESS_2 = 29, /* 0x85C — render_04 */
    RENDER_POST_PROCESS_3 = 30, /* 0x85C — render_04 */
    RENDER_POST_PROCESS_4 = 31 /* 0x85C — render_04 */
};

RenderCode* allocateRenderCode(RenderCode* arg0, AllocatedBlock** arg1)
{
    AllocatedBlock* block;
    unk8* base;
    unk32* table;

    table = _renderFunctionOffsets;
    if (arg1 == NULL) {
        block = fastAllocate(_renderFunctionsEnd - render_00);
        arg0->block = block;
        if (block == NULL) {
            nullsub_8(Str_8755644);
            return NULL;
        }
        DmaSet(3, render_00, block->address, (block->size >> 2) | DMA_ENABLE | DMA_32BIT_BUS);
    } else {
        arg0->block = *arg1;
    }
    base = (unk8*)arg0->block->address;
    arg0->triangleSetup = (void*)(base + table[RENDER_TRIANGLE_SETUP]);
    arg0->spanFill = (void*)(base + table[RENDER_SPAN_FILL]);
    arg0->shortSpan = (void*)(base + table[RENDER_SHORT_SPAN]);
    arg0->bucketInsert = (void*)(base + table[RENDER_BUCKET_INSERT]);
    arg0->faceCull = (void*)(base + table[RENDER_FACE_CULL]);
    arg0->stridedCopyAlt = (void*)(base + table[RENDER_STRIDED_COPY_ALT]);
    arg0->triangleSetup2 = (void*)(base + table[RENDER_TRIANGLE_SETUP_2]);
    arg0->triangleDraw = (void*)(base + table[RENDER_TRIANGLE_DRAW]);
    arg0->stridedCopy = (void*)(base + table[RENDER_STRIDED_COPY]);
    arg0->postProcess = (void*)(base + table[RENDER_POST_PROCESS]);
    arg0->faceDraw = (void*)(base + table[RENDER_FACE_DRAW]);
    arg0->stridedCopy2 = (void*)(base + table[RENDER_STRIDED_COPY_2]);
    arg0->vertexTransform = (void*)(base + table[RENDER_VERTEX_TRANSFORM]);
    arg0->faceDraw2 = (void*)(base + table[RENDER_FACE_DRAW_2]);
    arg0->shortSpan2 = (void*)(base + table[RENDER_SHORT_SPAN_2]);
    arg0->faceDraw3 = (void*)(base + table[RENDER_FACE_DRAW_3]);
    arg0->stridedCopyAlt2 = (void*)(base + table[RENDER_STRIDED_COPY_ALT_2]);
    arg0->stridedCopyAlt3 = (void*)(base + table[RENDER_STRIDED_COPY_ALT_3]);
    arg0->stridedCopyAlt4 = (void*)(base + table[RENDER_STRIDED_COPY_ALT_4]);
    arg0->stridedCopyAlt5 = (void*)(base + table[RENDER_STRIDED_COPY_ALT_5]);
    arg0->stridedCopyAlt6 = (void*)(base + table[RENDER_STRIDED_COPY_ALT_6]);
    arg0->stridedCopyAlt7 = (void*)(base + table[RENDER_STRIDED_COPY_ALT_7]);
    arg0->faceDraw4 = (void*)(base + table[RENDER_FACE_DRAW_4]);
    arg0->shortSpan3 = (void*)(base + table[RENDER_SHORT_SPAN_3]);
    arg0->offsetsPtr = base + table[RENDER_OFFSETS_PTR];
    arg0->shortSpan4 = (void*)(base + table[RENDER_SHORT_SPAN_4]);
    arg0->postProcess2 = (void*)(base + table[RENDER_POST_PROCESS_2]);
    arg0->postProcess3 = (void*)(base + table[RENDER_POST_PROCESS_3]);
    arg0->postProcess4 = (void*)(base + table[RENDER_POST_PROCESS_4]);
    return arg0;
}

asm(".align 2, 0");
