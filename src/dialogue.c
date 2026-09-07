#include "dialogue.h"

#include <agb/memory_map.h>

#include "beyblade.h"
#include "debug.h"
#include "display.h"
#include "effects.h"
#include "frontend.h"
#include "gamestate.h"
#include "include_asm.h"
#include "language.h"
#include "ram.h"
#include "sprite.h"
#include "teletype.h"
#include "tutorial.h"

INCLUDE_ASM("asm/dump/8040d18/8041ea0-teletypeDefaultUserCodeHandler.s");

extern const unk8 FontStyle_80688B8[];
extern const unk8 SpriteSheet_821CB80[];
void teletypeDefaultUserCodeHandler(TeletypeState*, unk32);

void sub_80420C4(FrontendState* state, unk32 command)
{
    FrontendSubobject* base;
    const unk8* const* languageStrings;
    unk32 count;
    s32 blend;
    unk32 layer;
    LevelState* levelState;
    SpriteEntry* sprite;

    base = &state->unkB8;
    switch (command) {
    case 0:
        languageStrings = sub_804A364();
        base->unk24 = 0;
        base->unk7C |= 3;
        base->unk14 = 0xA00;
        base[1].unk24 = 0;
        base[1].unk7C |= 3;
        base[1].unk14 = 0x800;
        base[2].unk24 = 0;
        base[2].unk7C |= 3;
        base[2].unk14 = -0x600;
        base[3].unk24 = 0;
        base[3].unk7C |= 3;
        base[3].unk14 = -0xC00;
        languageStrings += getLanguage();
        _unk300007C
            = sub_8063E18(*languageStrings, FontStyle_80688B8, 0x78, 0x800, 0x6400, 0xE000, 0);
        sub_8063F5C(_unk300007C, teletypeDefaultUserCodeHandler);
        _unk3000EE8 = &_unk3000080;
        _unk3000EEC.unk0 = 0;
        sub_8055914(
            &_unk3000080, GetTalkingHead(0)->unk18, GetTalkingHead(0)->unk20, 0x1700, 0x1700);
        _unk30000D4 = 0;
        _unk30000D5 = 0;
        _unk30000D6 = 0;
        _unk30000BC = 0;
        _unk30000C0 = 0x5800;
        _unk30000C4 = 0x4000;
        _unk30000C8 = 0x4000;
        *(vu16*)REG_WININ = 0x1F3F;
        *(vu16*)REG_WINOUT = 0;
        *(vu16*)REG_WIN0H = 0xF0;
        *(vu16*)REG_WIN0V = 0;
        *(vu16*)REG_WIN1H = 0xF0;
        *(vu16*)REG_WIN1V = 0x60A0;
        sprite = allocSprite(0);
        _unk30000D8 = sprite;
        LoadSpriteSheet(_unk30000D8, SpriteSheet_821CB80, 0xDC00, 0x8C00, 0, 0, 0, 0);
        sub_8061168(_unk30000D8, 0xB);
        _unk30000CC = 0x10;
        _unk30000D0 = 0;
        break;
    case 1:
        if (_unk30000D6 == 0) {
            sub_8050894(&state->transition.unk590);
            *(vu16*)REG_DISPCNT &= 0xF1FF;
            *(vu16*)REG_DISPCNT |= 0x6000;
            _unk30000D6 = 1;
        }
        _unk30000BC = _unk30000BC + ((_unk30000C0 - _unk30000BC) >> 3);
        _unk30000C4 = _unk30000C4 + ((_unk30000C8 - _unk30000C4) >> 3);
        *(vu16*)REG_WIN0V = ((0x34 - (_unk30000BC >> 9)) << 8) | ((_unk30000BC >> 9) + 0x34);
        *(vu16*)REG_WIN1V = ((_unk30000C4 >> 8) + 0x60) | 0x6000;
        if ((_unk3000EEC.unk0 & 1) != 0) {
            _unk30000C0 = 0;
            _unk30000D0 = 0x10;
            if ((_unk30000BC >> 8) == 0) {
                layer = (_unk3000EEC.unk0 & 0x300) >> 8;
                _unk30000C0 = 0x5800;
                _unk30000D0 = 0;
                *(vu16*)REG_DISPCNT &= 0xF0FF;
                *(vu16*)REG_DISPCNT |= 0x100 << layer;
                _unk3000EEC.unk0 &= ~1;
            }
        }
        if ((_unk3000EEC.unk0 & 2) != 0 && ((sub_8057C40() >> 4) & 3) == 0) {
            count = (_unk3000EEC.unk0 & 0x3C00) >> 10;
            _unk30000CC = 0x10;
            _unk30000D0 = 0;
            if (count == 0 || --count == 0) {
                _unk3000EEC.unk0 &= ~2;
            }
            _unk3000EEC.unk0 = (_unk3000EEC.unk0 & 0xFFFFC3FF) | (count << 10);
        }
        _unk30000D8->frame.word = (sub_8057C40() >> 8) & 1;
        if (sub_806417C(_unk300007C) != 0) {
            _unk30000D8->y = 0x8C00;
        } else {
            _unk30000D8->y = 0xA000;
        }
        sub_805599C(&_unk3000080);
        break;
    case 7:
        sub_8063F64(_unk300007C);
        sub_8060A94(_unk30000D8);
        sub_8055C30(&_unk3000080);
        break;
    case 8:
        *(vu16*)REG_BLDCNT = 0x9F;
        *(vu16*)REG_BLDY = _unk30000CC;
        if (_unk30000CC == _unk30000D0) {
            break;
        }
        blend = _unk30000CC - 1;
        if (_unk30000CC < _unk30000D0) {
            blend = _unk30000CC + 1;
        }
        _unk30000CC = blend;
        break;
    case 2:
        sub_8063F84(_unk300007C);
        if (_unk30000D4 != 0 && (_unk30000C4 >> 8) == 0) {
            _unk30000D4 = 0;
            sub_806415C(_unk300007C);
            _unk30000C8 = 0x4000;
            _unk30000C4 = 0x4000;
        }
        if (sub_806417C(_unk300007C) != 0 && (_unk3005DA0 & 1) != 0) {
            _unk30000D4 = 1;
            _unk30000C8 = 0;
        }
        if ((sub_8064188(_unk300007C) != 0 && (_unk3005DA0 & 1) != 0) || (_unk3005DA0 & 8) != 0) {
            _unk30000C0 = 0;
            _unk30000C8 = 0;
            _unk30000D0 = 0x10;
            _unk30000D5 = 1;
        }
        if (_unk30000D5 != 0 && (_unk30000BC >> 8) == 0) {
            levelState = sub_8051734();
            *(vu16*)REG_DISPCNT = 0;
            if ((levelState->unk0 & 1) != 0) {
                if (sub_8051744() != 0) {
                    sub_80490F8(0x27);
                } else {
                    sub_80490F8(8);
                    sub_804924C(0x11);
                }
            } else {
                sub_8048FE4();
            }
        }
        break;
    }
}

asm(".align 2, 0\n");
