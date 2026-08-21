#include "geometry.h"
#include "include_asm.h"
#include "ram.h"
#include "unsorted.h"

extern LevelState* sub_8051734(void);
extern const char Str_8729804[];

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
        __fastMemoryCopyARM(&state->unk10, &data->collectedBits, 4);
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8056e2c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056ec0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056f7c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056fac.s");

void nullsub_7(void)
{
}

asm(".align 2, 0\n");
