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

extern const unk8 SpriteSheet_86FBF94[];

#if 0
extern void ActorSetSpriteOffset(EnvironmentActorSlot*, unk16, unk16);
extern void LoadSpriteSheet(SpriteEntry*, const void*, unk32, unk32, unk32, unk32, unk32, unk32);
extern void actor_80585F8(EnvironmentActorSlot*, unk16, unk16, unk16, unk16);
extern void actor_805C48C(EnvironmentActorSlot*, LevelGeometryAddresses*, unk32, unk32);
extern void sub_8056B54(void);
extern void _return_false(void);
extern void sub_80550B8(void);
extern const unk8 SpriteSheet_86FAEAC[];
extern const unk8 Str_8729738[];
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
                        points[metaobject->unk8.word].geometry = geometryLine;
                        points[metaobject->unk8.word].line = (unk16)lineIndex;
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
                    actorType = metaobject->unk8.word;
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
                    sprite = allocSprite((unk16)(spriteId + 0x200));
                    LoadSpriteSheet(sprite, (const void*)metaobject->unk8.word, 0, 0, 0, actorType, 0, 0);
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
                    lineObject->unk3A = (unk16)metaobject->unk8.word;
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

#if 0
void renderEnvironmentActors(void)
{
    unk32 actorCount;
    unk32 effectCount;
    Actor* actor;
    ActorRenderState* actorState;
    EnvironmentNode* effect;
    DisplayRecord* camera;
    s32 x;
    s32 y;
    s32 temp;
    unk32 xDelta;
    unk32 yDelta;
    s16 xOffset;
    s16 yOffset;
    EnvironmentObject* lineObject;
    SpriteEntry* lineSprite;
    SpriteEntry* sprite;

    actorCount = _gameData->unkC84;
    effectCount = _gameData->unkC80;
    actor = (Actor*)_gameData->unkC7C;
    effect = _gameData->unkC78;
    camera = (DisplayRecord*)nullsub_12(&_gameData->unk434);
    if (actorCount == 0)
        return;
    actorCount--;
    actorState = &actor->stateA0;
    do {
        x = ((actor->x - actor->y) >> 8) - (xOffset = actorState->unk0);
        y = ((((actor->x + actor->y) >> 1) - actor->z) >> 8) - (yOffset = actorState->unk2);
        xDelta = sub_8055274();
        yDelta = sub_8055288();
        actorState->unk0 += xDelta;
        actorState->unk2 += yDelta;
        renderActor2(actor);
        actorState->unk0 = xOffset;
        actorState->unk2 = yOffset;
        lineObject = GetStruct4(actorState->unk14);
        if (lineObject != NULL) {
            lineSprite = lineObject->sprite;
            if (lineSprite != NULL) {
                sprite = actorState->unk18;
                if (sprite != NULL)
                    lineSprite->frame.word = sprite->frame.word;
                if (actor->unk3C != NULL) {
                    x -= actor->unk3C->unk40 >> 8;
                    y -= actor->unk3C->unk44 >> 8;
                }
                temp = ((lineObject->y + y) - yDelta) << 8;
                if ((unk32)(temp + 0x4000) > 0xE000)
                    temp = 0xA000;
                lineSprite->x = ((lineObject->x + x) - xDelta) << 8;
                lineSprite->y = temp;
            }
        }
        actorState = (ActorRenderState*)((unk8*)actorState + 0xC4);
        actor = (Actor*)((unk8*)actor + 0xC4);
        actorCount--;
    } while (actorCount != 0);
    if (effectCount == 0 || effect == NULL)
        return;
    effectCount--;
    do {
        y = (((effect->x + effect->y) >> 1) - effect->z) - camera->unk44;
        x = (effect->x - effect->y - camera->unk40) + 0xFFFFFC00;
        if (x < -0x2000 || y < -0x2000 || x > 0xEFFF || y > 0x9FFF) {
            if (effect->sprite != NULL)
                sub_8060A94(effect->sprite);
            effect->sprite = NULL;
        } else if (effect->sprite != NULL) {
            sprite = effect->sprite;
            if (effect->actor->unk70 == 0) {
                sub_8060A94(sprite);
                effect->sprite = NULL;
            } else {
                sprite->x = x;
                sprite->y = y;
            }
        } else if (effect->actor->unk70 != 0) {
            sprite = allocSprite(0x80);
            if (sprite != NULL) {
                LoadSpriteSheet(sprite, effect->spriteSheet, x, y, 3 & effect->unk12, 0, 0,
                    effect->unk10);
            }
            effect->sprite = sprite;
        }
        effect++;
        effectCount--;
    } while (effectCount != 0);
}

