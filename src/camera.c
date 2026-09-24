#include "camera.h"

#include <agb/memory_map.h>

#include "actor.h"
#include "common.h"
#include "geometry.h"
#include "include_asm.h"
#include "iwram.h"
#include "layer.h"
#include "system.h"

void sub_805E878(CameraState* camera, const ScreenLayout* level, unk16 mode)
{
    CameraLayerOffsets offsets;

    offsets.layers[0].x = 0;
    offsets.layers[0].y = 0;
    offsets.layers[1].x = 0;
    offsets.layers[1].y = 0;
    offsets.layers[2].x = 0;
    offsets.layers[2].y = 0;
    offsets.layers[3].x = 0;
    offsets.layers[3].y = 0;
    sub_805E8D8(camera, level, mode, &offsets);
}

void sub_805E8A0(CameraState* camera, const ScreenLayout* arg1, unk16 arg2, CameraLayerOffsets* arg3)
{
    sub_805E8D8(camera, arg1, arg2, arg3);
}

void sub_805E8B0(CameraState* camera, const ScreenLayout* level, unk16 mode, unk32 x, unk32 y)
{
    CameraLayerOffsets offsets;

    offsets.layers[0].x = x;
    offsets.layers[0].y = y;
    offsets.layers[1].x = x;
    offsets.layers[1].y = y;
    offsets.layers[2].x = x;
    offsets.layers[2].y = y;
    offsets.layers[3].x = x;
    offsets.layers[3].y = y;
    sub_805E8D8(camera, level, mode, &offsets);
}

void sub_805E8D8(CameraState* camera, const ScreenLayout* level, unk16 mode, CameraLayerOffsets* offsets)
{
    s8 flags;
    s8 index;
    BGLayer* first;
    const LevelDesignLayer* origin;
    s32 x;
    s32 y;

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
    first = &camera->records[0];
    origin = &level->layers[0];
    for (index = 0; index <= 3; index++) {
        x = offsets->layers[index].x;
        y = offsets->layers[index].y;
        if (level->layers[index].unk0 != NULL) {
            flags |= 1 << index;
            if (&camera->records[index] != first && (level->layers[index].unk4 != 0 || level->layers[index].unk8 != 0)) {
                sub_8058968(&camera->records[index], index, level->layers[index].unk0, 0x40, level->layers[index].unkC | 1, (origin->unk4 - level->layers[index].unk4) >> 8, (origin->unk8 - level->layers[index].unk8) >> 8);
            } else {
                sub_8058968(&camera->records[index], index, level->layers[index].unk0, 0x40, level->layers[index].unkC | 1, x, y);
            }
        }
    }
    sub_8059C18(level->unk74_0, level->unk74_2, level->unk74_4, level->unk74_6);
    if (level->bgPalette != NULL) {
        loadPalette(level->bgPalette);
    }
    if (level->spritePalette != NULL) {
        loadPalette2(level->spritePalette);
    }
    if (level->geometry != NULL) {
        getLevelGeometryAddresses(&camera->geometry, level->geometry);
    }
    camera->unk358 = (flags << 8) | mode;
}

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
    for (i = 0; i <= 3; i++) {
        if (camera->unk220->layers[i].unk0 != NULL) {
            sub_8058EF4(&camera->records[i]);
        }
    }
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

CameraState* nullsub_12(CameraState* camera)
{
    return camera;
}

