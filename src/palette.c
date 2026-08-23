#include "palette.h"

#include "include_asm.h"
#include "memory.h"
#include "unsorted.h"

void sub_80631B0(Palette* arg0, unk8* arg1, unk32 arg2, unk32 arg3, unk32 arg4)
{
    unk32 size;

    arg2 &= ~1;
    arg3 &= ~1;
    size = arg3 * 2;
    arg0->block = slowAllocate(size * arg4);
    arg0->unk4 = arg2;
    arg0->unk6 = arg3;
    arg0->unk8 = arg4;
    arg0->source = arg1;
    arg0->unkC.half = arg0->block->address;
}

void sub_80631EC(Palette* arg0, unk8* arg1, s32 arg2)
{
    if (arg2 < arg0->unk8) {
        __fastMemoryCopyARM(
            arg0->unkC.half + arg2 * arg0->unk6, arg1 + arg0->unk4 * 2, arg0->unk6 * 2);
    }
}

INCLUDE_ASM("asm/dump/8057b80-debug/8063220.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8063454.s");

void sub_8063544(
    Palette* arg0, s32 arg1, s32 arg2, s32 arg3, s32 arg4, s32 arg5, s32 arg6, s32 arg7, s32 arg8)
{
    s32 intensity;
    s32 step;
    s32 row;
    s32 col;
    s32 red;
    s32 green;
    s32 blue;
    s32 average;
    unk16 color;
    unk16* source;
    unk16* destination;

    step = (arg1 << 0xA >> 8) / arg0->unk8;
    row = 0;
    destination = arg0->unkC.half;
    for (intensity = 0; intensity < arg0->unk8; intensity++) {
        source = (unk16*)arg0->source + arg0->unk4;
        for (col = 0; col < arg0->unk6; col++) {
            color = *source;
            red = color & 0x1F;
            green = (color & 0x3E0) >> 5;
            blue = (color & 0x7C00) >> 0xA;
            average = (red >> 2) + (green >> 1) + (blue >> 1);
            if (average > 0x1F) {
                average = 0x1F;
            }
            if (average < arg2) {
                red += ((arg3 - red) * row) >> 0xA;
                green += ((arg4 - green) * row) >> 0xA;
                blue += ((arg5 - blue) * row) >> 0xA;
            } else {
                red += ((arg6 - red) * row) >> 0xA;
                green += ((arg7 - green) * row) >> 0xA;
                blue += ((arg8 - blue) * row) >> 0xA;
            }
            if (red > 0x1F) {
                red = 0x1F;
            }
            if (green > 0x1F) {
                green = 0x1F;
            }
            if (blue > 0x1F) {
                blue = 0x1F;
            }
            *destination = red + (green << 5) + (blue << 0xA);
            destination++;
            source++;
        }
        row += step;
    }
}

void sub_8063640(Palette* arg0, s32 arg1)
{
    s16 height;
    s32 step;
    s32 numerator;
    s32 row;
    s32 intensity;
    s32 col;
    s32 red;
    s32 green;
    s32 blue;
    unk16 color;
    unk16* source;
    unk16* destination;

    numerator = arg1 << 0xA >> 8;
    height = arg0->unk8;
    step = numerator / height;
    intensity = 0;
    destination = arg0->unkC.half;
    row = 0;
    if (row < height) {
        do {
            source = (unk16*)arg0->source + arg0->unk4;
            col = 0;
            if (col < arg0->unk6) {
                do {
                    color = *source;
                    red = color & 0x1F;
                    green = (color & 0x3E0) >> 5;
                    blue = (color & 0x7C00) >> 0xA;
                    red += (((0x1F - red - red) * intensity) >> 0xA);
                    green += (((0x1F - green - green) * intensity) >> 0xA);
                    blue += (((0x1F - blue - blue) * intensity) >> 0xA);
                    *destination = red + (green << 5) + (blue << 0xA);
                    destination++;
                    source++;
                    col++;
                } while (col < arg0->unk6);
            }
            intensity += step;
            row++;
        } while (row < arg0->unk8);
    }
}

void sub_8063704(Palette* arg0, s32 arg1)
{
    s16 height;
    s32 step;
    s32 row;
    s32 numerator;
    s32 col;
    s32 red;
    s32 green;
    s32 blue;
    unk16 color;
    unk16* source;
    unk16* destination;
    s32 intensity;

    numerator = arg1 << 0xA >> 8;
    height = arg0->unk8;
    step = numerator / height;
    intensity = 0;
    row = 0;
    destination = arg0->unkC.half;
    if (intensity < height) {
        do {
            source = (unk16*)arg0->source + arg0->unk4;
            col = 0;
            if (col < arg0->unk6) {
                do {
                    color = *source;
                    red = color & 0x1F;
                    green = (color & 0x3E0) >> 5;
                    blue = (color & 0x7C00) >> 0xA;
                    red += (((row * red) >> 0xA) * red) >> 5;
                    green += (((row * green) >> 0xA) * green) >> 5;
                    blue += (((row * blue) >> 0xA) * blue) >> 5;
                    if (red > 0x1F) {
                        red = 0x1F;
                    }
                    if (green > 0x1F) {
                        green = 0x1F;
                    }
                    if (blue > 0x1F) {
                        blue = 0x1F;
                    }
                    *destination = red + (green << 5) + (blue << 0xA);
                    destination++;
                    source++;
                    col++;
                } while (col < arg0->unk6);
            }
            row += step;
            intensity++;
        } while (intensity < arg0->unk8);
    }
}

