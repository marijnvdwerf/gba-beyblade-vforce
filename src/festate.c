#include <agb/memory_map.h>

#include "beyblade.h"
#include "common.h"
#include "debug.h"
#include "frontend.h"
#include "gamestate.h"
#include "iconmenu.h"
#include "include_asm.h"
#include "language.h"
#include "layer.h"
#include "menu.h"
#include "menuobject.h"
#include "music.h"
#include "packet.h"
#include "palette.h"
#include "ram.h"
#include "spritetext.h"
#include "unsorted.h"

void sub_8043A0C(FrontendState* state, u32 arg1, u32 arg2)
{
    switch (arg1) {
    case 0:
        sub_8049168();
        break;
    case 8:
        if (state->transition.value == 0
            && (((_unk3005DA0 & 9) != 0 && arg2 > 0x7C) || arg2 == 0xF0)) {
            sub_80490F8(state->unk0 + 1);
        }
        break;
    }
}

void sub_8043A58(FrontendState* state, u32 arg1, u32 arg2)
{
    switch (arg1) {
    case 0:
        sub_8049168();
        break;
    case 8:
        if (state->transition.value == 0
            && (((_unk3005DA0 & 9) != 0 && arg2 > 0x7C) || arg2 == 0xF0)) {
            sub_80490F8(7);
        }
        break;
    }
}

