#include <agb/types.h>

#include "debug.h"
#include "gameinit.h"
#include "geometry.h"
#include "include_asm.h"
#include "memory.h"
#include "ram.h"
#include "unsorted.h"

extern const unk8 Str_8729658[];
extern const unk8 Str_87296A4[];
#if 0
void initEventListeners(unk32 levelId)
{
    LevelGeometryAddresses geometry;
    void* geometryData = loadLevelGeometry(levelId);
    void* metadata = getLevelMetadata(levelId);
    unk32 listenerCount = 0;
    unk32 maxListeners = 0x20;
    unk32 listenerIds[maxListeners];
    unk32* listenerPtr;
    unk32 i;
    void* lineMetadata;
    AllocatedBlock* block;
    unk32 bytes;

    _gameData->unkCA4 = NULL;
    _gameData->unkCA0 = NULL;
    _gameData->unkCA8 = 0;
    if (metadata != NULL && geometryData != NULL) {
        getLevelGeometryAddresses(&geometry, geometryData);
        StoreMetadataAddr(&geometry, metadata);
        i = 0;
        if (listenerCount < geometry.unk0->lineCount) {
            listenerPtr = listenerIds;
            for (; i < geometry.unk0->lineCount; i++) {
                lineMetadata = GetLineMetaData(&geometry, i);
                if (lineMetadata != NULL
                    && getLineMetaObjectBytype(&geometry, lineMetadata, 7) != NULL) {
                    *listenerPtr++ = i;
                    listenerCount = listenerCount + 1;
                    if (listenerCount > maxListeners) {
                        printf((const unk8*)Str_8729658, maxListeners);
                    }
                }
            }
        }
        if (listenerCount != 0) {
            bytes = listenerCount * sizeof(unk32);
            block = slowAllocate(bytes);
            if (block == NULL) {
                printf((const unk8*)Str_87296A4, bytes);
            }
            __fastMemoryCopyARM(listenerIds, block->address, bytes);
            _gameData->unkCA0 = block;
            _gameData->unkCA4 = block->address;
            _gameData->unkCA8 = listenerCount;
            SetRiderGlobal(0);
        }
    }
}
#endif

INCLUDE_ASM("asm/dump/804a388-tutorial/80540ec-initEventListeners.s");

void deallocEventListeners(void)
{
    if (_gameData->unkCA0 != NULL) {
        deallocateBlock(_gameData->unkCA0);
    }
    _gameData->unkCA0 = NULL;
    _gameData->unkCA4 = NULL;
    _gameData->unkCA8 = 0;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8054248-processMetadata_6.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8054278.s");
#if 0
typedef void (*EventMetadataHandler)(LevelGeometryAddresses*, GeometryLine*, unk32, LineMetadata*);

extern EventMetadataHandler _8078990[];

void handleEventListeners(unk32 geometry, unk16 eventId)
{
    unk32* lineIndexPtr;
    LineMetadata* metadata;
    LineMetaObject* object;
    LineMetaObject* event;
    GeometryLine* line;
    unk32 lineIndex;
    unk32 objectIndex;
    unk32 objectCount;
    unk32 oldObjectCount;
    unk32 remainingLines;
    unk32* nextLinePtr;
    EventMetadataHandler handler;

    lineIndexPtr = (unk32*)_gameData->unkCA4;
    remainingLines = _gameData->unkCA8;
    if (remainingLines != 0) {
        remainingLines--;
        do {
            lineIndex = *lineIndexPtr;
            metadata = GetLineMetaData((LevelGeometryAddresses*)geometry, lineIndex);
            if (metadata != NULL) {
                object = getLineMetaobjectByTypeAndId(
                    (LevelGeometryAddresses*)geometry, metadata, 7, eventId);
                if (object != NULL) {
                    line = ((LevelGeometryAddresses*)geometry)->unkC + lineIndex;
                    objectIndex = *(s16*)((unk8*)object + 8);
                    objectCount = *(s16*)((unk8*)object + 0xA);
                    event = getLineMetaAtIndex(
                        (LevelGeometryAddresses*)geometry, metadata, objectIndex);
                    if (event != NULL) {
                        objectCount--;
                        nextLinePtr = lineIndexPtr + 1;
                        oldObjectCount = objectCount;
                        objectCount--;
                        if (oldObjectCount != 0) {
                            do {
                                handler = _8078990[event->type];
                                handler((LevelGeometryAddresses*)geometry, line, lineIndex, metadata);
                                event = (LineMetaObject*)((unk8*)event + event->size);
                            } while (objectCount-- != 0);
                        }
                        lineIndexPtr = nextLinePtr;
                    } else {
                        lineIndexPtr++;
                    }
                } else {
                    lineIndexPtr++;
                }
            } else {
                lineIndexPtr++;
            }
            remainingLines--;
        } while (remainingLines != 0);
    }
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/80542a8-handleEventListeners.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8054388-processMetadata_default.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80543a4-nullsub_42.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80543a8-processMetadata_1.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805444c-processMetadata_2.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80544bc-processMetadata_3.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805450c-processMetadata_4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80545b0-processMetadata_5.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8054684-processMetadata_8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80546a4-processMetadata_9.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80546c8-processMetadata_A.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80546e8-processMetadata_C.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805470c-processMetadata_D.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8054714-processMetadata_E.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8054738-nullsub_14.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805473c-processMetadata_10.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8054764-nullsub_15.s");
