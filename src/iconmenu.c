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

INCLUDE_ASM("asm/dump/804a388-tutorial/8050e80.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8050f0c.s");
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

asm(".align 2, 0\n");
