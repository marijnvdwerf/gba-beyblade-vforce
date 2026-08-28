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
    RENDER_TRIANGLE_SETUP = 0,
    RENDER_SPAN_FILL = 1,
    RENDER_SHORT_SPAN = 2,
    RENDER_BUCKET_INSERT = 3,
    RENDER_FACE_CULL = 4,
    RENDER_STRIDED_COPY_ALT = 5,
    RENDER_TRIANGLE_SETUP_2 = 6,
    RENDER_TRIANGLE_DRAW = 7,
    RENDER_STRIDED_COPY = 8,
    RENDER_POST_PROCESS = 9,
    RENDER_FACE_DRAW = 10,
    RENDER_STRIDED_COPY_2 = 11,
    RENDER_VERTEX_TRANSFORM = 12,
    RENDER_FACE_DRAW_2 = 13,
    RENDER_SHORT_SPAN_2 = 14,

    RENDER_FACE_DRAW_3 = 16,
    RENDER_STRIDED_COPY_ALT_2 = 17,
    RENDER_STRIDED_COPY_ALT_3 = 18,

    RENDER_STRIDED_COPY_ALT_4 = 21,
    RENDER_STRIDED_COPY_ALT_5 = 22,
    RENDER_STRIDED_COPY_ALT_6 = 23,
    RENDER_STRIDED_COPY_ALT_7 = 24,
    RENDER_FACE_DRAW_4 = 25,
    RENDER_SHORT_SPAN_3 = 26,
    RENDER_OFFSETS_PTR = 27,
    RENDER_SHORT_SPAN_4 = 28,
    RENDER_POST_PROCESS_2 = 29,
    RENDER_POST_PROCESS_3 = 30,
    RENDER_POST_PROCESS_4 = 31
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
