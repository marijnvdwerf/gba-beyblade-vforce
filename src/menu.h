#ifndef _MENU_H
#define _MENU_H

#include "common.h"

typedef struct MenuItemDescriptor {
    const u8* labels[5];
    unk32 flags; /* 0x14 */
    const MenuOptionSet* subitems; /* 0x18 */
    unk16 x; /* 0x1C */
    unk16 y; /* 0x1E */
} MenuItemDescriptor;

void allocateMenuItems(MenuState*, const MenuItemDescriptor*, unk32);
void sub_805AC80(MenuState*, UnkMenuItem*);
void sub_805AD24(MenuState*, const unk8*, const unk8*, unk32, unk32, unk32, unk32, unk8, unk8, unk8,
    unk8, MenuStateCallback, MenuStateValueCallback, unk8);
unk32 sub_805AFBC(MenuState*, u8);
s32 sub_805B050(MenuState*, unk8);
s32 sub_805B210(MenuState*);
unk32 sub_805B240(MenuState*);

#endif
