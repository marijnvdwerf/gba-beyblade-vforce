#include "gamestate.h"

#include "battery.h"
#include "beyblade.h"
#include "include_asm.h"
#include "music.h"
#include "ram.h"
#include "sound.h"
#include "unsorted.h"

extern const unk8 Str_87293C0[];
extern const unk8 Str_87293F0[];
extern LevelDescription LevelDescriptions[];
extern unk8 _807572c[];
extern unk8 _807576c[];
extern unk8 _80757ac[];
extern unk8 _80757ec[];
extern unk8 _807582c[];
extern s32 _80788cc[];
extern unk32 sub_805749C(unk32);

void sub_80510FC(void);
void sub_80513AC(void);

void InitCurrentGameState(void)
{
    AllocatedBlock* block;

    block = slowAllocate(0xC6C);
    if (block == NULL) {
        printf(Str_87293C0, 0xC6C);
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

#if 0
void sub_80510FC(void)
{
    CurrentGameState* state;
    LevelState* levelState;
    LevelSlot* entry;
    s32 index;
    s32 offset;
    unk32 found;
    s32 value;
    unk32 j;

    {
        unk32 zero;

        state = _currentGameState;
        zero = 0;
        state->unk0 = zero;
        state->unk6E8.half = zero;
        state->unk6AB = 1;
        state->unk6BC = 0;
        state->unk6EA = 0xFFFF;
    }
    index = 0;
    do {
        levelState = sub_8051720(index);
        levelState->unkC = &LevelDescriptions[index];
        levelState->unk4 = levelState->unkC->unk4;
        levelState->unk8 = levelState->unkC->unk8;
        if (index <= 0) {
            levelState->unk0 = 6;
        } else {
            levelState->unk0 = 4;
        }
        __fastMemoryClearARM(0, &levelState->unk10, 4);
        __fastMemoryClearARM(0, &levelState->unk14, 4);
        index++;
    } while (index <= 0x37);

    index = 0;
    offset = 0;
    do {
        entry = sub_80516E0(index);
        entry->unk4 = &_807582c[offset];
        entry->unk0 = 0;
        entry->unk2 = 0;
        offset += 0x50;
        index++;
    } while (index <= 9);

    __fastMemoryCopyARM(_807572c, _currentGameState->unk5A4, 0x40);
    __fastMemoryCopyARM(_807576c, _currentGameState->unk5E4, 0x40);
    __fastMemoryCopyARM(_80757ac, _currentGameState->unk624, 0x40);
    __fastMemoryCopyARM(_80757ec, _currentGameState->unk664, 0x40);
    {
        unk32 zero;

        state = _currentGameState;
        zero = 0;
        state->unk6A9 = zero;
        state->unk6A8 = zero;
        state->unk6A7 = zero;
        state->unk6A6 = zero;
        state->unk6A5 = zero;
        state->unk6A4 = zero;
    }

    index = 0;
    do {
        j = 0;
        found = 0;
        value = _80788cc[j];
        while (value >= 0 && value != index) {
            j++;
            value = _80788cc[j];
        }
        if (value < 0 || value == index) {
            found = 1;
        }
        if (index < 0) {
            found = 1;
        }
        sub_8057104(index, found);
        index++;
    } while (index <= 0x6C);
    _gameData->unk1638 = 0;
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/80510fc.s");

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
    index = 0;
    do {
        state = sub_8051720(index);
        description = getLevelDescription(index);
        if ((state->unk0 & 2) == 0) {
            if (description->unk1C != 0) {
                available = 1;
                level = description->unk24;
                while (level <= description->unk28) {
                    nextDescription = getLevelDescription(level);
                    prerequisiteState = sub_8051720(level);
                    if (prerequisiteState->unk4 > nextDescription->unk8) {
                        available = 0;
                        break;
                    }
                    level++;
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
        index++;
    } while (index <= 0x37);
}

unk32 sub_805137C(void)
{
    s32 index;
    unk32 result;
    LevelState* state;

    result = 0;
    index = 0;
    do {
        state = sub_8051720(index);
        getLevelDescription(index);
        if ((state->unk0 & 2) != 0) {
            result = index;
        }
        index++;
    } while (index <= 0x37);
    return result;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/80513ac.s");

void sub_8051488(void)
{
    CurrentGameSave* save;

    save = &_currentGameState->unk6FC;
    if (sub_8051558() == 0) {
        printf(Str_87293F0);
    } else {
        _currentGameState->unk0 = save->unk4;
        _currentGameState->unk1 = save->unk5;
        _currentGameState->unk2 = save->unk6;
        _currentGameState->unk3 = save->unk7;
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
    ptr = &save->magic;
    i = 334;
    do {
        xorSum ^= *ptr++;
        i--;
    } while (i != -1);

    return xorSum == save->checksum && save->magic == 0xDEAD;
}

unk8 sub_80515A4(void)
{
    BackupBlock* data;
    s32 size;
    unk8 result;

    data = (BackupBlock*)&_currentGameState->unk6FC;
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

    data = (BackupBlock*)&_currentGameState->unk6FC;
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

INCLUDE_ASM("asm/dump/804a388-tutorial/8051694.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80516b0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80516c0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80516d4.s");

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

unk32 sub_8051744(void)
{
    s32 index;

    index = 0;
    do {
        if ((sub_8051720(index)->unk0 & 1) != 0) {
            index++;
        } else {
            return 0;
        }
    } while (index <= 0x37);
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

INCLUDE_ASM("asm/dump/804a388-tutorial/80517e8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8051804.s");

unk32 sub_8051820(void)
{
    if (sub_8051780(4) != 0 || (_currentGameState->unkC64 & 4) != 0) {
        return _currentGameState->unk2;
    }
    return getLevelDescription2()->unk90;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/805185c.s");

unk8 sub_8051868(void)
{
    return sub_805749C(sub_8051820());
}

INCLUDE_ASM("asm/dump/804a388-tutorial/805187c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80518c8.s");

unk32 sub_80518F0(void)
{
    u32 value;
    unk32 count;

    value = sub_8051734()->unk10;
    count = 0;
    if (value != 0) {
        do {
            if ((value & 1) != 0) {
                count++;
            }
            value >>= 1;
        } while (value != 0);
    }
    return count;
}

ASM_ZEROPAD
