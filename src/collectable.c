#include "gamestate.h"
#include "geometry.h"
#include "include_asm.h"
#include "ram.h"
#include "unsorted.h"

extern const unk8 Str_8729804[];

void initCollectables(u16 levelId)
{
    LevelGeometryAddresses geometry;
    GameData* gameData = _gameData;
    CollectableData* data;
    LevelGeometryTable* geometryData;
    LineMetadata** metadata;
    LevelState* state;
    CollectableEntry* entry;
    GeometryLine* line;
    LineMetadata* lineMeta;
    s32 count;
    s32 i;

    data = &gameData->collectables;
    geometryData = loadLevelGeometry(levelId);
    metadata = getLevelMetadata(levelId);
    state = sub_8051734();
    count = 0;
    __fastMemoryClearARM(0, data, sizeof(CollectableData));
    if (metadata != NULL && geometryData != NULL) {
        getLevelGeometryAddresses(&geometry, geometryData);
        StoreMetadataAddr(&geometry, metadata);
        entry = data->entries;
        for (i = 0; i < geometry.unk0->lineCount; i++) {
            line = &geometry.unkC[i];
            lineMeta = GetLineMetaData(&geometry, i);
            if (count > 0x1F) {
                printf(Str_8729804);
                break;
            }
            if (lineMeta != NULL
                && getLineMetaobjectByTypeAndId(&geometry, lineMeta, 3, 0x37AE) != NULL) {
                entry->geometry = line;
                entry->line = i;
                count++;
                entry++;
            }
        }
        data->count = count;
        __fastMemoryCopyARM(&state->unk10, &data->collectedBits[0], 4);
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8056e2c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056ec0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056f7c.s");

void sub_8056FAC(void)
{
    s32 index;
    GameData* gameData;
    CollectableData* records;
    CollectableEntry* entry;
    GeometryAddressTable* geometry;
    EnvironmentLine* line;
    EnvironmentObject* object;
    s32 value;
    s32 offset;
    unk32 mask;
    unk32* wordBase;
    unk32* word;

    gameData = _gameData;
    records = &gameData->collectables;
    entry = records->entries;
    geometry = &gameData->unk65C;
    index = 0;
    if (index < records->count) {
        value = index;
        do {
            offset = index >> 5;
            offset <<= 2;
            wordBase = records->collectedBits;
            word = (unk32*)((unk8*)wordBase + offset);
            mask = 1 << (index & 0x1F);
            if ((*word & mask) == 0 && sub_8051780(4) == 0) {
                entry++;
                index++;
                continue;
            }
            line = &geometry->unkC[entry->line];
            object = GetStruct4(entry->line);
            if (object->actor != NULL) {
                object->actor->unk70 = value;
            }
            line->unk10 = value;
            entry++;
            index++;
        } while (index < records->count);
    }
}

void nullsub_7(void)
{
}

asm(".align 2, 0\n");
