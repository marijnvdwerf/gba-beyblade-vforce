#include "include_asm.h"
#include "ram.h"

extern void newPolyTable(void*, unk32, unk32);

INCLUDE_ASM("asm/dump/804a388-tutorial/8051918-gameLoop.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80520f4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052140.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052180.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80522d4.s");
void sub_8052514(void)
{
    newPolyTable(_gameData->unkB88, 0xA0, 0x20);
}
INCLUDE_ASM("asm/dump/804a388-tutorial/8052534.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805253c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052588.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80526c8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805295c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052978.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052a74.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052ab8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052afc-nullsub_43.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052b00-nullsub_44.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052b04-nullsub_45.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052b08.s");
