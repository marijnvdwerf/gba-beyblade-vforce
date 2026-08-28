#include "rider.h"

#include <agb/memory_map.h>

#include "actor.h"
#include "beyblade.h"
#include "geometry.h"
#include "include_asm.h"
#include "memory.h"
#include "particle.h"
#include "riderphysics.h"
#include "sprite.h"
#include "unsorted.h"

extern const unk8 SpriteSheet_86FAEAC[];
extern const unk8 SpriteSheet_86FAF34[];
extern const unk8 SpriteSheet_86FB40C[];

#if 0
void initRider(RiderBase* rider, void* arg1, unk32 arg2, unk32 arg3, unk32 arg4, unk32 arg5, unk32 arg6)
{
    ActorConfig* actorConfig;
    RiderBase* base;
    Actor* actor;
    Actor* actor2;
    EnvironmentActorSlot* environmentActor;
    unk32 value;
    unk16 spriteOffset;
    unk8 enabled;

    base = rider;
    actor = &base->unk238;
    environmentActor = (EnvironmentActorSlot*)actor;
    getBeybladeData0(arg6);
    __fastMemoryClearARM(0, actor, sizeof(Actor));
    __fastMemoryClearARM(0, &environmentActor->unkA8, 8);
    actorConfig = getBeyBladeActorDataForIndex(arg6);
    base->unk2FC.unk39 = getBeybladeActorData(arg6)->unk4;
    actor_8057C58(actor, actorConfig, arg1, arg2, arg3, arg4, -1);
    ActorSetSpriteOffset((EnvironmentActorSlot*)actor, 0xF, 0x14);
    rider_8058614(actor, 0, 0, 4);
    actor_80585F0((UnkActor*)actor, 7);
    actor_80585F8((EnvironmentActorSlot*)actor, -1, -1, 1, 1);
    actor->unk90 = (unk32)_unk3000FD0;
    actor->unk94 = (unk32)_unk3000FC0;
    actor->unkB0 = (unk32)(convert3DCoordsto2DCoords + 1);
    actor->unkB4 = (unk32)rider;
    spriteOffset = 0x10;
    if (arg5 != 0)
        spriteOffset = 0x20;
    actor->unkBC = spriteOffset;
    s_rider_804C4B4(base, actor);
    base->unk4 = (RiderTemp*)base;
    actor2 = &base->unk2FC;
    actor_8057C58(actor2, (ActorConfig*)SpriteSheet_86FAEAC, arg1, 0xFFFF8300, 0xFFFF8300, 0x7D00, -1);
    sub_80585C8(actor2, 1);
    ActorSetSpriteOffset((EnvironmentActorSlot*)actor2, 8, 4);
    actor2->unk39 = 0;
    actor2->unkB0 = (unk32)(convert3DCoordsto2DCoords + 1);
    actor2->unkBC = 0x100;
    base->unk3D4 = (((arg5 * 0x10) + 0x100) << 5) + 0x06010000;
    base->unk3C8 = 0;
    base->unk3CC = 0;
    base->unk3CA = 0;
    base->unk3C0 = 0;
    base->unk3CE = arg5;
    base->unk3D8 = 0;
    base->unk3DC = 0;
    base->unk3E4 = 0;
    base->unk3E0 = 0;
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
void sub_804B4FC(unk8* target, s32 item)
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

INCLUDE_ASM("asm/dump/804a388-tutorial/804b624.s");
#if 0
void sub_804B754(void)
{
    GameData* state;
    s32 i;
    s32 offset;

    state = _gameData;
    if (state->unk1638 <= 4) {
        sub_804FE30();
        return;
    }
    i = 0;
    if (i < state->unk430) {
        offset = 0;
        do {
            if ((sub_804DA48((unk8*)state, (unk8*)_gameData->unk42C + offset, 0x80) << 24) != 0) {
                sub_804FE14();
                if ((_unk3005DA0 & 0x200) != 0) {
                    _gameData->unk1638 = 0;
                    sub_804F800(_gameData->unk1638);
                    sub_805568C();
                }
                return;
            }
            sub_804FE30();
            offset += sizeof(RiderBase);
            i++;
            if (i >= _gameData->unk430) {
                return;
            }
        } while (1);
    }
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/804b754.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804b7fc.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804b8f0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804bbf0-renderRider.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804bedc-allocFXSprite.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804bf3c.s");

void sub_804C098(RiderBase* rider)
{
    if (rider->unk3C0 != NULL) {
        sub_8060A94(rider->unk3C0);
        rider->unk3C0 = NULL;
    }
    rider->unk3E4 = 0;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804c0c0.s");

void sub_804C0EC(RiderTemp* rider, unk8 arg1)
{
    if (arg1 != 0) {
        rider->unk3CC |= 8;
    } else {
        rider->unk3CC &= 0xFFF7;
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804c118.s");

void nullsub_2(void)
{
}

void nullsub_3(void)
{
}

void nullsub_4(void)
{
}

asm(".align 2, 0\n");
