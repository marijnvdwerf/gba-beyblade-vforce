#include "camera.h"

#include <agb/memory_map.h>

#include "common.h"
#include "include_asm.h"
#include "layer.h"

INCLUDE_ASM("asm/dump/8057b80-debug/805e878.s");

void sub_805E8A0(CameraState* camera, unk32* arg1, unk16 arg2, unk32* arg3)
{
    sub_805E8D8(camera, arg1, arg2, arg3);
}

INCLUDE_ASM("asm/dump/8057b80-debug/805e8b0.s");
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
        if (camera->unk220->entries[i].display != NULL) {
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
        if (camera->unk220->entries[i].display != NULL) {
            scale = camera->unk220->entries[i].unk14;
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

unk32* sub_805EEE0(CameraState* arg0)
{
    if (arg0->unk220->unk80 == 0) {
        return 0;
    }
    return &arg0->unk228;
}

void sub_805EEFC(CameraState* camera, unk32 arg1, unk32 arg2)
{
    camera->unk364 = arg1;
    camera->unk368 = arg2;
}

INCLUDE_ASM("asm/dump/8057b80-debug/805ef18.s");
