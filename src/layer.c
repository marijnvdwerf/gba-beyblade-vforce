#include "layer.h"

#include <agb/define.h>
#include <agb/memory_map.h>

#include "include_asm.h"
#include "math.h"
#include "unsorted.h"

typedef struct {
    unk8 filler00[4];
    u32 tileOffset;
    u32 tileBytes;
    u32 mapOffset;
    u32 mapBytes;
    u8 var14;
    unk8 filler15[3];
    u8 var18;
    u8 colorMode;
    unk8 filler1A[2];
    u16 columnCount;
    u16 rowCount;
} TileMapHeader;

typedef struct {
    unk32 var00;
    unk32 var04;
    unk32 var08;
    unk32 var0C;
    unk32 var10;
    unk32 var14;
} Struct3000CA0;

typedef struct {
    s32 columnCount;
    s32 rowCount;
    Struct3000CA0* var8;
    unk32 field_C;
    u32 field_10;
    u32 field_14;
    unk32 field_18;
    unk32 field_1C;
    unk32 field_20;
    unk32 field_24;
    unk32 field_28;
    unk32 field_2C;
    unk32 field_30;
    unk32 field_34;
    unk32 field_38;
    unk32 field_3C;
    unk32 field_40;
    unk32 field_44;
    u16 field_48;
    u16 field_4A;
    unk32 field_4C;
    unk32 field_50;
    unk32 field_54;
    unk32 field_58;
    u8 screenBaseBlock;
    u8 characterBaseBlock;
    unk8 layerIndex;
    u8 field_5F;
    u8 field_60;
    unk8 field_61;
    unk8 field_62[2];
    u16 var64;
    TileMapHeader* var68;
    void* tileAddr;
    void* mapAddr;
    u32 tileBytes;
    unk32 mapBytes;
    unk8 field_7C;
    unk32 field_80;
    unk32 field_84;
} BGLayer;

extern Struct3000CA0 _unk3000CA0[10];
extern u8 _unk3000DE0;
extern u8 _unk3000E3C;
extern s16 Unk_874CC3C[];
extern s16 Unk_872CC3C[];

unk32 sub_8059284(BGLayer* r0, u16 r1, u16 r2);
vu16* GetBGLayerHOffsetPtr(u8 layer);
vu16* GetBGLayerVOffsetPtr(u8 layer);

void sub_8058AA8(BGLayer* bgLayer, u8 layerIndex, TileMapHeader* header, u16 bgPriority, u16 sp0);

void sub_8059310(BGLayer* r0, s32 r1, s32 r2, s32 r3, s32 sp0, s32 sp4, s32 sp8);

typedef void (*LayerCopyFunc)(BGLayer*, unk32, unk32, unk32, unk32, unk32, unk32);
typedef void (*LayerClearFunc)(BGLayer*, unk32, unk32, unk32, unk32);

extern void (*__sub_8756FC0)(BGLayer*, unk32, unk32, unk32, unk32, unk32, unk32);
extern void (*__sub_8757380)(BGLayer*, unk32, unk32, unk32, unk32);
void sub_80594FC(BGLayer*, unk32, unk32, unk32, unk32, unk32, unk32);

INCLUDE_ASM("asm/dump/8057b80-debug/8058968.s");

void sub_8058A28(BGLayer* bgLayer, u8 layerIndex, TileMapHeader* header, u16 bgPriority, u16 sp0)
{
    s32 a, b;

    sub_8058AA8(bgLayer, layerIndex, header, bgPriority, sp0);

    *GetBGLayerHOffsetPtr(layerIndex) = 0;
    *GetBGLayerVOffsetPtr(layerIndex) = 0;

    a = (1 << bgLayer->field_5F);
    b = (1 << bgLayer->field_60);

    if (bgLayer->columnCount < a) {
        a = bgLayer->columnCount;
    }

    if (bgLayer->rowCount < b) {
        b = bgLayer->rowCount;
    }

    if (!(sp0 & 2)) {
        sub_8059310(bgLayer, 0, 0, 0, 0, a, b);
    }
}

