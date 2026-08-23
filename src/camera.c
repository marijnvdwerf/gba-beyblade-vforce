#include "camera.h"

#include <agb/memory_map.h>

#include "common.h"
#include "include_asm.h"

typedef struct CameraState {
    unk8 pad220[0x220];
    unk32* unk220;
    unk32 unk224;
    unk32 unk228;
    unk8 pad22C[0x11C];
    unk32 unk348;
    unk8 pad34C[9];
    unk8 unk355;
    unk8 unk356;
    unk8 pad357;
    unk16 unk358;
    unk8 pad35A[0xA];
    unk32* unk364;
    unk32* unk368;
} CameraState;

INCLUDE_ASM("asm/dump/8057b80-debug/805e878.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805e8a0.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805e8b0.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805e8d8.s");

void sub_805EADC(void* arg0)
{
    CameraState* camera;

    camera = arg0;
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
INCLUDE_ASM("asm/dump/8057b80-debug/805eee0.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805eefc.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805ef18.s");
