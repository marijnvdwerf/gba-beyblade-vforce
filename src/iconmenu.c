#include "iconmenu.h"

#include "debug.h"
#include "include_asm.h"
#include "language.h"
#include "memory.h"
#include "music.h"
#include "packet.h"
#include "sprite.h"
#include "spritetext.h"

void newIconMenu(FrontendMenu* menu, const FrontendMenuData* data, unk32 count)
{
    FrontendMenuItem* item;
    FrontendMenuItemData* itemData;
    unk32 size;
    s32 i;
    s32 offsetX;
    s32 offsetY;
    s32 angle;
    unk32 angleIndex;

    size = data->itemCount * sizeof(FrontendMenuItem);
    angle = 0x80;
    menu->block = slowAllocate(size);
    if (menu->block == NULL) {
        printf(Str_8729398, size);
    }
    item = menu->block->address;
    menu->items = item;
    menu->itemCount = data->itemCount;
    menu->config = data;
    menu->flags = 0;
    menu->unk34 = data->x;
    menu->unk38 = data->y;
    menu->step = 0x10000 / data->itemCount;
    menu->velocity = 0;
    menu->position = 0xFFFF - count * menu->step;
    menu->unk8 = menu->position;
    menu->selection = count;
    menu->timer = 0;
    menu->timerTarget = 0;
    menu->targetPosition = data->scale;
    menu->textPosition = data->scale;
    itemData = data->items;
    i = 0;
    while (i < data->itemCount) {
        angleIndex = (unk8)(angle >> 8);
        offsetX = Unk_874CC3C[angleIndex] * data->scale >> 8;
        angleIndex += 0x40;
        offsetY = Unk_874CC3C[angleIndex] * data->scale >> 8;
        item->data = itemData;
        item->unk10 = itemData->nextPosition;
        item->position = i == count ? itemData->previousPosition : itemData->nextPosition;
        item->x = itemData->unk18;
        item->y = itemData->unk1C;
        item->sprite = allocSprite(i == count ? 1 : 2);
        item->unk18 = 0;
        if (item->sprite != NULL) {
            unk16 tileCount;
            LoadSpriteSheet(item->sprite, itemData->spriteSheet, data->x - item->x + offsetX,
                data->y - item->y + offsetY, 0, 2, 0, tileCount = itemData->unk28);
        }
        item++;
        itemData++;
        angle += menu->step;
        i++;
    }
    allocFont(&menu->text, data->address->spriteSheet, data->address->font, data->unk14 >> 8,
        data->unk18 >> 8, 0xF0, data->address->tileCount);
    sub_8061660(&menu->text, menu->config->items[menu->selection].labels[getLanguage()],
        menu->config->address->unkA);
}

void sub_8050C18(FrontendMenu* menu)
{
    s32 scale;
    FrontendMenuItem* item;
    SpriteEntry* sprite;
    s32 angle;
    unk32 step;
    s32 textPosition;
    s32 offsetX;
    s32 offsetY;
    s32 i;
    unk32 angleIndex;
    unk8 frameOffset;
    s32 delta;
    s32 magnitude;
    s32 velocity;

    angle = menu->unk8 + 0x80;
    step = menu->step;
    textPosition = menu->textPosition;
    frameOffset = 0;
    item = menu->items;
    i = 0;
    while (i < menu->itemCount) {
        angleIndex = (unk8)(angle >> 8);
        offsetX = (Unk_874CC3C[angleIndex] * textPosition) >> 8;
        angleIndex += 0x40;
        offsetY = (Unk_874CC3C[angleIndex] * textPosition) >> 8;
        offsetX = (menu->config->unk20 * offsetX) >> 8;
        if (item->sprite != NULL) {
            sprite = item->sprite;
            scale = item->unk10;
            if ((menu->flags & 1) != 0 && i == menu->selection) {
                if (scale > 0x100) {
                    s32 dx = 0x7800 - sprite->x;
                    s32 dy;
                    dx -= (item->x * scale) >> 8;
                    sprite->x += dx >> 3;
                    dy = 0x5000 - sprite->y;
                    dy -= (item->y * scale) >> 8;
                    sprite->y += dy >> 3;
                } else {
                    s32 dx = 0x7800 - sprite->x;
                    s32 dy;
                    dx -= item->x;
                    sprite->x += dx >> 3;
                    dy = 0x5000 - sprite->y;
                    dy -= item->y;
                    sprite->y += dy >> 3;
                }
                if (menu->timer - menu->timerTarget > 0x10) {
                    item->position = 4;
                }
                if ((menu->timer & 3) == 0) {
                    sprite->frame.word = sprite->frame.word == item->data->unk2C
                        ? item->data->unk28
                        : item->data->unk2C;
                }
            } else {
                frameOffset = 0;
                if (i == menu->selection) {
                    scale += Unk_874CC3C[(unk8)(menu->timer * 8) + 0x40] >> 4;
                    frameOffset = Unk_874CC3C[(unk8)(menu->timer * 8)] >> 6;
                }
                sprite->x = menu->unk34 - ((item->x * scale) >> 8) + offsetX;
                sprite->y = menu->unk38 - ((item->y * scale) >> 8) + offsetY;
            }
            sub_8060F64(sprite, scale, scale, frameOffset);
        }
        angle += step;
        item->unk10 += (item->position - item->unk10) >> 3;
        item++;
        i++;
    }
    menu->position &= 0xFFFF;
    if ((menu->flags & 2) == 0) {
        delta = menu->position - menu->unk8;
        magnitude = delta;
        if (delta < 0) {
            magnitude = -delta;
        }
        if (magnitude > 0x8000) {
            magnitude -= 0xFF00;
        }
        velocity = magnitude >> 3;
        if (delta < 0) {
            velocity = -velocity;
        }
        menu->velocity = velocity;
    }
    menu->unk8 = (menu->unk8 + menu->velocity) & 0xFFFF;
    menu->timer++;
    menu->textPosition += (menu->targetPosition - menu->textPosition) >> 3;
}

