#include <agb/memory_map.h>

#include "iwram.h"

typedef struct TileMapRow {
    unk8 pad0[2];
    s16 data[0];
} TileMapRow;

void sub_8756FC0(BGLayer* layer, s32 x, s32 y, unk32 srcX, s32 srcY, s32 width, s32 height)
{
    const unk8* source;
    unk16* destination;
    s32 columns;
    unk32 columnMask;
    unk32 rowMask;
    unk32 screenWidth;
    unk32 compressed;
    const unk32* rowTable;
    unk32 fill;
    s32 mapRow;
    unk32 flags;
    s32 rows;
    const s16* rowData;
    unk32 destinationRow;
    s32 row;

    source = layer->mapAddr;
    source += (x + y * layer->columnCount) * 2;
    destination = (unk16*)(VRAM + (layer->screenBaseBlock << 11));
    columns = layer->columnCount;
    columnMask = (1 << layer->field_5F) - 1;
    flags = (layer->field_7C & 4) ? 2 : 0;
    rowMask = (1 << layer->field_60) - 1;
    screenWidth = 1 << layer->field_5F;
    compressed = layer->var64 & 2;
    rows = layer->rowCount;
    rowTable = (const unk32*)((const unk8*)layer->var68 + layer->var68->mapOffset);
    fill = layer->var68->unk1A;
    srcX &= columnMask;

    for (row = srcY; row < srcY + height; row++) {
        mapRow = row;
        if (flags & 2) {
            while (mapRow >= rows) {
                mapRow -= rows;
            }
            if (row < 0) {
                while (mapRow < 0) {
                    mapRow += rows;
                }
            }
            flags |= 1;
        } else {
            if (row >= 0 && row < rows) {
                flags |= 1;
            } else {
                flags &= ~1;
            }
        }
        rowData = ((const TileMapRow*)((const unk8*)rowTable + rowTable[mapRow]))->data;
        destinationRow = (row & rowMask) << layer->field_5F;
        if (srcX + width > screenWidth) {
            if (compressed) {
                if (flags & 1) {
                    __sub_8757494(rowData, x, mapRow, screenWidth - srcX,
                        destination + destinationRow + srcX, fill);
                    __sub_8757494(rowData, x + (screenWidth - srcX), mapRow,
                        width - (screenWidth - srcX), destination + destinationRow, fill);
                } else {
                    fastMemoryClear16ARM(
                        fill, destination + destinationRow + srcX, (screenWidth - srcX) * 2);
                    fastMemoryClear16ARM(
                        fill, destination + destinationRow, (width - (screenWidth - srcX)) * 2);
                }
            } else {
                fastMemoryCopy16ARM(
                    source, destination + destinationRow + srcX, (screenWidth - srcX) * 2);
                fastMemoryCopy16ARM(source + (screenWidth - srcX), destination + destinationRow,
                    (width - (screenWidth - srcX)) * 2);
            }
        } else {
            if (compressed) {
                if (flags & 1) {
                    __sub_8757494(
                        rowData, x, mapRow, width, destination + destinationRow + srcX, fill);
                } else {
                    fastMemoryClear16ARM(fill, destination + destinationRow + srcX, width * 2);
                }
            } else {
                fastMemoryCopy16ARM(source, destination + destinationRow + srcX, width * 2);
            }
        }
        source += columns * 2;
    }
}

void sub_8757380(BGLayer* layer, unk32 x, s32 y, unk32 width, s32 height)
{
    unk8* screenAddress;
    unk32 rowMask;
    unk32 screenWidth;
    unk32 columnMask;
    unk32 srcX;
    unk32 fill;
    unk32 rowOffset;
    s32 row;

    screenAddress = (unk8*)(VRAM + (layer->screenBaseBlock << 11));
    fill = layer->var68->unk1A;
    columnMask = (1 << layer->field_5F) - 1;
    rowMask = (1 << layer->field_60) - 1;
    screenWidth = 1 << layer->field_5F;
    srcX = x & columnMask;
    for (row = y; row < y + height; row++) {
        rowOffset = (row & rowMask) << layer->field_5F;
        if (srcX + width > screenWidth) {
            fastMemoryClear16ARM(
                fill, screenAddress + rowOffset * 2 + srcX * 2, (screenWidth - srcX) * 2);
            fastMemoryClear16ARM(
                fill, screenAddress + rowOffset * 2, (width - (screenWidth - srcX)) * 2);
        } else {
            fastMemoryClear16ARM(fill, screenAddress + rowOffset * 2 + srcX * 2, width * 2);
        }
    }
}

