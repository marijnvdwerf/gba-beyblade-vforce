#include "display.h"

#include <agb/memory_map.h>

#include "debug.h"
#include "include_asm.h"
#include "system.h"

extern unk8 _unk3000DE0;
extern unk8 _unk3000E3C;
extern const unk8 Str_872934C[];

void newLayerManagement(UnkStruct_sub1* data, BGLayer* records, ScreenLayout* layout,
    unk16 initialDisplayControl, unk8 loadPalettes)
{
    LevelDesignLayer* layer;
    BGLayer* record;
    unk8 colorMode;
    unk16 displayControl;
    unk32 count;
    unk16 layerIndex;
    unk32 layerMode;
    s32 i;

    count = 0;
    displayControl = 0;
    sub_8059934();
    for (i = 0; i < 4; i++) {
        layer = &layout->layers[i];
        record = &records[i];
        if (layer->unk0 != NULL) {
            colorMode = layer->unk0->var18 & 1;
            layerIndex = colorMode != 0 ? 2 : 0;
            while (((displayControl >> layerIndex) & 1) != 0) {
                layerIndex++;
            }
            if (layerIndex > 3) {
                printf(Str_872934C);
            } else {
                displayControl |= 1 << layerIndex;
                sub_8058968(record, layerIndex, layer->unk0, colorMode != 0 ? 0x4040 : 0x40,
                    layer->unkC | 1, -layer->unk4 >> 8, -layer->unk8 >> 8);
                switch (i) {
                case 0:
                    layerMode = layout->unk74_0;
                    break;
                case 1:
                    layerMode = layout->unk74_2;
                    break;
                case 2:
                    layerMode = layout->unk74_4;
                    break;
                case 3:
                    layerMode = layout->unk74_6;
                    break;
                }
                ((BGControl*)GetBGLayerCntPtr(layerIndex))->unk0_0 = layerMode;
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
    data->var02 = count;
    data->var04 = 0;
    data->var06 = displayControl;
    data->var08 = initialDisplayControl;
    data->var0C = records;
    data->var10 = layout;
    data->var14 = 0;
    data->var00 = _unk3000DE0;
    data->var01 = _unk3000E3C;
}

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

void sub_80508CC(UnkStruct_sub1* data, ScreenLayout* layout, unk8 loadPalettes)
{
    BGLayer* records;
    LevelDesignLayer* layer;
    BGLayer* record;
    unk8 colorMode;
    unk16 displayControl;
    unk16 count;
    unk16 layerIndex;
    unk32 layerMode;
    s32 i;

    records = data->var0C;
    displayControl = data->var06;
    count = 0;
    for (i = 0; i < 4 - data->var02; i++) {
        layer = &layout->layers[i];
        record = &records[data->var02 + i];
        if (layer->unk0 != NULL) {
            colorMode = layer->unk0->var18 & 1;
            layerIndex = colorMode != 0 ? 2 : 0;
            while (((displayControl >> layerIndex) & 1) != 0) {
                layerIndex++;
            }
            if (layerIndex > 3) {
                printf(Str_872934C);
            } else {
                displayControl |= 1 << layerIndex;
                sub_8058968(record, layerIndex, layer->unk0, colorMode != 0 ? 0x4040 : 0x40,
                    layer->unkC | 1, -layer->unk4 >> 8, -layer->unk8 >> 8);
                switch (i) {
                case 0:
                    layerMode = layout->unk74_0;
                    break;
                case 1:
                    layerMode = layout->unk74_2;
                    break;
                case 2:
                    layerMode = layout->unk74_4;
                    break;
                case 3:
                    layerMode = layout->unk74_6;
                    break;
                }
                ((BGControl*)GetBGLayerCntPtr(layerIndex))->unk0_0 = layerMode;
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

void sub_8050A50(DisplayData* display)
{
    unk32 count;
    unk32 offset;

    if (display->unk4 + display->unk2) {
        offset = 0;
        count = display->unk4 + display->unk2;
        do {
            sub_8058EF4((BGLayer*)(display->ptrC + offset));
            offset += sizeof(BGLayer);
            count--;
        } while (count != 0);
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8050a78-nullsub_41.s");
