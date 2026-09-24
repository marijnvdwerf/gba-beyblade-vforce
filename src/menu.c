#include "menu.h"

#include <agb/types.h>

#include "include_asm.h"
#include "memory.h"
#include "spritetext.h"
#include "system.h"
#include "unsorted.h"

MenuCallbackRecord* sub_805AC28(void (*arg0)(MenuCallbackRecord*), unk32 arg1, unk32 arg2, unk16 arg3)
{
    MenuCallbackRecord* data;

    data = slowAllocate(sizeof(MenuCallbackRecord))->address;
    if (data == NULL) {
        nullsub_8("Error Allocating memory for a Process\n");
        return NULL;
    }
    data->unkC = arg1;
    data->unk0 = arg0;
    data->unk4 = arg2;
    data->unk8 = arg3;
    return data;
}

void sub_805AC5C(MenuCallbackRecord* arg0)
{
    _unk3005DC0 = arg0;
}

void sub_805AC68(void)
{
    if (_unk3005DC0 != NULL) {
        _unk3005DC0->unk0(_unk3005DC0);
    }
}

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
            if (arg0->items + arg0->unk24 == arg1) {
                state = arg0->unk2E;
            }
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

void sub_805AD24(MenuState* arg0, const SpriteSheet* arg1, const unk8* arg2, unk32 arg3, unk32 arg4, unk32 arg5, unk32 arg6, unk8 arg7, unk8 arg8, unk8 arg9, unk8 argA, MenuStateCallback argB, MenuStateValueCallback argC, unk8 argD)
{
    arg0->unk0 = arg1;
    arg0->unk4 = arg2;
    arg0->unk10 = NULL;
    arg0->items = NULL;
    arg0->unk1C = arg3;
    arg0->unk20 = arg4;
    arg0->unkA = arg6;
    arg0->unk9 = 0;
    arg0->unk24 = 0;
    arg0->callback = argB;
    arg0->unk34 = argC;
    arg0->unk2C = arg8;
    arg0->unk2D = arg9;
    arg0->unk2E = arg7;
    arg0->unk2F = argA;
    arg0->unk28 = arg5;
    arg0->items = NULL;
    arg0->objectCount = 0;
    arg0->itemCount = 0;
    arg0->unk8 = argD;
}

void sub_805AD9C(MenuState* state)
{
    UnkMenuItem* item;
    s32 count;

    item = state->items;
    count = state->objectCount;
    while (count--) {
        sub_8061204(&item->text);
        item++;
    }
    if (state->unk10 != NULL) {
        deallocateBlock(state->unk10);
        state->unk10 = NULL;
    }
    state->itemCount = 0;
    state->objectCount = 0;
    state->unk9 = 0;
}

