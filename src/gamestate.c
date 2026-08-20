#include "include_asm.h"
#include "ram.h"
#include "unsorted.h"

extern const u8 Str_87293C0[];

void sub_80510FC(void);

extern LevelState* sub_8051720(s32);
extern LevelDescription* getLevelDescription(s32);

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
INCLUDE_ASM("asm/dump/804a388-tutorial/805162c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8051640.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8051654-getSomeLevelID.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8051688.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8051694.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80516b0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80516c0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80516d4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80516e0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80516f8-getLevelDescription2.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8051710-getLevelDescription.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8051720.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8051734.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8051744.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805176c.s");

unk32 sub_8051780(unk32 arg0)
{
    return _currentGameState->unk6B4 & arg0;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8051798.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80517ac-GetLevelDescriptionNo.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80517e8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8051804.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8051820.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805185c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8051868.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805187c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80518c8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80518f0.s");