void sub_8757494(const s16* source, s32 x, unk32 unused, s32 width, unk16* destination, unk16 fill)
{
    s32 run;
    s32 runLength;
    s32 position;
    s32 copyCount;

    position = 0;
    do {
        run = *source++;
        runLength = run < 0 ? -run : run;
        if (position + runLength > x) {
            break;
        }
        if (run >= 0) {
            source += runLength;
        }
        position += runLength;
    } while (1);
    if (run >= 0) {
        source += x - position;
    }
    runLength -= x - position;
    while (width > 0) {
        if (runLength < width) {
            copyCount = runLength;
        } else {
            copyCount = width;
        }
        if (run >= 0) {
            fastMemoryCopy16ARM(source, destination, copyCount * 2);
        } else {
            fastMemoryClear16ARM(fill, destination, copyCount * 2);
        }
        width -= copyCount;
        destination += copyCount;
        if (run >= 0) {
            source += runLength;
        }
        run = *source++;
        runLength = run < 0 ? -run : run;
    }
}

void sub_8757574(const unk32* tiles, const unk16* source, Tile4bpp* destination, s32 count)
{
    const unk32* tile;
    unk32* output;
    unk32 value;
    unk32 pixel;
    unk32 descriptor;
    unk32 row;

    while (count--) {
        descriptor = *source++;
        tile = &tiles[(descriptor & 0x3FF) * 2];
        value = *tile++;
        if ((descriptor & 0x800) != 0) {
            output = &(*destination)[7];
        } else {
            output = &(*destination)[0];
        }
        row = 7;
        do {
            if ((descriptor & 0x400) != 0) {
                pixel = (value & 1) != 0 ? 0x10000000 : 0;
                if ((value & 2) != 0) {
                    pixel |= 0x01000000;
                }
                if ((value & 4) != 0) {
                    pixel |= 0x00100000;
                }
                if ((value & 8) != 0) {
                    pixel |= 0x00010000;
                }
                if ((value & 0x10) != 0) {
                    pixel |= 0x00001000;
                }
                if ((value & 0x20) != 0) {
                    pixel |= 0x00000100;
                }
                if ((value & 0x40) != 0) {
                    pixel |= 0x00000010;
                }
                if ((value & 0x80) != 0) {
                    pixel |= 1;
                }
            } else {
                pixel = value & 1;
                if ((value & 2) != 0) {
                    pixel |= 0x10;
                }
                if ((value & 4) != 0) {
                    pixel |= 0x100;
                }
                if ((value & 8) != 0) {
                    pixel |= 0x1000;
                }
                if ((value & 0x10) != 0) {
                    pixel |= 0x10000;
                }
                if ((value & 0x20) != 0) {
                    pixel |= 0x100000;
                }
                if ((value & 0x40) != 0) {
                    pixel |= 0x1000000;
                }
                if ((value & 0x80) != 0) {
                    pixel |= 0x10000000;
                }
            }
            if ((descriptor & 0x800) != 0) {
                *output-- = pixel;
            } else {
                *output++ = pixel;
            }
            if (row == 4) {
                value = *tile++;
            } else {
                value >>= 8;
            }
        } while (row--);
        destination++;
    }
}

// TODO: fakematch?
void sub_87576D8(const unk32* rowTable, unk32 xArg, unk32 row, unk32 countArg,
    Tile4bpp* destination, const unk32* tiles)
{
    const s16* source;
    s32 position;
    s32 x;
    s32 count;
    s32 value;
    s32 runLength;
    s32 size;

    source = (const s16*)rowTable;
    x = xArg;
    count = countArg;
    source = ((const TileMapRow*)((const unk8*)source + rowTable[row]))->data;
    position = 0;
    do {
        value = *source++;
        runLength = value < 0 ? -value : value;
        if (position + runLength > x) {
            break;
        }
        if (value >= 0) {
            source += runLength;
        }
        position += runLength;
    } while (1);
    if (value >= 0) {
        source += x - position;
    }
    runLength -= x - position;
    while (count > 0) {
        if (runLength < count) {
            size = runLength;
        } else {
            size = count;
        }
        if (value >= 0) {
            sub_8757574(tiles, (const unk16*)source, destination, size);
        } else {
            fastMemoryClear16ARM(0, destination, size * sizeof(Tile4bpp));
        }
        count -= size;
        destination += size;
        if (value >= 0) {
            source += runLength;
        }
        value = *source++;
        runLength = value < 0 ? -value : value;
    }
}
