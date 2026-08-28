#include "iconmenu.h"

#include "debug.h"
#include "include_asm.h"
#include "language.h"
#include "memory.h"
#include "music.h"
#include "packet.h"
#include "sprite.h"
#include "spritetext.h"

#if 0
void newIconMenu(FrontendMenu* menu, const FrontendMenuData* data, unk32 count)
{
    (void)menu;
    (void)data;
    (void)count;
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/8050a7c-newIconMenu.s");

INCLUDE_ASM("asm/dump/804a388-tutorial/8050c18.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8050df8.s");

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