void sub_8058AA8(BGLayer* bgLayer, u8 layerIndex, TileMapHeader* header, u16 bgPriority, u16 sp0)
{
    u32 var0;
    u8 colorMode;
    unk32 tileBlocks;
    vu16* layerCnt;

    bgLayer->var68 = header;
    bgLayer->var64 = header->var18;
    var0 = sub_8059284(bgLayer, bgPriority, bgLayer->var64);

    colorMode = header->colorMode;
    bgLayer->var8 = &_unk3000CA0[layerIndex];
    bgLayer->var8->var10 = 0;
    bgLayer->var8->var14 = 0;
    bgLayer->var8->var00 = 0;
    bgLayer->var8->var08 = (1 << bgLayer->field_5F) - 1;
    bgLayer->var8->var04 = 0;
    bgLayer->var8->var0C = (1 << bgLayer->field_60) - 1;

    bgLayer->columnCount = header->columnCount;
    bgLayer->rowCount = header->rowCount;
    bgLayer->layerIndex = layerIndex;
    bgLayer->field_C = 0;
    bgLayer->field_10 = 0;
    bgLayer->field_14 = 0;
    bgLayer->field_18 = 0;
    bgLayer->field_1C = 0;
    bgLayer->field_20 = 0;
    bgLayer->field_54 = 0;
    bgLayer->field_58 = 0;
    bgLayer->field_24 = 0x10;
    bgLayer->field_40 = 0;
    bgLayer->field_44 = 0;
    bgLayer->field_28 = 0;
    bgLayer->field_2C = 0;
    bgLayer->field_30 = 0x10000;
    bgLayer->field_34 = 0x10000;
    bgLayer->field_38 = 0;
    bgLayer->field_3C = 0;
    bgLayer->field_48 = 0;
    bgLayer->field_4A = 0;
    bgLayer->field_4C = 0;
    bgLayer->field_50 = 0;
    bgLayer->field_7C = sp0 & 0x0C;
    bgLayer->field_80 = -1;
    bgLayer->field_84 = 0;
    bgLayer->tileAddr = (void*)(((uintptr_t)header) + header->tileOffset);
    bgLayer->tileBytes = header->tileBytes;
    bgLayer->mapAddr = (void*)(((uintptr_t)header) + header->mapOffset);
    bgLayer->mapBytes = header->mapBytes;

    tileBlocks = (bgLayer->tileBytes - 1) / 0x4000;

    bgLayer->characterBaseBlock = _unk3000DE0;
    bgLayer->field_61 = header->var14;

    if (bgLayer->tileBytes != 0) {
        __fastMemoryCopyARM(bgLayer->tileAddr,
            (void*)(0x6000000 + (bgLayer->characterBaseBlock * 0x4000)), bgLayer->tileBytes);
        _unk3000DE0 += 1;
        _unk3000DE0 += tileBlocks;
    } else {
        bgLayer->characterBaseBlock = 0;
    }

    if ((((tileBlocks + 1) * 0x4000) - bgLayer->tileBytes) >= var0 && bgLayer->tileBytes != 0) {
        u32 i;

        u32 i1 = var0 / 0x800;
        if (i1 == 0) {
            i1 = 1;
        }
        bgLayer->screenBaseBlock = (_unk3000DE0 * 8) - i1;

        i = _unk3000E3C - var0 / 0x800;
        if (bgLayer->screenBaseBlock >= i) {
            _unk3000E3C = i;
            bgLayer->screenBaseBlock = i;
        };

    } else {
        _unk3000E3C -= var0 / 0x800;
        bgLayer->screenBaseBlock = _unk3000E3C;
    }

    layerCnt = GetBGLayerCntPtr(layerIndex);
    *layerCnt = ((bgLayer->screenBaseBlock) << BG_SCREEN_BASE_SHIFT)
        | ((bgPriority) << BG_PRIORITY_SHIFT)
        | ((bgLayer->characterBaseBlock) << BG_CHAR_BASE_SHIFT) | (((colorMode & 1) ^ 0x1) << 7);
}

