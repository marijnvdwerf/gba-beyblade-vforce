#include <agb/types.h>

#include "include_asm.h"
#include "unsorted.h"

extern void sub_8060CDC(void*);
extern void sub_8061160(void*);
extern void sub_8060B38(void*);
extern s32 Div(s32, s32);
extern s32 DivRem(s32, s32);
extern unk8 showString(void*, const u8*, unk8);

void allocFont(SpriteTextCleanup* arg0, const u8* arg1, const u8* arg2, s16 arg3, s16 arg4,
    unk16 arg5, unk16 arg6)
{
    arg0->x = arg3 << 8;
    arg0->y = arg4 << 8;
    arg0->unkC = arg5;
    arg0->unkA = 0;
    arg0->unk14.count = 0;
    arg0->unk14.next = NULL;
    arg0->unk14.prev = NULL;
    arg0->unk20 = arg2;
    arg0->unk24 = arg1;
    arg0->unk8 = arg6;
    arg0->ptr2C = NULL;
    arg0->unkE = 0;
    arg0->unk10 = 0x100;
    arg0->unk12 = 0x100;
    arg0->unkF = 0;
    arg0->unk2B = 0;
    arg0->unk28 = 5;
    arg0->unk29 = 0;
    arg0->unk2A = arg1[5] + 4;
}

void sub_80611EC(SpriteTextCleanup* arg0, unk8 arg1)
{
    arg0->unk2A = arg1;
}

INCLUDE_ASM("asm/dump/8057b80-debug/80611f4.s");

void sub_80611FC(SpriteTextCleanup* arg0, unk8 arg1)
{
    arg0->unk28 = arg1;
}

void sub_8061204(SpriteTextCleanup* arg0)
{
    sub_8060CDC(&arg0->unk14);
    if (arg0->ptr2C != NULL) {
        sub_8061160(arg0->ptr2C);
        sub_8060B38(arg0->ptr2C);
        arg0->ptr2C = NULL;
    }
}

void sub_8061228(SpriteTextCleanup* arg0)
{
    sub_8060CDC(&arg0->unk14);
    arg0->unkA = 0;
}

INCLUDE_ASM("asm/dump/8057b80-debug/806123c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80614b0.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80614bc-showString.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061660.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061684.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061824.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061844.s");
INCLUDE_ASM("asm/dump/8057b80-debug/806185c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061880.s");

unk8 showNumber(SpriteTextCleanup* arg0, s32 arg1, unk8 arg2)
{
    unk8 negative;
    unk8 group;
    unk8 digits;
    unk8 buffer[16];
    unk8* ptr;
    s32 digit;

    negative = 0;
    group = 3;
    digits = 0xE;
    if (arg1 < 0) {
        negative = 1;
        arg1 = -arg1;
    }
    ptr = &buffer[15];
    *ptr = 0;
    if (arg1 == 0) {
        ptr--;
        *ptr = '0';
    } else {
        while (1) {
            if ((arg0->unk8 & 0x40) == 0) {
                group--;
                if (group == 0xFF) {
                    ptr--;
                    *ptr = ',';
                    group = 2;
                    digits--;
                }
            }
            digit = DivRem(arg1, 10);
            ptr--;
            *ptr = digit + '0';
            arg1 = Div(arg1, 10);
            digits--;
            if (arg1 == 0 || digits == 0) {
                break;
            }
        }
    }
    if (negative != 0) {
        ptr--;
        *ptr = '-';
    }
    return showString(arg0, ptr, arg2);
}

unk8 showNumber_2(void* arg0, unk32 arg1, unk8 arg2)
{
    sub_8061228(arg0);
    return showNumber(arg0, arg1, arg2);
}

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
