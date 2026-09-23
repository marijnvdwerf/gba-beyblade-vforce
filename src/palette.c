#include "palette.h"

#include "include_asm.h"
#include "memory.h"
#include "unsorted.h"

void sub_80631B0(Palette* arg0, unk16* arg1, unk32 arg2, unk32 arg3, unk32 arg4)
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

void sub_80631EC(Palette* arg0, unk16* arg1, s32 arg2)
{
    if (arg2 < arg0->unk8) {
        __fastMemoryCopyARM(arg0->unkC.half + arg2 * arg0->unk6, arg1 + arg0->unk4, arg0->unk6 * 2);
    }
}

void sub_8063220(Palette* palette, unk32 red, unk32 green, unk32 blue)
{
    s32 redTarget;
    s32 greenTarget;
    s32 blueTarget;
    s32 step;
    s32 intensity;
    unk32 width;
    s32 height;
    unk32 col;
    unk32* source;
    unk32* destination;
    s32 nextIntensity;
    s32 nextHeight;
    unk32 color;
    s32 redValue;
    s32 greenValue;
    s32 blueValue;
    s32 red2;
    s32 green2;
    s32 blue2;
    unk32* source4;

    redTarget = red;
    greenTarget = green;
    blueTarget = blue;
    height = palette->unk8;
    step = 0x400 / height;
    intensity = 0;
    width = palette->unk6 >> 1;
    source = (unk32*)(palette->source + palette->unk4);
    destination = palette->unkC.word;
    if (redTarget + greenTarget + blueTarget == 0) {
        height -= 2;
        while (height != -1) {
            source4 = source;
            col = 0;
            nextHeight = --height;
            nextIntensity = step + intensity;
            while (col < width) {
                color = *source4++;
                redValue = color & 0x1F;
                greenValue = (color >> 5) & 0x1F;
                blueValue = (color >> 0xA) & 0x1F;
                red2 = (color >> 0x10) & 0x1F;
                green2 = (color >> 0x15) & 0x1F;
                blue2 = (color >> 0x1A) & 0x1F;
                redValue -= (intensity * redValue) >> 0xA;
                greenValue -= (intensity * greenValue) >> 0xA;
                blueValue -= (intensity * blueValue) >> 0xA;
                red2 -= (intensity * red2) >> 0xA;
                green2 -= (intensity * green2) >> 0xA;
                blue2 -= (intensity * blue2) >> 0xA;
                *destination++ = redValue | (greenValue << 5) | (blueValue << 0xA) | (red2 << 0x10)
                    | (green2 << 0x15) | (blue2 << 0x1A);
                col++;
            }
            intensity = nextIntensity;
            height = nextHeight;
        }
        __fastMemoryClearARM(0, destination, width * 4);
        return;
    }
    height--;
    while (height != -1) {
        source4 = source;
        col = 0;
        nextHeight = --height;
        nextIntensity = step + intensity;
        while (col < width) {
            color = *source4;
            redValue = color & 0x1F;
            greenValue = (color >> 5) & 0x1F;
            blueValue = (color >> 0xA) & 0x1F;
            red2 = (color >> 0x10) & 0x1F;
            green2 = (color >> 0x15) & 0x1F;
            blue2 = (color >> 0x1A) & 0x1F;
            redValue += (intensity * (redTarget - redValue)) >> 0xA;
            greenValue += (intensity * (greenTarget - greenValue)) >> 0xA;
            blueValue += (intensity * (blueTarget - blueValue)) >> 0xA;
            red2 += (intensity * (redTarget - red2)) >> 0xA;
            green2 += (intensity * (greenTarget - green2)) >> 0xA;
            blue2 += (intensity * (blueTarget - blue2)) >> 0xA;
            if (redValue > 0x1F) {
                redValue = 0x1F;
            }
            if (greenValue > 0x1F) {
                greenValue = 0x1F;
            }
            if (blueValue > 0x1F) {
                blueValue = 0x1F;
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
            if (redValue < 0) {
                redValue = 0;
            }
            if (greenValue < 0) {
                greenValue = 0;
            }
            if (blueValue < 0) {
                blueValue = 0;
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
            *destination++ = redValue | (greenValue << 5) | (blueValue << 0xA) | (red2 << 0x10)
                | (green2 << 0x15) | (blue2 << 0x1A);
            source4++;
            col++;
        }
        intensity = nextIntensity;
        height = nextHeight;
    }
}

void sub_8063454(Palette* palette, unk16* targetPalette)
{
    s32 row;
    s32 intensity;
    s32 step;
    s32 col;
    unk16* source;
    unk16* target;
    unk16* destination;
    s32 nextRow;
    s32 nextIntensity;
    s32 red;
    s32 green;
    s32 blue;
    s32 red2;
    s32 green2;
    s32 blue2;
    unk16 color;
    unk16 targetColor;

    step = 0x400 / palette->unk8;
    intensity = 0;
    row = 0;
    destination = palette->unkC.half;
    while (row < palette->unk8) {
        source = palette->source;
        target = targetPalette + palette->unk4;
        col = 0;
        nextIntensity = step + intensity;
        nextRow = row + 1;
        while (col < palette->unk6) {
            color = *source;
            targetColor = *target;
            red = color & 0x1F;
            green = (color & 0x3E0) >> 5;
            blue = (color & 0x7C00) >> 0xA;
            red2 = targetColor & 0x1F;
            green2 = (targetColor & 0x3E0) >> 5;
            blue2 = (targetColor & 0x7C00) >> 0xA;
            red = ((red2 - red) * intensity) >> 0xA;
            green = ((green2 - green) * intensity) >> 0xA;
            blue = ((blue2 - blue) * intensity) >> 0xA;
            if (red > 0x1F) {
                red = 0x1F;
            }
            if (green > 0x1F) {
                green = 0x1F;
            }
            if (blue > 0x1F) {
                blue = 0x1F;
            }
            *destination++ = red + (green << 5) + (blue << 0xA);
            source++;
            col++;
        }
        intensity = nextIntensity;
        row = nextRow;
    }
}

void sub_8063544(
    Palette* arg0, s32 arg1, s32 arg2, s32 arg3, s32 arg4, s32 arg5, s32 arg6, s32 arg7, s32 arg8)
{
    s32 row;
    s32 step;
    s32 intensity;
    s32 col;
    s32 red;
    s32 green;
    s32 blue;
    s32 average;
    u16 color;
    u16* source;
    unk16* destination;

    step = (arg1 << 0xA >> 8) / arg0->unk8;
    intensity = 0;
    destination = arg0->unkC.half;
    for (row = 0; row < arg0->unk8; row++) {
        source = arg0->source + arg0->unk4;
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
                red += ((arg3 - red) * intensity) >> 0xA;
                green += ((arg4 - green) * intensity) >> 0xA;
                blue += ((arg5 - blue) * intensity) >> 0xA;
            } else {
                red += ((arg6 - red) * intensity) >> 0xA;
                green += ((arg7 - green) * intensity) >> 0xA;
                blue += ((arg8 - blue) * intensity) >> 0xA;
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
        intensity += step;
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
    u16 color;
    u16* source;
    unk16* destination;

    numerator = arg1 << 0xA >> 8;
    height = arg0->unk8;
    step = numerator / height;
    intensity = 0;
    destination = arg0->unkC.half;
    row = 0;
    if (row < height) {
        do {
            source = arg0->source + arg0->unk4;
            for (col = 0; col < arg0->unk6; col++) {
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
    s32 intensity;
    s32 numerator;
    s32 col;
    s32 red;
    s32 green;
    s32 blue;
    u16 color;
    u16* source;
    unk16* destination;
    s32 row;

    numerator = arg1 << 0xA >> 8;
    height = arg0->unk8;
    step = numerator / height;
    row = 0;
    intensity = 0;
    destination = arg0->unkC.half;
    if (row < height) {
        do {
            source = arg0->source + arg0->unk4;
            for (col = 0; col < arg0->unk6; col++) {
                color = *source;
                red = color & 0x1F;
                green = (color & 0x3E0) >> 5;
                blue = (color & 0x7C00) >> 0xA;
                red += (((intensity * red) >> 0xA) * red) >> 5;
                green += (((intensity * green) >> 0xA) * green) >> 5;
                blue += (((intensity * blue) >> 0xA) * blue) >> 5;
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
            intensity += step;
            row++;
        } while (row < arg0->unk8);
    }
}

void deallocate_80637CC(Palette* arg0)
{
    if (arg0->block != NULL) {
        deallocateBlock(arg0->block);
        arg0->block = NULL;
    }
}

void sub_80637E4(Palette* arg0, u16* arg1, u32 arg2, u32 arg3, u32 arg4)
{
    arg0->unk4 = arg2 & 0xFFFE;
    arg0->unk6 = (arg3 + 1) & 0xFFFE;
    arg0->source = arg1;
    arg0->unk8 = arg4;
    arg0->block = slowAllocate(arg0->unk6 * 2);
    arg0->unkC.half = arg0->block->address;
    __fastMemoryCopyARM(arg1 + arg0->unk4, arg0->unkC.half, arg0->unk6 * 2);
}

void sub_8063830(Palette* arg0, unk16* arg1, s32 arg2, s32 arg3, s32 arg4, s32 arg5)
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
    u32 color;
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