void sub_8050DF8(FrontendMenu* menu, s32 index)
{
    FrontendMenuItem* current;
    FrontendMenuItem* selected;
    FrontendMenuItemData* selectedData;
    unk32 currentIndex;

    currentIndex = menu->selection;
    current = menu->items + currentIndex;
    if (index >= 0 && index < menu->itemCount && (menu->flags & 1) == 0) {
        selected = menu->items + index;
        if (selected->sprite != NULL) {
            sub_8061078(selected->sprite, 1);
        }
        if (current->sprite != NULL) {
            sub_8061078(current->sprite, 2);
        }
        current->position = current->data->nextPosition;
        selectedData = selected->data;
        selected->position = selectedData->previousPosition;
        menu->position = 0xFFFF - index * menu->step;
        menu->selection = index;
        sub_8061660(&menu->text, selectedData->labels[getLanguage()], menu->config->address->unkA);
    }
}

void sub_8050E80(FrontendMenu* menu)
{
    FrontendMenuItem* current;
    FrontendMenuItem* next;
    FrontendMenuItemData* nextData;
    s32 index;
    s32 nextIndex;

    index = menu->selection;
    current = &menu->items[index];
    nextIndex = index + 1;
    if ((menu->flags & 1) == 0) {
        sub_804ABFC(7);
        if (nextIndex >= menu->itemCount) {
            nextIndex = 0;
        }
        next = &menu->items[nextIndex];
        if (next->sprite != NULL) {
            sub_8061078(next->sprite, 1);
        }
        if (current->sprite != NULL) {
            sub_8061078(current->sprite, 2);
        }
        current->position = current->data->nextPosition;
        nextData = next->data;
        next->position = nextData->previousPosition;
        menu->position = 0xFFFF - nextIndex * menu->step;
        menu->selection = nextIndex;
        sub_8061660(&menu->text, nextData->labels[getLanguage()], menu->config->address->unkA);
    }
}

void sub_8050F0C(FrontendMenu* menu)
{
    FrontendMenuItem* current;
    FrontendMenuItem* previous;
    FrontendMenuItemData* previousData;
    s32 index;
    s32 previousIndex;

    index = menu->selection;
    current = &menu->items[index];
    previousIndex = index - 1;
    if ((menu->flags & 1) == 0) {
        sub_804ABFC(7);
        if (previousIndex < 0) {
            previousIndex = menu->itemCount - 1;
        }
        previous = &menu->items[previousIndex];
        if (previous->sprite != NULL) {
            sub_8061078(previous->sprite, 1);
        }
        if (current->sprite != NULL) {
            sub_8061078(current->sprite, 2);
        }
        current->position = current->data->nextPosition;
        previousData = previous->data;
        previous->position = previousData->previousPosition;
        menu->position = 0xFFFF - previousIndex * menu->step;
        menu->selection = previousIndex;
        sub_8061660(&menu->text, previousData->labels[getLanguage()], menu->config->address->unkA);
    }
}

void sub_8050F98(FrontendMenu* menu)
{
    menu->flags |= 3;
    sub_804ABFC(8);
    menu->timerTarget = menu->timer;
    menu->velocity = 0x800;
    menu->targetPosition = 0x11800;
    sub_8061228(&menu->text);
}

void sub_8050FC8(FrontendMenu* menu)
{
    sub_8050FE8(menu, 0x11800);
    sub_804ABFC(9);
    sub_8061228(&menu->text);
}

void sub_8050FE8(FrontendMenu* menu, unk32 value)
{
    menu->targetPosition = value;
}

void sub_8050FEC(FrontendMenu* menu, unk32 value)
{
    menu->textPosition = value;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8050ff0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805100c.s");

void sub_8051028(FrontendMenu* menu)
{
    FrontendMenuItem* item;
    s32 i;

    item = menu->items;
    i = 0;
    while (i < menu->itemCount) {
        if (item->sprite != NULL) {
            sub_8060A94(item->sprite);
            item->sprite = NULL;
        }
        item++;
        i++;
    }
    if (menu->block != NULL) {
        deallocateBlock(menu->block);
        menu->block = NULL;
    }
    sub_8061204(&menu->text);
}

ASM_ZEROPAD
