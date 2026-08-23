#include "iconmenu.h"

#include "debug.h"
#include "include_asm.h"
#include "language.h"
#include "memory.h"
#include "music.h"
#include "sprite.h"
#include "spritetext.h"

extern const u8 Str_8729398[];
extern const s16 Unk_874CC3C[];

INCLUDE_ASM("asm/dump/804a388-tutorial/8050a7c-newIconMenu.s");

INCLUDE_ASM("asm/dump/804a388-tutorial/8050c18.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8050df8.s");

void sub_8050E80(FrontendMenu* menu)
{
    FrontendMenuItem* current;
    FrontendMenuItem* next;
    s32 index;
    s32 nextIndex;

    index = menu->selection;
    current = menu->items + index;
    nextIndex = index + 1;
    if ((menu->flags & 1) == 0) {
        sub_804ABFC(7);
        if (nextIndex >= menu->itemCount) {
            nextIndex = 0;
        }
        next = menu->items + nextIndex;
        if (next->sprite != NULL) {
            sub_8061078(next->sprite, 1);
        }
        if (current->sprite != NULL) {
            sub_8061078(current->sprite, 2);
        }
        current->target = current->source->selectedX;
        next->target = next->source->selectedY;
        menu->position.value = 0xFFFF - nextIndex * menu->itemSpacing;
        menu->selection = nextIndex;
        sub_8061660(
            &menu->text, (unk32)next->source->text[getLanguage()], menu->data->font->charWidth);
    }
}

void sub_8050F0C(FrontendMenu* menu)
{
    FrontendMenuItem* current;
    FrontendMenuItem* previous;
    s32 index;
    s32 previousIndex;

    index = menu->selection;
    current = menu->items + index;
    previousIndex = index - 1;
    if ((menu->flags & 1) == 0) {
        sub_804ABFC(7);
        if (previousIndex < 0) {
            previousIndex = menu->itemCount - 1;
        }
        previous = menu->items + previousIndex;
        if (previous->sprite != NULL) {
            sub_8061078(previous->sprite, 1);
        }
        if (current->sprite != NULL) {
            sub_8061078(current->sprite, 2);
        }
        current->target = current->source->selectedX;
        previous->target = previous->source->selectedY;
        menu->position.value = 0xFFFF - previousIndex * menu->itemSpacing;
        menu->selection = previousIndex;
        sub_8061660(
            &menu->text, (unk32)previous->source->text[getLanguage()], menu->data->font->charWidth);
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

INCLUDE_ASM("asm/dump/804a388-tutorial/8050fc8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8050fe8.s");

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
