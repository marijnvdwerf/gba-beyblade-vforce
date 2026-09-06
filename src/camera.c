#include "camera.h"

#include <agb/memory_map.h>

#include "common.h"
#include "geometry.h"
#include "include_asm.h"
#include "layer.h"
#include "system.h"

INCLUDE_ASM("asm/dump/8057b80-debug/805e878.s");

void sub_805E8A0(CameraState* camera, LevelDesign* arg1, unk16 arg2, s32* arg3)
{
    sub_805E8D8(camera, arg1, arg2, arg3);
}

INCLUDE_ASM("asm/dump/8057b80-debug/805e8b0.s");

#if 0
void sub_805E8D8(CameraState* camera, LevelDesign* level, unk16 mode, s32* offsets)
{
    s8 flags;
    s8 index;
    LevelDesignLayer* layerOrigin;
    LevelDesignLayer* layerBase;
    unk32 settings;
    s32 y;
    s32 x;

    flags = 0;
    camera->unk220 = level;
    camera->unk224 = 0;
    camera->unk354 &= -2;
    camera->callback = NULL;
    camera->unk348 = 0;
    camera->unk355 = 0xF;
    camera->unk356 = -1;
    camera->unk35C = 0;
    camera->unk35E = 0;
    camera->unk360 = 0xF0;
    camera->unk362 = 0xA0;
    camera->unk364 = 0;
    camera->unk368 = 0;
    *(vu16*)REG_BLDCNT = 0x3FFF;
    sub_8059934();
    layerOrigin = &level->layers[0];
    index = 0;
    layerBase = &level->layers[0];
    do {
        {
            s32* xBase;

            xBase = offsets;
            xBase += index * 2;
            x = *xBase;
        }
        {
            s32* yBase;

            yBase = offsets + 1;
            yBase += index * 2;
            y = *yBase;
        }
        {
            LevelDesignLayer* layer;

            layer = layerBase + index;
            if (layer->unk0 != NULL) {
                flags |= 1 << index;
                if (index != 0
                    && (level->layers[index].unk4 != 0 || level->layers[index].unk8 != 0)) {
                    sub_8058968(&camera->records[index], index, layerBase[index].unk0, 0x40,
                        level->layers[index].unkC | 1,
                        (layerOrigin->unk4 - level->layers[index].unk4) >> 8,
                        (layerOrigin->unk8 - level->layers[index].unk8) >> 8);
                } else {
                    sub_8058968(&camera->records[index], index, layerBase[index].unk0,
                        0x40, level->layers[index].unkC | 1, x, y);
                }
            }
        }
        index++;
    } while (index <= 3);
    settings = level->unk74;
    sub_8059C18(
        (settings << 30) >> 30, (settings << 28) >> 30, (settings << 26) >> 30, settings >> 6);
    if (level->unk78 != NULL) {
        loadPalette(level->unk78);
    }
    if (level->unk7C != NULL) {
        loadPalette2(level->unk7C);
    }
    if (level->geometry != NULL) {
        getLevelGeometryAddresses(&camera->geometry, level->geometry);
    }
    camera->unk358 = (flags << 8) | mode;
}

#endif
INCLUDE_ASM("asm/dump/8057b80-debug/805e8d8.s");

void sub_805EADC(CameraState* camera)
{
    *(vu16*)REG_DISPCNT = camera->unk358;
    camera->unk356 = 0xFF;
    camera->unk355 = 0xF;
}

void sub_805EB00(CameraState* camera)
{
    u8 i;

    *(vu16*)REG_BLDY = camera->unk355;
    if (camera->unk224 != 0) {
        if ((camera->unk354 & 1) == 0) {
            if (camera->callback == NULL) {
                sub_805EBCC(camera);
            } else {
                camera->callback(camera->unk224, camera);
            }
        } else {
            camera->unk354 &= -2;
        }
    }
    i = 0;
    do {
        if (camera->unk220->layers[i].unk0 != NULL) {
            sub_8058EF4(&camera->records[i]);
        }
        i++;
    } while (i <= 3);
    camera->unk355 += camera->unk356;
    if (camera->unk355 < 0) {
        camera->unk355 = 0;
        camera->unk356 = 0;
    }
    if (camera->unk355 > 15) {
        camera->unk355 = 15;
        camera->unk356 = 0;
    }
}

