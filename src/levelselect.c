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

void sub_8041078(LevelSelectState* state)
{
    SpriteTextCleanup* sprite;
    const LevelSelectSpriteData* data;
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

INCLUDE_ASM("asm/dump/8040d18/80410b4-displayFrontendLevel.s");
INCLUDE_ASM("asm/dump/8040d18/8041188.s");
INCLUDE_ASM("asm/dump/8040d18/8041288.s");

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

#if 0
typedef struct LevelDescriptionDraft {
    u8 unk0;
    u8 unk1;
    unk8 pad2[2];
    unk32 unk4;
    s32 unk8;
    unk16 unkC;
    unk8 padE[2];
    u8 unk10;
    u8 unk11;
    unk8 pad12[2];
    s32 unk14;
    unk32 unk18;
} LevelDescriptionDraft;

typedef struct LevelSelectStateDraft {
    SpriteEntry* sprite;
    SpriteTextCleanup* rows[6];
    unk8 pad1C;
    s8 index;
    unk8 state;
    unk8 pad1F;
} LevelSelectStateDraft;

typedef struct FrontendByteWordDraft {
    unk8 value;
    unk8 pad1;
} FrontendByteWordDraft;

typedef union PacketDraft {
    PacketTransport packet;
    unk8 raw[0x10];
} PacketDraft;

typedef struct CurrentGameStateDraft {
    unk8 pad0[0x5A4];
    s8 unk5A4[0x40];
    s8 unk5E4[0x40];
    s8 unk624[0x40];
    s8 unk664[0x40];
    unk8 unk6A4;
    unk8 unk6A5;
    unk8 unk6A6;
    unk8 unk6A7;
    unk8 unk6A8;
    u8 unk6A9;
} CurrentGameStateDraft;

typedef struct GameDataDraft {
    unk8 pad0[0x15C0];
    unk16 unk15C0;
    unk8 pad15C2[2];
    PacketDraft unk15C4;
    PacketDraft unk15D4[4];
} GameDataDraft;

#define _gameData _gameDataDraft
#define _currentGameState _currentGameStateDraft
#define sub_8043960 sub_8043960Draft
#define sub_8043970 sub_8043970Draft
#define getLevelDescription getLevelDescriptionDraft
#define getLevelDescription2 getLevelDescription2Draft

void sub_8041078(LevelSelectStateDraft*);
void displayFrontendLevel(LevelSelectStateDraft*, LevelDescriptionDraft*, LevelState*);
void sub_8041188(LevelSelectStateDraft*, LevelDescriptionDraft*, LevelState*, s8);
void sub_8041288(LevelSelectStateDraft*, LevelDescriptionDraft*, LevelState*, s8);
void sub_8041324(s32);
void sub_8041344(LevelSelectStateDraft*, s32);
void sub_8041364(LevelSelectStateDraft*);
void sub_8043960(PacketDraft*);
unk32 sub_8043970(PacketDraft*, unk8);
LevelDescriptionDraft* getLevelDescription(unk32);
LevelDescriptionDraft* getLevelDescription2(void);

extern s32 _300002C;
extern FrontendScalarWithPad _3000030;
extern LevelSelectStateDraft _3000038;
extern unk8 _unk3000058;
extern unk8 _unk3000059;
extern FrontendByteWordDraft _unk300005A;
extern SpriteEntry* _unk300005C;
extern SpriteEntry* _unk3000060;
extern s32 _unk3000064;
extern s32 _unk3000068;
extern s32 _unk300006C;
extern s32 _unk3000070;
extern s8* _unk3000074;
extern unk8 _unk3000078;
extern GameDataDraft* _gameData;
extern CurrentGameStateDraft* _currentGameState;

void sub_80413FC(FrontendState* state, unk32 arg1)
{
    PacketDraft* playerData = _gameData->unk15D4 + (1 - isMultiplayer());
    PacketDraft* baseData = &_gameData->unk15C4;

    switch (arg1) {
    case 0: {
        SpriteEntry* firstSprite;
        SpriteEntry* secondSprite;
        s8* ptr;
        s32 i;

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
            LoadSpriteSheet(
                firstSprite, SpriteSheet_823BF04, (unk32)0xFFFF0000, 0x5400, 0, 0, 0, 0);
        }

        secondSprite = allocSprite(0);
        _unk3000060 = secondSprite;
        if (secondSprite != NULL) {
            LoadSpriteSheet(
                secondSprite, SpriteSheet_823BF04, 0x18000, 0x5400, 0, 0, 1, 0);
        }

        _unk3000064 = 0x800;
        _unk3000068 = 0xD800;

        for (i = 0; i < _unk3000078; i++) {
            if (_unk3000074[i]
                == (sub_8051780(4) != 0 ? _currentGameState->unk6A9 : sub_805137C())) {
                break;
            }
        }
        _3000038.index = i;

        _3000030.value = 0x10000;
        _300002C = 0;
        sub_80596AC(&state->unk250, (s32)0xFFFF0000, 0x2400);

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
        _unk300005A.value = 0;

        state->unk80 |= 0x30;

        sub_8049168();

        if (sub_805FFE4() && sub_8060070()) {
            baseData->raw[2] = (baseData->raw[2] & 0xF0) | 0x04;
            baseData->raw[2] &= 0x0F;
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
        LevelDescriptionDraft* desc;
        s32 sinResult;
        s32 delta;
        s32 scrollDelta;
        s16 sinVal;

        if (state->transition.value == 0 && state->transition.unk585 == 0) {
            *(vu16*)REG_BLDCNT = 0xF40;
            *(vu16*)REG_BLDALPHA = _unk300006C | ((0x10 - _unk300006C) << 8);
            if (_unk300006C != _unk3000070) {
                if (_unk3000070 > _unk300006C) {
                    _unk300006C = _unk300006C + 1;
                } else {
                    _unk300006C = _unk300006C - 1;
                }
            }
            if (_unk3000059 == 0) {
                sub_8041078(&_3000038);
                sub_8041324(1);

                desc = getLevelDescription(_unk3000074[_3000038.index]);
                displayFrontendLevel(&_3000038, desc, sub_8051720(_unk3000074[_3000038.index]));

                desc = getLevelDescription(_unk3000074[_3000038.index]);
                sub_8041288(&_3000038, desc, sub_8051720(_unk3000074[_3000038.index]),
                    _unk3000074[_3000038.index]);

                desc = getLevelDescription(_unk3000074[_3000038.index]);
                sub_8041188(&_3000038, desc, sub_8051720(_unk3000074[_3000038.index]),
                    _unk3000074[_3000038.index]);

                _unk3000059 = 1;
            }
            if (_unk300006C == 0x10) {
                sub_8041344(&_3000038, 0);
            }
            if (_unk300006C == 0 && _unk300005A.value == 0) {
                _unk3000058 = 1;
                _unk3000070 = 0x10;
            }
        }

        if (_unk3000059 != 0 && _unk3000058 != 0) {
            desc = getLevelDescription(_unk3000074[_3000038.index]);
            displayFrontendLevel(&_3000038, desc, sub_8051720(_unk3000074[_3000038.index]));

            desc = getLevelDescription(_unk3000074[_3000038.index]);
            sub_8041188(&_3000038, desc, sub_8051720(_unk3000074[_3000038.index]),
                _unk3000074[_3000038.index]);

            _unk3000058 = 0;
        }

        sub_80439A0(&state->unk140);

        if (sub_805FFE4() && sub_8060070()) {
            if (sub_8060040()) {
                baseData->raw[4] = _3000038.index;
            }
            baseData->raw[5] = sub_8051820();
            sub_8043960(baseData);
        }

        if (_unk300005C != NULL) {
            sinResult = sub_8057C40();
            sinVal = Unk_874CC3C[(sinResult & 0x1FE) / 2];
            delta = (_unk3000064 - _unk300005C->x) >> 2;
            _unk300005C->x += delta + sinVal - _300002C;
        }

        if (_unk3000060 != NULL) {
            sinResult = sub_8057C40();
            sinVal = Unk_874CC3C[(sinResult & 0x1FE) / 2];
            delta = (_unk3000068 - _unk3000060->x) >> 2;
            _unk3000060->x += delta - sinVal + _300002C;
        }

        scrollDelta = (_300002C - _3000030.value) >> 2;
        sub_80596AC(&state->unk250, -scrollDelta, 0);
        _3000030.value += scrollDelta;
        break;
    }
    case 2: {
        LevelDescriptionDraft* desc;
        KeyState* ks;

        if ((0x30 & _keyInput) != 0 && _unk300005A.value == 0
            && !(sub_8060070() && sub_805FFE4() && sub_8060040())) {
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
                    desc = getLevelDescription(_unk3000074[_3000038.index]);
                    sub_8041288(&_3000038, desc, sub_8051720(_unk3000074[_3000038.index]),
                        _unk3000074[_3000038.index]);
                    _unk3000070 = 0;
                    sub_804ABFC(7);
                }
            }
            if ((0x10 & _keyInput) != 0) {
                ks = sub_805A914(4);
                if ((0x10 & _unk3005DA0) != 0
                    || (ks->var08 > 0xF0 && !((sub_8057C40() >> 4) & 7))) {
                    if (_3000038.index < (s8)(_unk3000078 - 1)) {
                        _3000038.index = _3000038.index + 1;
                    } else {
                        _3000038.index = 0;
                    }
                    sub_8041344(&_3000038, 0);
                    desc = getLevelDescription(_unk3000074[_3000038.index]);
                    sub_8041288(&_3000038, desc, sub_8051720(_unk3000074[_3000038.index]),
                        _unk3000074[_3000038.index]);
                    _unk3000070 = 0;
                    sub_804ABFC(7);
                }
            }
        }

        if (sub_805FFE4() && sub_8060070()) {
            if (sub_8060040()) {
                if (_unk3005DA0 & 1) {
                    baseData->raw[2] = (baseData->raw[2] & 0x0F) | 0x10;
                }
                if (_unk3005DA0 & 2) {
                    if (_currentGameState->unk6A6 == 0) {
                        baseData->raw[2] = (baseData->raw[2] & 0x0F) | 0x20;
                    }
                }
            }

            if (sub_8043970(playerData, 4)) {
                _gameData->unk15C0 = playerData->packet.unk4[1];

                if (sub_8060040() == 0) {
                    if (playerData->raw[4] != _3000038.index) {
                        _3000038.index = playerData->raw[4];
                        desc = getLevelDescription(_unk3000074[_3000038.index]);
                        sub_8041288(&_3000038, desc, sub_8051720(_unk3000074[_3000038.index]),
                            _unk3000074[_3000038.index]);
                        _unk3000070 = 0;
                    }
                }

                if ((playerData->raw[2] & 0xF0) == 0x10) {
                    _unk300005A.value = 1;
                    _unk3000070 = 0;
                    baseData->raw[2] = (baseData->raw[2] & 0x0F) | 0x10;

                    sub_8051688(_unk3000074[_3000038.index]);
                    _currentGameState->unk6A9 = _unk3000074[_3000038.index];
                }

                if ((playerData->raw[2] & 0xF0) == 0x20) {
                    baseData->raw[2] = (baseData->raw[2] & 0x0F) | 0x20;
                    _unk300005A.value = 2;
                    _unk3000070 = 0;
                }
            }
        } else {
            if (_unk3005DA0 & 2) {
                _unk300005A.value = 2;
                _unk3000070 = 0;
                sub_8041344(&_3000038, 1);
            }
            if (_unk3005DA0 & 1) {
                if (sub_80517E8(_unk3000074[_3000038.index])) {
                    _unk300005A.value = 1;
                    _unk3000070 = 0;
                    sub_8041344(&_3000038, 1);
                }
            }
        }

        if (_unk300005A.value != 0) {
            if (_unk300006C == _unk3000070) {
                if (sub_805FFE4() && sub_8060070()) {
                    if (_unk300005A.value == 1) {
                        sub_804924C(0x13);
                        sub_8049234(8);
                    } else {
                        sub_80490F8(0x21);
                        sub_804ABFC(9);
                    }
                } else {
                    if (_unk300005A.value == 1) {
                        sub_8051688(_unk3000074[_3000038.index]);
                        sub_8049234(8);
                        sub_804924C(0x11);
                        if (getLevelDescription2()->unk10 != 0 && !(sub_8051734()->unk0 & 1)) {
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
                _unk3000064 = (s32)0xFFFF0000;
                _unk3000068 = 0x1E000;
                _300002C = 0x10000;
            }
        }
        break;
    }
    }
}
#undef _gameData
#undef _currentGameState
#undef sub_8043960
#undef sub_8043970
#undef getLevelDescription
#undef getLevelDescription2
#endif
INCLUDE_ASM("asm/dump/8040d18/80413fc.s");
