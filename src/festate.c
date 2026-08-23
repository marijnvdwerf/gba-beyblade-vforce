#include "common.h"
#include "debug.h"
#include "frontend.h"
#include "gamestate.h"
#include "iconmenu.h"
#include "include_asm.h"
#include "language.h"
#include "menuobject.h"
#include "packet.h"
#include "ram.h"
#include "unsorted.h"

extern const u8 SpriteSheet_823BF04[];
extern const unk32 _80689A4[];
extern const s16 Unk_874CC3C[];

void sub_8043A0C(FrontendState* state, unk32 arg1, unk32 arg2)
{
    s8 value;

    switch (arg1) {
    case 0:
        sub_8049168();
        break;
    case 8:
        value = state->unk584;
        if (value == 0 && (((_unk3005DA0 & 9) != 0 && arg2 > 0x7C) || arg2 == 0xF0)) {
            sub_80490F8(state->unk0 + 1);
        }
        break;
    }
}

void sub_8043A58(FrontendState* state, unk32 arg1, unk32 arg2)
{
    s8 value;

    switch (arg1) {
    case 0:
        sub_8049168();
        break;
    case 8:
        value = state->unk584;
        if (value == 0 && (((_unk3005DA0 & 9) != 0 && arg2 > 0x7C) || arg2 == 0xF0)) {
            sub_80490F8(7);
        }
        break;
    }
}

