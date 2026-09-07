#include "math.h"

#include "include_asm.h"

#if 0
s16 sub_8059FA0(s16 a, s16 b)
{
    return a * b / 256;
}
#endif
INCLUDE_ASM("asm/dump/8057b80-debug/8059fa0.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059fb8.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059fd0.s");

void sub_8059FF8(unk32* arg0, unk32 arg1, unk32 arg2, unk32 arg3, unk32 arg4)
{
    arg0[0] = arg1;
    arg0[1] = arg2;
    arg0[2] = arg3;
    arg0[3] = arg4;
}

INCLUDE_ASM("asm/dump/8057b80-debug/805a00c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805a0dc.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805a148.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805a1dc.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805a290.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805a2dc.s");
