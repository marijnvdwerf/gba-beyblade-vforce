#include "common.h"
#include "include_asm.h"

extern s32 Div(s32, s32);

s32 sub_8064F38(const u8* str)
{
    s32 count;
    u8 c;

    count = 0;
    for (;;) {
        c = *str;
        if (c == 0) {
            break;
        }
        str++;
        if (c != ' ') {
            count++;
        }
    }
    return count;
}

unk32 sub_8064F50(unk32 value)
{
    unk32 count;
    unk32 group;
    unk32 temp;

    count = 0;
    group = 3;
    if (value == 0) {
        return 1;
    }
    do {
        temp = group;
        group--;
        if (temp == 0) {
            group = 3;
            count++;
        }
        count++;
        value = Div(value, 10);
    } while (value != 0);
    return count;
}

unk32 sub_8064F84(const u8* str)
{
    unk32 length;
    u8 c;

    c = *str;
    length = 1;
    if (c != 0) {
        do {
            c = str[length];
            length++;
        } while (c != 0);
    }
    return length;
}

INCLUDE_ASM("asm/dump/8064f38/8064f9c.s");
INCLUDE_ASM("asm/dump/8064f38/8064fe8-SpriteString_8064FE8.s");
INCLUDE_ASM("asm/dump/8064f38/8065088.s");
INCLUDE_ASM("asm/dump/8064f38/80650e0.s");
INCLUDE_ASM("asm/dump/8064f38/80650f8.s");
INCLUDE_ASM("asm/dump/8064f38/80650fc.s");
INCLUDE_ASM("asm/dump/8064f38/8065108.s");
INCLUDE_ASM("asm/dump/8064f38/806513e.s");
INCLUDE_ASM("asm/dump/8064f38/806530c.s");
INCLUDE_ASM("asm/dump/8064f38/8065334.s");
INCLUDE_ASM("asm/dump/8064f38/80653b0.s");
INCLUDE_ASM("asm/dump/8064f38/80653d8.s");
INCLUDE_ASM("asm/dump/8064f38/8065508.s");
INCLUDE_ASM("asm/dump/8064f38/80655c0.s");
INCLUDE_ASM("asm/dump/8064f38/80656b8.s");
INCLUDE_ASM("asm/dump/8064f38/806570c.s");
INCLUDE_ASM("asm/dump/8064f38/8065760.s");
INCLUDE_ASM("asm/dump/8064f38/80657c4.s");
INCLUDE_ASM("asm/dump/8064f38/80657ec.s");
