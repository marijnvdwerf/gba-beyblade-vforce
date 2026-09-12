#include "transition.h"

#include <agb/memory_map.h>

#include "frontend.h"
#include "keystate.h"
#include "layer.h"
#include "ram.h"
#include "system.h"

extern const TransitionImage _80687F0[];

void sub_804257C(FrontendState* state, unk32 command)
{
    switch (command) {
    case 0:
        *(vu16*)PLTT = 0;
        _unk30000DC = 0;
        _unk30000DD = 0;
        _unk30000E0 = 0;
        _unk30000E4 = 0;
        _unk30000E8 = 0;
        _unk30000EC = 0x10;
        _unk30000F0 = 0x10;
        _unk30000F4 = 0;
        *(vu16*)REG_WININ = 0x1F3F;
        *(vu16*)REG_WINOUT = 0;
        *(vu16*)REG_WIN0H = 0xF0;
        *(vu16*)REG_WIN0V = 0;
        break;
    case 1:
        _unk30000E4 += (_unk30000E8 - _unk30000E4) >> 3;
        *(vu16*)REG_WIN0V = ((0x34 - (_unk30000E4 >> 9)) << 8) | ((_unk30000E4 >> 9) + 0x34);
        if (_unk30000F4 != 0) {
            _unk30000F4--;
            if (_unk30000F4 == 0) {
                _unk30000E8 = 0;
                _unk30000F0 = 0x10;
            }
        }
        break;
    case 8:
        *(vu16*)REG_BLDCNT = 0x9F;
        *(vu16*)REG_BLDY = _unk30000EC;
        if (_unk30000EC != _unk30000F0) {
            _unk30000EC = _unk30000EC < _unk30000F0 ? _unk30000EC + 1 : _unk30000EC - 1;
        }
        break;
    case 2: {
        BGLayer* layer;
        const TransitionImage* images;

        if (_unk30000DC != 0 && _unk30000DD == 0) {
            *(vu16*)REG_DISPCNT = 0x3140;
            _unk30000DC = 0;
        }
        if ((_unk30000E4 >> 8) == 0) {
            if (_unk30000E0 <= 4) {
                _unk30000DC = 1;
                _unk30000E8 = 0x5800;
                _unk30000F0 = 0;
            } else {
                _unk30000DD = 1;
            }
        }
        if (_unk3005DA0 & 8) {
            _unk30000F0 = 0x10;
            _unk30000E8 = 0;
            _unk30000DD = 1;
        }
        if (_unk30000DD != 0 && (_unk30000E4 >> 8) == 0) {
            *(vu16*)REG_DISPCNT = 0;
            sub_80490F8(8);
            sub_804924C(0x1A);
        }
        if (_unk30000DC != 0 && _unk30000DD == 0) {
            layer = &state->bgLayers[0];
            images = _80687F0;
            *(vu16*)REG_DISPCNT = 0;
            *(vu16*)PLTT = 0;
            sub_8059934();
            sub_8058A28(layer, 0, images[_unk30000E0].unk0, 0, 0);
            loadPalette(images[_unk30000E0].unk4);
            *(vu16*)PLTT = 0;
            _unk30000F4 = 0x12C;
            _unk30000E0++;
        }
        break;
    }
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
        break;
    }
}