void nullsub_12(void* arg0)
{
}

#if 0
void sub_805EBCC(CameraState* camera)
{
    s32 local[3];
    CameraState* state;
    Actor* actor;
    DisplayRecord* record;
    unk16 scale;
    s16 i;
    unk8 width;

    state = nullsub_12(camera);
    actor = (Actor*)camera->unk224;
    sub_8058754(actor, local);
    width = actor->unk10;
    state->records[0].unk14
        = (local[0] - (state->records[0].unk40 + ((0xA0 - (width >> 1)) << 8))) >> 2;
    state->records[0].unk18
        = (local[1]
              - (state->records[0].unk44 + ((actor->unkA2 + (0x50 - (actor->unk11 >> 1))) << 8)))
        >> 2;
    if (state->records[0].unk40 + state->records[0].unk14 < camera->unk35C)
        state->records[0].unk14 = -state->records[0].unk40;
    if (state->records[0].unk44 + state->records[0].unk18 < 0)
        state->records[0].unk18 = -state->records[0].unk44;
    if (state->records[0].unk40 + state->records[0].unk14
        > (state->records[0].unk0 << 11) - (camera->unk360 << 8))
        state->records[0].unk14
            = (state->records[0].unk0 << 11) - (state->records[0].unk40 + (0xF0 << 8));
    if (state->records[0].unk44 + state->records[0].unk18 > (state->records[0].unk4 << 11) - 0xA000)
        state->records[0].unk18
            = (state->records[0].unk4 << 11) - (state->records[0].unk44 + (0xA0 << 8));
    i = 0;
    do {
        if (camera->unk220->layers[i].unk0 != NULL) {
            scale = camera->unk220->layers[i].unkC;
            record = &camera->records[i];
            if (record != (DisplayRecord*)state) {
                record->unk14 = state->records[0].unk14 + ((state->records[0].unk14 * scale) >> 5);
                record->unk18 = state->records[0].unk18 + ((state->records[0].unk18 * scale) >> 5);
                if (record->unk40 + record->unk14 < camera->unk35C)
                    record->unk14 = -record->unk40;
                if (record->unk44 + record->unk18 < 0)
                    record->unk18 = -record->unk44;
                if (record->unk40 + record->unk14 > (record->unk0 << 11) - (camera->unk360 << 8))
                    record->unk14 = (record->unk0 << 11) - (record->unk40 + (0xF0 << 8));
                if (record->unk44 + record->unk18 > (record->unk4 << 11) - 0xA000)
                    record->unk18 = (record->unk4 << 11) - (record->unk44 + (0xA0 << 8));
            }
        }
        i++;
    } while (i <= 3);
}
#endif
INCLUDE_ASM("asm/dump/8057b80-debug/805ebcc.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805ed60.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805ee78.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805eea4.s");

LevelGeometryAddresses* sub_805EEE0(CameraState* arg0)
{
    if (arg0->unk220->geometry == NULL) {
        return 0;
    }
    return &arg0->geometry;
}

void sub_805EEFC(CameraState* camera, const unk32** arg1, const unk32** arg2)
{
    camera->unk364 = arg1;
    camera->unk368 = arg2;
}

void sub_805EF18(
    CameraState* camera, unk32 x, unk32 y, unk32 width, s32 count, unk32 index, unk32 destination)
{
    const unk32** tableA;
    const unk32** tableB;
    const unk32* rowA;
    const unk32* rowB;

    tableA = camera->unk368;
    if (tableA == NULL) {
        return;
    }
    tableB = camera->unk364;
    if (tableB == NULL) {
        return;
    }
    rowA = tableA[index];
    rowB = tableB[index];
    if (rowA == NULL) {
        return;
    }
    if (rowB == NULL) {
        return;
    }
    while (count-- != 0) {
        (*__sub_87576D8)(rowA, x, y, width, destination, rowB);
        y++;
        destination += width * 0x20;
    }
}
