#include <agb/define.h>
#include <agb/macro.h>
#include <agb/memory_map.h>

#include "common.h"
#include "include_asm.h"
#include "unsorted.h"

typedef struct Unk3000EE0 {
    volatile unk32 unk0;
    volatile unk32 unk4;
} Unk3000EE0;

extern Unk3000EE0 _unk3000EE0;

void EnableInterrupt(u16 value)
{
    *(vu16*)REG_IE |= value;
}

void DisableInterrupt(u16 value)
{
    *(vu16*)REG_IE &= ~value;
}

void sub_8057A1C(unk32 value)
{
    DmaSet(3, value, OBJ_PLTT, DMA_ENABLE | DMA_32BIT_BUS | 0x80);
    DmaSet(3, value, BG_PLTT, DMA_ENABLE | DMA_32BIT_BUS | 0x80);
}

void loadPalette(void* src)
{
    __fastMemoryCopyARM(src, (void*)BG_PLTT, 0x200);
}

void loadPalette2(void* src)
{
    __fastMemoryCopyARM(src, (void*)OBJ_PLTT, 0x200);
}

INCLUDE_ASM("asm/dump/80578e0/8057a7c.s");

void sub_8057B30(unk32* ptr, unk32 value0, unk32 value1)
{
    ptr[0] = value0;
    ptr[1] = value1;
}

void nullsub_31(void)
{
}

void nullsub_8(void)
{
}

void nullsub_9(void)
{
}

void nullsub_10(void)
{
}

void nullsub_25(void)
{
}

void nullsub_26(void)
{
}

void nullsub_27(void)
{
}

void sub_8057B54(void)
{
    _unk3000EE0.unk4 = 0;
    _unk3000EE0.unk0 = 0;
}

void sub_8057B64(void)
{
    _unk3000EE0.unk0 += 1;
}

void nullsub_28(void)
{
}

void nullsub_29(void)
{
}

void nullsub_30(void)
{
}

asm(".align 2, 0");