void sub_8043AA0(FrontendState* state, unk32 arg1)
{
    FrontendMenu* menu;
    SpriteEntry* sprite1;
    SpriteEntry* sprite2;
    s32 value;
    switch (arg1) {
    case 0:
        sprite1 = allocSprite(0);
        _unk3000158 = sprite1;
        if (sprite1 != NULL) {
            LoadSpriteSheet(sprite1, SpriteSheet_823BF04, 0xFFFF0000, 0x5400, 0, 0, 0, 0);
        }
        sprite2 = allocSprite(0);
        _unk300015C = sprite2;
        if (sprite2 != NULL) {
            LoadSpriteSheet(sprite2, SpriteSheet_823BF04, 0x18000, 0x5400, 0, 0, 1, 0);
        }
        _unk3000160 = 0x800;
        _unk3000164 = 0xD800;
        menu = &state->menu;
        newIconMenu(menu, _80689A4, 0);
        sub_8050FEC(menu, 0x9600);
        _unk3000168 = 0;
        sub_8049168();
        break;
    case 7:
        sub_8051028(&state->menu);
        if (_unk3000158 != NULL) {
            sub_8060A94(_unk3000158);
        }
        if (_unk300015C != NULL) {
            sub_8060A94(_unk300015C);
        }
        break;
    case 1:
        if (_unk3000158 != NULL) {
            _unk3000158->x += ((_unk3000160 - _unk3000158->x) >> 3)
                + Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        if (_unk300015C != NULL) {
            _unk300015C->x += ((_unk3000164 - _unk300015C->x) >> 3)
                - Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        sub_80439A0(state->unk140);
        menu = &state->menu;
        sub_8050C18(menu);
        if ((_unk3005DA0 & 0x30) != 0) {
            if ((_unk3005DA0 & 0x20) != 0) {
                sub_8050F0C(menu);
            } else {
                sub_8050E80(menu);
            }
        }
        if (_unk3000168 != 0) {
            _unk3000168--;
            if (_unk3000168 == 0) {
                sub_80490F8(7);
            }
        }
        break;
    case 2:
        if ((_unk3005DA0 & 9) != 0 && _unk3000168 == 0) {
            _unk3000160 = 0xFFFF0000;
            _unk3000164 = 0x1E000;
            sub_8050F98(&state->menu);
            switch (state->menu.selection) {
            case 0:
                value = 0;
                break;
            case 1:
                value = 3;
                break;
            case 2:
                value = 4;
                break;
            case 3:
                value = 5;
                break;
            case 4:
                value = 7;
                break;
            }
            sub_8063A7C(value);
            _unk3000168 = 0x20;
        }
        break;
    }
}

void sub_8043CF8(FrontendState* state, unk32 arg1)
{
    switch (arg1) {
    case 0:
        sub_8049168();
        break;
    case 1:
        sub_80439A0(state->unkB8);
        break;
    case 2:
        if (_unk3005DA0 == 2) {
            sub_80490F8(10);
        }
        break;
    case 5:
        sub_805B210(&state->menuState);
        sub_8051688();
        sub_8049234(8);
        if (sub_8051780(1) != 0) {
            sub_804924C(0x12);
        } else if (sub_8051780(0x100) != 0) {
            sub_804924C(0x11);
        } else if (sub_8051780(4) != 0) {
            sub_804924C(0x13);
        }
        sub_80490F8(9);
        break;
    }
}

void sub_8043D84(FrontendState* state, unk32 arg1)
{
    switch (arg1) {
    case 0:
        sub_8049168();
        break;
    case 1:
        sub_80439A0(state->unkB8);
        break;
    case 2:
        if (_unk3005DA0 == 1) {
            sub_80490F8(0x14);
        }
        break;
    }
}

INCLUDE_ASM("asm/dump/8040d18/8043db8.s");
INCLUDE_ASM("asm/dump/8040d18/8043f40.s");
INCLUDE_ASM("asm/dump/8040d18/8044054.s");
INCLUDE_ASM("asm/dump/8040d18/804423c.s");
INCLUDE_ASM("asm/dump/8040d18/8044314.s");
INCLUDE_ASM("asm/dump/8040d18/804444c.s");
INCLUDE_ASM("asm/dump/8040d18/80448f4.s");
INCLUDE_ASM("asm/dump/8040d18/8044c48.s");
INCLUDE_ASM("asm/dump/8040d18/8044ed4.s");
INCLUDE_ASM("asm/dump/8040d18/8045160.s");
INCLUDE_ASM("asm/dump/8040d18/80453d8.s");
INCLUDE_ASM("asm/dump/8040d18/804541c.s");
INCLUDE_ASM("asm/dump/8040d18/8045638.s");
INCLUDE_ASM("asm/dump/8040d18/804566c.s");
INCLUDE_ASM("asm/dump/8040d18/804568c.s");
INCLUDE_ASM("asm/dump/8040d18/8045848.s");
INCLUDE_ASM("asm/dump/8040d18/8045a7c.s");
INCLUDE_ASM("asm/dump/8040d18/8045cb4.s");
INCLUDE_ASM("asm/dump/8040d18/80461d8.s");
INCLUDE_ASM("asm/dump/8040d18/8046424.s");
INCLUDE_ASM("asm/dump/8040d18/8046468.s");
INCLUDE_ASM("asm/dump/8040d18/80464c0.s");
INCLUDE_ASM("asm/dump/8040d18/8046500.s");
INCLUDE_ASM("asm/dump/8040d18/8046814.s");
INCLUDE_ASM("asm/dump/8040d18/8046a0c.s");
INCLUDE_ASM("asm/dump/8040d18/8046b94.s");
INCLUDE_ASM("asm/dump/8040d18/8046cc4.s");
INCLUDE_ASM("asm/dump/8040d18/8046f2c-initBBCollectionSprite.s");
INCLUDE_ASM("asm/dump/8040d18/804703c.s");
INCLUDE_ASM("asm/dump/8040d18/8047080.s");
INCLUDE_ASM("asm/dump/8040d18/80470c8.s");
INCLUDE_ASM("asm/dump/8040d18/804712c.s");
INCLUDE_ASM("asm/dump/8040d18/8047494.s");
INCLUDE_ASM("asm/dump/8040d18/80475e0-selectBladeFrontendHandler.s");
INCLUDE_ASM("asm/dump/8040d18/8047e5c.s");
INCLUDE_ASM("asm/dump/8040d18/80480ec.s");
INCLUDE_ASM("asm/dump/8040d18/8048310.s");
INCLUDE_ASM("asm/dump/8040d18/804868c.s");
INCLUDE_ASM("asm/dump/8040d18/8048a74.s");
INCLUDE_ASM("asm/dump/8040d18/8048ae8.s");
INCLUDE_ASM("asm/dump/8040d18/8048d8c.s");
