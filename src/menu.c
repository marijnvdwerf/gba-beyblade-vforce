#include <agb/types.h>

#include "include_asm.h"
#include "unsorted.h"

extern void sub_805AC80(UnkMenu*, UnkMenuItem*);

INCLUDE_ASM("asm/dump/8057b80-debug/805ac28.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805ac5c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805ac68.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805ac80.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805ad24.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805ad9c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805add4-allocateMenuItems.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805afb8-nullsub_48.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805afbc.s");

s32 sub_805B050(UnkMenu* arg0, u8 arg1)
{
    UnkMenuItem* item;
    s32 count;
    s32 value;
    s32 original;
    unk32 flags;

    item = arg0->items + arg0->unk24;
    if (item->next != NULL)
        item = item->next;
    count = item->count;
    if (count == 0)
        return -1;
    original = item->value;
    value = original;
    if (arg1 != 0)
        value++;
    else
        value--;
    if (value < 0) {
        if ((item->flags & 2) != 0)
            value = 0;
        else
            value += count;
    }
    if (value >= count) {
        flags = item->flags & 2;
        value = 0;
        if (flags != 0)
            value = original;
    }
    item->value = value;
    sub_805AC80(arg0, item);
    return value;
}

INCLUDE_ASM("asm/dump/8057b80-debug/805b0bc.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805b0f0.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805b13c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805b1a0.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805b1e0.s");

s32 sub_805B210(UnkMenu* arg0)
{
    s32 index;
    UnkMenuItem* item;

    index = arg0->unk24;
    item = arg0->items + index;
    if (index < 0 || index >= arg0->itemCount)
        return -1;
    if (item->next != NULL)
        item = item->next;
    if (item->options == NULL)
        return -1;
    return item->value;
}

unk32 sub_805B240(UnkMenu* arg0)
{
    return arg0->unk24;
}