void unref_8058C74(BGLayer* bgLayer, u8 layerIndex, u16 tileCount, u16 bgPriority)
{
    u32 var0;

    unk32 tileBlocks;
    vu16* layerCnt;
    void* dest;

    bgLayer->var68 = NULL;
    bgLayer->var64 = 0;
    var0 = sub_8059284(bgLayer, bgPriority, 0);

    bgLayer->var8 = &_unk3000CA0[layerIndex];
    bgLayer->var8->var10 = 0;
    bgLayer->var8->var14 = 0;
    bgLayer->var8->var00 = 0;
    bgLayer->var8->var08 = (1 << bgLayer->field_5F) - 1;
    bgLayer->var8->var04 = 0;
    bgLayer->var8->var0C = (1 << bgLayer->field_60) - 1;

    bgLayer->columnCount = 32;
    bgLayer->rowCount = 32;
    bgLayer->layerIndex = layerIndex;
    bgLayer->field_C = 0;
    bgLayer->field_10 = 0;
    bgLayer->field_14 = 0;
    bgLayer->field_18 = 0;
    bgLayer->field_1C = 0;
    bgLayer->field_20 = 0;
    bgLayer->field_54 = 0;
    bgLayer->field_58 = 0;
    bgLayer->field_24 = 0x10;
    bgLayer->field_40 = 0;
    bgLayer->field_44 = 0;
    bgLayer->field_28 = 0;
    bgLayer->field_2C = 0;
    bgLayer->field_30 = 0x10000;
    bgLayer->field_34 = 0x10000;
    bgLayer->field_38 = 0;
    bgLayer->field_3C = 0;
    bgLayer->field_48 = 0;
    bgLayer->field_4A = 0;
    bgLayer->field_4C = 0;
    bgLayer->field_50 = 0;
    bgLayer->field_7C = 0;
    bgLayer->field_80 = -1;
    bgLayer->field_84 = 0;

    bgLayer->tileAddr = NULL;
    if (bgPriority & 0x80) {
        bgLayer->tileBytes = tileCount * 64;
    } else {
        bgLayer->tileBytes = tileCount * 32;
    }

    bgLayer->mapAddr = NULL;
    bgLayer->mapBytes = 0;

    tileBlocks = (bgLayer->tileBytes - 1) / 0x4000;

    bgLayer->characterBaseBlock = _unk3000DE0;

    if (bgLayer->tileBytes != 0) {
        _unk3000DE0 += 1;
        _unk3000DE0 += tileBlocks;
    } else {
        bgLayer->characterBaseBlock = 0;
    }

    if ((((tileBlocks + 1) * 0x4000) - bgLayer->tileBytes) >= var0 && bgLayer->tileBytes != 0) {
        u32 i;

        u32 i1 = var0 / 0x800;
        if (i1 == 0) {
            i1 = 1;
        }
        bgLayer->screenBaseBlock = (_unk3000DE0 * 8) - i1;

        i = _unk3000E3C - var0 / 0x800;
        if (bgLayer->screenBaseBlock >= i) {
            _unk3000E3C = i;
            bgLayer->screenBaseBlock = i;
        };

    } else {
        _unk3000E3C -= var0 / 0x800;
        bgLayer->screenBaseBlock = _unk3000E3C;
    }

    dest = (void*)(0x6000000 + bgLayer->screenBaseBlock * 0x800);
    __fastMemoryClearARM(0, dest, var0);

    layerCnt = GetBGLayerCntPtr(layerIndex);
    *layerCnt = ((bgLayer->screenBaseBlock) << BG_SCREEN_BASE_SHIFT)
        | ((bgPriority) << BG_PRIORITY_SHIFT)
        | ((bgLayer->characterBaseBlock) << BG_CHAR_BASE_SHIFT);
}

INCLUDE_ASM("asm/dump/8057b80-debug/8058e18.s");

