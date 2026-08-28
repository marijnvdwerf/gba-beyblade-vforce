#include "iconmenu.h"

#include "debug.h"
#include "include_asm.h"
#include "language.h"
#include "memory.h"
#include "music.h"
#include "packet.h"
#include "sprite.h"
#include "spritetext.h"

typedef struct FrontendMenuFontData {
    const unk8* spriteSheet;
    const unk8* font;
    unk16 tileCount;
    unk8 unkA;
    unk8 padB[1];
} FrontendMenuFontData;

#if 0
void newIconMenu(FrontendMenu* menu, const FrontendMenuData* data, unk32 count)
{
    FrontendMenuItem* item;
    FrontendMenuItemData* itemData;
    FrontendMenuFontData* fontData;
    s32 size;
    s32 i;
    s32 offsets[2];
    s32 angle;
    SpriteEntry* sprite;

    size = (data->itemCount * 7) << 2;
    angle = 0x80;
    menu->block = slowAllocate(size);
    if (menu->block == NULL) {
        printf(Str_8729398, size);
    }
    menu->items = menu->block->address;
    menu->itemCount = data->itemCount;
    menu->config = (FrontendMenuConfig*)data;
    menu->flags = 0;
    menu->unk34 = data->x;
    menu->unk38 = data->y;
    menu->step = 0x4000 / data->itemCount;
    menu->velocity = 0;
    menu->position = 0xFFFF - count * menu->step;
    menu->unk8 = menu->position;
    menu->selection = count;
    menu->timer = 0;
    menu->timerTarget = 0;
    menu->textPosition = data->scale;
    menu->targetPosition = data->scale;
    itemData = data->items;
    item = menu->items;
    i = 0;
    while (i < data->itemCount) {
        offsets[0] = Unk_874CC3C[(angle >> 8) & 0xFF] * data->scale >> 8;
        offsets[1] = Unk_874CC3C[((angle >> 8) & 0xFF) + 0x40] * data->scale >> 8;
        item->data = itemData;
        item->x = itemData->unk18;
        item->y = itemData->unk1C;
        item->unk10 = itemData->nextPosition;
        item->position = itemData->nextPosition;
        if (i == count) {
            item->position = itemData->previousPosition;
        }
        item->sprite = allocSprite(i == count ? 1 : 2);
        item->unk18 = 0;
        sprite = item->sprite;
        if (sprite != NULL) {
            LoadSpriteSheet(sprite, itemData->spriteSheet, data->x - item->x + offsets[0],
                            data->y - item->y + offsets[1], 0, 2, 0, itemData->tileCount);
        }
        item++;
        itemData++;
        angle += menu->step;
        i++;
    }
    fontData = *(FrontendMenuFontData**)data;
    allocFont(&menu->text, fontData->spriteSheet, fontData->font,
              (data->unk14 << 8) >> 16, (data->unk18 << 8) >> 16, 0xF0, fontData->tileCount);
    itemData = data->items + count;
    sub_8061660(&menu->text, itemData->labels[getLanguage()], fontData->unkA);
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
