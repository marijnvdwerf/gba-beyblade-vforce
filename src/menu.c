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
    u8 state;

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

#if 0
void sub_805AD24(MenuState* arg0, unk32 arg1, unk32 arg2, s32 arg3, unk32 arg4, unk32 arg5,
    unk16 arg6, unk8 arg7, unk8 arg8, unk8 arg9, unk8 argA, MenuStateCallback argB,
    MenuStateValueCallback argC, unk32 argD)
{
    arg0->items = NULL;
    arg0->unk9 = 0;
    arg0->unk24 = 0;
    arg0->callback = argB;
    arg0->unk2E = arg9;
    arg0->unk2F = argA;
    arg0->items = NULL;
    arg0->objectCount = 0;
    arg0->itemCount = 0;
    arg0->unk8 = argD;
}
#endif
INCLUDE_ASM("asm/dump/8057b80-debug/805ad24.s");

#if 0
void sub_805AD9C(MenuState* state)
{
    s32 count;
    UnkMenuItem* item;

    item = state->items;
    count = state->objectCount;
    do {
        sub_8061204(&item->text);
        item++;
    } while (count-- != 0);
    if (state->menuBlock != NULL) {
        deallocateBlock(state->menuBlock);
        state->menuBlock = NULL;
    }
    state->itemCount = 0;
    state->objectCount = 0;
    state->unk9 = 0;
}
#endif
INCLUDE_ASM("asm/dump/8057b80-debug/805ad9c.s");

#if 0
void allocateMenuItems(MenuState* state, MenuItemDescriptor* descriptors, unk32 selected)
{
    UnkMenuItem* item;
    UnkMenuItem* nextItem;
    UnkMenuItem* itemNext;
    MenuItemDescriptor* base;
    MenuItemDescriptor* descriptor;
    MenuItemDescriptor* descriptorNext;
    const MenuOptionSet* descriptorTable;
    const unk8* stateByte;
    unk32 itemCount;
    unk32 language;
    unk32 enabledCount;
    unk32 totalCount;
    unk32 index;
    unk32 secondaryCount;
    unk32 size;
    s32 difference;
    unk32 center;
    unk32 currentCenter;

    base = descriptors;
    itemCount = 0;
    index = 0;
    state->unk24 = selected;
    enabledCount = 0;
    language = state->unk8;
    if (base->labels[language] != NULL) {
        do {
            if ((descriptors->flags & 1) != 0)
                enabledCount++;
            descriptors++;
            itemCount++;
        } while (descriptors->labels[language] != NULL);
    }
    totalCount = itemCount + enabledCount;
    state->unk9 = state->unkA * totalCount;
    difference = 0xA0 - state->unk9;
    center = (difference + (difference >> 31)) >> 1;
    center += state->unk20;
    state->itemCount = itemCount;
    state->objectCount = totalCount;
    size = totalCount * 0x4C;
    state->menuBlock = slowAllocate(size);
    if (state->menuBlock == NULL)
        printf(Str_8755370);
    item = state->menuBlock->address;
    state->items = item;
    nextItem = item + itemCount;
    descriptor = base;
    while (descriptor->labels[state->unk8] != NULL) {
        itemNext = item + 1;
        descriptorNext = descriptor + 1;
        secondaryCount = 0;
        descriptorTable = descriptor->subitems;
        if (descriptorTable != NULL) {
            while (descriptorTable->values[state->unk8] != NULL) {
                descriptorTable++;
                secondaryCount++;
            }
        }
        currentCenter = center + descriptor->y;
        allocFont(&item->text, state->spriteSheet, state->font, state->unk1C + descriptor->x,
            currentCenter, state->tileCount, 2);
        item->unk30 = descriptor->labels[state->unk8];
        item->flags = descriptor->flags;
        item->options = descriptor->subitems;
        item->value = 0;
        item->unk44 = 0;
        item->count = secondaryCount;
        item->next = NULL;
        sub_805AC80(state, item);
        if (descriptor->subitems != NULL && (descriptor->flags & 1) != 0) {
            currentCenter += state->unkA;
            allocFont(&nextItem->text, state->spriteSheet, state->font,
                state->unk1C + descriptor->x, currentCenter, state->tileCount, 2);
            nextItem->unk30 = NULL;
            nextItem->flags = descriptor->flags;
            nextItem->options = descriptor->subitems;
            nextItem->value = 0;
            nextItem->unk44 = 0;
            nextItem->count = secondaryCount;
            nextItem->next = NULL;
            item->next = nextItem;
            item->options = NULL;
            sub_805AC80(state, item);
            sub_805AC80(state, nextItem);
            nextItem++;
        }
        if (index == selected)
            stateByte = &state->unk2E;
        else
            stateByte = &state->unk2C;
        sub_806185C(item, *stateByte);
        index++;
        item = itemNext;
        center = currentCenter + state->unkA;
        descriptor = descriptorNext;
    }
}

#endif
INCLUDE_ASM("asm/dump/8057b80-debug/805add4-allocateMenuItems.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805afb8-nullsub_48.s");

#if 0
s32 sub_805AFBC(MenuState* state, u8 arg1)
{
    unk32 step;
    s32 current;
    s32 count;
    UnkMenuItem* item;

    current = state->unk24;
    count = state->itemCount;
    step = -1;
    if (arg1 != 0)
        step = 1;
    goto condition;
loop:
    current += step;
    if (current < 0)
        current += state->itemCount;
    if (current >= state->itemCount)
        current = 0;
    item = state->items + current;
    if (item->unk44 != 0)
        goto condition;
    {
        s32 old;
        UnkMenuItem* oldItem;

        old = state->unk24;
        if (old == current)
            goto end;
        oldItem = state->items + old;
        state->unk24 = current;
        sub_806185C(oldItem, state->unk2C);
        sub_806185C(item, state->unk2E);
        if (state->callback != NULL)
            state->callback(oldItem, old, item, current);
        goto end;
    }
condition:
    if (count-- != 0)
        goto loop;
end:
    return state->unk24;
}
#endif
INCLUDE_ASM("asm/dump/8057b80-debug/805afbc.s");

s32 sub_805B050(MenuState* arg0, unk8 arg1)
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
