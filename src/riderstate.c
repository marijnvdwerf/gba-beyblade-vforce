#include "include_asm.h"
#include "ram.h"
#include "unsorted.h"

void sub_804FF5C(s32 arg0)
{
    __fastMemoryClearARM(0, (void*)arg0, 0x10);
    _unk3000F44 = 0;
    _unk3000F40 = 0;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804ff88.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804ffd4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805000c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8050050.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8050114.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8050184.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80501a8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80501c8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80501f8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805024c.s");
