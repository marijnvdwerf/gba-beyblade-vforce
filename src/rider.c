#include "rider.h"

#include <agb/memory_map.h>

#include "actor.h"
#include "beyblade.h"
#include "collision.h"
#include "geometry.h"
#include "include_asm.h"
#include "levelhud.h"
#include "memory.h"
#include "particle.h"
#include "riderphysics.h"
#include "sprite.h"
#include "unsorted.h"

extern const unk8 SpriteSheet_86FAEAC[];
extern const unk8 SpriteSheet_86FAF34[];
extern const unk8 SpriteSheet_86FB40C[];
extern const unk8 SpriteSheet_86FBA14[];

#if 0
void initRider(RiderBase* rider, void* arg1, unk32 arg2, unk32 arg3, unk32 arg4, unk32 arg5, unk32 arg6)
{
    ActorConfig* actorConfig;
    RiderBase* base;
    Actor* actor;
    Actor* actor2;
    Actor* environmentActor;
    unk32 value;
    unk16 spriteOffset;
    unk8 enabled;
    typedef struct RiderTileStateDraft {
        unk32 unk0; /* 0x0 */
        unk32 unk4; /* 0x4 */
        unk32 unk8; /* 0x8 */
        unk32 unkC; /* 0xC */
    } RiderTileStateDraft;
    RiderTileStateDraft* tileStateDraft;

    base = rider;
    tileStateDraft = (RiderTileStateDraft*)&base->unk3D8;
    actor = &base->unk238;
    environmentActor = actor;
    getBeybladeData0(arg6);
    __fastMemoryClearARM(0, actor, sizeof(Actor));
    __fastMemoryClearARM(0, &environmentActor->unkA8, 8);
    actorConfig = getBeyBladeActorDataForIndex(arg6);
    base->unk2FC.unk39 = getBeybladeActorData(arg6)->unk4;
    actor_8057C58(actor, actorConfig, arg1, arg2, arg3, arg4, -1);
    ActorSetSpriteOffset(actor, 0xF, 0x14);
    rider_8058614(actor, 0, 0, 4);
    actor_80585F0(actor, 7);
    actor_80585F8(actor, -1, -1, 1, 1);
    actor->unk90 = (unk32)_unk3000FD0;
    actor->unk94 = (unk32)_unk3000FC0;
    actor->unkB0 = convert3DCoordsto2DCoords;
    actor->unkB4.rider = rider;
    spriteOffset = 0x10;
    if (arg5 != 0)
        spriteOffset = 0x20;
    actor->unkBC = spriteOffset;
    s_rider_804C4B4(base, actor);
    base->unk4 = base;
    actor2 = &base->unk2FC;
    actor_8057C58(actor2, (ActorConfig*)SpriteSheet_86FAEAC, arg1, 0xFFFF8300, 0xFFFF8300, 0x7D00, -1);
    sub_80585C8(actor2, 1);
    ActorSetSpriteOffset(actor2, 8, 4);
    actor2->unk39 = 0;
    actor2->unkB0 = convert3DCoordsto2DCoords;
    actor2->unkBC = 0x100;
    base->unk3D4 = (((arg5 * 0x10) + 0x100) << 5) + 0x06010000;
    base->unk3C8 = 0;
    base->unk3CC = 0;
    base->unk3CA = 0;
    base->unk3C0 = 0;
    base->unk3CE = arg5;
    base->unk3D8.unk0 = 0;
    base->unk3D8.unk4 = 0;
    base->unk3D8.unkC = 0;
    tileStateDraft->unk8 = 0;
    if (arg5 != 0) {
        value = (unk32)allocSprite(1);
        base->unk3C4 = (SpriteEntry*)value;
        if (value != 0)
            LoadSpriteSheet((SpriteEntry*)value, SpriteSheet_86FAF34, 0, 0, 0, 0, 0, 0);
    } else {
        base->unk3C4 = (SpriteEntry*)arg5;
    }
    enabled = 0;
    if (arg5 == 0)
        enabled = 1;
    base->unk3E8 = enabled;
    if (enabled != 0) {
        allocateParticleSystem(&base->unk3EC, 8, (void*)SpriteSheet_86FB40C, arg1);
        sub_804E584(&base->unk3EC, arg2, arg3, arg5);
    }
    base->unk3D0 = 0;
    base->unk424 = 0xFFFF;
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/804b07c-initRider.s");

void processRiderMetadata(RiderBase* rider, LevelGeometryAddresses* geometry, unk32 lineIndex)
{
    LineMetadata* metadata;
    LineMetaObject* metaobject;
    RiderBase* riderBase;
    unk32 value;
    unk16 metaId;
    s32 i;

    riderBase = rider;
    metadata = GetLineMetaData(geometry, lineIndex);
    if (metadata != NULL) {
        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0xD368);
        if (metaobject != NULL) {
            riderBase->unk228 = metaobject->unk8.word;
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0x6ACE);
        if (metaobject != NULL) {
            riderBase->unk22A = metaobject->unk8.word;
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0x5BBE);
        if (metaobject != NULL) {
            value = metaobject->unk8.word;
            riderBase->unk52 = value;
            riderBase->unk50 = value;
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0x215D);
        if (metaobject != NULL) {
            riderBase->unk210 = metaobject->unk8.word * metaobject->unk8.word;
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0x3AB4);
        if (metaobject != NULL) {
            riderBase->unk21C = metaobject->unk8.word;
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0x505B);
        if (metaobject != NULL) {
            riderBase->unk222 = metaobject->unk8.word;
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 3, 0x59C3);
        if (metaobject != NULL) {
            metaId = metaobject->unk8.half;
            i = 0;
            while (i < geometry->unk0->count.splineCountWord) {
                if (geometry->unk14[i]->unkC == metaId) {
                    riderBase->unk218 = i;
                }
                i++;
            }
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0xCF2C);
        if (metaobject != NULL) {
            riderBase->unk21A = metaobject->unk8.word;
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0xD271);
        if (metaobject != NULL) {
            SetRiderFlag(riderBase, 8);
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0x37AE);
        if (metaobject != NULL) {
            rider->unk424 = metaobject->unk8.word;
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0xF0F8);
        if (metaobject != NULL) {
            rider->unk3D0 = metaobject->unk8.word;
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0x5CF);
        if (metaobject != NULL) {
            riderBase->unk22C = metaobject->unk8.word;
        }
    }
}