void allocateMenuItems(MenuState* state, const MenuItemDescriptor* descriptor, unk32 selected)
{
    UnkMenuItem* item;
    UnkMenuItem* nextItem;
    const MenuItemDescriptor* descriptors;
    const MenuOptionSet* descriptorTable;
    unk32 itemCount;
    unk32 enabledCount;
    unk32 index;
    unk32 secondaryCount;
    unk32 center;

    descriptors = descriptor;
    itemCount = 0;
    index = 0;
    enabledCount = 0;
    state->unk24 = selected;
    while (descriptors->labels[state->unk8] != NULL) {
        if ((descriptors->flags & 1) != 0) {
            enabledCount++;
        }
        descriptors++;
        itemCount++;
    }
    state->unk9 = state->unkA * (itemCount + enabledCount);
    center = (0xA0 - state->unk9) / 2 + state->unk20;
    state->itemCount = itemCount;
    state->objectCount = itemCount + enabledCount;
    state->unk10 = slowAllocate((itemCount + enabledCount) * sizeof(UnkMenuItem));
    if (state->unk10 == NULL) {
        printf("allocateMenuItems : slowAllocate failed\n");
    }
    state->items = state->unk10->address;
    item = state->items;
    nextItem = item + state->itemCount;
    while (descriptor->labels[state->unk8] != NULL) {
        secondaryCount = 0;
        if (descriptor->subitems != NULL) {
            descriptorTable = descriptor->subitems;
            while (descriptorTable->values[state->unk8] != NULL) {
                descriptorTable++;
                secondaryCount++;
            }
        }
        center += descriptor->y;
        allocFont(&item->text, state->unk0, state->unk4, state->unk1C + descriptor->x, center, state->unk28, 2);
        item->unk30 = descriptor->labels[state->unk8];
        item->flags = descriptor->flags;
        item->options = descriptor->subitems;
        item->value = 0;
        item->unk44 = 0;
        item->count = secondaryCount;
        item->next = NULL;
        sub_805AC80(state, item);
        if (descriptor->subitems != NULL && (descriptor->flags & 1) != 0) {
            center += state->unkA;
            allocFont(&nextItem->text, state->unk0, state->unk4, state->unk1C + descriptor->x, center, state->unk28, 2);
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
        sub_806185C(item, index++ == selected ? state->unk2E : state->unk2C);
        item++;
        center += state->unkA;
        descriptor++;
    }
}

void nullsub_48(void)
{
}

unk32 sub_805AFBC(MenuState* state, u8 arg1)
{
    unk32 step;
    s32 current;
    s32 count;
    UnkMenuItem* item;
    unk32 old;
    UnkMenuItem* oldItem;

    current = state->unk24;
    count = state->itemCount;
    step = -1;
    if (arg1 != 0) {
        step = 1;
    }

    while (count-- != 0) {
        current += step;
        if (current < 0) {
            current += state->itemCount;
        }
        if (current >= state->itemCount) {
            current = 0;
        }
        item = state->items + current;
        if (item->unk44 != 0) {
            continue;
        }
        old = state->unk24;
        if (old != current) {
            oldItem = state->items + old;
            state->unk24 = current;
            sub_806185C(oldItem, state->unk2C);
            sub_806185C(item, state->unk2E);
            if (state->callback != NULL) {
                state->callback(oldItem, old, item, current);
            }
        }
        break;
    }
    return state->unk24;
}

s32 sub_805B050(MenuState* arg0, unk8 arg1)
{
    UnkMenuItem* item;
    s32 count;
    s32 value;
    s32 original;
    unk32 flags;

    item = arg0->items + arg0->unk24;
    if (item->next != NULL) {
        item = item->next;
    }
    count = item->count;
    if (count == 0) {
        return -1;
    }
    original = item->value;
    value = original;
    if (arg1 != 0) {
        value++;
    } else {
        value--;
    }
    if (value < 0) {
        if ((item->flags & 2) != 0) {
            value = 0;
        } else {
            value += count;
        }
    }
    if (value >= count) {
        flags = item->flags & 2;
        value = 0;
        if (flags != 0) {
            value = original;
        }
    }
    item->value = value;
    sub_805AC80(arg0, item);
    return value;
}

unk32 sub_805B0BC(MenuState* state)
{
    unk32 index;
    UnkMenuItem* item;

    index = state->unk24;
    item = state->items + index;
    if (state->unk34 != NULL) {
        state->unk34(item, index);
    }
    if (item->next != NULL) {
        item = item->next;
    }
    return state->unk24 | (item->value << 16);
}

void sub_805B0F0(MenuState* arg0, s32 arg1, unk8 arg2)
{
    UnkMenuItem* item;

    item = arg0->items + arg1;
    if (arg1 < 0 || arg1 >= arg0->itemCount) {
        return;
    }
    item->unk44 = arg2 == 0;
    sub_806185C(item, arg2 != 0 ? arg0->unk2C : arg0->unk2D);
}

void sub_805B13C(MenuState* state, s32 selected)
{
    UnkMenuItem* item;
    unk8 value;

    if (selected == state->unk24) {
        return;
    }
    item = state->items + selected;
    if (selected < 0 || selected >= state->itemCount) {
        return;
    }
    if (item->unk44 != 0) {
        return;
    }
    sub_806185C(item, state->unk2E);
    item = state->items + state->unk24;
    if (item->unk44 != 0) {
        value = state->unk2D;
    } else {
        value = state->unk2C;
    }
    sub_806185C(item, value);
    state->unk24 = selected;
}

void sub_805B1A0(MenuState* arg0, s32 arg1, s32 arg2)
{
    UnkMenuItem* item;

    item = arg0->items + arg1;
    if (arg1 < 0 || arg1 >= arg0->itemCount) {
        return;
    }
    if (item->next != NULL) {
        item = item->next;
    }
    if (item->options == NULL) {
        return;
    }
    if (arg2 < 0 || arg2 >= item->count) {
        return;
    }
    item->value = arg2;
    sub_805AC80(arg0, item);
}

s32 sub_805B1E0(MenuState* arg0, s32 arg1)
{
    UnkMenuItem* item;

    item = arg0->items + arg1;
    if (arg1 < 0 || arg1 >= arg0->itemCount) {
        return -1;
    }
    if (item->next != NULL) {
        item = item->next;
    }
    if (item->options == NULL) {
        return -1;
    }
    return item->value;
}

s32 sub_805B210(MenuState* arg0)
{
    s32 index;
    UnkMenuItem* item;

    index = arg0->unk24;
    item = arg0->items + index;
    if (index < 0 || index >= arg0->itemCount) {
        return -1;
    }
    if (item->next != NULL) {
        item = item->next;
    }
    if (item->options == NULL) {
        return -1;
    }
    return item->value;
}

unk32 sub_805B240(MenuState* arg0)
{
    return arg0->unk24;
}
