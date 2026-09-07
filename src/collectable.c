#include "beyblade.h"
#include "gamestate.h"
#include "geometry.h"
#include "include_asm.h"
#include "levelhud.h"
#include "ram.h"
#include "unsorted.h"

extern const unk8 Str_8729804[];
extern const unk8 Str_8729838[];

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

void sub_8056E2C(unk32 lineIndex)
{
    GameData* gameData;
    CollectableData* data;
    LevelGeometryAddresses* geometry;
    CollectableEntry* entry;
    LineMetadata* metadata;
    LineMetaObject* object;
    s32 index;

    index = 0;
    gameData = _gameData;
    data = &gameData->collectables;
    entry = data->entries;
    geometry = &gameData->unk434.geometry;
    while (entry->line != lineIndex && index < data->count) {
        index++;
        entry++;
    }
    if (index != data->count && entry->geometry != NULL) {
        sub_804FE50();
        metadata = GetLineMetaData(geometry, entry->line);
        if (metadata != NULL) {
            object = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0x37AE);
            if (object != NULL) {
                getItem(object->unk8.word);
            }
        }
        data->collectedBits[index >> 5] |= 1 << (index & 0x1F);
    }
}

void sub_8056EC0(void)
{
    GameData* gameData;
    CollectableData* data;
    LevelGeometryAddresses* geometry;
    LevelState* state;
    CollectableEntry* cursor;
    LineMetadata* metadata;
    LineMetaObject* object;
    s32 i;

    gameData = _gameData;
    geometry = &gameData->unk434.geometry;
    data = &gameData->collectables;
    cursor = data->entries;
    state = sub_8051734();
    i = 0;
    while (i < data->count) {
        if ((data->collectedBits[i >> 5] & (1 << (i & 0x1F))) != 0) {
            if ((state->unk10[i >> 5] & (1 << (i & 0x1F))) == 0) {
                sub_8051640(0);
            }
            metadata = GetLineMetaData(geometry, cursor->line);
            object = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0x37AE);
            if (object != NULL) {
                sub_8057104(object->unk8.word, 1);
            } else {
                printf(Str_8729838);
            }
        }
        cursor++;
        i++;
    }
    __fastMemoryCopyARM(data->collectedBits, state->unk10, 4);
}

void sub_8056F7C(void)
{
    GameData* gameData;
    LevelState* state;

    gameData = _gameData;
    state = sub_8051734();
    __fastMemoryCopyARM(&state->unk10, &gameData->collectables.collectedBits[0], 4);
}

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
    geometry = &gameData->unk434.geometry;
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
