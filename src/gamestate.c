#include "gamestate.h"

#include "battery.h"
#include "beyblade.h"
#include "include_asm.h"
#include "items.h"
#include "music.h"
#include "ram.h"
#include "sound.h"
#include "unsorted.h"

extern LevelDescription LevelDescriptions[];
extern unk8 _807572c[];
extern unk8 _807576c[];
extern unk8 _80757ac[];
extern unk8 _80757ec[];
extern unk8 _807582c[][0x50];
extern s32 _80788cc[];

void sub_80510FC(void);
void sub_80513AC(void);

void InitCurrentGameState(void)
{
    AllocatedBlock* block;

    block = slowAllocate(0xC6C);
    if (block == NULL) {
        printf("Error allocating %i bytes for CurrentGameState\n", 0xC6C);
    }
    _currentGameState = block->address;
    _currentGameState->unk6B0 = block;
    _currentGameState->unk0 = 0;
    _currentGameState->unk6B4 = 1;
    _currentGameState->unk2 = 0;
    _currentGameState->unk6E6 = 0x80;
    _currentGameState->unk6E4 = 0xFF;
    _currentGameState->unk6AC = 0;
    _currentGameState->unk6AE = 0;
    _currentGameState->unkC64 = 0;
    _currentGameState->unkC68 = 0;
    sub_80510FC();
}

void sub_80510FC(void)
{
    LevelState* levelState;
    LevelSlot* slot;
    s32 index;
    s32 j;
    unk32 found;

    _currentGameState->unk0 = 0;
    _currentGameState->unk6E8 = 0;
    _currentGameState->unk6AB = 1;
    _currentGameState->unk6C0 = 0;
    _currentGameState->unk6BC = 0;
    _currentGameState->unk6EA = 0xFFFF;
    for (index = 0; index <= 0x37; index++) {
        levelState = sub_8051720(index);
        levelState->unkC = &LevelDescriptions[index];
        levelState->unk4 = levelState->unkC->unk4;
        levelState->unk8 = levelState->unkC->unk8;
        if (index <= 0) {
            levelState->unk0 = 6;
        } else {
            levelState->unk0 = 4;
        }
        __fastMemoryClearARM(0, levelState->unk10, 4);
        __fastMemoryClearARM(0, levelState->unk14, 4);
    }
    for (index = 0; index <= 9; index++) {
        slot = sub_80516E0(index);
        slot->unk4 = _807582c[index];
        slot->unk0 = 0;
        slot->unk2 = 0;
    }
    __fastMemoryCopyARM(_807572c, _currentGameState->unk5A4, 0x40);
    __fastMemoryCopyARM(_807576c, _currentGameState->unk5E4, 0x40);
    __fastMemoryCopyARM(_80757ac, _currentGameState->unk624, 0x40);
    __fastMemoryCopyARM(_80757ec, _currentGameState->unk664, 0x40);
    _currentGameState->unk6A4 = _currentGameState->unk6A5 = _currentGameState->unk6A6
        = _currentGameState->unk6A7 = _currentGameState->unk6A8 = _currentGameState->unk6A9 = 0;
    for (index = 0; index <= 0x6C; index++) {
        found = 0;
        for (j = 0; _80788cc[j] >= 0; j++) {
            if (_80788cc[j] == index) {
                found = 1;
                break;
            }
        }
        if (index < 0) {
            found = 1;
        }
        sub_8057104(index, found);
    }
    _gameData->unk1638 = 0;
}

