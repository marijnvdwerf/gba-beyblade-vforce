#ifndef _MENU_H
#define _MENU_H

#include "common.h"

typedef struct UnkMenuItem UnkMenuItem;

typedef void (*UnkMenuCallback)(UnkMenuItem*, s32, UnkMenuItem*, s32);

struct UnkMenuItem {
    unk8 pad0[0x30];
    const u8* text;
    s32 value;
    s32 count;
    unk32 flags;
    const u8* options;
    unk8 disabled;
    unk8 pad45[3];
    UnkMenuItem* next;
};

typedef struct MenuState {
    union {
        struct {
            unk8 pad0[0xC];
            UnkMenuItem* items;
            unk8 pad10[4];
            s32 itemCount;
            unk8 pad18[0xC];
            s32 unk24;
            unk8 pad28[4];
            unk8 normalColor;
            unk8 disabledColor;
            unk8 selectedColor;
            unk8 pad2F;
            UnkMenuCallback callback;
            void (*valueCallback)(UnkMenuItem*, s32);
            unk8 pad38[0x10];
        } menu;

        struct {
            unk8 objectPad0[0x18];
            unk32 objectCount;
            unk8 objectPad1C[0x8C];
            UnkMotion* objectItems;
            unk32 allocation;
            unk32 timer;
            SpriteTextCleanup cleanup;
            UnkMotion motion;
        } object;
    } layout;
} MenuState;

void sub_805AC80(MenuState*, UnkMenuItem*);
void sub_805AFBC(MenuState*, unk32);
s32 sub_805B050(MenuState*, u8);
s32 sub_805B210(MenuState*);
unk32 sub_805B240(MenuState*);

#endif /* _MENU_H */
