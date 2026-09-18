#include "text.h"

#include <agb/memory_map.h>

#include "bios.h"
#include "include_asm.h"
#include "unsorted.h"

extern const unk8 byte_807D980[];

void sub_805B244(
    TilemapTextRenderer* arg0, BGLayer* arg1, const SpriteSheet* arg2, const unk8* arg3, unk32 arg4)
{
    arg0->font = arg2;
    arg0->layer = arg1;
    arg0->unkC = arg4;
    arg0->unk4 = arg3;
    arg0->unkE = 1;
    arg0->lineHeight = arg2->unk5;
}

void sub_805B260(TilemapTextRenderer* arg0, const SpriteSheet* arg1, const unk8* arg2, unk32 arg3)
{
    arg0->font = arg1;
    arg0->unkC = arg3;
    arg0->unk4 = arg2;
}

void sub_805B268(TilemapTextRenderer* arg0, unk32 arg1)
{
    arg0->lineHeight = arg1;
}

void sub_805B26C(TilemapTextRenderer* arg0, unk32 arg1)
{
    arg0->unkC = arg1;
}

RiderTile* sub_805B270(RiderTile* arg0, unk32 arg1)
{
    return &arg0[arg1 & 0x3FF];
}

INCLUDE_ASM("asm/dump/8057b80-debug/805b280.s");

void sub_805B394(TilemapTextRenderer* arg0)
{
    if (arg0->layer != NULL) {
        __fastMemoryClearARM(
            0, (void*)(VRAM + (arg0->layer->characterBaseBlock << 14)), arg0->layer->tileBytes);
        __fastMemoryClearARM(0, (void*)(VRAM + (arg0->layer->screenBaseBlock << 11)), 0x800);
        arg0->unkE = 1;
    }
}

unk32 sub_805B3DC(const unk8* string, const unk8* arg1, unk32 arg2)
{
    unk32 total;
    unk32 width;
    unk8 character;

    total = 0;
    while ((character = *string++) != 0) {
        width = 5;
        if (character != ' ') {
            character = byte_807D980[character];
            width = arg2;
            if (arg1 != NULL) {
                width -= arg1[character];
            }
        }
        total += width;
    }
    return total;
}

INCLUDE_ASM("asm/dump/8057b80-debug/805b41c.s");

void sub_805B668(TilemapTextRenderer* arg0, unk32 arg1, unk32 arg2, unk32 arg3, unk8 arg4)
{
    unk32 digit;
    s32 group;
    s32 digits;
    unk8* ptr;

    ptr = &_unk3000D30[80];
    group = 3;
    *--ptr = 0;
    if (arg3 == 0) {
        *--ptr = '0';
    }
    digits = 14;
    if (arg3 != 0) {
        do {
            digit = DivRem(arg3, 10);
            arg3 = Div(arg3, 10);
            if (group-- == 0) {
                *--ptr = ',';
                group = 2;
            }
            *--ptr = digit + '0';
            if (digits-- == 0) {
                break;
            }
        } while (arg3 != 0);
    }
    sub_805B41C(arg0, arg1, arg2, ptr, arg4);
}

void sub_805B700(TilemapTextRenderer* arg0, unk32 arg1, unk32 arg2, unk32 arg3, unk8 arg4)
{
    unk8* ptr;
    unk32 digit;
    unk32 seconds;
    unk32 minutes;
    s32 digits;
    unk32 count;

    ptr = &_unk3000D80[16];
    digits = 0xF;
    count = 0;
    *--ptr = 0;
    seconds = arg3 % 60;
    if (seconds == 0) {
        *--ptr = '0';
        count = 1;
    }
    while (digits != 0 && seconds != 0) {
        digit = DivRem(seconds, 10);
        seconds = Div(seconds, 10);
        ptr--;
        digit += '0';
        *ptr = digit;
        count++;
        digits--;
    }
    if (digits != 0) {
        if (count == 1) {
            *--ptr = '0';
            digits--;
        }
        if (digits != 0) {
            *--ptr = ':';
            digits--;
        }
    }
    minutes = arg3 / 60;
    if (minutes == 0) {
        *--ptr = '0';
    }
    while (digits-- != 0 && minutes != 0) {
        digit = DivRem(minutes, 10);
        minutes = Div(minutes, 10);
        ptr--;
        digit += '0';
        *ptr = digit;
    }
    sub_805B41C(arg0, arg1, arg2, ptr, arg4);
}

unk8* sub_805B7F0(SpriteSheet* arg0, unk32 arg1)
{
    return (unk8*)arg0 + (arg1 << arg0->unk6) + arg0->unk10;
}

void sub_805B800(TilemapTextRenderer* arg0, s16 arg1, s16 arg2, const unk8* arg3, unk32 arg4)
{
    unk8 buffer[64];
    unk8* ptr;
    unk8 zero; // TODO: fakematch?
    unk32 done; // TODO: fakematch?
    unk32 x;
    unk32 y;
    unk8 flags;
    unk8 ch;

    flags = arg4;
    done = 0;
    x = arg1;
    y = arg2;
    if (arg3 != NULL && *arg3 != 0) {
        zero = 0;
        ptr = buffer;
        do {
            ch = *arg3++;
            switch (ch) {
            case 0:
            case 0xFF:
                *ptr = zero;
                sub_805B41C(arg0, x, y, buffer, flags);
                return;
            case '\n':
                *ptr = zero;
                sub_805B41C(arg0, x, y, buffer, flags);
                ptr = buffer;
                x = arg1;
                y += arg0->lineHeight;
                break;
            case 0xFC:
                *ptr = zero;
                x = sub_805B41C(arg0, x, y, buffer, flags);
                arg0->unkC = *arg3++;
                ptr = buffer;
                break;
            case 0xFB:
                arg0->lineHeight = *arg3++;
                break;
            default:
                *ptr++ = ch;
                break;
            }
        } while (done == 0);
    }
}

ASM_ZEROPAD