void deallocate_80637CC(Palette* arg0)
{
    if (arg0->block != NULL) {
        deallocateBlock(arg0->block);
        arg0->block = NULL;
    }
}

void sub_80637E4(Palette* arg0, u16* arg1, unk32 arg2, unk32 arg3, unk32 arg4)
{
    arg0->unk4 = arg2 & 0xFFFE;
    arg0->unk6 = (arg3 + 1) & 0xFFFE;
    arg0->source = (unk8*)arg1;
    arg0->unk8 = arg4;
    arg0->block = slowAllocate(arg0->unk6 * 2);
    arg0->unkC.half = arg0->block->address;
    __fastMemoryCopyARM(arg1 + arg0->unk4, arg0->unkC.half, arg0->unk6 * 2);
}

void sub_8063830(Palette* arg0, u16* arg1, s32 arg2, s32 arg3, s32 arg4, s32 arg5)
{
    s16 height;
    PaletteBuffer source;
    PaletteBuffer destination;
    s32 step;
    s32 factor;
    s32 width;
    s32 red;
    s32 green;
    s32 blue;
    s32 red2;
    s32 green2;
    s32 blue2;
    unk32 color;
    s32 mask;
    s32 targetSum;

    height = arg0->unk8;
    if (arg2 >= height) {
        return;
    }
    targetSum = arg3 + arg4 + arg5;
    step = 0x400 / height;
    factor = arg2 * step;
    width = arg0->unk6 >> 1;
    source.word = arg0->unkC.word;
    destination.half = arg1 + arg0->unk4;
    if (targetSum == 0) {
        if (arg2 == height - 1) {
            __fastMemoryClearARM(0, destination.word, width * 4);
            return;
        }
        width--;
        if (width == -1) {
            return;
        }
        do {
            color = *source.word++;
            red = color & 0x1F;
            green = (color >> 5) & 0x1F;
            blue = (color >> 0xA) & 0x1F;
            red2 = (color >> 0x10) & 0x1F;
            green2 = (color >> 0x15) & 0x1F;
            blue2 = (color >> 0x1A) & 0x1F;
            red -= (red * factor) >> 0xA;
            green -= (green * factor) >> 0xA;
            blue -= (blue * factor) >> 0xA;
            red2 -= (red2 * factor) >> 0xA;
            green2 -= (green2 * factor) >> 0xA;
            blue2 -= (blue2 * factor) >> 0xA;
            *destination.word++ = red | (green << 5) | (blue << 0xA) | (red2 << 0x10)
                | (green2 << 0x15) | (blue2 << 0x1A);
            width--;
        } while (width != -1);
        return;
    }
    width--;
    if (width == -1) {
        return;
    }
    mask = 0x1F;
    do {
        color = *source.word;
        red = color & mask;
        green = (color >> 5) & mask;
        blue = (color >> 0xA) & mask;
        red2 = (color >> 0x10) & mask;
        green2 = (color >> 0x15) & mask;
        blue2 = (color >> 0x1A) & mask;
        red += ((arg3 - red) * factor) >> 0xA;
        green += ((arg4 - green) * factor) >> 0xA;
        blue += ((arg5 - blue) * factor) >> 0xA;
        red2 += ((arg3 - red2) * factor) >> 0xA;
        green2 += ((arg4 - green2) * factor) >> 0xA;
        blue2 += ((arg5 - blue2) * factor) >> 0xA;
        if (red > 0x1F) {
            red = 0x1F;
        }
        if (green > 0x1F) {
            green = 0x1F;
        }
        if (blue > 0x1F) {
            blue = 0x1F;
        }
        if (red2 > 0x1F) {
            red2 = 0x1F;
        }
        if (green2 > 0x1F) {
            green2 = 0x1F;
        }
        if (blue2 > 0x1F) {
            blue2 = 0x1F;
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
        if (red2 < 0) {
            red2 = 0;
        }
        if (green2 < 0) {
            green2 = 0;
        }
        if (blue2 < 0) {
            blue2 = 0;
        }
        *destination.word++ = red | (green << 5) | (blue << 0xA) | (red2 << 0x10) | (green2 << 0x15)
            | (blue2 << 0x1A);
        source.word++;
        width--;
    } while (width != -1);
}