void sub_8058EF4(DisplayRecord* arg0)
{
    s32 xDelta;
    s32 yDelta;

    arg0->unk14 += arg0->unk1C;
    arg0->unk18 += arg0->unk20;
    arg0->unk54 = arg0->unk14;
    arg0->unk58 = arg0->unk18;
    sub_80596AC(arg0, arg0->unk14, arg0->unk18);
    if ((arg0->unk64 & 1) != 0) {
        sub_8058F60(arg0);
    }
    if (arg0->unk24 != 0) {
        xDelta = arg0->unk14 * arg0->unk24 >> 8;
        yDelta = arg0->unk18 * arg0->unk24 >> 8;
        arg0->unk14 -= xDelta;
        arg0->unk18 -= yDelta;
        if (xDelta == 0 && arg0->unk14 != 0) {
            arg0->unk14 = 0;
        }
        if (yDelta == 0 && arg0->unk18 != 0) {
            arg0->unk18 = 0;
        }
    }
}

void sub_8058F60(DisplayRecord* layer)
{
    u8 index;
    s32 a;
    s32 b;
    s32 c;
    s32 factor;

    index = layer->unk5E - 2;
    layer->unk28 += layer->unk2C;
    if (layer->unk28 < 0) {
        layer->unk28 += 0x10000;
    }
    layer->unk30 += layer->unk38;
    layer->unk34 += layer->unk3C;
    sub_8059B00(layer->unk5E, (layer->unk28 >> 8) & 0xFF, (layer->unk30 << 8) >> 16,
        (layer->unk34 << 8) >> 16);
    SetBGOffset(layer->unk5E,
        layer->unk4C
            - (_unk3000D00[index].unk8.word * layer->unk48
                - _unk3000D00[index].unk10.word * layer->unk4A),
        layer->unk50
            + (_unk3000D00[index].unkC.word * layer->unk48
                - _unk3000D00[index].unk14.word * layer->unk4A));
    factor = layer->unk24;
    if (factor != 0) {
        a = (layer->unk2C * factor) >> 8;
        b = (layer->unk38 * factor) >> 8;
        c = (layer->unk3C * factor) >> 8;
        layer->unk2C -= a;
        layer->unk38 -= b;
        layer->unk3C -= c;
        if (a == 0 && layer->unk2C != 0) {
            layer->unk2C = 0;
        }
        if (b == 0 && layer->unk38 != 0) {
            layer->unk38 = 0;
        }
        if (c == 0 && layer->unk3C != 0) {
            layer->unk3C = 0;
        }
    }
}

INCLUDE_ASM("asm/dump/8057b80-debug/8059058-allocateActorMotionModifiers.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059110.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059184-nullsub_24.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059188.s");
#if 0
unk32 sub_8059284(BGLayer* bgLayer, u16 bgPriority, u16 flags)
{
    BGLayer* layerReg = bgLayer;
    s32 mode;
    unk32 size;

    mode = bgPriority >> 14;
    size = mode;
    if ((flags & 1) != 0) {
        size = 1 << (mode * 2 + 8);
        layerReg->field_5F = mode + 4;
        layerReg->field_60 = mode + 4;
        return size;
    }
    switch (mode) {
    case 0:
        size = 0x800;
        layerReg->field_5F = 5;
        layerReg->field_60 = 5;
        break;
    case 1:
        size = 0x1000;
        layerReg->field_5F = 6;
        layerReg->field_60 = 5;
        break;
    case 2:
        size = 0x1000;
        layerReg->field_5F = 5;
        layerReg->field_60 = 6;
        break;
    case 3:
        size = 0x2000;
        layerReg->field_5F = 6;
        layerReg->field_60 = 6;
        break;
    }
    return size;
}
#endif
INCLUDE_ASM("asm/dump/8057b80-debug/8059284.s");