void sub_80512AC(void)
{
    LevelDescription* description;
    LevelState* state;
    LevelState* prerequisiteState;
    LevelDescription* nextDescription;
    s32 index;
    s32 level;
    unk32 available;

    _currentGameState->unk6EA = 0xFFFF;
    for (index = 0; index <= 0x37; index++) {
        state = sub_8051720(index);
        description = getLevelDescription(index);
        if ((state->unk0 & 2) == 0) {
            if (description->unk1C != 0) {
                available = 1;
                for (level = description->unk24; level <= description->unk28; level++) {
                    nextDescription = getLevelDescription(level);
                    prerequisiteState = sub_8051720(level);
                    if (prerequisiteState->unk4 > nextDescription->unk8) {
                        available = 0;
                        break;
                    }
                }
                if (available != 0) {
                    state->unk0 |= 2;
                    _currentGameState->unk6EA = index;
                }
            } else if (description->unk20 >= 0) {
                prerequisiteState = sub_8051720(description->unk20);
                if ((prerequisiteState->unk0 & 1) != 0) {
                    state->unk0 |= 2;
                }
            }
        }
    }
}

unk32 sub_805137C(void)
{
    s32 index;
    unk32 result;
    LevelState* state;

    result = 0;
    for (index = 0; index <= 0x37; index++) {
        state = sub_8051720(index);
        getLevelDescription(index);
        if ((state->unk0 & 2) != 0) {
            result = index;
        }
    }
    return result;
}

void sub_80513AC(void)
{
    CurrentGameSave* save;
    unk32 xorSum;
    unk32* ptr;
    unk32 i;

    save = &_currentGameState->unk6FC;
    xorSum = 0;
    ptr = &save->block0.magic;
    save->block0.magic = 0xDEAD;
    save->block0.unk4 = _currentGameState->unk0;
    save->block0.unk5 = _currentGameState->unk1;
    save->block0.unk6 = _currentGameState->unk2;
    save->block0.unk7 = _currentGameState->unk3;
    save->unk558 = _currentGameState->unk6E4;
    save->unk55A = _currentGameState->unk6E6;
    save->unk55C = _currentGameState->unkC68;
    __fastMemoryCopyARM(&_currentGameState->unk4[0], &save->levelStates[0], 0xA8 << 3);
    __fastMemoryCopyARM(&_currentGameState->unk594[0], &save->unk548[0], 0x10);
    i = 335;
    while (i-- != 0) {
        xorSum ^= *ptr++;
    }
    save->checksum = xorSum;
}

void sub_8051488(void)
{
    CurrentGameSave* save;

    save = &_currentGameState->unk6FC;
    if (sub_8051558() == 0) {
        printf("Error: checksum failed in restoreFromSavedGameState() - no saved game restored\n");
    } else {
        _currentGameState->unk0 = save->block0.unk4;
        _currentGameState->unk1 = save->block0.unk5;
        _currentGameState->unk2 = save->block0.unk6;
        _currentGameState->unk3 = save->block0.unk7;
        _currentGameState->unk6E4 = save->unk558;
        _currentGameState->unk6E6 = save->unk55A;
        _currentGameState->unkC68 = save->unk55C;
        sub_804AFD4(_currentGameState->unk6E6);
        sub_804B00C(_currentGameState->unk6E4);
        __fastMemoryCopyARM(save->levelStates, &_currentGameState->unk4, 0xA8 << 3);
        __fastMemoryCopyARM(save->unk548, _currentGameState->unk594, 0x10);
        sub_8051640(1);
    }
}

unk8 sub_8051558(void)
{
    CurrentGameSave* save;
    unk32 xorSum;
    unk32* ptr;
    unk32 i;

    save = &_currentGameState->unk6FC;
    xorSum = 0;
    ptr = &save->block0.magic;
    for (i = 334; i != -1; i--) {
        xorSum ^= *ptr++;
    }

    return xorSum == save->checksum && save->block0.magic == 0xDEAD;
}

unk8 sub_80515A4(void)
{
    BackupBlock* data;
    s32 size;
    unk8 result;

    data = &_currentGameState->unk6FC.block0;
    size = 0x564;
    sub_80513AC();
    Sound_8062694();
    result = sub_80574D0(data, 0, size);
    Sound_80626E0();
    return result;
}

unk8 sub_80515E0(void)
{
    BackupBlock* data;
    s32 size;
    unk8 result;

    data = &_currentGameState->unk6FC.block0;
    size = 0x564;
    Sound_8062694();
    result = sub_8057568(0, data, size);
    Sound_80626E0();
    return result;
}

