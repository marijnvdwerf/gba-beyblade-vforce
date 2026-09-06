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
#if 0
void sub_8056EC0(void)
{
    GameData* gameData;
    CollectableData* data;
    LevelGeometryAddresses* geometry;
    LevelState* state;
    CollectableEntry* entry;
    LineMetadata* metadata;
    LineMetaObject* object;
    unk32 bit;
    s32 i;

    gameData = _gameData;
    geometry = &gameData->unk65C;
    data = &gameData->collectables;
    entry = data->entries;
    state = sub_8051734();
    i = 0;
    while (i < data->count) {
        bit = 1 << (i & 0x1F);
        if ((data->collectedBits[i >> 5] & bit) != 0) {
            if (((&state->unk10)[i >> 5] & bit) == 0) {
                sub_8051640(0);
            }
            metadata = GetLineMetaData(geometry, entry->line);
            object = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0x37AE);
            if (object != NULL) {
                sub_8057104(object->unk8.word, 1);
            } else {
                printf(Str_8729838);
            }
        }
        entry++;
        i++;
    }
    __fastMemoryCopyARM(data->collectedBits, &state->unk10, 4);
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/8056ec0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8056f7c.s");

void sub_8056FAC(void)
{
    s32 index;
    GameData* gameData;
    CollectableData* records;
    CollectableEntry* entry;
    LevelGeometryAddresses* geometry;
    GeometryLine* line;
    EnvironmentObject* object;
    s32 value;
    gameData = _gameData;
    records = &gameData->collectables;
    entry = records->entries;
    geometry = &gameData->unk65C;
    index = 0;
    if (index < records->count) {
        value = index;
        do {
            if (records->collectedBits[index >> 5] & (1 << (index & 0x1F)) || sub_8051780(4) != 0) {
                line = &geometry->unkC[entry->line];
                object = GetStruct4(entry->line);
                if (object->actor != NULL) {
                    object->actor->unk70 = value;
                }
                line->unk10 = value;
            }
            entry++;
            index++;
        } while (index < records->count);
    }
}

void nullsub_7(void)
{
}

asm(".align 2, 0\n");
