#include "ai.h"

#include "include_asm.h"

extern const unk8 Unk_874CEBC[];

INCLUDE_ASM("asm/dump/804a388-tutorial/80575f4-initAiManagement.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80576ec.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80577a0-deallocateAiManagement.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80577d4-fn_aiStubFunc.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80577d8.s");

unk32 sub_8057878(s32 arg0, s32 arg1)
{
    s32 absArg1;
    s32 angle;
    s32 value;

    absArg1 = arg1;
    if (absArg1 < 0)
        absArg1 = -absArg1;
    if (absArg1 <= 0x80) {
        angle = -(arg1 >> 1);
    } else {
        angle = arg0 >> 1;
        arg0 = arg1;
    }
    value = Unk_874CEBC[(s16)angle + 0x80];
    if (arg0 < 0)
        value = 0xFF - value;
    if (absArg1 > 0x80) {
        value += 0x40;
        if (value > 0xFF)
            value -= 0x100;
    }
    return value;
}
