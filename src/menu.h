#ifndef _MENU_H
#define _MENU_H

#include "common.h"

void sub_805AC80(MenuState*, UnkMenuItem*);
void sub_805AD24(MenuState*, unk32, unk32, s32, unk32, unk32, unk16, unk8, unk8, unk8, unk8,
    MenuStateCallback, MenuStateValueCallback, unk32);
s32 sub_805AFBC(MenuState*, u8);
s32 sub_805B050(MenuState*, unk8);
s32 sub_805B210(MenuState*);
unk32 sub_805B240(MenuState*);

#endif