#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/8054c9c-renderEnvironmentActors.s");
#if 0
extern void sub_8054278(void*, unk16);
extern void sub_80584B8(Actor*);

void updateEnvirenmentActors(void)
{
    unk32 count;
    unk8* actor;
    unk8* metaBase;
    unk8* record;
    unk8* meta;
    unk8* struct4;
    unk8* p1;
    unk8* p2;
    unk32 remaining;
    s32 oldX;
    s32 oldY;
    s32 oldZ;

    count = _gameData->unkC84;
    record = (unk8*)_gameData->unkC7C;
    metaBase = (unk8*)_gameData + 0x65C;
    actor = record;
    remaining = count;
    if (remaining == 0)
        return;
    count--;
    do {
            index = *(unk32*)(actor + 0xB4);
        struct4 = (unk8*)GetStruct4(index);
        meta = *(unk8**)(metaBase + 0xC) + (index << 5);
        if (struct4 != NULL && (*(unk16*)(struct4 + 0x10) & 1) != 0) {
            p1 = *(unk8**)(metaBase + 4) + *(unk32*)(meta + 0) * 0x10;
            p2 = *(unk8**)(metaBase + 4) + *(unk32*)(meta + 4) * 0x10;
            *(unk32*)(p1 + 0) = (*(s32*)(actor + 4) >> 5) + *(s32*)(struct4 + 0x14);
            *(unk32*)(p1 + 4) = (*(s32*)(actor + 8) >> 5) + *(s32*)(struct4 + 0x18);
            *(unk32*)(p1 + 8) = (*(s32*)(actor + 0xC) >> 5) + *(s32*)(struct4 + 0x1C);
            *(unk32*)(p2 + 0) = (*(s32*)(actor + 4) >> 5) + *(s32*)(struct4 + 0x20);
            *(unk32*)(p2 + 4) = (*(s32*)(actor + 8) >> 5) + *(s32*)(struct4 + 0x24);
            *(unk32*)(p2 + 8) = (*(s32*)(actor + 0xC) >> 5) + *(s32*)(struct4 + 0x28);
        }
        if (*(s16*)(struct4 + 0x38) != 0) {
            *(unk16*)(struct4 + 0x38) -= 1;
            if (*(s16*)(struct4 + 0x38) == 0) {
                *(unk32*)(actor + 0x40) = *(unk32*)(struct4 + 0x2C);
                *(unk32*)(actor + 0x44) = *(unk32*)(struct4 + 0x30);
                *(unk32*)(actor + 0x48) = *(unk32*)(struct4 + 0x34);
            }
        }
        if (*(s16*)(struct4 + 0x3C) != 0) {
            *(unk16*)(struct4 + 0x3C) -= 1;
            if (*(s16*)(struct4 + 0x3C) == 0)
                sub_8054278(metaBase, *(unk16*)(struct4 + 0x3E));
        }
        oldX = *(s32*)(actor + 4);
        oldY = *(s32*)(actor + 8);
        oldZ = *(s32*)(actor + 0xC);
        sub_80584B8((Actor*)actor);
        *(unk32*)(struct4 + 0x40) = *(s32*)(actor + 4) - oldX;
        *(unk32*)(struct4 + 0x44) = *(s32*)(actor + 8) - oldY;
        *(unk32*)(struct4 + 0x48) = *(s32*)(actor + 0xC) - oldZ;
        actor += 0xC4;
    } while (count-- != 0);
}
#endif
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

unk32 sub_8055274(void)
{
    ProjectileSystem* projectileSystem;

    projectileSystem = &_gameData->projectileSystem;
    return projectileSystem->unk2C;
}

unk32 sub_8055288(void)
{
    ProjectileSystem* projectileSystem;

    projectileSystem = &_gameData->projectileSystem;
    return projectileSystem->unk30;
}
