#include "camera.h"

#include <agb/memory_map.h>

#include "common.h"
#include "include_asm.h"
#include "layer.h"

INCLUDE_ASM("asm/dump/8057b80-debug/805e878.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805e8a0.s");
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
    vu16* bldy;
    s8 displayControl;
    u8 i;

    bldy = (vu16*)REG_BLDY;
    displayControl = camera->unk355;
    *bldy = displayControl;
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
    if ((s8)camera->unk355 < 0) {
        camera->unk355 = 0;
        camera->unk356 = 0;
    }
    if ((s8)camera->unk355 > 15) {
        camera->unk355 = 15;
        camera->unk356 = 0;
    }
}

void nullsub_12(void* arg0)
{
}

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

INCLUDE_ASM("asm/dump/8057b80-debug/805eefc.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805ef18.s");