void sub_805EBCC(CameraState* camera)
{
    s32 actorPosition[3];
    CameraState* state;
    Actor* actor;
    s16 scale;
    s16 i;
    BGLayer* record;
    s32 right;
    s32 bottom;

    state = nullsub_12(camera);
    actor = camera->unk224;
    sub_8058754(actor, actorPosition);
    state->records[0].field_14 = (actorPosition[0] - (state->records[0].field_40 + ((0xA0 - (actor->unk10 >> 1)) << 8))) >> 2;
    state->records[0].field_18 = (actorPosition[1] - (state->records[0].field_44 + ((actor->unkA2 + (0x50 - (actor->unk11 >> 1))) << 8))) >> 2;
    if (state->records[0].field_40 + state->records[0].field_14 < camera->unk35C) {
        state->records[0].field_14 = -state->records[0].field_40;
    }
    if (state->records[0].field_44 + state->records[0].field_18 < 0) {
        state->records[0].field_18 = -state->records[0].field_44;
    }
    if (state->records[0].field_40 + state->records[0].field_14 > (state->records[0].columnCount << 11) - (camera->unk360 << 8)) {
        right = state->records[0].field_40 + 0xF000;
        state->records[0].field_14 = (state->records[0].columnCount << 11) - right;
    }
    if (state->records[0].field_44 + state->records[0].field_18 > (state->records[0].rowCount << 11) - 0xA000) {
        bottom = state->records[0].field_44 + 0xA000;
        state->records[0].field_18 = (state->records[0].rowCount << 11) - bottom;
    }
    for (i = 0; i <= 3; i++) {
        if (camera->unk220->layers[i].unk0 != NULL) {
            scale = camera->unk220->layers[i].unk14;
            record = &camera->records[i];
            if (record != &state->records[0]) {
                record->field_14 = state->records[0].field_14 + (state->records[0].field_14 * scale >> 5);
                record->field_18 = state->records[0].field_18 + (state->records[0].field_18 * scale >> 5);
                if (record->field_40 + record->field_14 < camera->unk35C) {
                    record->field_14 = -record->field_40;
                }
                if (record->field_44 + record->field_18 < 0) {
                    record->field_18 = -record->field_44;
                }
                if (record->field_40 + record->field_14 > (record->columnCount << 11) - (camera->unk360 << 8)) {
                    right = record->field_40 + 0xF000;
                    record->field_14 = (record->columnCount << 11) - right;
                }
                if (record->field_44 + record->field_18 > (record->rowCount << 11) - 0xA000) {
                    bottom = record->field_44 + 0xA000;
                    record->field_18 = (record->rowCount << 11) - bottom;
                }
            }
        }
    }
}

void sub_805ED60(CameraState* camera, Actor* actor)
{
    CameraState* state;
    s32 actorPosition[3];
    s16 i;
    s16 scale;
    BGLayer* record;
    s32 right;
    s32 bottom;
    s32 actorY;

    state = nullsub_12(camera);
    sub_8058754(actor, actorPosition);
    camera->unk354 |= 1;
    state->records[0].field_14 = actorPosition[0] - (state->records[0].field_40 + ((0xA0 - (actor->unk10 >> 1)) << 8));
    actorY = actor->unkA2 + 0x50;
    state->records[0].field_18 = actorPosition[1] - (state->records[0].field_44 + ((actorY - (actor->unk11 >> 1)) << 8));
    if (state->records[0].field_40 + state->records[0].field_14 < 0) {
        state->records[0].field_14 = -state->records[0].field_40;
    }
    if (state->records[0].field_44 + state->records[0].field_18 < 0) {
        state->records[0].field_18 = -state->records[0].field_44;
    }
    if (state->records[0].field_40 + state->records[0].field_14 > (state->records[0].columnCount << 11) - 0xF000) {
        right = state->records[0].field_40 + 0xF000;
        state->records[0].field_14 = (state->records[0].columnCount << 11) - right;
    }
    if (state->records[0].field_44 + state->records[0].field_18 > (state->records[0].rowCount << 11) - 0xA000) {
        bottom = state->records[0].field_44 + 0xA000;
        state->records[0].field_18 = (state->records[0].rowCount << 11) - bottom;
    }
    for (i = 0; i < 4; i++) {
        if (camera->unk220->layers[i].unk0 != NULL) {
            scale = camera->unk220->layers[i].unk14;
            record = &camera->records[i];
            if (record != &state->records[0]) {
                record->field_14 = state->records[0].field_14 + (state->records[0].field_14 * scale >> 5);
                record->field_18 = state->records[0].field_18 + (state->records[0].field_18 * scale >> 5);
            }
        }
    }
}

void sub_805EE78(CameraState* camera, Actor* actor)
{
    camera->unk224 = actor;
    if (camera->unk348 == NULL) {
        sub_805ED60(camera, actor);
    } else {
        camera->unk348(actor, camera);
    }
}

s16 sub_805EEA4(const ScreenLayout* layouts, unk16 value, s16 count)
{
    s16 i;

    for (i = 0; i < count; i++) {
        if (value == layouts->unk0) {
            return i;
        }
        layouts++;
    }
    return -1;
}

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

void sub_805EF18(CameraState* camera, unk32 x, unk32 y, unk32 width, s32 count, unk32 index, RiderTile* destination)
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
        destination += width;
    }
}
