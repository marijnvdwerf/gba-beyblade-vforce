#include <agb/memory_map.h>

#include "beyblade.h"
#include "debug.h"
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

#if 0
typedef struct CollectionListDataDraft {
    SpriteTextCleanup fonts[5];
    SpriteEntry* icons[5];
    SpriteTextCleanup detail;
} CollectionListData;

typedef struct DecompressorStateDraft {
    AllocatedBlock* block;
    const unk8* source;
    unk8* data;
    unk32 size;
} DecompressorState;

extern s32 _unk30000F8;
extern s32 _unk30000FC;
extern s32 _unk3000100;
extern s32 _unk3000104;
extern unk32 _unk3000108;
extern s32 _unk300010C;
extern unk32 _unk3000110;
extern unk32 _unk3000114;
extern unk32 _unk3000118;
extern unk32 _unk300011C;
extern AllocatedBlock* _collectionListFontBlock;
extern SpriteTextCleanup* _collectionListFont;
extern SpriteTextCleanup* _unk3000128;
extern SpriteEntry** _unk300012C;
extern SpriteEntry* _unk3000130;
extern SpriteEntry* _unk3000134;
extern SpriteEntry* _unk3000138;
extern SpriteEntry* _unk300013C;
extern DecompressorState _unk3000140;

extern void sub_8055C4C(DecompressorState*);
extern unk8* getDecompressorData(DecompressorState*, const unk8*);
extern void sub_8055CA0(DecompressorState*);

