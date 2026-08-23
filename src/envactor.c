#include <agb/memory_map.h>

#include "debug.h"
#include "geometry.h"
#include "include_asm.h"
#include "memory.h"
#include "palette.h"
#include "projectile.h"
#include "ram.h"
#include "sprite.h"
#include "unsorted.h"

extern const u8 SpriteSheet_86FBF94[];

#if 0
extern void ActorSetSpriteOffset(EnvironmentActorSlot*, unk16, unk16);
extern void LoadSpriteSheet(SpriteEntry*, const void*, unk32, unk32, unk32, unk32, unk32, unk32);
extern void actor_80585F8(EnvironmentActorSlot*, unk16, unk16, unk16, unk16);
extern void actor_805C48C(EnvironmentActorSlot*, LevelGeometryAddresses*, unk32, unk32);
extern void sub_8056B54(void);
extern void _return_false(void);
extern void sub_80550B8(void);
extern const u8 SpriteSheet_86FAEAC[];
extern const u8 Str_8729738[];
extern void convert3DCoordsto2DCoords(void);

void initLevelEnvironmentActors(u16 level)
{
    GameData* gameData;
    unk32 actorSize;
    EnvironmentActorAllocation* allocationField;
    EnvironmentActorConfig* actorConfigs[0x20];
    EnvironmentActorConfig* actorConfig;
    unk32 selectedLines[0x20];
    LevelGeometryAddresses geometry;
    unk32 callbackData[3];
    unk32 lineIndex;
    unk32 selectedCount;
    unk32 effectCount;
    unk32 lineSize;
    unk32 effectSizeBytes;
    unk32 pointSize;
    EnvironmentObject* lineObjects;
    EnvironmentObject* lineObject;
    EnvironmentNode* effect;
    EnvironmentPointEntry* points;
    GeometryPoint* point0;
    GeometryPoint* point1;
    unk32 spriteId;
    EnvironmentActorState* actorState;
    LineMetadata* metadata;
    LineMetaObject* metaobject;
    EnvironmentActorOffsetMeta* offsetMeta;
    EnvironmentActorTransformMeta* transformMeta;
    EnvironmentActorSlot* actorBase;
    AllocatedBlock* block;
    SpriteEntry* sprite;
    unk32 geometryData;
    unk32 metadataData;
    unk32 allocationSize;
    unk32 actorType;
    unk32 xDelta;
    unk32 yDelta;
    unk32 x;
    unk32 y;
    unk32 z;

    gameData = _gameData;
    allocationField = (EnvironmentActorAllocation*)&gameData->unkC74;
    geometryData = (unk32)loadLevelGeometry(level);
    metadataData = (unk32)getLevelMetadata(level);
    selectedCount = 0;
    effectCount = 0;
    if (metadataData == 0) {
        return;
    }
    if (geometryData == 0) {
        return;
    }
    getLevelGeometryAddresses(&geometry, (LevelGeometryTable*)geometryData);
    StoreMetadataAddr(&geometry, (LineMetadata**)metadataData);
    sub_805E514(&gameData->unkC90, 0, 0, (unk32)sub_80550B8, selectedCount);
    sub_805E50C(callbackData, 0, (unk32)sub_8056B54, (unk32)_return_false);
    lineIndex = 0;
    if (selectedCount < geometry.unk0->lineCount) {
        EnvironmentActorConfig** actorConfigCursor;

        actorConfigCursor = actorConfigs;
        do {
            metadata = GetLineMetaData(&geometry, lineIndex);
            if (metadata != NULL) {
                metaobject = getLineMetaobjectByTypeAndId(
                    &geometry, metadata, 2, 0xD679);
                if (metaobject != NULL) {
                    actorConfig = ((EnvironmentActorMetaObject*)metaobject)->config;
                    actorConfigCursor[0] = actorConfig;
                    actorConfigCursor++;
                    selectedLines[selectedCount] = lineIndex;
                    selectedCount++;
                    metaobject = getLineMetaobjectByTypeAndId(&geometry, metadata, 1, 0xF4FA);
                    if (metaobject != NULL) {
                        effectCount++;
                    }
                }
            }
            lineIndex++;
        } while (lineIndex < geometry.unk0->lineCount);
    }
    block = allocationField->block;
    if (block != NULL) {
        deallocateBlock(block);
    }
    actorSize = selectedCount * 0xC4;
    lineSize = geometry.unk0->lineCount * 0x4C;
    effectSizeBytes = effectCount * 0x1C;
    pointSize = geometry.unk0->count.splineCountWord * 8;
    allocationSize = actorSize + lineSize + effectSizeBytes + pointSize;
    block = slowAllocate(allocationSize);
    allocationField->block = block;
    allocationField->actorCount = selectedCount;
    if (block == NULL) {
        printf(Str_8729738, allocationSize);
    }
    actorBase = (EnvironmentActorSlot*)block->address;
    allocationField->actorContainer = (EnvironmentActorContainer*)actorBase;
    lineObjects = (EnvironmentObject*)((unk8*)actorBase + actorSize);
    effect = (EnvironmentNode*)((unk8*)lineObjects + lineSize);
    points = (EnvironmentPointEntry*)((unk8*)effect + effectSizeBytes);
    allocationField->lineObjects = lineObjects;
    allocationField->points = (unk32)points;
    allocationField->effect = effect;
    allocationField->effectCount = effectCount;
    __fastMemoryClearARM(0, lineObjects, lineSize + effectSizeBytes + pointSize);
    {
        GeometryLine* geometryLine;

        lineIndex = 0;
        if (lineIndex < geometry.unk0->lineCount) {
            do {
                geometryLine = &geometry.unkC[lineIndex];
                metadata = GetLineMetaData(&geometry, lineIndex);
                if (metadata != NULL) {
                    metaobject = getLineMetaobjectByTypeAndId(
                        &geometry, metadata, 1, 0xAF90);
                    if (metaobject != NULL) {
                        points[metaobject->unk8].geometry = geometryLine;
                        points[metaobject->unk8].line = (unk16)lineIndex;
                    }
                }
                lineIndex++;
            } while (lineIndex < geometry.unk0->lineCount);
        }
    }
    effect = allocationField->effect;
    lineIndex = 0;
    spriteId = 0;
    actorState = &actorBase->state90;
    if (lineIndex < selectedCount) {
        do {
            lineObject = &lineObjects[selectedLines[lineIndex]];
            lineObject->unk0 = actorBase;
            point0 = &geometry.unk4[geometry.unkC[selectedLines[lineIndex]].point0];
            point1 = &geometry.unk4[geometry.unkC[selectedLines[lineIndex]].point1];
            x = point0->x >> 3;
            y = point0->y >> 3;
            z = point0->z >> 3;
            actor_8057C58(
                actorBase, actorConfigs[lineIndex], _gameData->unk434, x, y, z, -1);
            actorBase->unk39 = 0;
            actorState->unk20 = (void*)convert3DCoordsto2DCoords;
            actorBase->unk68 = 0;
            actorState->unk2C = (unk16)(spriteId + 0x200);
            actorState->unk24 = selectedLines[lineIndex];
            actorState->unk0 = (void*)((unk8*)allocationField + 0x1C);
            x = (point0->x + point1->x) << 4;
            y = (point0->y + point1->y) << 4;
            xDelta = x - actorBase->unk4.x;
            actorBase->unk4.x = x;
            yDelta = y - actorBase->y;
            actorBase->y = y;
            actorState->unk4 = callbackData;
            actor_80585F8(actorBase, 0, 0, 1, 1);
            actor_805C48C(actorBase, &geometry, 0, 0);
            actorState->unk4 = NULL;
            actorBase->unk4.x -= xDelta;
            actorBase->y -= yDelta;
            metadata = GetLineMetaData(&geometry, selectedLines[lineIndex]);
            if (metadata != NULL) {
                metaobject = getLineMetaobjectByTypeAndId(
                    &geometry, metadata, 1, 0xF70C);
                actorType = 0;
                if (metaobject != NULL) {
                    actorType = metaobject->unk8;
                }
                if (actorType == 1) {
                    actorType = 2;
                } else if (actorType == 2) {
                    actorType = 1;
                } else {
                    actorType = 0;
                }
                actorBase->unk3C = &_gameData->unk434[actorType];
                metaobject = getLineMetaobjectByTypeAndId(
                    &geometry, metadata, 2, 0xFB93);
                if (metaobject != NULL) {
                    sprite = allocSprite((u16)(spriteId + 0x200));
                    LoadSpriteSheet(sprite, (const void*)metaobject->unk8, 0, 0, 0, actorType, 0, 0);
                    lineObject->sprite = sprite;
                    lineObject->unk8 = 0;
                    lineObject->unkC = 0;
                }
                metaobject = getLineMetaobjectByTypeAndId(
                    &geometry, metadata, 1, 0xF4FA);
                if (metaobject != NULL) {
                    effect->geometry = &geometry.unkC[selectedLines[lineIndex]];
                    effect->unk8 = (point0->x + point1->x) << 4;
                    effect->unkC = lineObject->unk12 << 8;
                    effect->unk10 = 0;
                    effect->unk12 = 0;
                    effect->unk14 = SpriteSheet_86FAEAC;
                    effect->actor = actorBase;
                    effect++;
                }
                transformMeta = (EnvironmentActorTransformMeta*)getLineMetaobjectByTypeAndId(
                    &geometry, metadata, 4, 0xD679);
                if (transformMeta != NULL) {
                    actorBase->unk4.x += transformMeta->x << 8;
                    actorBase->y += transformMeta->y << 8;
                    actorBase->z += transformMeta->z << 8;
                }
                metaobject = getLineMetaobjectByTypeAndId(
                    &geometry, metadata, 1, 0xBF84);
                if (metaobject != NULL) {
                    lineObject->unk3A = (unk16)metaobject->unk8;
                } else {
                    lineObject->unk3A = 0;
                }
                offsetMeta = (EnvironmentActorOffsetMeta*)getLineMetaobjectByTypeAndId(
                    &geometry, metadata, 0xE, 0xD679);
                if (offsetMeta != NULL) {
                    ActorSetSpriteOffset(actorBase, offsetMeta->x, offsetMeta->y);
                }
                if (getLineMetaObjectBytype(
                        &geometry, metadata, 0xB) != NULL) {
                    lineObject->unk10 |= 1;
                }
                lineObject->unk14 = point0->x + point1->x - (actorBase->unk4.x >> 5);
                lineObject->unk18 = point0->y + point1->y - (actorBase->y >> 5);
                lineObject->unk1C = point0->z - (actorBase->z >> 5);
                lineObject->unk20 = point1->x - (actorBase->unk4.x >> 5);
                lineObject->unk24 = point1->y - (actorBase->y >> 5);
                lineObject->unk28 = point1->z - (actorBase->z >> 5);
                lineObject->unk38 = 0;
                lineObject->unk3C = 0;
            }
            actorState = (EnvironmentActorState*)((unk8*)actorState + 0xC4);
            actorBase = (EnvironmentActorSlot*)((unk8*)actorBase + 0xC4);
            lineIndex++;
        } while (lineIndex < selectedCount);
    }
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/8054768-initLevelEnvironmentActors.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8054c9c-renderEnvironmentActors.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8054eb4-updateEnvirenmentActors.s");

void sub_8054FE0(void)
{
    SpriteEntry* zero;
    s32 actorCount;
    s32 nodeCount;
    EnvironmentActorContainer* actorContainer;
    EnvironmentActorSlot* actor;
    EnvironmentNode* node;
    EnvironmentObject* object;

    actorCount = _gameData->unkC84;
    nodeCount = _gameData->unkC80;
    actorContainer = _gameData->unkC7C;
    node = _gameData->unkC78;
    if (actorCount-- != 0) {
        actor = actorContainer->slots;
        do {
            object = GetStruct4(actor->objectId);
            if (actor->sprite != NULL) {
                sub_8060A94(actor->sprite);
            }
            zero = 0;
            actor->sprite = zero;
            if (object->sprite != NULL) {
                sub_8060A94(object->sprite);
            }
            object->sprite = zero;
            actor++;
        } while (actorCount-- != 0);
    }
    while (nodeCount-- != 0) {
        if (node->sprite != NULL) {
            sub_8060A94(node->sprite);
        }
        node++;
    }
    if (_gameData->unkC74 != NULL) {
        deallocateBlock(_gameData->unkC74);
    }
    _gameData->unkC74 = NULL;
    _gameData->unkC84 = 0;
    _gameData->unkC7C = NULL;
    _gameData->unkC88 = NULL;
    _gameData->unkC8C = 0;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/80550b8.s");

void initProjectileSystem(void)
{
    GameData* gameData;
    ProjectileSystem* system;
    Palette* palette1;
    Palette* palette2;
    Palette* palette3;

    gameData = _gameData;
    system = &gameData->projectileSystem;
    newProjectileSystem(system, 3, SpriteSheet_86FBF94, 6, &gameData->unk434);
    palette1 = &system->palette34;
    sub_80631B0(palette1, (void*)PLTT, 0, 0x180, 8);
    sub_8063640(palette1, 0x100);
    palette2 = &system->palette48;
    sub_80631B0(palette2, (void*)PLTT, 0, 0x30, 8);
    sub_8063220(palette2, 0x1F, 8, 8);
    palette3 = &system->palette5C;
    sub_80631B0(palette3, (void*)PLTT, 0, 0x100, 8);
    sub_8063544(palette3, 0xC0, 0xE, 0, 0, 10, 10, 10, 0x1F);
    system->unk70 = 0;
    system->unk72 = 0;
    system->unk74 = 0;
    system->unk7A = 0;
    system->unk76 = 0;
    system->unk78 = 0;
    system->unk28 = 0;
    system->unk2C = 0;
    system->unk30 = 0;
    system->unk7C = 0x560;
    system->unk7E = 0x560;
    system->unk80 = 0;
    system->unk84 = 0;
    system->unk88 = 0;
    *(vu16*)REG_WININ = 0;
    *(vu16*)(REG_WINOUT) = 0xFFFF;
    *(vu16*)REG_WIN0H = 0xF0;
    *(vu16*)(REG_WIN1H) = 0xF0;
    *(vu16*)REG_WIN0V = ((system->unk7C << 16) >> 20);
    *(vu16*)(REG_WIN1V) = (0xA0 - (((system->unk7C << 16) >> 20))) << 8 | 0xA0;
    *(vu16*)REG_DISPCNT |= 0x6000;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8055274.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055288.s");
