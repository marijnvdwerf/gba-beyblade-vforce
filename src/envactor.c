#include "envactor.h"

#include <agb/memory_map.h>

#include "actor.h"
#include "collision.h"
#include "debug.h"
#include "geometry.h"
#include "include_asm.h"
#include "memory.h"
#include "palette.h"
#include "projectile.h"
#include "ram.h"
#include "riderphysics.h"
#include "sprite.h"
#include "unsorted.h"

extern const SpriteTrailSheet SpriteSheet_86FBF94[];

extern const unk8 SpriteSheet_86FAEAC[];
extern const unk8 Str_8729738[];

void initLevelEnvironmentActors(u16 level)
{
    GameData* gameData;
    unk32 actorSize;
    EnvironmentActorAllocation* allocationField;
    ActorConfig* actorConfigs[0x20];
    ActorConfig* actorConfig;
    unk32 selectedLines[0x20];
    LevelGeometryAddresses geometry;
    ActorCollisionFunctions callbackData;
    s32 lineIndex;
    s32 selectedCount;
    unk32 effectCount;
    unk32 lineSize;
    unk32 effectSizeBytes;
    unk32 pointSize;
    EnvironmentObject* lineObjects;
    EnvironmentObject* lineObject;
    EnvironmentNode* effect;
    EnvironmentPointEntry* points;
    EnvironmentPointEntry* pointEntry;
    GeometryLine* geometryLine;
    GeometryPoint* point0;
    GeometryPoint* point1;
    LineMetadata* metadata;
    LineMetaObject* metaobject;
    Actor* actorBase;
    AllocatedBlock* block;
    SpriteEntry* sprite;
    LevelGeometryTable* geometryData;
    LineMetadata** metadataData;
    unk32 allocationSize;
    unk32 actorType;
    s16 spriteLayer;
    DisplayRecord* display;
    unk32 xDelta;
    unk32 yDelta;
    unk32 x;
    unk32 y;

    gameData = _gameData;
    allocationField = &gameData->environmentActors;
    geometryData = loadLevelGeometry(level);
    metadataData = getLevelMetadata(level);
    selectedCount = 0;
    effectCount = 0;
    if (metadataData == 0) {
        return;
    }
    if (geometryData == 0) {
        return;
    }
    getLevelGeometryAddresses(&geometry, geometryData);
    StoreMetadataAddr(&geometry, metadataData);
    sub_805E514(gameData->environmentActors.callbacks, 0, 0, (unk32)sub_80550B8, selectedCount);
    sub_805E50C(&callbackData, 0, sub_8056B54, _return_false);
    lineIndex = 0;
    if (selectedCount < geometry.unk0->lineCount) {
        do {
            metadata = GetLineMetaData(&geometry, lineIndex);
            if (metadata != NULL) {
                metaobject = getLineMetaobjectByTypeAndId(&geometry, metadata, 2, 0xD679);
                if (metaobject != NULL) {
                    actorConfig = metaobject->unk8.config;
                    actorConfigs[selectedCount] = actorConfig;
                    selectedLines[selectedCount++] = lineIndex;
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
    actorSize = selectedCount * sizeof(Actor);
    lineSize = geometry.unk0->lineCount * sizeof(EnvironmentObject);
    effectSizeBytes = effectCount * sizeof(EnvironmentNode);
    pointSize = geometry.unk0->count.splineCountWord * sizeof(EnvironmentPointEntry);
    allocationSize = actorSize + lineSize + effectSizeBytes + pointSize;
    block = slowAllocate(allocationSize);
    allocationField->block = block;
    allocationField->actorCount = selectedCount;
    if (block == NULL) {
        printf(Str_8729738, allocationSize);
    }
    actorBase = block->address;
    allocationField->actorContainer = actorBase;
    lineObjects = (EnvironmentObject*)((unk8*)actorBase + actorSize);
    effect = (EnvironmentNode*)((unk8*)lineObjects + lineSize);
    points = (EnvironmentPointEntry*)((unk8*)effect + effectSizeBytes);
    allocationField->lineObjects = lineObjects;
    allocationField->points = points;
    allocationField->effect = effect;
    allocationField->effectCount = effectCount;
    __fastMemoryClearARM(0, lineObjects, lineSize + effectSizeBytes + pointSize);
    lineIndex = 0;
    if (lineIndex < geometry.unk0->lineCount) {
        do {
            geometryLine = &geometry.unkC[lineIndex];
            metadata = GetLineMetaData(&geometry, lineIndex);
            if (metadata != NULL) {
                metaobject = getLineMetaobjectByTypeAndId(&geometry, metadata, 1, 0xAF90);
                if (metaobject != NULL) {
                    pointEntry = &points[metaobject->unk8.word];
                    pointEntry->geometry = geometryLine;
                    pointEntry->line = lineIndex;
                }
            }
            lineIndex++;
        } while (lineIndex < geometry.unk0->lineCount);
    }
    for (lineIndex = 0; lineIndex < selectedCount; lineIndex++) {
        lineObjects[selectedLines[lineIndex]].actor = actorBase;
        lineObject = &lineObjects[selectedLines[lineIndex]];
        geometryLine = &geometry.unkC[selectedLines[lineIndex]];
        point0 = &geometry.unk4[geometryLine->point0];
        point1 = &geometry.unk4[geometryLine->point1];
        actorType = 0;
        display = &_gameData->unk434.records[0];
        actor_8057C58(actorBase, actorConfigs[lineIndex], display, point0->x >> 3, point0->y >> 3,
            point0->z >> 3, -1);
        actorBase->unk39 = 0;
        actorBase->unkB0 = convert3DCoordsto2DCoords;
        actorBase->unk68 = 0;
        actorBase->unkBC = lineIndex * 8 + 0x200;
        actorBase->unkB4.lineIndex = selectedLines[lineIndex];
        actorBase->callbacks.unk0 = allocationField->callbacks;
        x = (point0->x + point1->x) << 4;
        xDelta = actorBase->x;
        y = (point0->y + point1->y) << 4;
        yDelta = actorBase->y;
        xDelta = x - xDelta;
        actorBase->x = x;
        yDelta = y - yDelta;
        actorBase->y = y;
        actorBase->callbacks.unk4 = &callbackData;
        actor_80585F8(actorBase, 0, 0, 1, 1);
        actor_805C48C(actorBase, &geometry, 0, 0);
        actorBase->callbacks.unk4 = NULL;
        actorBase->x -= xDelta;
        actorBase->y -= yDelta;
        metadata = GetLineMetaData(&geometry, selectedLines[lineIndex]);
        if (metadata == NULL) {
            actorBase++;
            continue;
        }
        metaobject = getLineMetaobjectByTypeAndId(&geometry, metadata, 1, 0xF70C);
        if (metaobject != NULL) {
            actorType = metaobject->unk8.word;
        }
        display = &_gameData->unk434.records[actorType];
        switch (actorType) {
        case 1:
            spriteLayer = 2;
            break;
        case 2:
            spriteLayer = 1;
            break;
        default:
            spriteLayer = 0;
            break;
        }
        actorBase->unk3C = display;
        metaobject = getLineMetaobjectByTypeAndId(&geometry, metadata, 2, 0xFB93);
        if (metaobject != NULL) {
            sprite = allocSprite(lineIndex * 8 + 0x200);
            LoadSpriteSheet(sprite, metaobject->unk8.data, 0, 0, 0, spriteLayer, 0, 0);
            lineObject->sprite = sprite;
            lineObject->unk8 = 0;
            lineObject->unkC = 0;
            metaobject = getLineMetaobjectByTypeAndId(&geometry, metadata, 4, 0xFB93);
            if (metaobject != NULL) {
                lineObject->unk8 = metaobject->unk8.transform.x;
                lineObject->unkC = metaobject->unk8.transform.y;
            }
        }
        metaobject = getLineMetaobjectByTypeAndId(&geometry, metadata, 1, 0xF4FA);
        if (metaobject != NULL) {
            effect->unk4 = (point0->x + point1->x) << 4;
            effect->unk8 = (point0->y + point1->y) << 4;
            effect->unkC = lineObject->unk12 << 8;
            effect->unk12 = 0;
            effect->unk10 = 0;
            effect->unk14 = SpriteSheet_86FAEAC;
            effect->actor = actorBase;
            effect++;
        }
        metaobject = getLineMetaobjectByTypeAndId(&geometry, metadata, 4, 0xD679);
        if (metaobject != NULL) {
            actorBase->x += metaobject->unk8.transform.x << 8;
            actorBase->y += metaobject->unk8.transform.y << 8;
            actorBase->z += metaobject->unk8.transform.z << 8;
        }
        metaobject = getLineMetaobjectByTypeAndId(&geometry, metadata, 1, 0xBF84);
        if (metaobject != NULL) {
            lineObject->unk3A = metaobject->unk8.word;
        } else {
            lineObject->unk3A = 0;
        }
        metaobject = getLineMetaobjectByTypeAndId(&geometry, metadata, 0xE, 0xD679);
        if (metaobject != NULL) {
            ActorSetSpriteOffset(actorBase, metaobject->unk8.offset.x, metaobject->unk8.offset.y);
        }
        metaobject = getLineMetaObjectBytype(&geometry, metadata, 0xB);
        if (metaobject != NULL) {
            lineObject->unk10 |= 1;
        }
        lineObject->unk14 = point0->x - (actorBase->x >> 5);
        lineObject->unk18 = point0->y - (actorBase->y >> 5);
        lineObject->unk1C = point0->z - (actorBase->z >> 5);
        lineObject->unk20 = point1->x - (actorBase->x >> 5);
        lineObject->unk24 = point1->y - (actorBase->y >> 5);
        lineObject->unk28 = point1->z - (actorBase->z >> 5);
        lineObject->unk38 = 0;
        lineObject->unk3C = 0;
        actorBase++;
    }
}

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

    actorCount = _gameData->environmentActors.actorCount;
    effectCount = _gameData->environmentActors.effectCount;
    actor = _gameData->environmentActors.actorContainer;
    effect = _gameData->environmentActors.effect;
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

    count = _gameData->environmentActors.actorCount;
    record = (unk8*)_gameData->environmentActors.actorContainer;
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
    Actor* actorContainer;
    Actor* actor;
    EnvironmentNode* node;
    EnvironmentObject* object;

    actorCount = _gameData->environmentActors.actorCount;
    nodeCount = _gameData->environmentActors.effectCount;
    actorContainer = _gameData->environmentActors.actorContainer;
    node = _gameData->environmentActors.effect;
    if (actorCount-- != 0) {
        actor = actorContainer;
        do {
            object = GetStruct4(actor->unkB4.lineIndex);
            if (actor->unkB8 != NULL) {
                sub_8060A94(actor->unkB8);
            }
            zero = 0;
            actor->unkB8 = zero;
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
    if (_gameData->environmentActors.block != NULL) {
        deallocateBlock(_gameData->environmentActors.block);
    }
    _gameData->environmentActors.block = NULL;
    _gameData->environmentActors.actorCount = 0;
    _gameData->environmentActors.actorContainer = NULL;
    _gameData->environmentActors.lineObjects = NULL;
    _gameData->environmentActors.points = NULL;
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
