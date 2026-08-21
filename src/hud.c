#include "include_asm.h"
#include "ram.h"

INCLUDE_ASM("asm/dump/804a388-tutorial/804ec14-LoadHUD.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804ee2c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804ee54.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804f05c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804f2a0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804f37c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804f478.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804f794.s");
void sub_804F800(s32 arg0)
{
    GameData* base;

    base = _gameData;
    if (arg0 < 0) {
        arg0 = 0;
    }
    if (arg0 > 5) {
        arg0 = 5;
    }
    base->unk107C = arg0;
}
INCLUDE_ASM("asm/dump/804a388-tutorial/804f824.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804f84c.s");
