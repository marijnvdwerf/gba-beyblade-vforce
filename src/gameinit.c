#include <agb/types.h>

#include "include_asm.h"
#include "unsorted.h"

extern void sub_8053F0C(unk32);
extern void nullsub_12(void*);
extern unk32 getSomeLevelID(void);
extern unk32 GetLevelDescriptionNo(void);
extern LevelDescription* getLevelDescription2(void);
extern void emptyBeybladeActorData(void);
extern void initRiders(void);
extern void initLevelEnvironmentActors(u16);
extern void initEventListeners(unk32);
extern void initCollectables(u16);
extern void initTutorialManagement(u16);
extern void nullsub_2(void);
extern void LoadHUD(void);
extern void sub_804F800(s32);
extern void initKeyRecording(unk32);
extern void sub_805AAEC(unk32, u16);
extern LevelState* sub_8051734(void);
extern void sub_805AB38(void);
extern void sub_8051640(unk32);
extern unk32 sub_8051744(void);
extern void StoreLevelVar14(unk32);
extern void sub_8049234(unk32);
extern unk32 sub_80518F0(void);
extern const u8 Str_87294CC[];
extern void sub_8060CDC(void*);
extern void sub_8061204(void*);
extern void deallocBeybladeActorData(void);
extern void sub_80538C0(void);
extern void sub_804B4A4(void*);
extern void sub_8054FE0(void);
extern void deallocEventListeners(void);
extern void nullsub_7(void);
extern void sub_804A72C(void);
extern void nullsub_4(void);
extern void sub_804FEE8(void);
extern void sub_805BA3C(GeometryAddressTable*);
extern void deallocateQuadTree(QuadTree*);

void initGame(void)
{
    AllocatedBlock* block;

    block = slowAllocate(0x1644);
    _levelDataBlockPtr = block;
    _gameData = (GameData*)block->address;
    __fastMemoryClearARM(0, &_gameData->unk1620, 0x18);
    _gameData->unkC24 |= 0xFFFF;
    _gameData->unkC28 = -1;
    _gameData->unkC2C = -1;
    _gameData->unkC26 |= 0xFFFF;
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
    _gameData->unkC24 |= 0xFFFF;
    _gameData->unkC28 = -1;
    _gameData->unkC2C = -1;
    _gameData->unkC26 |= 0xFFFF;
    _gameData->unkC6C |= 0xFFFF;
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
        printf(Str_87294CC, 0x2990);
    }
    _gameData->unk428 = ridersBlock;
    _gameData->unk42C = ridersBlock->address;
    initRiders();
    levelIdCopy = levelId;
    initLevelEnvironmentActors((u16)levelId);
    initEventListeners(levelId);
    levelIdCopy = (u16)levelId;
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

INCLUDE_ASM("asm/dump/804a388-tutorial/8053600-initRiders.s");

void sub_80538C0(void)
{
    s32 i;
    void* rider;

    for (i = 0; i < (_gameData->unk430 + 1); i++) {
        if (i != 0)
            rider = &_gameData->unk42C[i - 1];
        else
            rider = _gameData;
        sub_804B4A4(rider);
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8053920.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8053954.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8053978-loadLevelGeometry.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8053990-getLevelMetadata.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80539a0-GetStruct4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80539c4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80539e8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8053b04-initCollisionData.s");

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
            value = gameData->unk234 << 4;
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
                sub_8049234(0x1C);
            } else if (levelDescription->unk11 != 0) {
                StoreLevelVar14(getLevelDescription2()->unk18);
                sub_8049234(0x1C);
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
    sub_805BA3C(&_gameData->unk65C);
    deallocateQuadTree(&_gameData->unk7A4);
    sub_8053F0C(1);
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8053d58-initGameloop2.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8053e18.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8053ef8.s");

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

INCLUDE_ASM("asm/dump/804a388-tutorial/80540c8.s");

void SetRiderGlobal(unk32 arg0)
{
    _unk3000C10[0] = arg0;
}
