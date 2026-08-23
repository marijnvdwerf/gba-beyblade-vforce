#include "gamestate.h"

#include "beyblade.h"
#include "include_asm.h"
#include "ram.h"
#include "unsorted.h"

extern const u8 Str_87293C0[];
extern LevelDescription LevelDescriptions[];
extern unk8 _807572c[];
extern unk8 _807576c[];
extern unk8 _80757ac[];
extern unk8 _80757ec[];
extern unk8 _807582c[];
extern s32 _80788cc[];

void sub_80510FC(void);
extern Unk80516E0* sub_80516E0(unk32);
extern LevelState* sub_8051720(s32);

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

INCLUDE_ASM("asm/dump/804a388-tutorial/805137c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80513ac.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8051488.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8051558.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80515a4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80515e0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8051618.s");

unk8 sub_805162C(void)
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
INCLUDE_ASM("asm/dump/804a388-tutorial/80516e0.s");

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

unk8 sub_805176C(void)
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
INCLUDE_ASM("asm/dump/804a388-tutorial/8051868.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805187c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80518c8.s");

unk32 sub_80518F0(void)
{
    unk32 value;
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
