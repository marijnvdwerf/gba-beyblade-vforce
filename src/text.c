#include "text.h"

#include <agb/define.h>
#include <agb/memory_map.h>

#include "bios.h"
#include "include_asm.h"
#include "layer.h"
#include "system.h"
#include "unsorted.h"

enum { TEXT_MAP_WIDTH_TILES = 32 };

extern const unk8 byte_807D980[];

void sub_805B280(unk16* map, Tile4bpp* tiles, const unk32* data, s32 x, unk32 y);
const Tile4bpp* sub_805B7F0(const SpriteSheet*, unk32);

void sub_805B244(
    TilemapTextRenderer* arg0, BGLayer* arg1, const SpriteSheet* arg2, const unk8* arg3, unk32 arg4)
{
    arg0->font = arg2;
    arg0->layer = arg1;
    arg0->palette = arg4;
    arg0->widthAdjustments = arg3;
    arg0->nextTileIndex = 1;
    arg0->lineHeight = arg2->unk5;
}

void sub_805B260(TilemapTextRenderer* arg0, const SpriteSheet* arg1, const unk8* arg2, unk32 arg3)
{
    arg0->font = arg1;
    arg0->palette = arg3;
    arg0->widthAdjustments = arg2;
}

void sub_805B268(TilemapTextRenderer* arg0, unk32 arg1)
{
    arg0->lineHeight = arg1;
}

void sub_805B26C(TilemapTextRenderer* arg0, unk32 arg1)
{
    arg0->palette = arg1;
}

Tile4bpp* sub_805B270(Tile4bpp* arg0, unk32 arg1)
{
    return &arg0[arg1 & 0x3FF];
}

void sub_805B280(unk16* map, Tile4bpp* tiles, const unk32* data, s32 x, unk32 y)
{
    unk32* topLeft;
    unk32* topRight;
    unk32* bottomLeft;
    unk32* bottomRight;
    s32 xTile;
    unk32 invShift;
    unk32 topCount;
    unk32 bottomCount;
    unk32 pixels;
    unk32 left;

    xTile = x >> 3;
    if (y > 0x98 || (unk32)(x + 7) > 0xF6) {
        return;
    }
    topLeft = *sub_805B270(tiles, map[0]);
    topRight = *sub_805B270(tiles, map[1]);
    bottomLeft = *sub_805B270(tiles, map[0x20]);
    bottomRight = *sub_805B270(tiles, map[0x21]);
    x &= 7;
    y &= 7;
    topLeft += y;
    topRight += y;
    x <<= 2;
    invShift = 0x20 - x;
    topCount = 8 - y;
    bottomCount = y;
    while (topCount--) {
        pixels = *data++;
        left = pixels << x;
        pixels >>= invShift;
        if (xTile >= 0) {
            *topLeft |= left;
        }
        if (xTile <= 0x1C) {
            *topRight |= pixels;
        }
        topLeft++;
        topRight++;
    }
    while (bottomCount--) {
        pixels = *data++;
        left = pixels << x;
        pixels >>= invShift;
        if (xTile >= 0) {
            *bottomLeft |= left;
        }
        if (xTile <= 0x1C) {
            *bottomRight |= pixels;
        }
        bottomLeft++;
        bottomRight++;
    }
}

void sub_805B394(TilemapTextRenderer* arg0)
{
    if (arg0->layer != NULL) {
        __fastMemoryClearARM(
            0, (void*)(VRAM + (arg0->layer->characterBaseBlock << 14)), arg0->layer->tileBytes);
        __fastMemoryClearARM(0, (void*)(VRAM + (arg0->layer->screenBaseBlock << 11)), 0x800);
        arg0->nextTileIndex = 1;
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

unk32 sub_805B41C(TilemapTextRenderer* renderer, s32 x, s32 y, unk8* string, unk8 flags)
{
    BGLayer* layer;
    const SpriteSheet* font;
    unk16* map;
    void* tiles;
    unk32 tileWidth;
    unk32 tileHeight;
    unk32 fontWidth;
    s32 width;
    s32 rows;
    s32 columns;
    s32 column;
    s32 drawColumn;
    unk16 firstTile;
    unk32 allocated;
    unk8 character;
    unk32 advance;
    s32 drawY;
    s32 drawX;
    s32 row;
    const Tile4bpp* data;

    layer = renderer->layer;
    font = renderer->font;
    map = (unk16*)(VRAM + (layer->screenBaseBlock << 11));
    tiles = (void*)(VRAM + (layer->characterBaseBlock << 14));
    tileWidth = font->unk4 >> 3;
    tileHeight = font->unk5 >> 3;
    fontWidth = font->unk4;
    if ((*GetBGLayerCntPtr(layer->layerIndex) & BG_COLOR_256) != 0 || !(font->unkC & 1)) {
        nullsub_8("textLayer error: font or background 256 colours.");
        return x;
    }
    width = sub_805B3DC(string, renderer->widthAdjustments, fontWidth);
    switch (flags & 3) {
    case 1:
        x -= width;
        break;
    case 2:
        x -= width >> 1;
        break;
    }
    map += (y & ~7) * 4 + (x >> 3);
    rows = tileHeight;
    if (y & 7) {
        rows++;
    }
    columns = (width + (x & 7) + 8) >> 3;
    firstTile = renderer->nextTileIndex;
    while (rows-- != 0) {
        column = columns;
        while (column-- != 0) {
            if (*map == 0) {
                *map = renderer->nextTileIndex;
                renderer->nextTileIndex++;
            }
            *map = (*map & 0xFFF) | (renderer->palette << 12);
            map++;
        }
        map += TEXT_MAP_WIDTH_TILES - columns;
    }
    allocated = renderer->nextTileIndex - firstTile;
    if (allocated != 0) {
        __fastMemoryClearARM(0,
            (Tile4bpp*)(VRAM + (renderer->layer->characterBaseBlock << 14)) + firstTile,
            allocated * sizeof(Tile4bpp));
    }
    map = (unk16*)(VRAM + (layer->screenBaseBlock << 11));
    while ((character = *string++) != 0) {
        advance = 5;
        if (character > ' ') {
            drawY = y;
            row = tileHeight;
            character = byte_807D980[character];
            data = sub_805B7F0(renderer->font, character);
            advance = fontWidth;
            if (renderer->widthAdjustments != NULL) {
                advance -= renderer->widthAdjustments[character];
            }
            while (row-- != 0) {
                drawX = x;
                drawColumn = tileWidth;
                while (drawColumn-- != 0) {
                    sub_805B280(map + (drawY & ~7) * 4 + (drawX >> 3), tiles, *data, drawX, drawY);
                    drawX += 8;
                    data++;
                }
                drawY += 8;
            }
        }
        x += advance;
        if (x >= LCD_WIDTH) {
            break;
        }
    }
    return x;
}

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

const Tile4bpp* sub_805B7F0(const SpriteSheet* arg0, unk32 arg1)
{
    return (const Tile4bpp*)((const unk8*)arg0 + (arg1 << arg0->unk6) + arg0->unk10);
}

void sub_805B800(TilemapTextRenderer* arg0, s16 arg1, s16 arg2, const unk8* arg3, unk32 arg4)
{
    unk8 buffer[64];
    unk8* ptr;
    unk8 zero; // TODO: fakematch?
    unk32 done;
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
                done = 1;
                break;
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
                arg0->palette = *arg3++;
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