#if 0
void sub_8059310(BGLayer* layer, s32 x, s32 y, s32 srcX, s32 srcY, s32 width, s32 height)
{
    LayerCopyFunc copy;
    s32 endX;
    s32 widthValue;
    s32 remainder;
    s32 sourceX;
    s32 adjustedSrcX;
    unk32 wrappedX;
    s32 stackY;
    s32 stackHeight;
    s32 stackSrcY;

    stackY = y;
    stackHeight = height;
    stackSrcY = srcY;
    widthValue = width;
    remainder = 0;
    sourceX = srcX;
    if ((layer->var64 & 1) != 0) {
        copy = sub_80594FC;
    } else {
        copy = __sub_8756FC0;
    }
    adjustedSrcX = sourceX;
    endX = x + widthValue;
    if (endX > layer->columnCount) {
        widthValue = 0;
        if (x < layer->columnCount) {
            widthValue = layer->columnCount - x;
        }
        remainder = width - widthValue;
        wrappedX = x + widthValue - layer->columnCount;
        adjustedSrcX += widthValue;
    }
    if (x < 0) {
        widthValue = endX;
        if (widthValue < 0) {
            widthValue = 0;
        }
        remainder = width - widthValue;
        wrappedX = x + layer->columnCount;
        x = 0;
        sourceX += remainder;
    }
    if (widthValue > 0) {
        copy(layer, x, stackY, sourceX, stackSrcY, widthValue, stackHeight);
    }
    if (remainder > 0) {
        if ((layer->field_7C & 8) != 0) {
            copy(layer, wrappedX, stackY, adjustedSrcX, stackSrcY, remainder, stackHeight);
        } else {
            (*__sub_8757380)(layer, adjustedSrcX, stackSrcY, remainder, stackHeight);
        }
    }
}
#else
INCLUDE_ASM("asm/dump/8057b80-debug/8059310.s");
#endif
INCLUDE_ASM("asm/dump/8057b80-debug/8059404.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80594fc.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80595fc.s");
#if 0
void sub_80596AC(void* arg0, unk32 deltaX, unk32 deltaY)
{
    BGLayer* bgLayer;
    Struct3000CA0* map;
    s32 x;
    s32 y;
    s32 xBase;
    s32 yBase;
    s32 xStart;
    s32 yStart;
    s32 xOffset;
    s32 yOffset;
    s32 xLimit;
    s32 yLimit;
    s32 xDelta;
    s32 yDelta;
    s32 horizontal;
    s32 xAdjust;
    s32 yAdjust;
    u8 xShift;
    u8 yShift;
    u8* flags;

    bgLayer = arg0;
    xDelta = 0;
    yDelta = 0;
    xAdjust = 0;
    yAdjust = 0;
    horizontal = bgLayer->var64 & 1;
    flags = &bgLayer->field_5F;
    xShift = 1 << bgLayer->field_5F;
    yShift = 1 << bgLayer->field_60;
    x = bgLayer->field_40 + deltaX;
    bgLayer->field_40 = x;
    y = bgLayer->field_44 + deltaY;
    bgLayer->field_44 = y;
    bgLayer->field_C += deltaX;
    bgLayer->field_10 += deltaY;
    xBase = bgLayer->field_C >> 11;
    yBase = bgLayer->field_10 >> 11;
    xLimit = xBase + 0x1E;
    yLimit = yBase + 0x14;
    xStart = xBase;
    yStart = yBase;
    map = bgLayer->var8;

    if (xLimit > map->var08) {
        xDelta = xLimit - map->var08;
        xOffset = map->var10 + xShift;
        xStart = map->var08 + 1;
        xAdjust = xDelta;
    }
    if (xStart < map->var00) {
        xDelta = xStart - map->var00;
        xOffset = map->var10 + xDelta;
        xStart = map->var00 + xDelta;
        xAdjust = -xDelta;
    }
    if (yLimit > map->var0C) {
        yDelta = yLimit - map->var0C;
        yOffset = map->var14 + yShift;
        yStart = map->var0C + 1;
        yAdjust = yDelta;
    }
    if (yStart < map->var04) {
        yDelta = yStart - map->var04;
        yOffset = map->var14 + yDelta;
        yStart = map->var04 + yDelta;
        yAdjust = -yDelta;
    }

    if (xDelta != 0 && !(bgLayer->field_7C & 1)) {
        sub_8059310(bgLayer, xStart, xBase, xOffset, map->var14, xAdjust, 0x20);
        map = bgLayer->var8;
        map->var10 += xDelta;
        map->var00 += xDelta;
        map->var08 += xDelta;
        if (bgLayer->field_7C & 8) {
            if (map->var08 >= bgLayer->columnCount && map->var00 >= bgLayer->columnCount) {
                map->var00 = map->var00 - bgLayer->columnCount;
                map->var08 = map->var08 - bgLayer->columnCount;
                map->var10 &= (1 << *flags) - 1;
                bgLayer->field_C = bgLayer->field_C - (bgLayer->columnCount << 11);
            } else {
                map = bgLayer->var8;
                if (map->var08 < 0 && map->var00 < 0) {
                    map->var00 += bgLayer->columnCount;
                    map->var08 += bgLayer->columnCount;
                    map->var10 &= (1 << bgLayer->field_5F) - 1;
                    bgLayer->field_C += bgLayer->columnCount << 11;
                }
            }
        }
    }
    if (yDelta != 0 && !(bgLayer->field_7C & 2)) {
        map = bgLayer->var8;
        sub_8059310(bgLayer, map->var00, yStart, map->var10, yOffset, 0x20, yAdjust);
        map = bgLayer->var8;
        map->var14 += yDelta;
        map->var04 += yDelta;
        map->var0C += yDelta;
        if (bgLayer->field_7C & 4) {
            if (map->var0C >= bgLayer->rowCount && map->var04 >= bgLayer->columnCount) {
                map->var04 = map->var04 - bgLayer->rowCount;
                map->var0C = map->var0C - bgLayer->rowCount;
                bgLayer->field_10 = bgLayer->field_10 - (bgLayer->rowCount << 11);
            } else {
                map = bgLayer->var8;
                if (map->var0C < 0 && map->var04 < 0) {
                    map->var04 += bgLayer->rowCount;
                    map->var0C += bgLayer->rowCount;
                    bgLayer->field_10 += bgLayer->rowCount << 11;
                }
            }
        }
    }
    if (horizontal == 0) {
        *GetBGLayerHOffsetPtr(bgLayer->layerIndex) = bgLayer->field_40 >> 8;
        *GetBGLayerVOffsetPtr(bgLayer->layerIndex) = bgLayer->field_44 >> 8;
    } else {
        SetBGOffset(bgLayer->layerIndex, bgLayer->field_40, bgLayer->field_44);
    }
}
#endif