u8 sub_8051618(void)
{
    if (sub_805137C() == 0) {
        return 1;
    }
    return 0;
}

u8 sub_805162C(void)
{
    return _currentGameState->unk6AB;
}

void sub_8051640(unk32 value)
{
    _currentGameState->unk6AB = value;
}

s32 getSomeLevelID(void)
{
    if (sub_8051780(0x20) != 0) {
        return _currentGameState->unk6C4;
    }
    return _currentGameState->unk0;
}

void sub_8051688(unk32 value)
{
    _currentGameState->unk0 = value;
}

unk8* sub_8051694(void)
{
    return _807582c[sub_80516B0()];
}

unk32 sub_80516B0(void)
{
    s8 value;

    value = _currentGameState->unk1;
    return value;
}

unk8* sub_80516C0(unk32 index)
{
    return _807582c[index];
}

void sub_80516D4(unk8 value)
{
    _currentGameState->unk1 = value;
}

LevelSlot* sub_80516E0(unk32 index)
{
    return &_currentGameState->unk544[index];
}

LevelDescription* getLevelDescription2(void)
{
    return &LevelDescriptions[getSomeLevelID()];
}

LevelDescription* getLevelDescription(s32 level)
{
    return &LevelDescriptions[level];
}

LevelState* sub_8051720(s32 index)
{
    return &_currentGameState->unk4[index];
}

LevelState* sub_8051734(void)
{
    return sub_8051720(getSomeLevelID());
}

unk8 sub_8051744(void)
{
    s32 index;

    for (index = 0; index <= 0x37; index++) {
        if ((sub_8051720(index)->unk0 & 1) == 0) {
            return 0;
        }
    }
    return 1;
}

u8 sub_805176C(void)
{
    return _currentGameState->unk6E8;
}

unk32 sub_8051780(unk32 arg0)
{
    return _currentGameState->unk6B4 & arg0;
}

void sub_8051798(unk32 value)
{
    _currentGameState->unk6B4 = value;
}

unk32 GetLevelDescriptionNo(void)
{
    LevelDescription* description;

    description = getLevelDescription2();
    if (sub_8051780(0x20) != 0) {
        return LevelDescriptions[_currentGameState->unk6C4].unk0;
    }
    return description->unk0;
}

unk8 sub_80517E8(unk32 index)
{
    if ((sub_8051720(index)->unk0 & 2) != 0) {
        return 1;
    }
    return 0;
}

unk32 sub_8051804(unk32 index)
{
    if ((sub_8051720(index)->unk0 & 4) != 0) {
        return 1;
    }
    return 0;
}

unk32 sub_8051820(void)
{
    if (sub_8051780(4) != 0 || (_currentGameState->unkC64 & 4) != 0) {
        return _currentGameState->unk2;
    }
    return getLevelDescription2()->unk90;
}

void sub_805185C(s8 value)
{
    _currentGameState->unk2 = value;
}

s32 sub_8051868(void)
{
    return sub_805749C(sub_8051820());
}

void sub_805187C(LevelEffectDescriptor* data)
{
    _currentGameState->unk6C0 = data->unk4;
    _currentGameState->unk6BC = data->unk0;
    _currentGameState->unk6C4 = data->unk8;
    _currentGameState->unk6C6 = data->unkA;
    _currentGameState->unk6C8 = data->unkC;
    _currentGameState->unk6CA = data->unkE;
}

unk32 sub_80518C8(s32 index)
{
    u32 value;
    unk32 count;

    value = sub_8051720(index)->unk10[0];
    count = 0;
    while (value != 0) {
        if ((value & 1) != 0) {
            count++;
        }
        value >>= 1;
    }
    return count;
}

unk32 sub_80518F0(void)
{
    u32 value;
    unk32 count;

    value = sub_8051734()->unk10[0];
    count = 0;
    while (value != 0) {
        if ((value & 1) != 0) {
            count++;
        }
        value >>= 1;
    }
    return count;
}

ASM_ZEROPAD
