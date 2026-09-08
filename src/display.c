#include "display.h"

#include <agb/memory_map.h>

#include "debug.h"
#include "include_asm.h"
#include "system.h"

extern unk8 _unk3000DE0;
extern unk8 _unk3000E3C;
extern const unk8 Str_872934C[];

#if 0
typedef struct ScreenLayoutDraft {
    unk8 pad0[0x14];
    LevelDesignLayer layers[4];
    unk8 unk74;
    unk8 pad75[3];
    unk16* bgPalette;
    unk16* spritePalette;
    unk32 var80;
} ScreenLayoutDraft;

typedef struct NewLayerManagementDraftData {
    unk8 var00;
    unk8 var01;
    unk16 var02;
    unk16 var04;
    unk16 var06;
    unk16 var08;
    DisplayRecord* var0C;
    ScreenLayoutDraft* var10;
    unk32 var14;
} NewLayerManagementDraftData;

void newLayerManagement(NewLayerManagementDraftData* data, DisplayRecord* recordsArg,
    ScreenLayoutDraft* layout, unk16 initialDisplayControl, unk8 loadPalettes)
{
    NewLayerManagementDraftData* output;
    DisplayRecord* record;
    LevelDesignLayer* layer;
    unk8 colorMode;
    unk16 displayControl;
    unk32 count;
    unk16 layerIndex;
    unk8 layerIndexByte;
    unk32 layerMode;
    unk32 settingsWord;
    s32 i;

    output = data;
    count = 0;
    displayControl = 0;
    sub_8059934();
    for (i = 0; i < 4; i++) {
        layer = &layout->layers[i];
        record = &recordsArg[i];
        if (layer->unk0 != NULL) {
            colorMode = layer->unk0->var18 & 1;
            layerIndex = colorMode != 0 ? 2 : 0;
            while (((displayControl >> layerIndex) & 1) != 0) {
                layerIndex++;
            }
            if (layerIndex > 3) {
                printf(Str_872934C);
            } else {
                unk32 mask;
                unk32 clear;
                unk16 result;
                vu16* layerCnt;

                displayControl |= 1 << layerIndex;
                layerIndexByte = layerIndex;
                sub_8058968(record, layerIndexByte, layer->unk0,
                    colorMode != 0 ? 0x4040 : 0x40, layer->unkC | 1, -layer->unk4 >> 8,
                    -layer->unk8 >> 8);
                switch (i) {
                case 0:
                    layerMode = ((settingsWord = layout->unk74) << 30) >> 30;
                    break;
                case 1:
                    layerMode = ((settingsWord = layout->unk74) << 28) >> 30;
                    break;
                case 2:
                    layerMode = ((settingsWord = layout->unk74) << 26) >> 30;
                    break;
                case 3:
                    layerMode = (settingsWord = layout->unk74) >> 6;
                    break;
                }
                layerCnt = GetBGLayerCntPtr(layerIndexByte);
                mask = 3;
                layerMode &= mask;
                clear = 4;
                clear = -clear;
                result = *layerCnt & clear;
                result |= layerMode;
                *layerCnt = result;
                count++;
            }
        }
    }
    if (loadPalettes != 0) {
        if (layout->bgPalette != NULL) {
            loadPalette(layout->bgPalette);
        }
        if (layout->spritePalette != NULL) {
            loadPalette2(layout->spritePalette);
        }
    }
    output->var02 = count;
    output->var04 = 0;
    output->var06 = displayControl;
    output->var08 = initialDisplayControl;
    output->var0C = recordsArg;
    output->var10 = layout;
    output->var14 = 0;
    output->var00 = _unk3000DE0;
    output->var01 = _unk3000E3C;
}
#endif

INCLUDE_ASM("asm/dump/804a388-tutorial/80506f4-newLayerManagement.s");

void sub_8050894(UnkStruct_sub1* data)
{
    *(vu16*)REG_DISPCNT = (data->var06 << 8) | data->var08;
}

void sub_80508A4(UnkStruct_sub1* data)
{
    _unk3000DE0 = data->var00;
    _unk3000E3C = data->var01;
    *(vu16*)REG_DISPCNT = (data->var06 << 8) | data->var08;
    data->var04 = 0;
}

#if 0
typedef struct ScreenLayoutDraft {
    unk8 pad0[0x14];
    LevelDesignLayer layers[4];
    unk8 unk74;
    unk8 pad75[3];
    unk16* bgPalette;
    unk16* spritePalette;
    unk32 var80;
} ScreenLayoutDraft;

typedef struct Sub80508CCDraftData {
    unk8 var00;
    unk8 var01;
    unk16 var02;
    unk16 var04;
    unk16 var06;
    unk16 var08;
    DisplayRecord* var0C;
    unk32 var10;
    unk32 var14;
} Sub80508CCDraftData;

void sub_80508CC(Sub80508CCDraftData* data, ScreenLayoutDraft* layout, unk8 loadPalettes)
{
    DisplayRecord* record;
    LevelDesignLayer* layer;
    unk8 colorMode;
    unk32 layerIndexShifted;
    unk8 layerIndexByte;
    unk16 displayControl;
    unk16 count;
    unk16 layerIndex;
    unk32 layerMode;
    unk32 settingsWord;
    s32 i;

    displayControl = data->var06;
    count = 0;
    for (i = 0; i < 4 - data->var02; i++) {
        layer = &layout->layers[i];
        record = &data->var0C[data->var02 + i];
        if (layer->unk0 != NULL) {
            colorMode = layer->unk0->var18 & 1;
            layerIndex = colorMode != 0 ? 2 : 0;
            while (((displayControl >> layerIndex) & 1) != 0) {
                layerIndex++;
            }
            if (layerIndex > 3) {
                printf(Str_872934C);
            } else {
                unk8 mask;
                unk32 clear;
                unk16 result;
                vu16* layerCnt;

                displayControl |= 1 << layerIndex;
                layerIndexShifted = layerIndex << 24;
                layerIndexByte = layerIndexShifted >> 24;
                sub_8058968(record, layerIndexByte, layer->unk0,
                    colorMode != 0 ? 0x4040 : 0x40, layer->unkC | 1, -layer->unk4 >> 8,
                    -layer->unk8 >> 8);
                switch (i) {
                case 0:
                    layerMode = ((settingsWord = layout->unk74) << 30) >> 30;
                    break;
                case 1:
                    layerMode = ((settingsWord = layout->unk74) << 28) >> 30;
                    break;
                case 2:
                    layerMode = ((settingsWord = layout->unk74) << 26) >> 30;
                    break;
                case 3:
                    layerMode = (settingsWord = layout->unk74) >> 6;
                    break;
                }
                layerCnt = GetBGLayerCntPtr(layerIndexByte);
                mask = 3;
                layerMode &= mask;
                clear = 4;
                clear = -clear;
                result = *layerCnt & clear;
                result |= layerMode;
                *layerCnt = result;
                count++;
            }
        }
    }
    *(vu16*)REG_DISPCNT |= displayControl << 8;
    data->var04 = count;
    if (layout->bgPalette != NULL && loadPalettes != 0) {
        loadPalette(layout->bgPalette);
    }
}
#endif

INCLUDE_ASM("asm/dump/804a388-tutorial/80508cc.s");

void sub_8050A50(DisplayData* display)
{
    unk32 count;
    unk32 offset;

    if (display->unk4 + display->unk2) {
        offset = 0;
        count = display->unk4 + display->unk2;
        do {
            sub_8058EF4((DisplayRecord*)(display->ptrC + offset));
            offset += sizeof(DisplayRecord);
            count--;
        } while (count != 0);
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8050a78-nullsub_41.s");
