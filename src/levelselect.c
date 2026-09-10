#include "levelselect.h"

#include <agb/memory_map.h>

#include "common.h"
#include "debug.h"
#include "frontend.h"
#include "gamestate.h"
#include "include_asm.h"
#include "keystate.h"
#include "layer.h"
#include "multiplayer.h"
#include "music.h"
#include "packet.h"
#include "ram.h"
#include "sprite.h"
#include "spritetext.h"
#include "tutorial.h"
#include "unsorted.h"

extern const unk8 Str_86FCF24[];
extern const unk8 Str_86FCF54[];
extern const unk8* _806EA5C[];
extern const unk8* _806EA70[];
extern const unk8 SpriteSheet_823AA74[];
extern const unk8 Pal_823B2BC[];
extern const unk8 SpriteSheet_823B4BC[];
extern const unk8 Pal_823BD04[];
extern const SpriteTextPlacement _8068710[];

void sub_8041078(LevelSelectState* state)
{
    SpriteTextCleanup* sprite;
    const SpriteTextPlacement* data;
    s32 i;

    for (i = 0; i <= 5; i++) {
        sprite = sub_804A0E0(i);
        data = &_8068710[i];
        sprite->unkC = data->unk8;
        sprite->x = data->unk0 << 8;
        sprite->y = data->unk4 << 8;
        sprite->unk8 = data->unkC;
        sub_8061E58(sprite, 1);
    }
}

void displayFrontendLevel(
    LevelSelectState* state, LevelDescription* description, LevelState* levelState)
{
    const unk8* palette;
    const unk8* spriteSheet;

    getLanguage();
    if (state->sprite == NULL) {
        state->sprite = allocSprite(1);
    } else {
        sub_8060A60(state->sprite);
    }
    if ((levelState->unk0 & 2) != 0 || sub_8051780(4) != 0) {
        if (sub_8051780(4) != 0) {
            if (_currentGameState->unk6A4 == 2) {
                spriteSheet = SpriteSheet_823AA74;
                palette = Pal_823B2BC;
            } else {
                spriteSheet = SpriteSheet_823B4BC;
                palette = Pal_823BD04;
            }
        } else {
            spriteSheet = description->unkC0;
            palette = description->unkC4;
        }
    } else {
        spriteSheet = description->unkC8;
        palette = description->unkCC;
    }
    if (spriteSheet != NULL) {
        LoadSpriteSheet(state->sprite, spriteSheet, 0x1000, 0x3C00, 1, 0, 0, 0);
    } else {
        printf(Str_86FCF24);
    }
    if (palette != NULL) {
        __fastMemoryCopyARM(palette, (void*)OBJ_PLTT, 0x20);
    }
}

void sub_8041188(LevelSelectState* state, LevelDescription* description, LevelState* levelState,
    unk32 levelIndex)
{
    unk32 language;
    LevelState* laterLevelState;
    unk32 laterIndex;

    laterLevelState = levelState;
    laterIndex = levelIndex;
    language = getLanguage();
    if (description->unk1C != 0 && (levelState->unk0 & 2) == 0 && sub_8051780(4) == 0) {
        sub_8061228(state->rows[3]);
        sub_8061228(state->rows[4]);
        sub_8061228(state->rows[5]);
        sub_8061660(state->rows[2], description->unk54[language], 0xF);
    } else {
        sub_8061228(state->rows[2]);
        if (sub_8051780(4) != 0) {
            sub_8061228(state->rows[3]);
            sub_8061228(state->rows[4]);
            sub_8061228(state->rows[5]);
        } else {
            sub_8061660(state->rows[3], _806E97C[1][language], 0xE);
            printTime(state->rows[3], laterLevelState->unk4, 0xF);
            sub_8061660(state->rows[4], _806E97C[7][language], 0xE);
            printTime(state->rows[4], laterLevelState->unk8, 0xF);
            sub_8061660(state->rows[5], _806E97C[8][language], 0xE);
            showNumber(state->rows[5], sub_80518C8(laterIndex), 0xF);
            showString(state->rows[5], Str_86FCF54, 0xF);
            showNumber(state->rows[5], description->unk1, 0xF);
        }
    }
}

