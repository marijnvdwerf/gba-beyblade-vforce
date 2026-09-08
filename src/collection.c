#include "collection.h"

#include <agb/memory_map.h>

#include "beyblade.h"
#include "debug.h"
#include "effects.h"
#include "frontend.h"
#include "include_asm.h"
#include "keystate.h"
#include "layer.h"
#include "memory.h"
#include "music.h"
#include "packet.h"
#include "ram.h"
#include "sprite.h"
#include "spritetext.h"
#include "unsorted.h"

extern const unk8* _806E8B0[];
extern const unk8 SpriteSheet_823C150[];
extern const unk8 SpriteSheet_823C260[];
extern const unk8 SpriteSheet_823C2C8[];
extern const unk8 SpriteSheet_82B1A84[];
extern const unk8 Str_86FD214[];
extern const unk8 Str_86FD25C[];
extern const unk8 Str_86FD264[];

void collectionListFrontendHandler(FrontendState* state, unk32 command)
{
    s32 i;

    switch (command) {
    case 0: {
        CollectionListData* collectionData;
        SpriteEntry* firstSprite;
        SpriteEntry* secondSprite;
        unk32 allocationSize;
        unk16 frame;

        allocationSize = sizeof(CollectionListData);
        _unk30000FC = -0x10000;
        _unk30000F8 = 0;
        sub_80596AC(&state->unk250, -0x10000, 0);
        _collectionListFontBlock = slowAllocate(allocationSize);
        if (_collectionListFontBlock == NULL) {
            printf(Str_86FD214);
        }
        // TODO: fakematch? nested assignment
        _collectionListFont = (collectionData = _collectionListFontBlock->address)->unk0;
        _unk300012C = collectionData->unkF0;
        _unk3000128 = &collectionData->unk104;
        _unk3000100 = 0;
        _unk3000104 = 0;
        _unk3000108 = 0;
        _unk300010C = 0;
        _unk3000110 = 0;
        _unk3000114.word = 0;
        _unk3000118 = 0;
        _unk300011C = 0;
        for (i = 0; i < 5; i++) {
            allocFont(&_collectionListFont[i], SpriteSheet_82B05EC, ShadowFontMeta, 0x42,
                i * 0xF + 0x56, 0xC8, 0);
            sub_80611FC(&_collectionListFont[i], 3);
            if (sub_80570D4(i) != 0) {
                sub_8061660(&_collectionListFont[i], sub_8057048(i), 0xF);
            } else {
                sub_8061660(&_collectionListFont[i], Str_86FD25C, 0xC);
                showNumber(&_collectionListFont[i], i + 1, 0xC);
            }
            _unk300012C[i] = allocSprite(0);
            if (_unk300012C[i] != NULL) {
                frame = sub_80570D4(i) != 0 ? sub_805703C(i) << 1 : (sub_805703C(i) << 1) + 1;
                LoadSpriteSheet(
                    _unk300012C[i], SpriteSheet_823C150, 0, (i << 10) + 0x5600, 0, 0, 0, frame);
            } else {
                printf(Str_86FD264);
            }
        }
        allocFont(_unk3000128, SpriteSheet_82B05EC, ShadowFontMeta, 0x70, 0x28, 0x70, 0x10);
        sub_8061E58(_unk3000128, 1);
        firstSprite = allocSprite(0);
        _unk3000130 = firstSprite;
        if (firstSprite != NULL) {
            LoadSpriteSheet(firstSprite, SpriteSheet_823C260, 0xC600, 0x5F00, 0, 0, 0, 0);
        }
        secondSprite = allocSprite(0);
        _unk3000134 = secondSprite;
        if (secondSprite != NULL) {
            LoadSpriteSheet(secondSprite, SpriteSheet_82B1A84, 0, 0, 0, 0, 1, 0x62);
        }
        _unk3000138 = NULL;
        _unk300013C = NULL;
        *(vu16*)REG_WININ = 0x3F3F;
        *(vu16*)REG_WINOUT = 0x2F;
        *(vu16*)REG_WIN0H = 0xF0;
        *(vu16*)REG_WIN0V = 0x5692;
        *(vu16*)REG_WIN1H = 0xF0;
        *(vu16*)REG_WIN1V = 0x47;
        *(vu16*)REG_DISPCNT |= 0x6000;
        sub_8055C4C(&_unk3000140);
        break;
    }
    case 1: {
        s32 slot;
        s32 targetY;
        unk32 y;
        unk32 scroll;

        if (state->transition.value == 0 && state->transition.unk585 == 0) {
            *(vu16*)REG_BLDCNT = 0xF40;
            *(vu16*)REG_BLDALPHA = ((0x10 - _unk3000118) << 8) | _unk3000118;
            if (_unk3000118 != _unk300011C) {
                _unk3000118 = _unk300011C > _unk3000118 ? _unk3000118 + 1 : _unk3000118 - 1;
            }
            if (_unk3000118 == 0 && ((sub_8057C40() >> 4) & 3) == 0) {
                if (_unk3000138 == NULL) {
                    _unk3000138 = allocSprite(0);
                } else {
                    sub_8060A60(_unk3000138);
                }
                if (_unk3000138 != NULL) {
                    LoadSpriteSheet(_unk3000138,
                        getDecompressorData(&_unk3000140, sub_8057094(_unk3000114.word)), 0x2900,
                        0x800, 1, 0, 0, 0);
                    _unk3000138->oam_attr_2 = (_unk3000138->oam_attr_2 & 0xFFF) | 0x3000;
                    __fastMemoryCopyARM(
                        sub_8057068(_unk3000114.word), (void*)(OBJ_PLTT + 0x60), 0x20);
                    if (sub_80570D4(_unk3000114.word) != 0) {
                        sub_8061660(_unk3000128, _806E8B0[getLanguage()], 0xE);
                        showString(_unk3000128, sub_8057048(_unk3000114.word), 0xF);
                    } else {
                        sub_8061228(_unk3000128);
                    }
                }
                if (sub_805703C(_unk3000114.word) == 0 && sub_80570D4(_unk3000114.word) != 0) {
                    if (_unk300013C == NULL) {
                        _unk300013C = allocSprite(0);
                    } else {
                        sub_8060A60(_unk300013C);
                    }
                } else if (_unk300013C != NULL) {
                    sub_8060A94(_unk300013C);
                    _unk300013C = NULL;
                }
                if (_unk300013C != NULL) {
                    LoadSpriteSheet(_unk300013C, SpriteSheet_823C2C8, 0x5800, 0x3700, 1, 0, 0,
                        _unk3000114.half[0]);
                }
                _unk300011C = 0x10;
            }
        }
        sub_80439A0(&state->unk140);
        if (_unk30000F8 != _unk30000FC) {
            s32 scrollDelta = (_unk30000F8 - _unk30000FC) >> 2;
            sub_80596AC(&state->unk250, scrollDelta, 0);
            _unk30000FC += scrollDelta;
        }
        if ((_unk3005DA0 & 0x40) != 0 && _unk3000114.word != 0) {
            _unk3000114.word -= 1;
            _unk300011C = 0;
            sub_804ABFC(7);
        }
        if ((_unk3005DA0 & 0x80) != 0 && _unk3000114.word <= 0x6B) {
            _unk3000114.word += 1;
            _unk300011C = 0;
            sub_804ABFC(7);
        }
        if ((_keyInput & 0x40) != 0 && _unk3000114.word != 0 && sub_805A914(6)->var08 > 0xF0) {
            if (((sub_8057C40() >> 4) & 3) == 0) {
                _unk3000114.word -= 1;
                _unk300011C = 0;
                sub_804ABFC(7);
            }
        }
        if ((_keyInput & 0x80) != 0 && _unk3000114.word <= 0x6B && sub_805A914(7)->var08 > 0xF0) {
            if (((sub_8057C40() >> 4) & 3) == 0) {
                _unk3000114.word += 1;
                _unk300011C = 0;
                sub_804ABFC(7);
            }
        }
        targetY = -0x400 - ((_unk3000114.word - 2) * 0xF00);
        _unk3000108 = (targetY - _unk3000104) >> 2;
        _unk3000100 += _unk3000108;
        _unk3000104 += _unk3000108;
        if (_unk3000100 > 0) {
            if (_unk3000110 != 0) {
                _unk3000110 -= 1;
                _unk3000100 -= 0xF00;
                if (_unk300010C > 0) {
                    _unk300010C -= 1;
                } else {
                    _unk300010C = 4;
                }
                if (sub_80570D4(_unk3000110) != 0) {
                    sub_8061660(&_collectionListFont[_unk300010C], sub_8057048(_unk3000110), 0xF);
                } else {
                    sub_8061660(&_collectionListFont[_unk300010C], Str_86FD25C, 0xC);
                    showNumber(&_collectionListFont[_unk300010C], _unk3000110 + 1, 0xC);
                }

                _unk300012C[_unk300010C]->frame.word = sub_80570D4(_unk3000110) != 0
                    ? sub_805703C(_unk3000110) << 1
                    : (sub_805703C(_unk3000110) << 1) + 1;
            } else {
                _unk3000100 = 0;
                _unk3000104 = 0;
            }
        }
        if (_unk3000100 <= -0xF00) {
            if (_unk3000110 + 5 <= 0x6C) {
                if (sub_80570D4(_unk3000110 + 5) != 0) {
                    sub_8061660(
                        &_collectionListFont[_unk300010C], sub_8057048(_unk3000110 + 5), 0xF);
                } else {
                    sub_8061660(&_collectionListFont[_unk300010C], Str_86FD25C, 0xC);
                    showNumber(&_collectionListFont[_unk300010C], _unk3000110 + 6, 0xC);
                }

                _unk300012C[_unk300010C]->frame.word = sub_80570D4(_unk3000110 + 5) != 0
                    ? sub_805703C(_unk3000110 + 5) << 1
                    : (sub_805703C(_unk3000110 + 5) << 1) + 1;
                _unk3000100 += 0xF00;
                _unk3000110 += 1;
                if (_unk300010C <= 3) {
                    _unk300010C += 1;
                } else {
                    _unk300010C = 0;
                }
            } else {
                _unk3000100 = -0xEFF;
                _unk3000104 = -0x626FF;
            }
        }
        for (i = 0, scroll = 0x5600, y = 0x56; i < 5; i++) {
            slot = i + _unk300010C;
            if (slot > 4) {
                slot -= 5;
            }
            sub_8061844(
                &_collectionListFont[slot], -(_unk30000FC >> 8) + 0x42, (_unk3000100 >> 8) + y);

            if (_unk300012C[slot] != NULL) {
                _unk300012C[slot]->x = -_unk30000FC + 0x3600;
                _unk300012C[slot]->y = _unk3000100 + scroll;
            }
            scroll += 0xF00;
            y += 0xF;
        }
        sub_8061844(_unk3000128, -(_unk30000FC >> 8) + 0x70, 0x28);
        if (_unk3000130 != NULL) {
            _unk3000130->x = 0xC600 - _unk30000FC;
            _unk3000130->y = (_unk3000110 * 0x60) + 0x5F00;
        }
        if (_unk3000134 != NULL) {
            s32 rowY;
            // TODO: figure out how to remove cast
            _unk3000134->x
                = -_unk30000FC + 0x2600 + Unk_874CC3C[0x40 + (unk8)((sub_8057C40() >> 7) * 0x20)];
            rowY = _unk3000114.word * 0xF00;
            _unk3000134->y = _unk3000104 + rowY + 0x5200;
        }
        if (_unk3000138 != NULL) {
            _unk3000138->x = 0x2900 - _unk30000FC;
        }
        if (_unk300013C != NULL) {
            _unk300013C->x = 0x5800 - _unk30000FC;
        }
        return;
    }
    case 2:
        if ((_unk3005DA0 & 0xB) != 0) {
            sub_8049178();
            _unk30000F8 = -0x10000;
            sub_804ABFC(9);
        }
        break;
    case 7:
        for (i = 0; i < 5; i++) {
            sub_8061204(&_collectionListFont[i]);
            if (_unk300012C[i] != NULL) {
                sub_8060A94(_unk300012C[i]);
            }
        }
        sub_8061204(_unk3000128);
        if (_unk3000130 != NULL) {
            sub_8060A94(_unk3000130);
        }
        if (_unk3000134 != NULL) {
            sub_8060A94(_unk3000134);
        }
        if (_unk3000138 != NULL) {
            sub_8060A94(_unk3000138);
        }
        if (_unk300013C != NULL) {
            sub_8060A94(_unk300013C);
        }
        if (_collectionListFontBlock != NULL) {
            deallocateBlock(_collectionListFontBlock);
        }
        sub_8055CA0(&_unk3000140);
        break;
    default:
        break;
    }
}

ASM_ZEROPAD
