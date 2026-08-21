#include <agb/types.h>

#include "include_asm.h"
#include "unsorted.h"

extern void sub_8060CDC(void*);
extern void sub_8061160(void*);
extern void sub_8060B38(void*);

INCLUDE_ASM("asm/dump/8057b80-debug/8061190-allocFont.s");

void sub_80611EC(UnkSpriteText* arg0, unk8 arg1)
{
    arg0->unk2A = arg1;
}

INCLUDE_ASM("asm/dump/8057b80-debug/80611f4.s");

void sub_80611FC(UnkSpriteText* arg0, unk8 arg1)
{
    arg0->unk28 = arg1;
}

void sub_8061204(SpriteTextCleanup* arg0)
{
    sub_8060CDC(arg0->unk14);
    if (arg0->ptr2C != NULL) {
        sub_8061160(arg0->ptr2C);
        sub_8060B38(arg0->ptr2C);
        arg0->ptr2C = NULL;
    }
}

INCLUDE_ASM("asm/dump/8057b80-debug/8061228.s");
INCLUDE_ASM("asm/dump/8057b80-debug/806123c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80614b0.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80614bc-showString.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061660.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061684.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061824.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061844.s");
INCLUDE_ASM("asm/dump/8057b80-debug/806185c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061880.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80618d0-showNumber.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061980-showNumber_2.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80619a4.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061a18-printTime.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061ae8.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061ba0.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061c24.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061c48.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061c6c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061c90.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061cb4.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061d54.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061d68.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061e08.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061e44.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061e58.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061e90.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061e94.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061e9c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061f3c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80622d0.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80622e8.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8062318.s");
