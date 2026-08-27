#include "credits.h"

#include <agb/memory_map.h>

#include "debug.h"
#include "frontend.h"
#include "include_asm.h"
#include "keystate.h"
#include "layer.h"
#include "packet.h"
#include "ram.h"
#include "spritetext.h"
#include "system.h"

extern CreditsEntry Credits[];

extern const unk8 SpriteSheet_82B05EC[];
extern const unk8 ShadowFontMeta[];
extern const unk8 Str_86FCED8[];

void creditsFrontendHandler(FrontendState* state, unk32 arg1)
{
    switch (arg1) {
    case 0:
        _3000004 = -0x10000;
        _3000000 = 0;
        sub_80596AC(&state->unk250, -0x10000, 0);
        _3000008 = 0;
        _3000020 = 0;
        _3000021 = 0;
        _currentCreditsPtr = NULL;
        _creditsPtr = Credits;
        _300000C = 0;
        _3000010 = 0;
        _3000014 = 0;
        _3000024 = NULL;
        _fontPtr = NULL;
        break;
    case 1:
        /* ldrh 0x584: value and unk585 are tested as one halfword. */
        if (*(unk16*)&state->transition == 0) {
            *(vu16*)REG_BLDCNT = 0xF40;
            *(vu16*)REG_BLDALPHA = _300000C | ((0x10 - _300000C) << 8);
            if (_3000014 != 0) {
                _3000014--;
            } else {
                _3000010 = 0;
            }
            if (_300000C != _3000010) {
                s32 next;
                next = _300000C - 1;
                if (_3000010 > _300000C) {
                    next = _300000C + 1;
                }
                _300000C = next;
            }
            if (_300000C == 0) {
                _3000020 = 1;
            }
        }
        if (_3000020 != 0 && (_creditsPtr->unk4 & 1)) {
            _3000021 = 1;
        }
        if ((_unk3005DA0 & 0xB) != 0 && state->transition.value == 0) {
            _3000021 = 1;
        }
        if (_3000021 != 0 && _3000008 != 0) {
            _3000021 = 1;
            if (sub_804915C() == 8) {
                sub_80490F8(0xA);
            } else {
                sub_8049178();
            }
            _3000000 = -0x10000;
            while (_3000008-- != 0) {
                sub_8061204(_fontPtr);
                _fontPtr++;
            }
            _3000008 = 0;
            if (_3000024 != NULL) {
                deallocateBlock(_3000024);
            }
            _3000024 = NULL;
            _3000020 = 0;
        }
        if (_3000020 != 0) {
            s32 totalWidth;
            s32 x;
            s32 i;

            while (_3000008-- != 0) {
                sub_8061204(_fontPtr);
                _fontPtr++;
            }
            if (_3000024 != NULL) {
                deallocateBlock(_3000024);
            }
            _3000008 = 0;
            totalWidth = 0;
            _currentCreditsPtr = _creditsPtr;
            while (_creditsPtr->text != NULL) {
                totalWidth += _creditsPtr->width;
                _creditsPtr++;
                _3000008++;
            }
            _creditsPtr++;
            _3000024 = slowAllocate(_3000008 * sizeof(SpriteTextCleanup));
            if (_3000024 == NULL) {
                printf(Str_86FCED8);
            }
            _fontPtr = _3000024->address;
            x = 0x50 - (totalWidth >> 1);
            for (i = 0; i < _3000008; i++) {
                allocFont(&_fontPtr[i], SpriteSheet_82B05EC, ShadowFontMeta, 0, x, 0xF0, 2);
                sub_8061660(&_fontPtr[i], _currentCreditsPtr[i].text, _currentCreditsPtr[i].color);
                sub_8061E58(&_fontPtr[i], 1);
                x += _currentCreditsPtr[i].width;
            }
            _3000010 = 0x10;
            _3000014 = 0x78;
            _3000020 = 0;
        }
        sub_80439A0(&state->unk140);
        if (_3000000 != _3000004) {
            s32 delta;
            delta = (_3000000 - _3000004) >> 2;
            sub_80596AC(&state->unk250, delta, 0);
            _3000004 += delta;
        }
        break;
    case 2:
    default:
        break;
    }
}