void collectionListFrontendHandler(FrontendState* state, unk32 command)
{
    CollectionListData* collectionData;
    SpriteEntry* sprite;
    s32 i;
    s32 slot;
    s32 value;
    unk32 allocationSize;
    unk32 y;
    unk32 scroll;
    unk32 index;
    unk32 frame;
    unk8* decompressed;

    switch (command) {
    case 0:

        allocationSize = 0x134;
        _unk30000FC = 0xFFFF0000;
        _unk30000F8 = 0;
        sub_80596AC(&state->unk250, -0x10000, 0);
        _collectionListFontBlock = slowAllocate(allocationSize);
        if (_collectionListFontBlock == NULL) {
            printf(Str_86FD214);
        }
        collectionData = _collectionListFontBlock->address;
        _collectionListFont = collectionData->fonts;
        _unk300012C = collectionData->icons;
        _unk3000128 = &collectionData->detail;
        _unk3000100 = 0;
        _unk3000104 = 0;
        _unk3000108 = 0;
        _unk300010C = 0;
        _unk3000110 = 0;
        _unk3000114 = 0;
        _unk3000118 = 0;
        _unk300011C = 0;
        for (i = 0; i < 5; i++) {
            allocFont(&_collectionListFont[i], SpriteSheet_82B05EC, ShadowFontMeta, 0x42,
                (s16)(i * 0xF + 0x56), 0xC8, 0);
            sub_80611FC(&_collectionListFont[i], 3);
            if (sub_80570D4(i) != 0) {
                sub_8061660(&_collectionListFont[i], sub_8057048(i), 0xF);
            } else {
                sub_8061660(&_collectionListFont[i], Str_86FD25C, 0xC);
                showNumber(&_collectionListFont[i], i + 1, 0xC);
            }
            _unk300012C[i] = allocSprite(0);
            if (_unk300012C[i] != NULL) {
                if (sub_80570D4(i) != 0) {
                    frame = sub_805703C(i) << 1;
                } else {
                    frame = (sub_805703C(i) << 1) + 1;
                }
                LoadSpriteSheet(_unk300012C[i], SpriteSheet_823C150, 0, (i << 10) + 0x5600, 0,
                    0, 0, frame);
            } else {
                printf(Str_86FD264);
            }
        }
        allocFont(_unk3000128, SpriteSheet_82B05EC, ShadowFontMeta, 0x28, 0x70, 0x10, 0x70);
        sub_8061E58(_unk3000128, 1);
        _unk3000130 = allocSprite(0);
        if (_unk3000130 != NULL) {
            LoadSpriteSheet(_unk3000130, SpriteSheet_823C260, 0xC600, 0x5F00, 0, 0, 0, 0);
        }
        _unk3000134 = allocSprite(0);
        if (_unk3000134 != NULL) {
            LoadSpriteSheet(_unk3000134, SpriteSheet_82B1A84, 0, 0, 0, 0, 1, 0x62);
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
    case 1:
        if (state->transition.value != 0) {
            return;
        }
        *(vu16*)REG_BG2PA = 0xF40;
        *(vu16*)REG_BG2PB = ((_unk3000118 ^ 0x10) << 8) | _unk3000118;
        if (_unk3000118 != _unk300011C) {
            if (_unk300011C > _unk3000118) {
                _unk3000118 += 1;
            } else {
                _unk3000118 -= 1;
            }
        }
        if (_unk3000118 == 0 && ((sub_8057C40() >> 4) & 3) == 0) {
            if (_unk3000138 == NULL) {
                _unk3000138 = allocSprite(0);
            } else {
                sub_8060A60(_unk3000138);
            }
            if (_unk3000138 != NULL) {
                decompressed = getDecompressorData(&_unk3000140, sub_8057094(_unk3000114));
                LoadSpriteSheet(_unk3000138, decompressed, 0x2900, 0x800, 1, 0, 0, 0);
                _unk3000138->oam_attr_2 = (_unk3000138->oam_attr_2 & 0xFFF) | 0x3000;
                __fastMemoryCopyARM(sub_8057068(_unk3000114), OBJ_PLTT_PTR + 0x30, 0x20);
                if (sub_80570D4(_unk3000114) != 0) {
                    sub_8061660(_unk3000128, _806E8B0[getLanguage()], 0xE);
                    showString(_unk3000128, sub_8057048(_unk3000114), 0xF);
                } else {
                    sub_8061228(_unk3000128);
                }
            }
            if (sub_805703C(_unk3000114) == 0 && sub_80570D4(_unk3000114) != 0) {
                if (_unk300013C == NULL) {
                    _unk300013C = allocSprite(0);
                } else {
                    sub_8060A60(_unk300013C);
                }
                if (_unk300013C != NULL) {
                    LoadSpriteSheet(
                        _unk300013C, &SpriteSheet_823C2C8, 0x5800, 0x3700, 0, 0, 0, _unk3000114);
                }
            } else if (_unk300013C != NULL) {
                sub_8060A94(_unk300013C);
                _unk300013C = NULL;
            }
            _unk300011C = 0x10;
        }
        sub_80439A0(&state->unk250);
        if (_unk30000F8 != _unk30000FC) {
            value = (_unk30000F8 - _unk30000FC) >> 2;
            sub_80596AC(&state->unk250, value, 0);
            _unk30000FC += value;
        }
        if ((_unk3005DA0 & 0x40) != 0 && _unk3000114 != 0) {
            _unk3000114 -= 1;
            _unk300011C = 0;
            sub_804ABFC(7);
        }
        if ((_unk3005DA0 & 0x80) != 0 && _unk3000114 <= 0x6B) {
            _unk3000114 += 1;
            _unk300011C = 0;
            sub_804ABFC(7);
        }
        if ((_keyInput & 0x40) != 0 && _unk3000114 != 0 && sub_805A914(6)->var08 > 0xF0) {
            if (((sub_8057C40() >> 4) & 3) == 0) {
                _unk3000114 -= 1;
                _unk300011C = 0;
                sub_804ABFC(7);
            }
        }
        if ((_keyInput & 0x80) != 0 && _unk3000114 <= 0x6B && sub_805A914(7)->var08 > 0xF0) {
            if (((sub_8057C40() >> 4) & 3) == 0) {
                _unk3000114 += 1;
                _unk300011C = 0;
                sub_804ABFC(7);
            }
        }
        value = (-0x400 - ((_unk3000114 - 2) * 0xF00) - _unk3000104) >> 2;
        _unk3000108 = value;
        _unk3000100 += value;
        _unk3000104 += value;
        if (_unk3000100 > 0) {
            if (_unk3000110 != 0) {
                _unk3000110 -= 1;
                _unk3000100 -= 0xF00;
                if (_unk300010C != 0) {
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
                sprite = _unk300012C[_unk300010C];
                frame = sub_80570D4(_unk3000110) != 0 ? sub_805703C(_unk3000110) << 1
                                                      : (sub_805703C(_unk3000110) << 1) + 1;
                sprite->frame.word = frame;
            } else {
                _unk3000100 = 0;
                _unk3000104 = 0;
            }
        }
        if (_unk3000100 <= -0xF00) {
            return;
        }
        if (_unk3000110 + 5 <= 0x6C) {
            index = _unk3000110 + 5;
            if (sub_80570D4(index) != 0) {
                sub_8061660(&_collectionListFont[_unk300010C], sub_8057048(index), 0xF);
            } else {
                sub_8061660(&_collectionListFont[_unk300010C], Str_86FD25C, 0xC);
                showNumber(&_collectionListFont[_unk300010C], _unk3000110 + 6, 0xC);
            }
            sprite = _unk300012C[_unk300010C];
            frame = sub_80570D4(index) != 0 ? sub_805703C(index) << 1
                                            : (sub_805703C(index) << 1) + 1;
            sprite->frame.word = frame;
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
            _unk300010C = -1;
        }
        for (i = 0, scroll = 0x5600, y = 0x56; i < 5; i++) {
            slot = i + _unk300010C;
            if (slot > 4) {
                slot -= 5;
            }
            sub_8061844(&_collectionListFont[slot], (s16)(0x42 - (_unk30000FC >> 8)),
                (s16)((_unk3000100 >> 8) + y));
            sprite = _unk300012C[slot];
            if (sprite != NULL) {
                sprite->x = 0x3600 - _unk30000FC;
                sprite->y = scroll - _unk30000FC;
            }
            scroll += 0xF00;
            y += 0xF;
        }
        sub_8061844(_unk3000128, (s16)(0x70 - (_unk30000FC >> 8)), 0x28);
        if (_unk3000130 != NULL) {
            _unk3000130->x = 0xC600 - _unk30000FC;
            _unk3000130->y = (_unk3000110 * 0x60) + 0x5F00;
        }
        if (_unk3000134 != NULL) {
            frame = sub_8057C40();
            _unk3000134->x = 0x2600 + ((s16)frame - _unk30000FC);
            _unk3000134->y = _unk3000104 + (_unk3000114 * 0xF00) + 0x5200;
        }
        if (_unk3000138 != NULL) {
            _unk3000138->x = 0x2900 - _unk30000FC;
        }
        if (_unk300013C != NULL) {
            _unk300013C->x = 0x5800 - _unk30000FC;
        }
        return;
    case 2:

        if ((_unk3005DA0 & 0xB) != 0) {
            sub_8049178();
            _unk30000F8 = 0xFFFF0000;
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

#endif

INCLUDE_ASM("asm/dump/8040d18/80427e4-collectionListFrontendHandler.s");

ASM_ZEROPAD
