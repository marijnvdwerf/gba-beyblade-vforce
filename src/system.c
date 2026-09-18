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

void EnableInterrupt(unk16 value)
{
    *(vu16*)REG_IE |= value;
}

void DisableInterrupt(unk16 value)
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

void sub_8057A7C(unk16* src, unk8 paletteIndex, s16 offset)
{
    unk16* dst;
    unk16 i;
    unk16 color;
    s16 red;
    s16 green;
    s16 blue;

    dst = (unk16*)(BG_PLTT + (paletteIndex << 9));
    for (i = 0; i < 8; i++) {
        color = *src;
        red = color & 0x1F;
        green = (color & 0x3E0) >> 5;
        blue = (color & 0x7C00) >> 10;
        red += offset;
        green += offset;
        blue += offset;
        if (red > 0x1F) {
            red = 0x1F;
        }
        if (green > 0x1F) {
            green = 0x1F;
        }
        if (blue > 0x1F) {
            blue = 0x1F;
        }
        if (red < 0) {
            red = 0;
        }
        if (green < 0) {
            green = 0;
        }
        if (blue < 0) {
            blue = 0;
        }
        *dst = red + (green << 5) + (blue << 10);
        src++;
        dst++;
    }
}

void sub_8057B30(unk32* ptr, unk32 value0, unk32 value1)
{
    ptr[0] = value0;
    ptr[1] = value1;
}

void nullsub_31(void)
{
}

void nullsub_8(const unk8* arg0)
{
}

void nullsub_9(const unk8* arg0, s32 arg1)
{
}

void nullsub_10(const unk8* arg0, s32 arg1, const unk8* arg2, s32 arg3)
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

ASM_ZEROPAD
