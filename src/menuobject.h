#ifndef _MENUOBJECT_H
#define _MENUOBJECT_H

#include "menu.h"

/* MenuState overlays the menu controls and the owning object's fields. */
typedef struct MenuObject {
    unk8 pad0[0x478];
    MenuState state;
} MenuObject;

void sub_80434EC(MenuObject*);
void sub_804374C(MenuObject*);
unk32 sub_8043720(MenuObject*);

#endif /* _MENUOBJECT_H */
