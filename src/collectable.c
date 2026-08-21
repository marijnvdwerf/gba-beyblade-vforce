#include "include_asm.h"
#include "ram.h"
#include "unsorted.h"

extern void* loadLevelGeometry(u16);
extern void* getLevelMetadata(u16);
extern void getLevelGeometryAddresses(LevelGeometryAddresses*, void*);
extern void StoreMetadataAddr(LevelGeometryAddresses*, void*);
extern void* GetLineMetaData(LevelGeometryAddresses*, s32);
extern LevelState* sub_8051734(void);
extern void* getLineMetaobjectByTypeAndId(LevelGeometryAddresses*, void*, unk32, unk32);
extern const char Str_8729804[];

void initCollectables(u16 levelId)
{
    LevelGeometryAddresses geometry;
    GameData* gameData = _gameData;
    CollectableData* data;
    void* geometryData;
    void* metadata;
    LevelState* state;
    CollectableEntry* entry;
    GeometryLine* line;
    void* lineMeta;
    s32 count;
    s32 i;

    data = &gameData->collectables;
    geometryData = loadLevelGeometry(levelId);
    metadata = getLevelMetadata(levelId);
    state = sub_8051734();
    count = 0;
    __fastMemoryClearARM(0, data, sizeof(CollectableData));
    if (metadata != 0 && geometryData != NULL) {
        getLevelGeometryAddresses(&geometry, geometryData);
        StoreMetadataAddr(&geometry, metadata);
        entry = gameData->collectables.entries;
        for (i = 0; i < geometry.unk0->lineCount; i++) {
            line = &geometry.unkC[i];
            lineMeta = GetLineMetaData(&geometry, i);
            if (count > 0x1F) {
                printf(Str_8729804);
                break;
            }
            if (lineMeta != 0
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