INCLUDE_ASM("asm/dump/8057b80-debug/80596ac.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059904.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059934.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059994.s");

vu16* GetBGLayerHOffsetPtr(u8 layer)
{
    switch (layer) {
    case 0:
        return (vu16*)REG_BG0HOFS;

    case 1:
        return (vu16*)REG_BG1HOFS;

    case 2:
        return (vu16*)REG_BG2HOFS;

    case 3:
        return (vu16*)REG_BG3HOFS;
    }
}

vu16* GetBGLayerVOffsetPtr(u8 layer)
{
    switch (layer) {
    case 0:
        return (vu16*)REG_BG0VOFS;

    case 1:
        return (vu16*)REG_BG1VOFS;

    case 2:
        return (vu16*)REG_BG2VOFS;

    case 3:
        return (vu16*)REG_BG3VOFS;
    }
}

vu16* GetBGLayerCntPtr(u8 layer)
{
    switch (layer) {
    case 0:
        return (vu16*)REG_BG0CNT;

    case 1:
        return (vu16*)REG_BG1CNT;

    case 2:
        return (vu16*)REG_BG2CNT;

    case 3:
        return (vu16*)REG_BG3CNT;
    }
}

void SetBGOffset(u8 layer, s32 x, s32 y)
{
    switch (layer) {
    case 2:
        *(vu16*)REG_BG2X_L = x;
        *(vu16*)REG_BG2X_H = x >> 16;
        *(vu16*)REG_BG2Y_L = y;
        *(vu16*)REG_BG2Y_H = y >> 16;
        break;
    case 3:
        *(vu16*)REG_BG3X_L = x;
        *(vu16*)REG_BG3X_H = x >> 16;
        *(vu16*)REG_BG3Y_L = y;
        *(vu16*)REG_BG3Y_H = y >> 16;
        break;
    }
}

