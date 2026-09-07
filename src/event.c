#include "event.h"

#include <agb/types.h>

#include "actor.h"
#include "collectable.h"
#include "debug.h"
#include "effects.h"
#include "gameinit.h"
#include "geometry.h"
#include "include_asm.h"
#include "memory.h"
#include "music.h"
#include "ram.h"
#include "riderphysics.h"
#include "riderstate.h"
#include "tutorial.h"
#include "unsorted.h"

extern const unk8 Str_8729658[];
extern const unk8 Str_87296A4[];
extern const unk8 Str_87296D8[];
extern const unk8 Str_87296E8[];
#if 0
void initEventListeners(unk32 levelId)
{
    LevelGeometryAddresses geometry;
    void* geometryData = loadLevelGeometry(levelId);
    void* metadata = getLevelMetadata(levelId);
    s32 listenerCount = 0;
    s32 maxListeners = 0x20;
    unk32 listenerIds[maxListeners];
    unk32* listenerPtr;
    s32 i;
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
            do {
                lineMetadata = GetLineMetaData(&geometry, i);
                if (lineMetadata != NULL
                    && getLineMetaObjectBytype(&geometry, lineMetadata, 7) != NULL) {
                    *listenerPtr++ = i;
                    listenerCount = listenerCount + 1;
                    if (listenerCount > maxListeners) {
                        printf((const unk8*)Str_8729658, maxListeners);
                    }
                }
                i++;
            } while (i < geometry.unk0->lineCount);
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

void processMetadata_6(LevelGeometryAddresses* arg0, GeometryLine* arg1, unk32 lineIndex,
    LineMetadata* arg3, LineMetaObject* event)
{
    unk16 id;

    id = event->id;
    handleEventListeners(arg0, id);
    if (_gameData->unk1618 != 0) {
        sub_804FF88(id);
    }
}

void sub_8054278(LevelGeometryAddresses* arg0, unk16 arg1)
{
    handleEventListeners(arg0, arg1);
    if (_gameData->unk1618 != 0)
        sub_804FF88(arg1);
}

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

void processMetadata_default(LevelGeometryAddresses* arg0, GeometryLine* arg1, unk32 lineIndex,
    LineMetadata* arg3, LineMetaObject* event)
{
    GetStruct4(lineIndex);
    printf(Str_87296D8, lineIndex);
}

void nullsub_42(LevelGeometryAddresses* arg0, GeometryLine* arg1, unk32 lineIndex,
    LineMetadata* arg3, LineMetaObject* event)
{
}

void processMetadata_1(LevelGeometryAddresses* arg0, GeometryLine* arg1, unk32 lineIndex,
    LineMetadata* arg3, LineMetaObject* event)
{
    EnvironmentObject* target;
    RiderBase* rider;

    target = GetStruct4(lineIndex);
    rider = (RiderBase*)_unk3000C10[0];
    if (rider != NULL) {
        switch (event->id) {
        case 0x4ECB:
            target->unk3C = event->unk8.word;
            break;
        case 0x2A39:
            rider->unk208 = 0xC00;
            sub_8055734(0, NULL, NULL);
            sub_804ABFC(0xC);
            break;
        case 0x8CEC:
            if (RiderHasFlag(rider, 0x4000000) == 0 && sub_8051780(4) == 0
                && _gameData->unk161B == 0)
                turorial_804A488(lineIndex);
            break;
        }
    }
}

void processMetadata_2(LevelGeometryAddresses* arg0, GeometryLine* arg1, unk32 lineIndex,
    LineMetadata* arg3, LineMetaObject* event)
{
    Actor* actor;
    unk32 saved;

    if (event->id == 0x524D) {
        actor = GetStruct4(lineIndex)->actor;
        if (actor != NULL) {
            saved = actor->unkB4;
            if (actor->unkB8 != NULL) {
                sub_8060A94(actor->unkB8);
            }
            actor_8057C58(actor, event->unk8.config, actor->unk3C, actor->x >> 8, actor->y >> 8,
                actor->z >> 8, actor->unk70);
            actor->unkB0 = convert3DCoordsto2DCoords;
            actor->unk68 = 0;
            actor->unkBC = 0x10;
            actor->unkB4 = saved;
        }
    }
}

void processMetadata_3(LevelGeometryAddresses* arg0, GeometryLine* arg1, unk32 lineIndex,
    LineMetadata* arg3, LineMetaObject* event)
{
    EnvironmentObject* target;

    target = GetStruct4(lineIndex);
    switch (event->id) {
    case 0x4ECB:
        target->unk3E = event->unk8.word;
        break;
    case 0x37AE:
        sub_8056E2C(lineIndex);
        sub_8055734(2, NULL, NULL);
        sub_80558E8(1);
        sub_804ABFC(0x10);
        break;
    }
}

void processMetadata_4(LevelGeometryAddresses* arg0, GeometryLine* arg1, unk32 lineIndex,
    LineMetadata* arg3, LineMetaObject* event)
{
    RiderBase* rider;
    Actor* actor;
    LineMetaObject* metadata;
    unk32 x;
    unk32 y;

    GetStruct4(lineIndex);
    metadata = event;
    rider = (RiderBase*)_unk3000C10[0];
    if (rider != NULL) {
        actor = rider->unk0;
        rider->unk40 += metadata->unk8.transform.x;
        rider->unk44 += metadata->unk8.transform.y;
        actor->unk48 += metadata->unk8.transform.z;
        if (RiderHasFlag(rider, 0x4000000) == 0) {
            if (metadata->unk8.transform.z != 0) {
                sub_804ABFC(0xD);
                sub_8055734(3, NULL, NULL);
            } else {
                x = 0;
                y = 0;
                if (metadata->unk8.transform.x != 0) {
                    x = -0x1CC;
                    if (metadata->unk8.transform.x > 0)
                        x = 0x1CC;
                }
                if (metadata->unk8.transform.y != 0) {
                    y = -0x1CC;
                    if (metadata->unk8.transform.y > 0)
                        y = 0x1CC;
                }
                sub_804ABFC(0xE);
                sub_805582C(0, NULL, x * 4, -y * 4, 0);
            }
        }
    }
}

void processMetadata_5(LevelGeometryAddresses* arg0, GeometryLine* arg1, unk32 lineIndex,
    LineMetadata* arg3, LineMetaObject* event)
{
    GeometrySpline* found;
    GeometryPoint* point;
    Actor* actor;
    unk32 splineIndex;
    unk32 pointIndex;
    s32 x;
    s32 y;
    s32 z;
    s32 index;

    actor = GetStruct4(lineIndex)->actor;
    found = NULL;
    if (actor != NULL) {
        for (index = 0; index < arg0->unk0->count.splineCountWord; index++) {
            if (arg0->unk14[index]->unkC == event->id) {
                found = arg0->unk14[index];
                splineIndex = index;
                break;
            }
        }
        if (found == NULL) {
            printf(Str_87296E8);
        } else {
            pointIndex = event->unk8.transform.z;
            point = GetPointAtSplineIndex(arg0, splineIndex, pointIndex);
            if (point != NULL) {
                x = (point->x << 5) - actor->x;
                y = (point->y << 5) - actor->y;
                z = (point->z << 5) - actor->z;
                sub_805C3BC(arg0, actor, splineIndex, pointIndex << 10);
                actor->unk40 = event->unk8.transform.y;
                actor_80585F0(actor, 0xA);
                actor->unk9A = x >> 8;
                actor->unk9C = y >> 8;
                actor->unk9E = z >> 8;
            }
        }
    }
}

void processMetadata_8(LevelGeometryAddresses* arg0, GeometryLine* arg1, unk32 lineIndex,
    LineMetadata* arg3, LineMetaObject* event)
{
    Actor* actor;

    actor = GetStruct4(lineIndex)->actor;
    if (actor != NULL) {
        actor_80580C0(actor, event->unk8.sequence.unk0, event->unk8.sequence.unk2);
    }
}

void processMetadata_9(LevelGeometryAddresses* arg0, GeometryLine* arg1, unk32 lineIndex,
    LineMetadata* arg3, LineMetaObject* event)
{
    Actor* actor;

    actor = GetStruct4(lineIndex)->actor;
    if (actor != NULL) {
        actor->unk40 = event->unk8.transform.x;
        actor->unk44 = event->unk8.transform.y;
        actor->unk48 = event->unk8.transform.z;
    }
}

void processMetadata_A(LevelGeometryAddresses* arg0, GeometryLine* arg1, unk32 lineIndex,
    LineMetadata* arg3, LineMetaObject* event)
{
    Actor* actor;

    actor = GetStruct4(lineIndex)->actor;
    if (actor != NULL) {
        actor->unk68 = event->unk8.transform.x;
        actor->unk70 = event->unk8.transform.y;
    }
}

void processMetadata_C(LevelGeometryAddresses* arg0, GeometryLine* arg1, unk32 lineIndex,
    LineMetadata* arg3, LineMetaObject* event)
{
    Actor* actor;

    actor = GetStruct4(lineIndex)->actor;
    if (actor != NULL) {
        actor->unk4C = event->unk8.transform.x;
        actor->unk50 = event->unk8.transform.y;
        actor->unk54 = event->unk8.transform.z;
    }
}

void processMetadata_D(LevelGeometryAddresses* arg0, GeometryLine* arg1, unk32 lineIndex,
    LineMetadata* arg3, LineMetaObject* event)
{
    arg1->unk10 = event->unk8.unk0;
}

void processMetadata_E(LevelGeometryAddresses* arg0, GeometryLine* arg1, unk32 lineIndex,
    LineMetadata* arg3, LineMetaObject* event)
{
    Actor* actor;

    actor = GetStruct4(lineIndex)->actor;
    if (actor != NULL) {
        ActorSetSpriteOffset(actor, event->unk8.offset.x, event->unk8.offset.y);
    }
}

void nullsub_14(LevelGeometryAddresses* arg0, GeometryLine* arg1, unk32 lineIndex,
    LineMetadata* arg3, LineMetaObject* event)
{
}

void processMetadata_10(LevelGeometryAddresses* arg0, GeometryLine* arg1, unk32 lineIndex,
    LineMetadata* arg3, LineMetaObject* event)
{
    Actor* actor;

    actor = GetStruct4(lineIndex)->actor;
    if (actor != NULL) {
        actor->x = event->unk8.transform.x << 8;
        actor->y = event->unk8.transform.y << 8;
        actor->z = event->unk8.transform.z << 8;
    }
}

void nullsub_15(LevelGeometryAddresses* arg0, GeometryLine* arg1, unk32 lineIndex,
    LineMetadata* arg3, LineMetaObject* event)
{
}

asm(".align 2, 0\n");
