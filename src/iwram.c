#include "iwram.h"

#include <agb/memory_map.h>

#include "include_asm.h"
#include "ram.h"

unk32 ARM_sub_87569F4(UnkStruct_87569F4* arg0, unk32 arg1)
{
    unk32 result = arg0->unk24;
    unk32 current = _unk3005E74;
    if (current - result > 0x3FFu) {
        unk32 offset = current & 0x3FFu;
        if (offset + (arg1 >> 5) > 0x400u || offset < _unk3005E6C) {
            _unk3005E74 = ((current + 0x400u) & ~0x3FFu) + _unk3005E6C;
        }
        result = _unk3005E74;
        _unk3005E74 = result + (arg1 >> 5);
    }
    return result;
}

INCLUDE_ASM("asm/dump/8756a00-iwram/8756a84-arm_sub_8756a84.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/8756cc0-oam_8756cc0.s");
#if 0
#include <agb/memory_map.h>

typedef struct TileMapRowDraft8756FC0 {
    unk8 pad0[2];
    s16 data[1];
} TileMapRowDraft8756FC0;

typedef struct TileMapRowTableDraft8756FC0 {
    TileMapRowDraft8756FC0* rows[1];
} TileMapRowTableDraft8756FC0;

typedef struct TileMapHeaderDraft8756FC0 {
    unk8 pad0[0xC];
    TileMapRowTableDraft8756FC0* rowTable;
    unk8 pad10[0xA];
    unk16 unk1A;
    unk8 pad1C[4];
} TileMapHeaderDraft8756FC0;

typedef struct BGLayerDraft8756FC0 {
    s32 columnCount;
    s32 rowCount;
    unk8 pad8[0x54];
    unk8 screenBaseBlock;
    unk8 pad5D[2];
    unk8 field_5F;
    unk8 field_60;
    unk8 pad61[3];
    unk16 var64;
    unk8 pad66[2];
    TileMapHeaderDraft8756FC0* var68;
    unk8 pad6C[4];
    const unk8* mapAddr;
    unk8 pad74[8];
    unk8 field_7C;
    unk8 pad7D[0xB];
} BGLayerDraft8756FC0;

extern void (*__sub_8757494)(const s16*, s32, s32, unk32, unk16*, unk16);

void sub_8756FC0(BGLayerDraft8756FC0* layer, s32 x, s32 y, unk32 srcX, s32 srcY, s32 width, s32 height)
{
    const unk8* source;
    unk16* destination;
    s32 columns;
    unk32 rowMask;
    unk32 screenWidth;
    unk32 compressed;
    TileMapRowTableDraft8756FC0* rowTable;
    unk32 fill;
    s32 mapRow;
    unk32 flags;
    s32 rows;
    unk32 split;
    const s16* rowData;
    unk32 destinationRow;
    s32 row;

    source = layer->mapAddr;
    source += (x + y * layer->columnCount) * 2;
    destination = (unk16*)(VRAM + (layer->screenBaseBlock << 11));
    columns = layer->columnCount;
    compressed = layer->var64 & 2;
    flags = (layer->field_7C & 4) ? 2 : 0;
    screenWidth = 1 << layer->field_5F;
    rows = layer->rowCount;
    rowTable = layer->var68->rowTable;
    rowMask = (1 << layer->field_60) - 1;
    fill = layer->var68->unk1A;
    srcX &= screenWidth - 1;
    split = screenWidth - srcX;

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
            unk32 valid = row < rows;
            if (row < 0) {
                valid = 0;
            }
            if (valid) {
                flags |= 1;
            } else {
                flags &= ~1;
            }
        }
        rowData = rowTable->rows[mapRow]->data;
        destinationRow = (row & rowMask) << layer->field_5F;
        if (srcX + width > screenWidth) {
            if (compressed) {
                if (flags & 1) {
                    __sub_8757494(rowData, x, mapRow, split, destination + destinationRow + srcX, fill);
                    __sub_8757494(rowData, x + split, mapRow, width - split, destination + destinationRow, fill);
                } else {
                    fastMemoryClear16ARM(fill, destination + destinationRow + srcX, split * 2);
                    fastMemoryClear16ARM(fill, destination + destinationRow, (width - split) * 2);
                }
            } else {
                fastMemoryCopy16ARM(source, destination + destinationRow + srcX, split * 2);
                fastMemoryCopy16ARM(source + split, destination + destinationRow, (width - split) * 2);
            }
        } else {
            if (compressed) {
                if (flags & 1) {
                    __sub_8757494(rowData, x, mapRow, width, destination + destinationRow + srcX, fill);
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
#endif
INCLUDE_ASM("asm/dump/8756a00-iwram/8756fc0-sub_8756fc0.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/8757380-sub_8757380.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/8757494-sub_8757494.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/8757574-sub_8757574.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/87576d8-sub_87576d8.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/87577b4-sub_87577b4.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/8757a64-sound_8757a64.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/3006fac-fastmemorycleararm.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/3007034-fastmemorycopyarm.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/30070b8-fastmemoryclear16arm.s");
#if 0
extern const unk8 Str_8756798[];
extern void (*off_807D96C)(const unk8*);

void fastMemoryCopy16ARM(const void* sourceArg, void* destinationArg, unk32 byteCount)
{
    const unk16* source;
    unk16* destination;

    source = sourceArg;
    destination = destinationArg;
    if (byteCount == 0) {
        return;
    }
    if (byteCount & 1) {
        off_807D96C(Str_8756798);
    } else {
        byteCount >>= 1;
        do {
            *destination++ = *source++;
            byteCount--;
        } while (byteCount != 0);
    }
}
#endif
INCLUDE_ASM("asm/dump/8756a00-iwram/300711c-fastmemorycopy16arm.s");

void sub_8757CD0(void)
{
    MultiPlayerState* state;
    unk16* src;

    state = _unk3005DC4;
    src = state->unk3C;
    *(vu16*)REG_SIOMLT_SEND = *src++;
    *(vu16*)REG_SIOCNT |= 0x80;
    state->unk3C = src;
    state->unk0++;
}

INCLUDE_ASM("asm/dump/8756a00-iwram/8757d24-sub_8757d24.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/8757e4c-sub_8757e4c.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/8757fcc-sub_8757fcc.s");
