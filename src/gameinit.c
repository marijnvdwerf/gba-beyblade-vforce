#include "gameinit.h"

#include <agb/memory_map.h>
#include <agb/types.h>

#include "actor.h"
#include "beyblade.h"
#include "camera.h"
#include "collectable.h"
#include "envactor.h"
#include "event.h"
#include "frontend.h"
#include "gameloop.h"
#include "gamestate.h"
#include "geometry.h"
#include "hud.h"
#include "include_asm.h"
#include "keystate.h"
#include "leveldesigns.h"
#include "levelhud.h"
#include "math.h"
#include "multiplayer.h"
#include "music.h"
#include "rider.h"
#include "riderphysics.h"
#include "spritetext.h"
#include "tutorial.h"
#include "unsorted.h"

void initGame(void)
{
    AllocatedBlock* block;

    block = slowAllocate(0x1644);
    _levelDataBlockPtr = block;
    _gameData = (GameData*)block->address;
    __fastMemoryClearARM(0, &_gameData->unk1620, 0x18);
    _gameData->unkC24 |= -1;
    _gameData->unkC28 = -1;
    _gameData->unkC2C = -1;
    _gameData->unkC26 |= -1;
    _gameData->unk7A0 = 0;
    _gameData->unkB56 = 0;
    _gameData->unkB34 = 0;
    _gameData->unk1638 = 0;
    _gameData->unk1640 = 0;
    _gameData->unkB58 = 0;
    sub_8053F0C(1);
}

void initGameLoop(void)
{
    unk32 levelId;
    u16 levelIdCopy;
    AllocatedBlock* ridersBlock;

    nullsub_12(&_gameData->unk434);
    levelId = getSomeLevelID();
    if (sub_8051780(2) != 0 && sub_8051780(0x20) == 0) {
        _currentGameState->unk0 = _currentGameState->unk6C4;
    }
    GetLevelDescriptionNo();
    getLevelDescription2();
    _gameData->unk161C = 0;
    _gameData->unk998 = 0;
    _gameData->unkC24 |= -1;
    _gameData->unkC28 = -1;
    _gameData->unkC2C = -1;
    _gameData->unkC26 |= -1;
    _gameData->unkC6C |= -1;
    _gameData->unkB53 = 0;
    _gameData->unkC6E = 0;
    _gameData->unk163C = 0;
    if (_gameData->unk1618 == 0) {
        _gameData->unk430 = 10;
    } else {
        _gameData->unk430 = 1;
    }
    sub_8053F0C(0);
    _gameData->unk161B = 0;
    _gameData->unk1641 = 0;
    emptyBeybladeActorData();
    _gameData->unk978 = _unk3000E30[0];
    _gameData->unk988 = 0;
    _gameData->unk98C = 0;
    _gameData->unk990 = 0;
    _gameData->unk994 = 0;
    _gameData->unk91C = 0;
    ridersBlock = slowAllocate(0x2990);
    if (ridersBlock == NULL) {
        printf("Error allocating %i bytes for riders in initGameLoop()\n", 0x2990);
    }
    _gameData->unk428 = ridersBlock;
    _gameData->unk42C = ridersBlock->address;
    initRiders();
    levelIdCopy = levelId;
    initLevelEnvironmentActors(levelId);
    initEventListeners(levelId);
    levelIdCopy = levelId;
    initCollectables(levelIdCopy);
    initTutorialManagement(levelIdCopy);
    nullsub_2();
    LoadHUD();
    sub_804F800(_gameData->unk1638);
    _gameData->unkC28 = 0;
    _gameData->unk984 = 0;
    _gameData->unkB22 = 0;
    _gameData->unkB20 = 0;
    _gameData->unkB24 = 0;
    _gameData->unkB28 = 0;
    _gameData->unkB26 = 0;
    _gameData->unkB2A = 0;
    _gameData->unk99C = 0;
    _gameData->unk980 = 0;
    if (sub_8051780(4) != 0) {
        _gameData->unk1638 = 0;
    }
    if (sub_8051780(1) != 0) {
        initKeyRecording(0xE10);
    }
    if (sub_8051780(2) != 0) {
        if (_currentGameState->unk6BC == 0) {
            sub_805AAEC(0, 0x8CA0);
        } else {
            sub_805AAEC(_currentGameState->unk6BC, _currentGameState->unk6C0);
        }
    }
}