void sub_8043AA0(FrontendState* state, u32 arg1)
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
        menu = &state->menuState.menu;
        newIconMenu(menu, _80689A4, 0);
        sub_8050FEC(menu, 0x9600);
        _unk3000168 = 0;
        sub_8049168();
        break;
    case 7:
        sub_8051028(&state->menuState.menu);
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
        sub_80439A0(&state->unk140);
        menu = &state->menuState.menu;
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
            sub_8050F98(&state->menuState.menu);
            switch (state->menuState.menu.selection) {
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

void sub_8043CF8(FrontendState* state, u32 arg1)
{
    switch (arg1) {
    case 0:
        sub_8049168();
        break;
    case 1:
        sub_80439A0(&state->unkB8);
        break;
    case 2:
        if (_unk3005DA0 == 2) {
            sub_80490F8(10);
        }
        break;
    case 5:
        sub_8051688(sub_805B210(&state->menuState));
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

void sub_8043D84(FrontendState* state, u32 arg1)
{
    switch (arg1) {
    case 0:
        sub_8049168();
        break;
    case 1:
        sub_80439A0(&state->unkB8);
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

void sub_80453D8(FrontendState* state, u32 arg1)
{
    switch (arg1) {
    case 0:
        sub_8049168();
        break;
    case 1:
        sub_80439A0(&state->unkB8);
        break;
    case 5:
        switch (sub_805B240(&state->menuState)) {
        case 0:
            sub_80490F8(0x16);
            return;
        case 1:
            sub_80490F8(0xA);
            return;
        }
        break;
    }
}

void sub_804541C(FrontendState* state, u32 arg1)
{
    FrontendMenu* menu;
    SpriteEntry* sprite1;
    SpriteEntry* sprite2;
    s32 selection;

    switch (arg1) {
    case 0: {
        sprite1 = allocSprite(0);
        _unk300036C = sprite1;
        if (sprite1 != NULL) {
            LoadSpriteSheet(sprite1, SpriteSheet_823BF04, 0xFFFF0000, 0x5400, 0, 0, 0, 0);
        }
        sprite2 = allocSprite(0);
        _unk3000370 = sprite2;
        if (sprite2 != NULL) {
            LoadSpriteSheet(sprite2, SpriteSheet_823BF04, 0x18000, 0x5400, 0, 0, 1, 0);
        }
        _unk3000374 = 0x800;
        _unk3000378.value = 0xD800;
        menu = &state->menuState.menu;
        newIconMenu(menu, _80692A4, sub_805162C() == 0 ? 3 : 0);
        sub_8050FEC(menu, 0x9600);
        break;
    }
    case 7:
        sub_8051028(&state->menuState.menu);
        if (_unk300036C != NULL) {
            sub_8060A94(_unk300036C);
        }
        if (_unk3000370 != NULL) {
            sub_8060A94(_unk3000370);
        }
        break;
    case 1:
        if (_unk300036C != NULL) {
            _unk300036C->x += ((_unk3000374 - _unk300036C->x) >> 3)
                + Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        if (_unk3000370 != NULL) {
            _unk3000370->x += ((_unk3000378.value - _unk3000370->x) >> 3)
                - Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        sub_80439A0(&state->unk140);
        menu = &state->menuState.menu;
        sub_8050C18(menu);
        if ((_unk3005DA0 & 0x30) != 0) {
            if ((_unk3005DA0 & 0x20) != 0) {
                sub_8050F0C(menu);
            } else {
                sub_8050E80(menu);
            }
        }
        break;
    case 2:
        if ((_unk3005DA0 & 1) != 0) {
            _unk3000374 = 0xFFFF0000;
            _unk3000378.value = 0x1E000;
            sub_8050F98(&state->menuState.menu);
            selection = state->menuState.menu.selection;
            switch (selection) {
            case 0:
                sub_80490F8(0x1B);
                break;
            case 1:
                sub_80490F8(0xA);
                break;
            case 2:
                sub_80490F8(0x28);
                break;
            case 3:
                sub_80490F8(0x29);
                break;
            }
        }
        break;
    }
}

void sub_8045638(FrontendState* state, u32 arg1, u32 arg2)
{
    switch (arg1) {
    case 0:
        sub_8049168();
        break;
    case 1:
        sub_80439A0(&state->unk140);
        break;
    case 8:
        if (arg2 == 0x24) {
            sub_80490F8(sub_8049258());
        }
        break;
    }
}

void sub_804566C(FrontendState* state, unk32 arg1)
{
    switch (arg1) {
    case 0:
        sub_8048FE4();
        break;
    case 1:
        sub_80439A0(&state->unk140);
        break;
    }
}

void sub_804568C(FrontendState* state, u32 arg1)
{
    FrontendResource* resource;
    s32 i;

    switch (arg1) {
    case 0:
        sub_8049168();
        sub_8057158(&_unk3000380, _80693A0);
        sub_8057158(&_unk3000388, _8069378);
        sub_8057158(&_unk3000390, _806938C);
        sub_8057158(&_unk3000398, _80693B4);
        sub_8057158(&_unk30003A0, _80693C8);
        break;
    case 1:
        resource = &_unk3000380;
        sub_8057164(resource);
        if (sub_80571D0(resource) != 0) {
            for (i = 0; i <= 0x37; i++) {
                sub_8051720(i)->unk0 |= 2;
            }
            sub_804ABFC(8);
        }
        resource = &_unk3000388;
        sub_8057164(resource);
        if (sub_80571D0(resource) != 0) {
            _currentGameState->unkC64 |= 1;
            sub_804ABFC(8);
        }
        resource = &_unk3000390;
        sub_8057164(resource);
        if (sub_80571D0(resource) != 0) {
            for (i = 0; i <= 0x6C; i++) {
                sub_8057104(i, 1);
            }
            sub_804ABFC(8);
        }
        resource = &_unk3000398;
        sub_8057164(resource);
        if (sub_80571D0(resource) != 0) {
            _currentGameState->unkC64 |= 2;
            sub_804ABFC(8);
        }
        resource = &_unk30003A0;
        sub_8057164(resource);
        if (sub_80571D0(resource) != 0) {
            _currentGameState->unkC64 |= 4;
            sub_804ABFC(8);
        }
        if (((sub_8057C40() >> 8) & 1) != 0) {
            *(vu16*)REG_DISPCNT |= 0x1000;
        } else {
            *(vu16*)REG_DISPCNT &= 0xEFFF;
        }
        break;
    case 2:
        if ((_unk3005DA0 & 9) != 0) {
            sub_804924C(0xA);
            sub_80490F8(8);
        }
        break;
    case 7:
        *(vu16*)REG_DISPCNT |= 0x1000;
        break;
    }
}

void sub_8045848(FrontendState* state, u32 arg1)
{
    FrontendMenu* menu;
    SpriteEntry* sprite1;
    SpriteEntry* sprite2;
    s32 selection;

    switch (arg1) {
    case 0:
        sprite1 = allocSprite(0);
        _unk30003A8 = sprite1;
        if (sprite1 != NULL) {
            LoadSpriteSheet(sprite1, SpriteSheet_823BF04, 0xFFFF0000, 0x5400, 0, 0, 0, 0);
        }
        sprite2 = allocSprite(0);
        _unk30003AC = sprite2;
        if (sprite2 != NULL) {
            LoadSpriteSheet(sprite2, SpriteSheet_823BF04, 0x18000, 0x5400, 0, 0, 1, 0);
        }
        _unk30003B0 = 0x800;
        _unk30003B4 = 0xD800;
        menu = &state->menuState.menu;
        newIconMenu(menu, _80693DC, 0);
        sub_8050FEC(menu, 0x9600);
        sub_8049168();
        break;
    case 7:
        sub_8051028(&state->menuState.menu);
        if (_unk30003A8 != NULL) {
            sub_8060A94(_unk30003A8);
        }
        if (_unk30003AC != NULL) {
            sub_8060A94(_unk30003AC);
        }
        break;
    case 1:
        if (_unk30003A8 != NULL) {
            _unk30003A8->x += ((_unk30003B0 - _unk30003A8->x) >> 3)
                + Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        if (_unk30003AC != NULL) {
            _unk30003AC->x += ((_unk30003B4 - _unk30003AC->x) >> 3)
                - Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        sub_80439A0(&state->unk140);
        menu = &state->menuState.menu;
        sub_8050C18(menu);
        if ((_unk3005DA0 & 0x30) != 0) {
            if ((_unk3005DA0 & 0x20) != 0) {
                sub_8050F0C(menu);
            } else {
                sub_8050E80(menu);
            }
        }
        break;
    case 2:
        if ((_unk3005DA0 & 1) != 0) {
            _unk30003B0 = 0xFFFF0000;
            _unk30003B4 = 0x1E000;
            sub_8050F98(&state->menuState.menu);
            selection = state->menuState.menu.selection;
            switch (selection) {
            case 0:
                sub_8051798(1);
                sub_80490F8(0x19);
                break;
            case 2:
                sub_8051798(1);
                sub_80490F8(0xF);
                break;
            case 1:
                sub_8051798(4);
                sub_80490F8(0xF);
                break;
            case 4:
                sub_80490F8(0x28);
                break;
            case 3:
                sub_80490F8(0xC);
                break;
            }
        }
        break;
    }
}

void sub_8045A7C(FrontendState* state, u32 arg1)
{
    switch (arg1) {
    case 0: {
        SpriteEntry* sprite1;
        SpriteEntry* sprite2;
        sprite1 = allocSprite(0);
        _unk30003B8 = sprite1;
        if (sprite1 != NULL) {
            LoadSpriteSheet(sprite1, SpriteSheet_823BF04, 0xFFFF0000, 0x5400, 0, 0, 0, 0);
        }
        sprite2 = allocSprite(0);
        _unk30003BC = sprite2;
        if (sprite2 != NULL) {
            LoadSpriteSheet(sprite2, SpriteSheet_823BF04, 0x18000, 0x5400, 0, 0, 1, 0);
        }
        _unk30003C0 = 0x800;
        _unk30003C4 = 0xD800;
        newIconMenu(&state->menuState.menu, _8069428, 0);
        sub_8050FEC(&state->menuState.menu, 0x9600);
        break;
    }
    case 7:
        sub_8051028(&state->menuState.menu);
        if (_unk30003B8 != NULL) {
            sub_8060A94(_unk30003B8);
        }
        if (_unk30003BC != NULL) {
            sub_8060A94(_unk30003BC);
        }
        break;
    case 1: {
        FrontendMenu* menu;

        if (_unk30003B8 != NULL) {
            _unk30003B8->x += ((_unk30003C0 - _unk30003B8->x) >> 3)
                + Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        if (_unk30003BC != NULL) {
            _unk30003BC->x += ((_unk30003C4 - _unk30003BC->x) >> 3)
                - Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        sub_80439A0(&state->unk140);
        menu = &state->menuState.menu;
        sub_8050C18(menu);
        if ((_unk3005DA0 & 0x30) != 0) {
            if ((_unk3005DA0 & 0x20) != 0) {
                sub_8050F0C(menu);
            } else {
                sub_8050E80(menu);
            }
        }
        break;
    }
    case 2: {
        s32 selection;

        if ((_unk3005DA0 & arg1) != 0) {
            _unk30003C0 = 0xFFFF0000;
            _unk30003C4 = 0x1E000;
            sub_8050FC8(&state->menuState.menu);
            sub_80490F8(0xA);
        }
        if ((_unk3005DA0 & 1) != 0) {
            _unk30003C0 = 0xFFFF0000;
            _unk30003C4 = 0x1E000;
            sub_8050F98(&state->menuState.menu);
            selection = state->menuState.menu.selection;
            switch (selection) {
            case 0:
                sub_80490F8(0xD);
                break;
            case 1:
                sub_80490F8(0x29);
                break;
            case 2:
                sub_80490F8(0x1A);
                break;
            case 3:
                sub_80490F8(0xE);
                break;
            }
        }
    } break;
    }
}

INCLUDE_ASM("asm/dump/8040d18/8045cb4.s");

void sub_80461D8(FrontendState* state, u32 arg1)
{
    SpriteEntry* sprite1;
    SpriteEntry* sprite2;

    switch (arg1) {
    case 0:
        sprite1 = allocSprite(0);
        _unk3000464 = sprite1;
        if (sprite1 != NULL) {
            LoadSpriteSheet(sprite1, SpriteSheet_823BF04, 0xFFFF0000, 0x5400, 0, 0, 0, 0);
        }
        sprite2 = allocSprite(0);
        _unk3000468 = sprite2;
        if (sprite2 != NULL) {
            LoadSpriteSheet(sprite2, SpriteSheet_823BF04, 0x18000, 0x5400, 0, 0, 1, 0);
        }
        _unk300046C = 0x800;
        _unk3000470 = 0xD800;
        newIconMenu(&state->menuState.menu, _8069514, _currentGameState->unkC68 == 0 ? 1 : 0);
        sub_8050FEC(&state->menuState.menu, 0x9600);
        break;
    case 7:
        sub_8051028(&state->menuState.menu);
        if (_unk3000464 != NULL) {
            sub_8060A94(_unk3000464);
        }
        if (_unk3000468 != NULL) {
            sub_8060A94(_unk3000468);
        }
        break;
    case 1:
        if (_unk3000464 != NULL) {
            _unk3000464->x += ((_unk300046C - _unk3000464->x) >> 3)
                + Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        if (_unk3000468 != NULL) {
            _unk3000468->x += ((_unk3000470 - _unk3000468->x) >> 3)
                - Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        sub_80439A0(&state->unk140);
        sub_8050C18(&state->menuState.menu);
        if ((_unk3005DA0 & 0x30) != 0) {
            if ((_unk3005DA0 & 0x20) != 0) {
                sub_8050F0C(&state->menuState.menu);
            } else {
                sub_8050E80(&state->menuState.menu);
            }
        }
        break;
    case 2:
        if ((_unk3005DA0 & 1) != 0) {
            _unk300046C = 0xFFFF0000;
            _unk3000470 = 0x1E000;
            sub_8050F98(&state->menuState.menu);
            switch (state->menuState.menu.selection) {
            case 0:
                _currentGameState->unkC68 = 1;
                break;
            case 1:
                _currentGameState->unkC68 = 0;
                break;
            }
            sub_80490F8(0xC);
        }
        if ((_unk3005DA0 & 2) != 0) {
            sub_8050FC8(&state->menuState.menu);
            sub_8049178();
        }
        break;
    }
}

void sub_8046424(FrontendState* arg0, u32 arg1)
{
    switch (arg1) {
    case 0:
        sub_8049168();
        break;
    case 1:
        sub_80439A0(&arg0->unkB8);
        break;
    case 2:
        if (_unk3005DA0 == 2) {
            sub_80490F8(0xA);
        }
        break;
    case 5:
        sub_80490F8(0xF);
        break;
    }
}

void sub_8046468(FrontendSelectionObject* arg0, const ItemDescriptionEntry* arg1, unk32 arg2)
{
    Palette palette;
    unk8 mode;

    mode = (unk8)arg2;
    getLanguage();
    if ((arg0->unkE & 1) != 0) {
        sub_8060A60(arg0->sprite);
    }
    arg0->unkE |= 1;
    if (mode != 0) {
        arg0->unkE |= 2;
    } else {
        sub_8063830(&palette, (unk16*)OBJ_PLTT, 0, 0x10, 0x10, 0x10);
        deallocate_80637CC(&palette);
    }
}


void sub_80464C0(FrontendSelectionObject* arg0, s32 value)
{
    arg0->sprite->x = value + (0x80 << 6);
    sub_8061844(arg0->unk4, (value >> 8) + 0x54, arg0->unk4->y >> 8);
    sub_8061844(arg0->unk8, (value >> 8) + 0x70, arg0->unk8->y >> 8);
}

void sub_8046500(FrontendState* state, u32 arg1, u32 arg2)
{
    SpriteEntry* leftSprite;
    SpriteEntry* rightSprite;
    s32 scrollDelta;

    switch (arg1) {
    case 0:
        leftSprite = allocSprite(0);
        _unk3000494 = leftSprite;
        if (leftSprite != NULL) {
            LoadSpriteSheet(leftSprite, SpriteSheet_823BF04, 0xFFFF0000, 0x5400, 0, 0, 0, 0);
        }
        rightSprite = allocSprite(0);
        _unk3000498 = rightSprite;
        if (rightSprite != NULL) {
            LoadSpriteSheet(rightSprite, SpriteSheet_823BF04, 0x18000, 0x5400, 0, 0, 1, 0);
        }
        _unk300049C = 0x800;
        _unk30004A0 = 0xD800;
        _unk3000478.value = 0x10000;
        _unk3000474 = 0;
        sub_80596AC(&state->unk250, -_unk3000478.value, 0x2400);
        _unk3000480.frame = 0;
        _unk3000480.unk4 = sub_804A0E0(0);
        _unk3000480.unk8 = sub_804A0E0(1);
        _unk3000491 = 0;
        _unk3000490 = 1;
        state->unk80 |= 0x30;
        break;
    case 7:
        if (_unk3000494 != NULL) {
            sub_8060A94(_unk3000494);
        }
        if (_unk3000498 != NULL) {
            sub_8060A94(_unk3000498);
        }
        if (_unk3000480.sprite != NULL) {
            sub_8060A94(_unk3000480.sprite);
        }
        break;
    case 8:
        if (arg2 == 1) {
            _unk3000491 = arg2;
            _unk3000480.sprite = allocSprite(0);
            sub_8046468(&_unk3000480, sub_80570C0(_unk3000480.frame), 1);
        }
        break;
    case 1:
        sub_80439A0(&state->unk140);
        if (_unk3000494 != NULL) {
            _unk3000494->x += ((_unk300049C - _unk3000494->x) >> 3)
                + Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1] - _unk3000474;
        }
        if (_unk3000498 != NULL) {
            _unk3000498->x += ((_unk30004A0 - _unk3000498->x) >> 3)
                - Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1] + _unk3000474;
        }
        if (_unk3000491 != 0 && (_unk3000478.value >> 8) > 0xFE && _unk3000474 == 0x10000) {
            sub_8046468(&_unk3000480, sub_80570C0(_unk3000480.frame), 1);
            _unk3000474 = 0;
        }
        scrollDelta = (_unk3000474 - _unk3000478.value) >> 2;
        sub_80596AC(&state->unk250, -scrollDelta, 0);
        _unk3000478.value += scrollDelta;
        sub_80464C0(&_unk3000480, _unk3000478.value);
        break;
    case 2:
        if ((_unk3005DA0 & 3) != 0) {
            _unk300049C = 0xFFFF0000;
            _unk30004A0 = 0x1E000;
            _unk3000474 = 0x10000;
            _unk3000491 = 0;
            sub_8049178();
        }
        if ((_unk3005DA0 & 0x30) != 0) {
            if ((_unk3005DA0 & 0x20) != 0) {
                if (_unk3000480.frame > 0) {
                    _unk3000480.frame--;
                } else {
                    _unk3000480.frame = 0x6C;
                }
            } else {
                if (_unk3000480.frame < 0x6C) {
                    _unk3000480.frame++;
                } else {
                    _unk3000480.frame = 0;
                }
            }
            _unk3000474 = 0x10000;
        }
        break;
    case 3:
    case 4:
    case 5:
    case 6:
        break;
    }
}

void sub_8046814(FrontendState* state, u32 arg1)
{
    SpriteEntry* leftSprite;
    SpriteEntry* rightSprite;
    switch (arg1) {
    case 0:
        leftSprite = allocSprite(0);
        _unk30004A4 = leftSprite;
        if (leftSprite != NULL) {
            LoadSpriteSheet(leftSprite, SpriteSheet_823BF04, 0xFFFF0000, 0x5400, 0, 0, 0, 0);
        }
        rightSprite = allocSprite(0);
        _unk30004A8 = rightSprite;
        if (rightSprite != NULL) {
            LoadSpriteSheet(rightSprite, SpriteSheet_823BF04, 0x18000, 0x5400, 0, 0, 1, 0);
        }
        _unk30004AC = 0x800;
        _unk30004B0 = 0xD800;
        newIconMenu(&state->menuState.menu, _8069108, 0);
        sub_8050FEC(&state->menuState.menu, 0x9600);
        sub_8049168();
        break;
    case 7:
        sub_8051028(&state->menuState.menu);
        if (_unk30004A4 != NULL) {
            sub_8060A94(_unk30004A4);
        }
        if (_unk30004A8 != NULL) {
            sub_8060A94(_unk30004A8);
        }
        break;
    case 1:
        if (_unk30004A4 != NULL) {
            _unk30004A4->x += ((_unk30004AC - _unk30004A4->x) >> 3)
                + Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        if (_unk30004A8 != NULL) {
            _unk30004A8->x += ((_unk30004B0 - _unk30004A8->x) >> 3)
                - Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        sub_80439A0(&state->unk140);
        sub_8050C18(&state->menuState.menu);
        break;
    case 2:
        if ((_unk3005DA0 & 0x20) != 0) {
            sub_8050F0C(&state->menuState.menu);
        }
        if ((_unk3005DA0 & 0x10) != 0) {
            sub_8050E80(&state->menuState.menu);
        }
        if ((_unk3005DA0 & arg1) != 0) {
            sub_8050FC8(&state->menuState.menu);
            sub_80490F8(_unk3000648);
        }
        if ((_unk3005DA0 & 1) != 0) {
            if (state->menuState.menu.selection != 0) {
                sub_80490F8(_unk3000648);
            } else {
                sub_80490F8(0x18);
            }
            sub_8050F98(&state->menuState.menu);
        }
        break;
    }
}

INCLUDE_ASM("asm/dump/8040d18/8046a0c.s");

void sub_8046B94(FrontendState* state, u32 arg1)
{
    s32 scrollDelta;

    switch (arg1) {
    case 0:
        _unk30004C8 = -0x10000;
        _unk30004C4 = 0;
        sub_80596AC(&state->unk250, _unk30004C8, 0);
        _unk30004CC = 0;
        if (sub_804915C() == 0xC) {
            _unk3000648 = 0xC;
        } else {
            _unk3000648 = 0x15;
        }
        break;
    case 1:
        if (_unk30004CC == 1) {
            sub_8061660(sub_804A0E0(0), _806E0DC[3][getLanguage()], 0xF);
        }
        sub_80439A0(&state->unk140);
        sub_8061844(sub_804A0E0(0), -(_unk30004C8 >> 8) + 0x10, 0x4A);
        scrollDelta = (_unk30004C4 - _unk30004C8) >> 2;
        sub_80596AC(&state->unk250, scrollDelta, 0);
        _unk30004C8 += scrollDelta;
        _unk30004CC++;
        break;
    case 2:
        if ((_unk3005DA0 & 1) != 0 || _unk30004CC > 0x258) {
            sub_80490F8(0x17);
            _unk30004C4 = -0x10000;
        }
        if ((_unk3005DA0 & 2) != 0) {
            sub_8049178();
            _unk30004C4 = -0x10000;
        }
        break;
    }
}

void sub_8046CC4(FrontendState* state, u32 arg1)
{
    unk32 value;

    switch (arg1) {
    case 0: {
        SpriteEntry* sprite1;
        SpriteEntry* sprite2;
        sprite1 = allocSprite(0);
        _unk30004D0 = sprite1;
        if (sprite1 != NULL) {
            LoadSpriteSheet(sprite1, SpriteSheet_823BF04, 0xFFFF0000, 0x5400, 0, 0, 0, 0);
        }
        sprite2 = allocSprite(0);
        _unk30004D4 = sprite2;
        if (sprite2 != NULL) {
            LoadSpriteSheet(sprite2, SpriteSheet_823BF04, 0x18000, 0x5400, 0, 0, 1, 0);
        }
        _unk30004D8 = 0x800;
        _unk30004DC = 0xD800;
        _unk30004E0 = sub_80515E0();
        if (_unk30004E0 != 0 && sub_8051558() != 0) {
            value = sub_8051618() != 0 ? 2 : 0;
            newIconMenu(&state->menuState.menu, _806980C, value);
        } else {
            unk32 result;
            result = sub_8051618() != 0;
            newIconMenu(&state->menuState.menu, _8069830, result);
        }
        sub_8050FEC(&state->menuState.menu, 0x9600);
        break;
    }
    case 7:
        sub_8051028(&state->menuState.menu);
        if (_unk30004D0 != NULL) {
            sub_8060A94(_unk30004D0);
        }
        if (_unk30004D4 != NULL) {
            sub_8060A94(_unk30004D4);
        }
        break;
    case 1: {
        if (_unk30004D0 != NULL) {
            _unk30004D0->x += ((_unk30004D8 - _unk30004D0->x) >> 3)
                + Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        if (_unk30004D4 != NULL) {
            _unk30004D4->x += ((_unk30004DC - _unk30004D4->x) >> 3)
                - Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        sub_80439A0(&state->unk140);
        sub_8050C18(&state->menuState.menu);
        break;
    }
    case 2:
        if ((_unk3005DA0 & 0x20) != 0) {
            sub_8050F0C(&state->menuState.menu);
        }
        if ((_unk3005DA0 & 0x10) != 0) {
            sub_8050E80(&state->menuState.menu);
        }
        if ((_unk3005DA0 & arg1) != 0) {
            sub_8050FC8(&state->menuState.menu);
            sub_8049178();
        }
        if ((_unk3005DA0 & 1) != 0) {
            sub_8050F98(&state->menuState.menu);
            if (state->menuState.menu.selection == 2) {
                sub_8051488();
            }
            if (state->menuState.menu.selection == 1) {
                sub_80510FC();
            }
            if ((_currentGameState->unkC64 & 4) != 0) {
                sub_80490F8(0xF);
            } else {
                sub_80490F8(0x1B);
            }
        }
        break;
    }
}

INCLUDE_ASM("asm/dump/8040d18/8046f2c-initBBCollectionSprite.s");
INCLUDE_ASM("asm/dump/8040d18/804703c.s");
INCLUDE_ASM("asm/dump/8040d18/8047080.s");
INCLUDE_ASM("asm/dump/8040d18/80470c8.s");
INCLUDE_ASM("asm/dump/8040d18/804712c.s");
INCLUDE_ASM("asm/dump/8040d18/8047494.s");
INCLUDE_ASM("asm/dump/8040d18/80475e0-selectBladeFrontendHandler.s");
INCLUDE_ASM("asm/dump/8040d18/8047e5c.s");

void sub_80480EC(FrontendState* state, unk32 arg1)
{
    FrontendMenu* menu;
    SpriteEntry* sprite1;
    SpriteEntry* sprite2;

    switch (arg1) {
    case 0:
        sprite1 = allocSprite(0);
        _unk30005B0 = sprite1;
        if (sprite1 != NULL) {
            LoadSpriteSheet(sprite1, SpriteSheet_823BF04, 0xFFFF0000, 0x5400, 0, 0, 0, 0);
        }
        sprite2 = allocSprite(0);
        _unk30005B4 = sprite2;
        if (sprite2 != NULL) {
            LoadSpriteSheet(sprite2, SpriteSheet_823BF04, 0x18000, 0x5400, 0, 0, 1, 0);
        }
        _unk30005B8 = 0x800;
        _unk30005BC = 0xD800;
        menu = &state->menuState.menu;
        newIconMenu(menu, _8069D04, 0);
        sub_8050FEC(menu, 0x9600);
        sub_8049168();
        break;
    case 7:
        sub_8051028(&state->menuState.menu);
        if (_unk30005B0 != NULL) {
            sub_8060A94(_unk30005B0);
        }
        if (_unk30005B4 != NULL) {
            sub_8060A94(_unk30005B4);
        }
        break;
    case 1:
        if (_unk30005B0 != NULL) {
            _unk30005B0->x += ((_unk30005B8 - _unk30005B0->x) >> 3)
                + Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        if (_unk30005B4 != NULL) {
            _unk30005B4->x += ((_unk30005BC - _unk30005B4->x) >> 3)
                - Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        sub_80439A0(&state->unk140);
        menu = &state->menuState.menu;
        sub_8050C18(menu);
        if ((_unk3005DA0 & 0x30) != 0) {
            if ((_unk3005DA0 & 0x20) != 0) {
                sub_8050F0C(menu);
            } else {
                sub_8050E80(menu);
            }
        }
        break;
    case 2:
        if ((_unk3005DA0 & 1) != 0) {
            _unk30005B8 = 0xFFFF0000;
            _unk30005BC = 0x1E000;
            sub_8050F98(&state->menuState.menu);
            switch (state->menuState.menu.selection) {
            case 0:
                sub_80490F8(0x1F);
                break;
            case 1: {
                GameData* gameData;

                gameData = _gameData;
                gameData->unk1618 = 0;
                gameData->unk1619 = 0;
                gameData->unk161A = 0;
                sub_80600B4();
                sub_80490F8(0xA);
                break;
            }
            }
        }
        break;
    }
}

INCLUDE_ASM("asm/dump/8040d18/8048310.s");
INCLUDE_ASM("asm/dump/8040d18/804868c.s");
INCLUDE_ASM("asm/dump/8040d18/8048a74.s");
INCLUDE_ASM("asm/dump/8040d18/8048ae8.s");

void sub_8048D8C(FrontendState* state, u32 arg1)
{
    switch (arg1) {
    case 0: {
        LevelDescription* description;
        SpriteEntry* sprite;
        s32* scrollPosition;
        s32 initialScroll;

        _unk3000644 = _currentGameState->unk6EA;
        description = getLevelDescription(_unk3000644);
        if (description->unkC4 != NULL) {
            __fastMemoryCopyARM(description->unkC4, OBJ_PLTT_PTR, 0x20);
        }
        sprite = allocSprite(0);
        _unk3000600 = sprite;
        _unk3000604 = 0x5800;
        _unk3000640 = 0x1000;
        _unk3000608 = 0;
        scrollPosition = &_unk300060C;
        initialScroll = 0x10000;
        *scrollPosition = initialScroll;
        sub_80596AC(&state->unk250, -initialScroll, 0);
        if (_unk3000600 != NULL) {
            LoadSpriteSheet(_unk3000600, description->unkC0, initialScroll, 0x2300, 0, 0, 0, 0);
        }
        allocFont(&_unk3000610, SpriteSheet_82B05EC, ShadowFontMeta, 0x100, 0x6E, 0xD0, 2);
        sub_8061660(&_unk3000610, _806E650[getLanguage()], 0xF);
        showString(&_unk3000610, description->unk68[getLanguage()], 0xF);
        break;
    }
    case 7:
        sub_8061204(&_unk3000610);
        if (_unk3000600 != NULL) {
            sub_8060A94(_unk3000600);
        }
        break;
    case 1: {
        s32 textX;
        s32 scrollDelta;

        textX = _unk3000610.x;
        sub_80439A0(&state->unk140);
        _unk3000600->x += (_unk3000604 - _unk3000600->x) >> 2;
        textX += (_unk3000640 - textX) >> 2;
        sub_8061844(&_unk3000610, textX >> 8, 0x6E);
        scrollDelta = (_unk3000608 - _unk300060C) >> 2;
        sub_80596AC(&state->unk250, -scrollDelta, 0);
        _unk300060C += scrollDelta;
        break;
    }
    case 2:
        if ((_unk3005DA0 & 1) != 0) {
            _unk3000604 = 0x10000;
            _unk3000640 = 0x10000;
            _unk3000608 = 0x10000;
            sub_80490F8(0x15);
        }
        break;
    }
}