void sub_8041288(
    LevelSelectState* state, LevelDescription* description, LevelState* levelState, s8 levelIndex)
{
    unk32 language;

    language = getLanguage();
    if (sub_8051780(4) == 0) {
        sub_8061660(state->rows[1], description->unk68[language], 0xE);
        sub_8061660(state->rows[0], description->unk40[language], 0xE);
    } else if (_currentGameState->unk6A4 == 2) {
        sub_8061660(state->rows[1], description->unk94[language], 0xE);
        sub_8061660(state->rows[0], _806EA70[language], 0xE);
    } else {
        sub_8061660(state->rows[1], description->unkA8[language], 0xE);
        sub_8061660(state->rows[0], _806EA5C[language], 0xE);
    }
}

void sub_8041324(unk32 arg0)
{
    s32 i;

    for (i = 0; i <= 5; i++) {
        sub_8061E58(sub_804A0E0(i), arg0);
    }
}

#if 0
void sub_8041344(LevelSelectState* state, unk32 arg1)
{
    u8 color = arg1;

    sub_8061E58(state->rows[1], color);
    sub_8061E58(state->rows[0], color);
}
#endif
INCLUDE_ASM("asm/dump/8040d18/8041344.s");

void sub_8041364(LevelSelectState* state)
{
    s32 i;

    for (i = 0; i <= 5; i++) {
        sub_8061228(sub_804A0E0(i));
    }
    if (state->sprite != NULL) {
        sub_8060A94(state->sprite);
        state->sprite = NULL;
    }
}

INCLUDE_ASM("asm/dump/8040d18/8041390.s");

extern s32 _300002C;
extern s32 _3000030;
extern unk8 _unk3000058;
extern unk8 _unk3000059;
extern u8 _unk300005A;
extern SpriteEntry* _unk300005C;
extern SpriteEntry* _unk3000060;
extern s32 _unk3000064;
extern s32 _unk3000068;
extern s32 _unk300006C;
extern s32 _unk3000070;
extern s8* _unk3000074;
extern unk8 _unk3000078;