void initRiders(void)
{
    LevelGeometryAddresses geometry;
    LevelDescription* levelDescription;
    LevelGeometryTable* geometryData;
    GeometryLine* multiplayerLine;
    GeometryPoint* point;
    unk32 initialized;
    unk16 lineType;
    s32 lineIndex;
    s32 multiplayerLineIndex;
    s32 x;
    s32 y;
    s32 z;
    s32 riderIndex;
    RiderBase* rider;
    GeometryLine* line;

    GetLevelDescriptionNo();
    levelDescription = getLevelDescription2();
    initialized = 0;
    riderIndex = 0;
    geometryData = loadLevelGeometry(getSomeLevelID());
    if (geometryData == NULL) {
        printf("Warning; unable to locate start points for level, no supplied collision "
               "data, in initRiders()\n");
        return;
    }
    getLevelGeometryAddresses(&geometry, geometryData);
    StoreMetadataAddr(&geometry, levelDescription->metadata);
    lineIndex = GetLineIndexOfType(&geometry, 0x86, 0);
    if (lineIndex == -1) {
        printf("Warning; no starting point located in initRiders()\n");
    } else {
        while (lineIndex >= 0) {
            line = &geometry.unkC[lineIndex];
            point = &geometry.unk4[line->point0];
            lineType = line->unk16;
            x = point->x >> 3;
            y = point->y >> 3;
            z = point->z >> 3;
            if (lineType == 0) {
                rider = &_gameData->base;
                multiplayerLine = NULL;
                if ((initialized & 1) == 0) {
                    if (_gameData->unk1618 != 0 && isMultiplayer() != 0) {
                        multiplayerLineIndex = GetLineIndexOfType(&geometry, 0x99, 0);
                        if (multiplayerLineIndex >= 0) {
                            multiplayerLine = &geometry.unkC[multiplayerLineIndex];
                            point = &geometry.unk4[multiplayerLine->point0];
                            x = point->x >> 3;
                            y = point->y >> 3;
                            z = point->z >> 3;
                        } else {
                            x += (SinTable[line->unk8 & 0xFF] * 0x20) >> 8;
                            y += -(SinTable[(line->unk8 & 0xFF) + 0x40] * 0x20) >> 8;
                            printf("unable to find multiplayer starting point for rider %i\n",
                                rider->unk3CE);
                        }
                    }
                    initRider(rider, &_gameData->unk434, x, y, z + 0x80, lineType, sub_8051820());
                    processRiderMetadata(rider, &geometry, lineIndex);
                    if (multiplayerLine != NULL) {
                        rider->unk200 = multiplayerLine;
                    } else {
                        rider->unk200 = line;
                    }
                    sub_804E1FC(rider, line->unk8);
                    sub_804C888(rider, 1);
                    initialized |= 1;
                } else {
                    printf("attempting to reinitialise the primary rider in initRiders()\n");
                }
                if (_gameData->unk1618 != 0) {
                    rider = &_gameData->unk42C[riderIndex];
                    if (riderIndex > 9) {
                        printf("Warning, no more slots available to allocate Riders in "
                               "initRiders()\n");
                        break;
                    }
                    initRider(rider, &_gameData->unk434, 0, 0, 0, riderIndex, _gameData->unk15C0);
                    SetRiderFlag(rider, 0x04000000);
                    riderIndex++;
                }
            } else if (_gameData->unk1618 == 0) {
                rider = &_gameData->unk42C[riderIndex];
                if (riderIndex > 9) {
                    printf("Warning, no more slots available to allocate Riders in initRiders()\n");
                    break;
                }
                initRider(
                    rider, &_gameData->unk434, x, y, z, riderIndex + 1, (line->unk16 & 0xFFFF) - 1);
                processRiderMetadata(rider, &geometry, lineIndex);
                SetRiderFlag(rider, 0x04000000);
                riderIndex++;
            }
            lineIndex = GetLineIndexOfType(&geometry, 0x86, lineIndex + 1);
        }
    }
    _gameData->unk430 = riderIndex;
}

void sub_80538C0(void)
{
    s32 i;
    void* rider;

    for (i = 0; i < (_gameData->unk430 + 1); i++) {
        if (i != 0) {
            rider = &_gameData->unk42C[i - 1];
        } else {
            rider = _gameData;
        }
        sub_804B4A4(rider);
    }
}

void sub_8053920(void)
{
    _gameData->unk1638++;
    if (_gameData->unk1638 > 5) {
        _gameData->unk1638 = 5;
    }
    sub_804F800(_gameData->unk1638);
}

void sub_8053954(void)
{
    _gameData->unk1638 = 5;
    sub_804F800(_gameData->unk1638);
}

LevelGeometryTable* loadLevelGeometry(u16 arg0)
{
    return LevelDesigns[arg0].geometry;
}

LineMetadata** getLevelMetadata(u16 arg0)
{
    return getLevelDescription(arg0)->metadata;
}

