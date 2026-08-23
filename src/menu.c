#include "menu.h"

#include <agb/types.h>

#include "include_asm.h"
#include "spritetext.h"
#include "unsorted.h"

INCLUDE_ASM("asm/dump/8057b80-debug/805ac28.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805ac5c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805ac68.s");

void sub_805AC80(MenuState* arg0, UnkMenuItem* arg1)
{
    unk8* destination;
    const u8* source;
    unk8 state;

    state = arg0->unk2F;
    if (arg1->options != NULL) {
        source = arg1->unk30;
        destination = _unk3000D30;
        if (source != NULL) {
            while (*source != 0) {
                *destination = *source;
                source++;
                destination++;
            }
        }
        if ((arg1->flags & 5) == 0) {
            if (arg0->items + arg0->unk24 == arg1)
                state = arg0->unk2E;
            *destination = 0x3A;
            destination++;
            *destination = 0x20;
            destination++;
        }
        source = arg1->options[arg1->value].values[arg0->unk8];
        while (*source != 0) {
            *destination = *source;
            source++;
            destination++;
        }
        *destination = 0;
        sub_8061660(&arg1->text, _unk3000D30, state);
    } else if (arg1->unk30 != NULL) {
        sub_8061660(&arg1->text, arg1->unk30, state);
    }
}

INCLUDE_ASM("asm/dump/8057b80-debug/805ad24.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805ad9c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805add4-allocateMenuItems.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805afb8-nullsub_48.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805afbc.s");

s32 sub_805B050(MenuState* arg0, u8 arg1)
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

s32 sub_805B210(MenuState* arg0)
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

unk32 sub_805B240(MenuState* arg0)
{
    return arg0->unk24;
}