void SetLayerTransform(u8 layer, s16 dx, s16 dmx, s16 dy, s16 dmy)
{

    switch (layer) {
    case 2:
        *(vu16*)REG_BG2PA = dx;
        *(vu16*)REG_BG2PB = dmx;
        *(vu16*)REG_BG2PC = dy;
        *(vu16*)REG_BG2PD = dmy;
        break;
    case 3:
        *(vu16*)REG_BG3PA = dx;
        *(vu16*)REG_BG3PB = dmx;
        *(vu16*)REG_BG3PC = dy;
        *(vu16*)REG_BG3PD = dmy;
        break;
    }
}

void sub_8059B00(u8 layer, u8 angle, u16 xAngle, u16 yAngle)
{
    u8 index;
    LayerTransformRecord* transform;
    LayerTransformRecord* base;
    LayerTransformValue* matrixB;
    LayerTransformValue* matrixA;
    LayerTransformValue* matrixC;
    s16 matrixD;
    u8 check;

    check = layer - 2;
    if (check <= 2) {
        base = _unk3000D00;
        index = check;
        transform = &base[index];
        transform->unk2 = xAngle;
        transform->unk4 = yAngle;
        transform->unk0 = angle;
        _unk3000D00[index].unk8.word
            = sub_8059FA0(Unk_874CC3C[transform->unk0 + 0x40], Unk_872CC3C[transform->unk2]);
        matrixA = &_unk3000D00[index].unk8;
        _unk3000D00[index].unkC.word
            = sub_8059FA0(Unk_874CC3C[transform->unk0], Unk_872CC3C[transform->unk2]);
        matrixB = &_unk3000D00[index].unkC;
        _unk3000D00[index].unk10.word
            = sub_8059FA0(-Unk_874CC3C[transform->unk0], Unk_872CC3C[transform->unk4]);
        matrixC = &_unk3000D00[index].unk10;
        matrixD = sub_8059FA0(Unk_874CC3C[transform->unk0 + 0x40], Unk_872CC3C[transform->unk4]);
        _unk3000D00[index].unk14.word = matrixD;
        SetLayerTransform(layer, matrixA->half, matrixB->half, matrixC->half, matrixD);
    }
}

INCLUDE_ASM("asm/dump/8057b80-debug/8059c18.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059cb4.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059cc8.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059cf0.s");

void ToggleLayerVisibility(u8 layer, bool8 enabled)
{
    if (enabled) {
        switch (layer) {
        case 0:
            *(vu16*)REG_DISPCNT |= DISP_BG0_ON;
            break;

        case 1:
            *(vu16*)REG_DISPCNT |= DISP_BG1_ON;
            break;

        case 2:
            *(vu16*)REG_DISPCNT |= DISP_BG2_ON;
            break;

        case 3:
            *(vu16*)REG_DISPCNT |= DISP_BG3_ON;
            break;
        }
    } else {
        switch (layer) {
        case 0:
            *(vu16*)REG_DISPCNT &= ~DISP_BG0_ON;
            break;

        case 1:
            *(vu16*)REG_DISPCNT &= ~DISP_BG1_ON;
            break;

        case 2:
            *(vu16*)REG_DISPCNT &= ~DISP_BG2_ON;
            break;

        case 3:
            *(vu16*)REG_DISPCNT &= ~DISP_BG3_ON;
            break;
        }
    }
}

INCLUDE_ASM("asm/dump/8057b80-debug/8059db8.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059ddc.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059e5c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059ebc.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059f20.s");