EnvironmentObject* GetStruct4(unk32 arg0)
{
    if (_gameData->environmentActors.lineObjects == NULL) {
        return NULL;
    }
    return &_gameData->environmentActors.lineObjects[arg0];
}

EnvironmentPointEntry* sub_80539C4(unk32 arg0)
{
    if (_gameData->environmentActors.points == NULL) {
        return NULL;
    }
    return &_gameData->environmentActors.points[arg0];
}

void sub_80539E8(Actor* actor)
{
    s32 position[3];
    CameraLayerOffsets offsets;
    s16 levelNo;
    unk16 levelId;
    LevelDescription* description;
    GameData* gameData;
    s32 x;
    s32 y;
    s32 top;

    levelNo = GetLevelDescriptionNo();
    levelId = getSomeLevelID();
    description = getLevelDescription2();
    gameData = _gameData; // TODO: fakematch? (dead load, byte-required: sub_80539E8-2026-09-15.md)
    getLevelMetadata(levelId);
    sub_8058754(actor, position);
    x = position[0] - 0x7800;
    top = ((actor->unkA2 + (0x50 - (actor->unk11 >> 1))) << 8) - 0x8000;
    y = position[1] - top;
    if (x < 0) {
        x = 0;
    }
    if (y < 0) {
        y = 0;
    }
    offsets.layers[0].x = x >> 8;
    offsets.layers[0].y = y >> 8;
    offsets.layers[1].x = x >> 8;
    offsets.layers[1].y = y >> 8;
    offsets.layers[2].x = x >> 8;
    offsets.layers[2].y = y >> 8;
    offsets.layers[3].x = 0;
    offsets.layers[3].y = 0;
    sub_805E8A0(&_gameData->unk434, &LevelDesigns[levelNo], 0x1040, &offsets);
    _gameData->unk7A0 = levelNo;
    *(vu16*)PLTT = 0;
    if (description->unk30 != 0) {
        sub_805EEFC(&_gameData->unk434, description->unk30, description->unk34);
    }
    initCollisionData();
    _gameData->unk434.callback = sub_80522D4;
    _gameData->unkB50 = 3;
    _gameData->unkB51 = 0x40;
    _gameData->unkB52 = 0x40;
    _gameData->unkB54 = 0x40;
    _gameData->unkB55 = 0x40;
}

void initCollisionData(void)
{
    s16 levelNo;
    LevelGeometryTable* geometry;
    LineMetadata** metadata;
    LevelDescription* description;
    LevelGeometryAddresses* collision;

    levelNo = GetLevelDescriptionNo();
    metadata = getLevelMetadata(getSomeLevelID());
    description = getLevelDescription2();
    geometry = LevelDesigns[levelNo].geometry;
    collision = &_gameData->unk434.geometry;
    if (geometry != NULL) {
        newCollisionDataRam(collision, geometry, 3);
    }
    StoreMetadataAddr(&_gameData->unk434.geometry, metadata);
    initQuadTree(&_gameData->unk7A4, collision, description->unkC, 0x400, 0x80, 0x20);
}

void sub_8053B94(void)
{
    LevelDescription* levelDescription;
    LevelState* levelState;
    CurrentGameStateTail* currentGameState;
    GameData* gameData;
    s32 value;

    levelDescription = getLevelDescription2();
    levelState = sub_8051734();
    currentGameState = &_currentGameState->unk6EC;
    gameData = _gameData;
    _currentGameState->unk6BC = 0;
    if (sub_8051780(2) != 0) {
        sub_805AB38();
    }
    if (_gameData->unk161B != 0 && _gameData->unk1641 == 0) {
        currentGameState->unkC = 2;
        currentGameState->unk0 = 0;
    } else if (sub_8051780(4) == 0) {
        currentGameState->unkC = 1;
        if (_gameData->unk1641 == 0) {
            value = gameData->base.unk234 << 4;
        } else {
            value = 0x3E8;
        }
        currentGameState->unk0 = value;
        if (value < levelState->unk4) {
            currentGameState->unkC |= 4;
            levelState->unk4 = value;
            sub_8051640(0);
        }
        if ((levelState->unk0 & 1) == 0) {
            levelState->unk0 |= 1;
            sub_8051640(0);
            if ((sub_8051744() << 24) != 0) {
                StoreLevelVar14(0x29);
                sub_8049234(STATE_DIALOG);
            } else if (levelDescription->unk11 != 0) {
                StoreLevelVar14(getLevelDescription2()->unk18);
                sub_8049234(STATE_DIALOG);
            }
        }
    }
    currentGameState->unk4 = _gameData->unk163C + 1;
    currentGameState->unk8 = sub_80518F0();
}

