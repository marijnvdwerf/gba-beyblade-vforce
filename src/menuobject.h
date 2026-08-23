#ifndef _MENUOBJECT_H
#define _MENUOBJECT_H

#include "common.h"
#include "spritetext.h"

typedef FrontendMenuState MenuState;

typedef struct MenuObject {
    unk8 pad0[0x478];
    MenuState state;
    unk32 count;
    unk8 pad494[0x8C];
    UnkMotion* items;
    unk32 allocation;
    unk32 timer;
    SpriteTextCleanup cleanup;
    UnkMotion motion;
} MenuObject;

void sub_80434EC(MenuObject*);
void sub_804374C(MenuObject*);
unk32 sub_8043720(MenuObject*);
void sub_805AFBC(MenuState*, unk32);
unk32 sub_805B210(MenuState*);
void sub_805B050(MenuState*, unk32);

#endif /* _MENUOBJECT_H */