void sub_80413FC(FrontendState* state, unk32 arg1)
{
    Packet* playerData = _gameData->unk15D4 + (1 - isMultiplayer());
    Packet* baseData = &_gameData->unk15C4;

    switch (arg1) {
    case 0: {
        SpriteEntry* firstSprite;
        SpriteEntry* secondSprite;
        s8* ptr;
        s32 i;
        unk32 levelId;

        if (sub_8051780(1) != 0) {
            _unk3000074 = _currentGameState->unk5A4;
        } else if (sub_8051780(0x100) != 0) {
            _unk3000074 = _currentGameState->unk5E4;
        } else if (sub_8051780(4) != 0) {
            if (_currentGameState->unk6A4 == 1) {
                _unk3000074 = _currentGameState->unk624;
            } else {
                _unk3000074 = _currentGameState->unk664;
            }
        }

        ptr = _unk3000074;
        _unk3000078 = 0;
        while (*ptr++ != -1) {
            _unk3000078++;
        }

        firstSprite = allocSprite(0);
        _unk300005C = firstSprite;
        if (firstSprite != NULL) {
            LoadSpriteSheet(firstSprite, SpriteSheet_823BF04, -0x10000, 0x5400, 0, 0, 0, 0);
        }

        secondSprite = allocSprite(0);
        _unk3000060 = secondSprite;
        if (secondSprite != NULL) {
            LoadSpriteSheet(secondSprite, SpriteSheet_823BF04, 0x18000, 0x5400, 0, 0, 1, 0);
        }

        _unk3000064 = 0x800;
        _unk3000068 = 0xD800;

        levelId = sub_8051780(4) != 0 ? _currentGameState->unk6A9 : sub_805137C();
        for (i = 0; i < _unk3000078; i++) {
            if (_unk3000074[i] == levelId) {
                _3000038.index = i;
                break;
            }
        }

        _3000030 = 0x10000;
        _300002C = 0;
        sub_80596AC(&state->unk250, -_3000030, 0x2400);

        _3000038.rows[0] = sub_804A0E0(0);
        _3000038.rows[1] = sub_804A0E0(1);
        _3000038.rows[2] = sub_804A0E0(2);
        _3000038.rows[3] = sub_804A0E0(3);
        _3000038.rows[4] = sub_804A0E0(4);
        _3000038.rows[5] = sub_804A0E0(5);
        _3000038.state = 0;
        sub_8062318(_3000038.rows[0], 1);
        sub_8062318(_3000038.rows[1], 1);
        sub_8062318(_3000038.rows[2], 1);
        sub_8062318(_3000038.rows[3], 1);
        sub_8062318(_3000038.rows[4], 1);
        sub_8062318(_3000038.rows[5], 1);
        _3000038.sprite = NULL;
        _unk3000058 = 0;
        _unk3000059 = 0;
        _unk300005A = 0;

        state->unk80 |= 0x30;

        sub_8049168();

        if (sub_805FFE4() && sub_8060070()) {
            baseData->packet.unk2_0 = 4;
            baseData->packet.unk2_4 = 0;
            __fastMemoryClearARM(0, baseData->packet.unk4, 0xC);
            sub_8043960(baseData);
        }

        _unk300006C = 0;
        _unk3000070 = 0x10;
        break;
    }
    case 7:
        if (_unk300005C != NULL) {
            sub_8060A94(_unk300005C);
        }
        if (_unk3000060 != NULL) {
            sub_8060A94(_unk3000060);
        }
        if (_3000038.sprite != NULL) {
            sub_8060A94(_3000038.sprite);
        }
        break;
    case 1: {
        s32 scrollDelta;

        if (state->transition.value == 0 && state->transition.unk585 == 0) {
            *(vu16*)REG_BLDCNT = 0xF40;
            *(vu16*)REG_BLDALPHA = _unk300006C | ((0x10 - _unk300006C) << 8);
            if (_unk300006C != _unk3000070) {
                _unk300006C = _unk3000070 > _unk300006C ? _unk300006C + 1 : _unk300006C - 1;
            }
            if (_unk3000059 == 0) {
                sub_8041078(&_3000038);
                sub_8041324(1);

                displayFrontendLevel(&_3000038, getLevelDescription(_unk3000074[_3000038.index]),
                    sub_8051720(_unk3000074[_3000038.index]));

                sub_8041288(&_3000038, getLevelDescription(_unk3000074[_3000038.index]),
                    sub_8051720(_unk3000074[_3000038.index]), _unk3000074[_3000038.index]);

                sub_8041188(&_3000038, getLevelDescription(_unk3000074[_3000038.index]),
                    sub_8051720(_unk3000074[_3000038.index]), _unk3000074[_3000038.index]);

                _unk3000059 = 1;
            }
            if (_unk300006C == 0x10) {
                sub_8041344(&_3000038, 0);
            }
            if (_unk300006C == 0 && _unk300005A == 0) {
                _unk3000058 = 1;
                _unk3000070 = 0x10;
            }
        }

        if (_unk3000059 != 0 && _unk3000058 != 0) {
            displayFrontendLevel(&_3000038, getLevelDescription(_unk3000074[_3000038.index]),
                sub_8051720(_unk3000074[_3000038.index]));

            sub_8041188(&_3000038, getLevelDescription(_unk3000074[_3000038.index]),
                sub_8051720(_unk3000074[_3000038.index]), _unk3000074[_3000038.index]);

            _unk3000058 = 0;
        }

        sub_80439A0(&state->unk140);

        if (sub_805FFE4() && sub_8060070()) {
            if (sub_8060040()) {
                baseData->packet.unk4[0] = _3000038.index;
            }
            baseData->packet.unk4[1] = sub_8051820();
            sub_8043960(baseData);
        }

        if (_unk300005C != NULL) {
            _unk300005C->x += ((_unk3000064 - _unk300005C->x) >> 2)
                + Unk_874CC3C[(sub_8057C40() & 0x1FE) / 2] - _300002C;
        }

        if (_unk3000060 != NULL) {
            _unk3000060->x += ((_unk3000068 - _unk3000060->x) >> 2)
                - Unk_874CC3C[(sub_8057C40() & 0x1FE) / 2] + _300002C;
        }

        scrollDelta = (_300002C - _3000030) >> 2;
        sub_80596AC(&state->unk250, -scrollDelta, 0);
        _3000030 += scrollDelta;
        break;
    }
    case 2: {
        KeyState* ks;

        if ((0x30 & _keyInput) != 0 && _unk300005A == 0
            && (!sub_8060070() || (sub_805FFE4() && sub_8060070() && sub_8060040()))) {
            if ((0x20 & _keyInput) != 0) {
                ks = sub_805A914(5);
                if ((0x20 & _unk3005DA0) != 0
                    || (ks->var08 > 0xF0 && !((sub_8057C40() >> 4) & 7))) {
                    if (_3000038.index > 0) {
                        _3000038.index = _3000038.index - 1;
                    } else {
                        _3000038.index = _unk3000078 - 1;
                    }
                    sub_8041344(&_3000038, 0);
                    sub_8041288(&_3000038, getLevelDescription(_unk3000074[_3000038.index]),
                        sub_8051720(_unk3000074[_3000038.index]), _unk3000074[_3000038.index]);
                    _unk3000070 = 0;
                    sub_804ABFC(7);
                }
            }
            if ((0x10 & _keyInput) != 0) {
                ks = sub_805A914(4);
                if ((0x10 & _unk3005DA0) != 0
                    || (ks->var08 > 0xF0 && !((sub_8057C40() >> 4) & 7))) {
                    if (_3000038.index < (_unk3000078 - 1)) {
                        _3000038.index = _3000038.index + 1;
                    } else {
                        _3000038.index = 0;
                    }
                    sub_8041344(&_3000038, 0);
                    sub_8041288(&_3000038, getLevelDescription(_unk3000074[_3000038.index]),
                        sub_8051720(_unk3000074[_3000038.index]), _unk3000074[_3000038.index]);
                    _unk3000070 = 0;
                    sub_804ABFC(7);
                }
            }
        }

        if (sub_805FFE4() && sub_8060070()) {
            if (sub_8060040()) {
                if (_unk3005DA0 & 1) {
                    baseData->packet.unk2_4 = 1;
                }
                if (_unk3005DA0 & 2) {
                    if (_currentGameState->unk6A6 == 0) {
                        baseData->packet.unk2_4 = 2;
                    }
                }
            }

            if (sub_8043970(playerData, 4)) {
                _gameData->unk15C0 = playerData->packet.unk4[1];

                if (sub_8060040() == 0) {
                    if (playerData->packet.unk4[0] != _3000038.index) {
                        _3000038.index = playerData->packet.unk4[0];
                        sub_8041288(&_3000038, getLevelDescription(_unk3000074[_3000038.index]),
                            sub_8051720(_unk3000074[_3000038.index]), _unk3000074[_3000038.index]);
                        _unk3000070 = 0;
                    }
                }

                if (playerData->packet.unk2_4 == 1) {
                    _unk300005A = 1;
                    _unk3000070 = 0;
                    baseData->packet.unk2_4 = 1;

                    sub_8051688(_unk3000074[_3000038.index]);
                    _currentGameState->unk6A9 = _unk3000074[_3000038.index];
                }

                if (playerData->packet.unk2_4 == 2) {
                    baseData->packet.unk2_4 = 2;
                    _unk300005A = 2;
                    _unk3000070 = 0;
                }
            }
        } else {
            if (_unk3005DA0 & 2) {
                _unk300005A = 2;
                _unk3000070 = 0;
                sub_8041344(&_3000038, 1);
            }
            if (_unk3005DA0 & 1) {
                if (sub_80517E8(_unk3000074[_3000038.index])) {
                    _unk300005A = 1;
                    _unk3000070 = 0;
                    sub_8041344(&_3000038, 1);
                }
            }
        }

        if (_unk300005A != 0) {
            if (_unk300006C == _unk3000070) {
                if (sub_805FFE4() && sub_8060070()) {
                    if (_unk300005A == 1) {
                        sub_804924C(0x13);
                        sub_8049234(8);
                        sub_80490F8(9);
                    } else {
                        sub_80490F8(0x21);
                        sub_804ABFC(9);
                    }
                } else {
                    if (_unk300005A == 1) {
                        LevelState* levelState;
                        LevelDescription* selectedDesc;

                        sub_8051688(_unk3000074[_3000038.index]);
                        levelState = sub_8051734();
                        selectedDesc = getLevelDescription2();
                        sub_8049234(8);
                        sub_804924C(0x11);
                        if (selectedDesc->unk10 != 0 && !(levelState->unk0 & 1)) {
                            StoreLevelVar14(getLevelDescription2()->unk14);
                            StoreFunction(sub_8049DE0);
                            sub_80490F8(0x1C);
                        } else {
                            sub_80490F8(9);
                        }
                    } else {
                        sub_80490F8(0xA);
                        sub_804ABFC(9);
                    }
                }

                sub_8041364(&_3000038);
                _unk3000064 = -0x10000;
                _unk3000068 = 0x1E000;
                _300002C = 0x10000;
            }
        }
        break;
    }
    }
}