void closeGame(void)
{
    sub_8060CDC(&_gameData->unk92C);
    sub_8061204(&_gameData->unk810);
    sub_8061204(&_gameData->unk840);
    sub_8061204(&_gameData->unk8A8);
    deallocBeybladeActorData();
    sub_80538C0();
    if (_gameData->unk428 != NULL) {
        deallocateBlock(_gameData->unk428);
        _gameData->unk428 = NULL;
    }
    sub_8054FE0();
    deallocEventListeners();
    nullsub_7();
    sub_804A72C();
    nullsub_4();
    sub_804FEE8();
    sub_805BA3C(&_gameData->unk434.geometry);
    deallocateQuadTree(&_gameData->unk7A4);
    sub_8053F0C(1);
}

void initGameloop2(void)
{
    unk32 levelId;
    GameData* gameData;

    levelId = getSomeLevelID();
    sub_804AE8C();
    sub_804AFD4(0);
    sub_8054FE0();
    deallocEventListeners();
    initLevelEnvironmentActors(levelId);
    initEventListeners(levelId);
    gameData = _gameData;
    gameData->unk434.unk224 = &gameData->base.unk238;
    gameData->unkB53 = 1;
    _gameData->unkC6E = 0x3C;
    _gameData->unk163C++;
    if (_gameData->unk1638 != 0) {
        _gameData->unk1638--;
    }
    sub_804F800(_gameData->unk1638);
    sub_804FE9C();
    sub_80538C0();
    initRiders();
    sub_8056F7C();
    sub_805BA3C(&_gameData->unk434.geometry);
    deallocateQuadTree(&_gameData->unk7A4);
    initCollisionData();
    sub_8056FAC();
    sub_804AD44();
}

void sub_8053E18(u8 arg0)
{
    if (_gameData->base.unkB8 == 0) {
        SetRiderFlag(&_gameData->base, 0x400);
    }
    if (arg0 != 0) {
        _gameData->unkC6C = 0x20;
        _gameData->unk161B = 1;
    } else {
        _gameData->unkC6C = 0x118;
        if (_gameData->unk1618 != 0) {
            if (_currentGameState->unk6A4 == 2) {
                if (RiderHasFlag(&_gameData->base, 0x08000000) == 0) {
                    sub_804FA40();
                }
            } else if (RiderHasFlag(&_gameData->base, 0x800) == 0) {
                sub_804FAD4();
            } else {
                sub_804FA40();
            }
        } else {
            sub_804FA40();
        }
    }
    if (sub_8051780(1) != 0) {
        _currentGameState->unk6C4 = _currentGameState->unk0;
        _currentGameState->unk6C0 = 0;
        sub_805AAB4();
    }
}

void sub_8053EF8(Actor* actor)
{
    _gameData->unk434.unk224 = actor;
}

void sub_8053F0C(unk32 arg0)
{
    switch (_currentGameState->unk3) {
    case 1: {
        _gameData->unk7FC = 0x200;
        _gameData->unk7FE = 0x100;
        _gameData->unk800 = 2;
        _gameData->unk802 = 1;
        _gameData->unk804 = 9;
        _gameData->unk806 = 8;
        _gameData->unk808 = 1;
        _gameData->unk80A = 0;
        return;
    }
    case 2: {
        _gameData->unk7FC = 0x100;
        _gameData->unk7FE = 0x200;
        _gameData->unk800 = 2;
        _gameData->unk802 = 1;
        _gameData->unk804 = 8;
        _gameData->unk806 = 9;
        _gameData->unk808 = 1;
        _gameData->unk80A = 0;
        return;
    }
    case 3: {
        _gameData->unk7FC = 0x100;
        _gameData->unk7FE = 2;
        _gameData->unk800 = 1;
        _gameData->unk802 = 0x200;
        _gameData->unk804 = 8;
        _gameData->unk806 = 1;
        _gameData->unk808 = 0;
        _gameData->unk80A = 9;
        return;
    }
    default: {
        _gameData->unk7FC = 0x200;
        _gameData->unk7FE = 0x100;
        _gameData->unk800 = 1;
        _gameData->unk802 = 2;
        _gameData->unk804 = 9;
        _gameData->unk806 = 8;
        _gameData->unk808 = 0;
        _gameData->unk80A = 1;
        return;
    }
    }
}

s32 sub_80540C8(s32 arg0, s32 arg1, s32 arg2)
{
    s32 result;

    result = arg0;
    if (result < 0) {
        result = -result;
    }
    result >>= 3;
    if (result > arg2) {
        result = arg2;
    }
    if (arg0 < 0) {
        result = -result;
    }
    return result;
}

void SetRiderGlobal(RiderBase* arg0)
{
    _unk3000C10 = arg0;
}
