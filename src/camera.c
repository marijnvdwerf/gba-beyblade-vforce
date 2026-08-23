#include "camera.h"

#include <agb/memory_map.h>

#include "common.h"
#include "include_asm.h"

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

INCLUDE_ASM("asm/dump/8057b80-debug/805eb00.s");

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
