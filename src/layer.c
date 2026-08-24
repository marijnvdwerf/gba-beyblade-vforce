#include "layer.h"

#include <agb/define.h>
#include <agb/memory_map.h>

#include "include_asm.h"
#include "unsorted.h"

typedef struct {
    unk8 filler00[4]; // 0x00
    u32 tileOffset; // 0x04
    u32 tileBytes; // 0x08
    u32 mapOffset; // 0x0C
    u32 mapBytes; // 0x10
    u8 var14; // 0x14
    unk8 filler15[3]; // 0x15
    u8 var18; // 0x18
    u8 colorMode; // 0x19
    unk8 filler1A[2]; // 0x1A
    u16 columnCount; // 0x1C
    u16 rowCount; // 0x1E
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
    s32 columnCount; // 0x00
    s32 rowCount; // 0x04
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
    u8 screenBaseBlock; // 0x5C
    u8 characterBaseBlock; // 0x5D
    unk8 layerIndex; // 0x5E
    u8 field_5F;
    u8 field_60;
    unk8 field_61;
    unk8 field_62[2];
    u16 var64;
    TileMapHeader* var68;
    void* tileAddr; // 0x6C
    void* mapAddr; // 0x70
    u32 tileBytes; // 0x74
    unk32 mapBytes; // 0x78
    unk8 field_7C;
    unk32 field_80;
    unk32 field_84;
} BGLayer;

extern Struct3000CA0 _unk3000CA0[10];
extern u8 _unk3000DE0;
extern u8 _unk3000E3C;

unk32 sub_8059284(BGLayer* r0, u16 r1, u16 r2);
vu16* GetBGLayerHOffsetPtr(u8 layer);
vu16* GetBGLayerVOffsetPtr(u8 layer);

void sub_8058AA8(BGLayer* bgLayer, u8 layerIndex, TileMapHeader* header, u16 bgPriority, u16 sp0);

void sub_8059310(BGLayer* r0, unk32 r1, unk32 r2, unk32 r3, unk32 sp0, unk32 sp4, unk32 sp8);

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

ASM_ZEROPAD

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
    //    unk8 colorMode;
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
INCLUDE_ASM("asm/dump/8057b80-debug/8058ef4.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8058f60.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059058-allocateActorMotionModifiers.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059110.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059184-nullsub_24.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059188.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059284.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059310.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059404.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80594fc.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80595fc.s");
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

void SetLayerTransform(u8 layer, u16 dx, u16 dmx, u16 dy, u16 dmy)
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

INCLUDE_ASM("asm/dump/8057b80-debug/8059b00.s");
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