void sub_804B4A4(RiderBase* arg0)
{
    sub_80588A8(&arg0->unk238);
    sub_80588A8(&arg0->unk2FC);
    if (arg0->unk420 != NULL) {
        deallocateBlock(arg0->unk420);
        arg0->unk420 = NULL;
    }
    if (arg0->unk3E8 != 0) {
        sub_804EBE8(&arg0->unk3EC);
    }
    if (arg0->unk3C4 != 0) {
        sub_8060A94(arg0->unk3C4);
    }
}

#if 0
void sub_804B4FC(LevelGeometryAddresses* target, RiderState* item)
{
    s32 i;
    unk32 value;

    sub_804B8F0(&_gameData->base, target);
    *(vu16*)REG_VCOUNT;
    if (_gameData->unk1618 == 0) {
        unk32 offset;
        RiderBase* rider = &_gameData->base;

        i = 0;
        if (i < _gameData->unk430) {
            for (offset = 0; i < _gameData->unk430; offset += sizeof(RiderBase), i++) {
                rider = (RiderBase*)((unk8*)_gameData->unk42C + offset);
                if ((rider->unk3C8 & 2) != 0 || rider->unk210 != 0 || RiderHasFlag(rider, 2) != 0)
                    sub_804B8F0(rider, target);
            }
        }
        value = *(vu16*)REG_VCOUNT;
    } else {
        value = sub_80501F8(item, _gameData->unk42C);
    }
    sub_804B754(value);
    sub_804B624();
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/804b4fc.s");

void sub_804B5C0(void)
{
    RiderBase* rider;
    s32 i;

    for (i = 0; i < _gameData->unk430 + 1; i++) {
        if (i != 0)
            rider = &_gameData->unk42C[i - 1];
        else
            rider = &_gameData->base;
        sub_804C098(rider);
    }
}

void nullsub_1(void)
{
}

#if 0
void sub_804B624(void)
{
    s32 i;
    s32 j;
    s32 k;

    i = 1;
    {
        RiderBase* riders[_gameData->unk430 + 1];
        RiderBase* rider;
        RiderBase* other;
        RiderBase* value;
        RiderBase** riderList;
        RiderBase** otherList;

        j = 0;
        if (j < _gameData->unk430 + 1) {
            riderList = riders;
            do {
                if (j != 0)
                    rider = &_gameData->unk42C[j - 1];
                else
                    rider = &_gameData->base;
                value = 0;
                if ((rider->unk3CC & 4) == 0)
                    value = rider;
                *riderList = value;
                riderList++;
                j++;
            } while (j < _gameData->unk430 + 1);
        }
        j = 0;
        while (j < _gameData->unk430) {
            rider = riders[j];
            j++;
            if (rider != NULL) {
                k = i;
                if (k < _gameData->unk430 + 1) {
                    otherList = &riders[k];
                    do {
                        other = *otherList;
                        if (other != NULL) {
                            rider_vs_rider_collision_804DB94(rider, other);
                            sub_804DAA0(rider, other);
                        }
                        otherList++;
                        k++;
                    } while (k < _gameData->unk430 + 1);
                }
                i++;
            }
        }
    }
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/804b624.s");

void sub_804B754(void)
{
    GameData* state;
    s32 i;

    state = _gameData;
    if (state->unk1638 <= 4) {
        sub_804FE30();
        return;
    }
    i = 0;
    if (i < state->unk430) {
        do {
            if (sub_804DA48(&state->base, &_gameData->unk42C[i], 0x80) != 0) {
                sub_804FE14();
                if ((_unk3005DA0 & 0x200) != 0) {
                    _gameData->unk1638 = 0;
                    sub_804F800(_gameData->unk1638);
                    sub_805568C();
                }
                return;
            }
            sub_804FE30();
            i++;
            if (i >= _gameData->unk430) {
                return;
            }
        } while (1);
    }
}

#if 0
RiderBase* sub_804B7FC(RiderBase* arg0)
{
    s32 x;
    s32 y;
    s32 z;
    s32 distance;
    s32 bestDistance;
    s32 dx;
    s32 dy;
    s32 dz;
    s32 i;
    RiderBase* candidate;
    RiderBase* best;
    Actor* coord;

    best = 0;
    bestDistance = 0x07FFFFFF;
    coord = arg0->unk0;
    x = coord->x >> 8;
    y = coord->y >> 8;
    z = coord->z >> 8;
    i = 0;
    if (i < _gameData->unk430 + 1) {
        do {
            if (i != 0)
                candidate = &_gameData->unk42C[i - 1];
            else
                candidate = &_gameData->base;
            if (candidate != arg0 && (candidate->unk3CC & 0xC) == 0
                && (RiderHasFlag(candidate, 2) << 24) == 0) {
                coord = candidate->unk0;
                dx = (coord->x >> 8) - x;
                dy = (coord->y >> 8) - y;
                dz = (coord->z >> 8) - z;
                distance = dx * dx + dy * dy + dz * dz;
                if (distance < bestDistance) {
                    bestDistance = distance;
                    best = candidate;
                }
            }
            i++;
        } while (i < _gameData->unk430 + 1);
    }
    return best;
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/804b7fc.s");

void sub_804B8F0(RiderBase* rider, LevelGeometryAddresses* target)
{
    RiderBase* riderBase = rider;
    QuadTree* quadTree;
    Actor* actor;
    QuadTreeNode* node;
    QuadTreeNode* node2;
    s32 i;
    EnvironmentObject* object;
    s32 x;
    s32 y;
    unk32 px;
    unk32 py;
    unk32 pz;
    s32 angle;

    actor = &rider->unk238;
    quadTree = &_gameData->unk7A4;
    if ((rider->unk3CC & 4) != 0)
        return;
    actor->unk3B = 0;
    rider->unk2FC.unk3B = 0;
    rider->unk1B4 = -0x40000;
    sub_804D104(rider);
    if (RiderHasFlag(rider, 0x400) == 0 && RiderHasFlag(rider, 0x200) == 0)
        sub_804CB08(rider, actor);
    sub_804D110(rider, &rider->unk238);
    x = actor->x >> 5;
    y = actor->y >> 5;
    node = GetQuadTreeNodeForPos(
        quadTree, (actor->x + actor->unk40) >> 5, (actor->y + actor->unk44) >> 5);
    node2 = GetQuadTreeNodeForPos(quadTree, x, y);
    if (rider->unk238.unk84 == -1) {
        (void)*(vu16*)REG_VCOUNT;
        if (node != NULL) {
            rider->unk11C = sub_805C9A4(&rider->unk238, target, 0, 0, node);
            if (node2 != NULL && node2 != node)
                rider->unk11C = sub_805C9A4(&rider->unk238, target, 0, 0, node2);
        }
        if (quadTree->unk48 != 0) {
            unk32* entries[quadTree->unk48];

            for (i = 0; i < quadTree->unk48; i++) {
                object = GetStruct4(quadTree->unk4C[i]);
                if (object == NULL || object->actor == NULL)
                    entries[i] = 0;
                else
                    entries[i] = &object->unk40;
            }
            rider->unk11C
                += sub_805CEB8(&rider->unk238, target, quadTree->unk4C, quadTree->unk48, entries);
        }
        sub_80561A0((unk32)actor, (unk32)target);
        (void)*(vu16*)REG_VCOUNT;
    }
    nullsub_6(actor, riderBase);
    nullsub_5(riderBase);
    px = actor->x;
    py = actor->y;
    pz = actor->z;
    riderBase->unk1A8 = px;
    riderBase->unk1AC = py;
    riderBase->unk1B0 = pz;
    sub_80584B8(actor);
    rider->unk2FC.x = rider->unk238.x;
    rider->unk2FC.y = rider->unk238.y;
    if (actor->unk84 == -1)
        rider->unk2FC.z = riderBase->unk1B4;
    else
        rider->unk2FC.z = -0x10000;
    sub_80584B8(&rider->unk2FC);
    if (RiderHasFlag(riderBase, 2) == 0) {
        angle = 0x80 - riderBase->unk62;
        if (angle < 0)
            angle = -angle;
        if (rider->unk3E8 != 0 && rider->unk208 > 0x100 && (rider->unk3CC & 8) == 0) {
            if (((_unk3000E30[0] >> 4) & 3) == 0)
                sub_804E594(&rider->unk3EC, -0x40, 0x12C, 0x46, 0x78, 2);
            if (riderBase->unk19C <= 3 && ((_unk3000E30[0] >> 4) & 3) == 1)
                sub_804E594(&rider->unk3EC, 0x40, 0x200, 0x46, 0x78, 2);
        }
    }
}

void renderRider(RiderBase* rider)
{
    Actor* actor;
    Actor* actor2;
    s32 position[3];
    s32 x;
    s32 y;
    s32 screenX;
    unk32 screenY;
    s32 shift;
    s32 layer;
    unk32 mode;

    actor = &rider->unk238;
    actor2 = &rider->unk2FC;
    if ((rider->unk3CC & 0xC) != 0) {
        if (rider->unk238.unkB8 != NULL) {
            sub_8060A94(rider->unk238.unkB8);
            rider->unk238.unkB8 = NULL;
        }
        if (rider->unk2FC.unkB8 != NULL) {
            sub_8060A94(rider->unk2FC.unkB8);
            rider->unk2FC.unkB8 = NULL;
        }
        if (rider->unk3E8 == 0)
            return;
        sub_804EA88(&rider->unk3EC);
        return;
    }
    if (actor->unkB0 != NULL) {
        actor->unkB0(actor, position);
        x = position[0] >> 8;
        y = position[1] >> 8;
    } else {
        x = actor->x >> 8;
        y = actor->y >> 8;
    }
    if (actor->unk3C != NULL) {
        x -= actor->unk3C->field_40 >> 8;
        y -= actor->unk3C->field_44 >> 8;
    }
    screenX = x;
    screenY = y;
    if (rider->unk3C4 != NULL) {
        shift = 8 - ((0xAA * rider->unk208 + 0x8000) >> 16);
        layer = 0;
        if (RiderHasFlag(rider, 8) != 0) {
            layer = Unk_874CC3C[(unk8)((sub_8057C40() >> 4) * 4)] * 0x10;
            if (layer > 0)
                layer = -layer;
        }
        rider->unk3C4->x = (screenX << 8) - 0x700;
        rider->unk3C4->y = (screenY << 8) - 0x1C00 + layer;
        rider->unk3C4->frame.word = shift >= 0 ? shift : 8;
        rider->unk3C4->oam_attr_2
            = (rider->unk3C4->oam_attr_2 & 0xFFF) | ((0xF - rider->unk3D0) << 12);
    }
    if (screenY + 0x40 > 0x108 || screenX < -0x40 || screenX > 0x118) {
        rider->unk3C8 &= 0xFFFD;
    } else {
        rider->unk3C8 |= 2;
    }
    if ((rider->unk3C8 & 2) != 0) {
        if (RiderHasFlag(rider, 0x1000000) != 0 && rider->unk3C0 == NULL) {
            allocFXSprite(rider);
        } else if (RiderHasFlag(rider, 0x1000000) == 0 && rider->unk3C0 != NULL) {
            sub_804C098(rider);
        }
    } else if (rider->unk3C0 != NULL) {
        sub_804C098(rider);
    }
    if (rider->unk3C0 != NULL)
        sub_804BF3C(rider);
    renderActor2(&rider->unk238);
    if (actor->unkB8 != NULL) {
        actor->unkB8->oam_attr_2 = (actor->unkB8->oam_attr_2 & 0xFFF) | (rider->unk3CF << 12);
        if (actor->unkB8 != NULL)
            rider->unk2FC.unkBC = actor->unkB8->var22 + 2;
    }
    renderActor2(&rider->unk2FC);
    if (RiderHasFlag(rider, 4) != 0 || actor->z < 0) {
        if (actor->z >= 0)
            mode = rider->unk1C0;
        else
            mode = 3;
        if (actor->unkB8 != NULL)
            actor->unkB8->oam_attr_2 = (actor->unkB8->oam_attr_2 & 0xF3FF) | ((mode & 3) << 10);
        if (actor2->unkB8 != NULL)
            actor2->unkB8->oam_attr_2 = (actor2->unkB8->oam_attr_2 & 0xF3FF) | ((mode & 3) << 10);
    }
    if (rider->unk3E8 != 0) {
        sub_804E560(&rider->unk3EC, actor->x, actor->y, actor->z);
        sub_804EA88(&rider->unk3EC);
    }
}

void allocFXSprite(RiderBase* rider)
{
    SpriteEntry* sprite;

    if (rider->unk3C0 == NULL) {
        sprite = allocSprite(0xFF);
        if (sprite != NULL) {
            LoadSpriteSheet(sprite, SpriteSheet_86FBA14, 0, 0, 2, 0, 0, 0);
            sprite->var20 |= 1;
            sprite->var24 = (rider->unk3CE << 4) + 0x100;
        }
        rider->unk3C0 = sprite;
    }
}

void sub_804BF3C(RiderBase* rider)
{
    SpriteEntry* fxSprite;
    SpriteEntry* sprite;
    BGLayer* layer;
    RiderTileState* tiles;
    unk32 dx;
    unk32 dy;
    s32 fxX;
    s32 fxY;
    s32 x;
    s32 y;
    s32 rowCount;
    s32 clearCount;
    unk32 newRows;

    fxSprite = rider->unk3C0;
    sprite = rider->unk238.unkB8;
    layer = rider->unk238.unk3C;
    tiles = &rider->unk3D8;
    if (sprite == NULL) {
        return;
    }
    x = (sprite->x + layer->field_C) >> 11;
    y = (sprite->y + layer->field_10) >> 11;
    dx = x - (layer->field_C >> 11);
    dy = y - (layer->field_10 >> 11);
    fxX = (dx << 11) - (layer->field_C & 0x700);
    fxY = (dy << 11) - (layer->field_10 & 0x700);
    rowCount = (rider->unk3CA + 8 + ((sprite->y - fxY) >> 8)) >> 3;
    if (rowCount > 4) {
        rowCount = 4;
    }
    fxSprite->x = fxX;
    fxSprite->y = fxY;
    if (x != tiles->unk0 || y != tiles->unk4) {
        clearCount = tiles->unkC - rowCount;
        sub_805EF18(&_gameData->unk434, x, y, 4, rowCount, rider->unk1C0 - 1, rider->unk3D4[0]);
        if (clearCount > 0) {
            __fastMemoryClearARM(0, &rider->unk3D4[rowCount], clearCount * sizeof(RiderTileRow));
        }
    } else if (rowCount > tiles->unkC) {
        newRows = rowCount - tiles->unkC;
        sub_805EF18(&_gameData->unk434, x, y + tiles->unkC, 4, newRows, rider->unk1C0 - 1,
            rider->unk3D4[tiles->unkC]);
    } else if (rowCount < tiles->unkC) {
        __fastMemoryClearARM(
            0, &rider->unk3D4[rowCount], (tiles->unkC - rowCount) * sizeof(RiderTileRow));
    }
    tiles->unk0 = x;
    tiles->unk4 = y;
    tiles->unkC = rowCount;
}

void sub_804C098(RiderBase* rider)
{
    if (rider->unk3C0 != NULL) {
        sub_8060A94(rider->unk3C0);
        rider->unk3C0 = NULL;
    }
    rider->unk3D8.unkC = 0;
}

void sub_804C0C0(RiderBase* rider)
{
    rider->unk3CC |= 4;
    if (rider->unk3C4 != NULL)
        sub_8060A94(rider->unk3C4);
    rider->unk3C4 = NULL;
}

void sub_804C0EC(RiderBase* rider, unk8 arg1)
{
    if (arg1 != 0) {
        rider->unk3CC |= 8;
    } else {
        rider->unk3CC &= 0xFFF7;
    }
}

void sub_804C118(RiderBase* rider)
{
    if (rider->unk424 != -1 && sub_80570D4(rider->unk424) == 0) {
        sub_8057104(rider->unk424, 1);
        getItem(rider->unk424);
    }
}

void nullsub_2(void)
{
}

void nullsub_3(void)
{
}

void nullsub_4(void)
{
}

ASM_ZEROPAD
