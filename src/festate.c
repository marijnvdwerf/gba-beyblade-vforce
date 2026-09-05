#include "festate.h"

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
#include "multiplayer.h"
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

void sub_8043DB8(SpriteTextCleanup** arg0, LevelState* arg1, CurrentGameStateTail* arg2, unk32 arg3)
{
    LevelDescription* description;
    unk32 scale;
    unk32 mask;
    u32 language;

    description = getLevelDescription2();
    scale = arg3 & 0xFF;
    mask = arg3 >> 8;
    language = getLanguage();
    if ((mask & 1) != 0) {
        sub_8061660(arg0[0], _806E97C[0][language], 0xE);
        if (arg2->unk0 != 0) {
            sub_8061C48(arg0[1], (scale * arg2->unk0) >> 5, 0xF);
        } else {
            sub_8061660(arg0[1], Str_86FD468, 0xF);
        }
    }
    if ((mask & 2) != 0) {
        sub_8061660(arg0[2], _806E97C[1][language], 0xE);
        sub_8061C48(arg0[3], (scale * arg1->unk4) >> 5, 0xF);
    }
    if ((mask & 4) != 0) {
        sub_8061660(arg0[4], _806E97C[2][language], 0xE);
        showNumber_2(arg0[5], (scale * arg2->unk4) >> 5, 0xF);
    }
    if ((mask & 8) != 0) {
        sub_8061660(arg0[6], _806E97C[3][language], 0xE);
        showNumber_2(arg0[7], (scale * arg2->unk8) >> 5, 0xF);
        showString(arg0[7], Str_86FD46C, 0xF);
        showNumber(arg0[7], description->unk1, 0xF);
    }
    if ((mask & 0x10) != 0 && (arg2->unkC & 4) != 0) {
        sub_8061660(arg0[8], _806E97C[4][language], 0xE);
    }
    if ((mask & 0x20) != 0) {
        if ((arg2->unkC & 1) != 0) {
            sub_8061660(arg0[9], _806E97C[5][language], 0xE);
        } else {
            sub_8061660(arg0[9], _806E97C[6][language], 0xE);
        }
    }
}

void sub_8043F40(SpriteTextCleanup** arg0, CurrentGameStateTail* arg1, s32 arg2)
{
    SpriteTextCleanup* text;
    s32 position;
    unk8 mode;

    position = arg2;
    sub_8061844(arg0[0], (position >> 8) + 0x12, arg0[0]->y >> 8);
    sub_8061844(arg0[1], (position >> 8) + 0x80, arg0[1]->y >> 8);
    sub_8061844(arg0[2], (position >> 8) + 0x12, arg0[2]->y >> 8);
    sub_8061844(arg0[3], (position >> 8) + 0x80, arg0[3]->y >> 8);
    sub_8061844(arg0[4], (position >> 8) + 0x12, arg0[4]->y >> 8);
    sub_8061844(arg0[5], (position >> 8) + 0x80, arg0[5]->y >> 8);
    sub_8061844(arg0[6], (position >> 8) + 0x12, arg0[6]->y >> 8);
    sub_8061844(arg0[7], (position >> 8) + 0x80, arg0[7]->y >> 8);
    sub_8061844(arg0[8], position >> 8, arg0[8]->y >> 8);
    sub_8061844(arg0[9], position >> 8, arg0[9]->y >> 8);
    if ((arg1->unkC & 4) != 0) {
        text = arg0[2];
        mode = ((((sub_8057C40() >> 4) + 4) & 8) != 0) ? 0xE : 0xF;
        sub_806185C(text, mode);
        text = arg0[3];
        mode = ((((sub_8057C40() >> 4) + 4) & 8) != 0) ? 0xD : 0xF;
        sub_806185C(text, mode);
    }
    text = arg0[9];
    mode = (((sub_8057C40() >> 4) & 8) != 0) ? 0xE : 0xF;
    sub_806185C(text, mode);
}

void sub_8044054(FrontendState* state, unk32 arg1)
{
    LevelState* levelState;
    s32 delta;
    unk32 progress;

    levelState = sub_8051734();
    switch (arg1) {
    case 0:
        _unk3000174 = 1;
        _unk3000178.value = 0;
        _unk30001A8 = 0;
        _unk3000180[0] = sub_804A0E0(0);
        _unk3000180[1] = sub_804A0E0(1);
        _unk3000180[2] = sub_804A0E0(2);
        _unk3000180[3] = sub_804A0E0(3);
        _unk3000180[4] = sub_804A0E0(4);
        _unk3000180[5] = sub_804A0E0(5);
        _unk3000180[6] = sub_804A0E0(6);
        _unk3000180[7] = sub_804A0E0(7);
        _unk3000180[8] = sub_804A0E0(8);
        _unk3000180[9] = sub_804A0E0(9);
        _unk3000170 = 0x10000;
        _unk300016C = 0;
        sub_80596AC(&state->unk250, -_unk3000170, 0);
        state->unk80 |= 0x30;
        sub_8049168();
        break;
    case 1:
        sub_80439A0(&state->unk140);
        delta = (_unk300016C - _unk3000170) >> 2;
        sub_80596AC(&state->unk250, -delta, 0);
        _unk3000170 += delta;
        sub_8043F40(_unk3000180, &_currentGameState->unk6EC, _unk3000170);
        break;
    case 2:
        if ((_unk3005DA0 & 1) != 0) {
            if (_unk30001A8 != 0) {
                sub_804ABFC(8);
                if (_currentGameState->unk6EA >= 0) {
                    sub_80490F8(0x26);
                } else {
                    sub_80490F8(0x15);
                }
                _unk300016C = 0x10000;
            } else {
                if (_unk3000174 <= 0x3F) {
                    _unk3000178.value = 0x20;
                    _unk3000174 = 0x3F;
                }
                sub_804ABFC(8);
            }
        }
        if (_unk30001A8 == 0) {
            sub_8043DB8(_unk3000180, levelState, &_currentGameState->unk6EC,
                (_unk3000174 << 8) | _unk3000178.value);
            if (_unk3000174 <= 0x3F) {
                _unk3000178.value++;
                progress = _unk3000178.value;
                if (progress > 0x20) {
                    _unk3000178.value = 0;
                    _unk3000174 <<= 1;
                    if (_unk3000174 > 0x3F) {
                        _unk30001A8 = 1;
                    }
                }
            }
        }
        break;
    default:
        break;
    }
}

INCLUDE_ASM("asm/dump/8040d18/804423c.s");
INCLUDE_ASM("asm/dump/8040d18/8044314.s");
#if 0
typedef struct FrontendPacketStateDraft {
    unk8 unk0;
    unk8 unk1;
    unk8 unk2;
    unk8 unk3;
    s8 unk4;
    unk8 unk5;
    unk8 unk6;
    unk8 unk7;
    unk8 unk8;
    s8 unk9;
    s8 unkA;
    s8 unkB;
    unk8 padC[4];
} FrontendPacketStateDraft;

typedef union CurrentGameStatePacketWordDraft {
    unk32 value;
    struct {
        unk8 pad0[2];
        s16 value2;
    } half;
    struct {
        unk8 pad0[3];
        s8 value3;
    } byte;
} CurrentGameStatePacketWordDraft;

typedef struct CurrentGameStatePacketDraft {
    CurrentGameStatePacketWordDraft word;
    unk32 unk4;
} CurrentGameStatePacketDraft;

extern s32 _unk30001AC;
extern s32 _unk30001B0;
extern s32 _unk30001B4;
extern s32 _unk30001B8;
extern s32 _unk30001BC;
extern unk16 _unk30001C0;
extern SpriteTextCleanup* _unk30001C8[10];
void sub_804423C(SpriteTextCleanup**, s32);
void sub_8044314(SpriteTextCleanup**, FrontendPacketStateDraft*, s32, s32);

void sub_804444C(FrontendState* state, unk32 arg1)
{
    CurrentGameState* gameState;
    CurrentGameStatePacketDraft* packetData;
    FrontendPacketStateDraft* packetState;
    FrontendPacketStateDraft* record;
    GameData* data;
    unk32 delta;
    unk32 difference;
    unk32 halfDifference;
    unk32 value;
    unk32 otherValue;
    unk32 flag;
    unk32 progress;

    data = _gameData;
    gameState = _currentGameState;
    packetData = (CurrentGameStatePacketDraft*)&gameState->unk6EC;
    record = (FrontendPacketStateDraft*)data->unk15D4 + (1 - isMultiplayer());
    packetState = (FrontendPacketStateDraft*)data->unk15C4;
    switch (arg1) {
    case 1:
        sub_804423C(_unk30001C8, _unk30001B0);
        sub_80439A0(&state->unk140);
        if (_unk30001B8 == 0 && sub_805FFE4() != 0 && sub_8060070() != 0
            && sub_8043970(record, 7) != 0) {
            flag = _unk30001B8;
            _unk30001B8 = 1;
            if (data->unk161B != 0) {
                _unk30001BC = flag;
            } else if (gameState->unk6A4 == 1) {
                if (RiderHasFlag(data, 0x800) != 0) {
                    if (record->unkB == 0) {
                        _unk30001BC = 1;
                    } else {
                        _unk30001BC = 0;
                    }
                } else {
                    _unk30001BC = 2;
                }
            } else if (RiderHasFlag(data, 0x8000000) == 0 && record->unkB != 0) {
                _unk30001BC = 1;
            } else if (RiderHasFlag(data, 0x8000000) != 0 && record->unkB == 0) {
                _unk30001BC = 2;
            } else {
                _unk30001BC = 0;
            }
            value = _unk30001BC;
            if (value == 0) {
                gameState->unk6A8++;
            } else if (value == 1) {
                gameState->unk6A7++;
            }
        }
        delta = (_unk30001AC - _unk30001B0) >> 2;
        sub_80596AC(&state->unk250, -delta, 0);
        _unk30001B0 += delta;
        break;
    case 2:
        if (_unk30001B8 != 0) {
            sub_8044314(_unk30001C8, record, _unk30001B4, _unk30001BC);
            if (_unk30001C0 != 0) {
                progress = _unk30001B4 & 0x1F;
                if (progress == 0x1F) {
                    _unk30001B4++;
                } else if (progress == 0) {
                    _unk30001B4 += 0x1F;
                } else {
                    _unk30001B4 |= 0x1F;
                }
            } else {
                _unk30001B4++;
                if (_unk30001B4 > 0x7E) {
                    _unk30001C0 = 1;
                }
            }
        }
        if (sub_805FFE4() == 0 || sub_8060070() == 0) {
            break;
        }
        if (sub_8060040() != 0 && (_unk3005DA0 & 1) != 0) {
            if (_unk30001C0 != 0) {
                packetState->unk2 = (packetState->unk2 & 0xF) | 0x10;
                sub_8043960(packetState);
            } else {
                packetState->unkA = 1;
                sub_8043960(packetState);
                _unk30001C0 = 1;
            }
        }
        if (sub_8043970(record, 7) != 0) {
            value = gameState->unk6A7;
            otherValue = gameState->unk6A8;
            difference = (gameState->unk6A6 - otherValue) - value;
            halfDifference = ((gameState->unk6A5 - otherValue) >> 1) + 1;
            if (record->unkA != 0) {
                _unk30001C0 = 1;
            }
            if ((record->unk2 & 0xF0) == 0x10) {
                packetState->unk2 = (packetState->unk2 & 0xF) | 0x10;
                sub_8043960(packetState);
                _unk30001AC = 0x10000;
                if (gameState->unk6A5 == gameState->unk6A4
                    && value == difference) {
                    sub_80490F8(0x25);
                } else if (halfDifference - otherValue <= 0) {
                    sub_80490F8(0x23);
                } else if (halfDifference - difference <= 0) {
                    sub_80490F8(0x24);
                } else {
                    sub_80490F8(0x22);
                }
                sub_804ABFC(8);
            }
        }
        break;
    case 0:
        sub_8049168();
        gameState->unk6A6++;
        _unk30001B0 = 0x10000;
        _unk30001AC = 0;
        _unk30001B4 = 0;
        _unk30001BC = 0;
        _unk30001C0 = 0;
        sub_80596AC(&state->unk250, -0x10000, 0);
        state->unk80 |= 0x30;
        _unk30001B8 = 0;
        if (sub_805FFE4() != 0 && sub_8060070() != 0) {
            packetState->unk2 = 7;
            packetState->unk4 = packetData->unk4;
            packetState->unk5 = RiderHasFlag(data, 0x8000000);
            packetState->unk6 = packetData->word.value;
            packetState->unk7 = packetData->word.value >> 8;
            packetState->unk8 = packetData->word.half.value2;
            packetState->unk9 = packetData->word.byte.value3;
            packetState->unkA = 0;
            packetState->unkB = RiderHasFlag(data, 0x800) != 0;
            sub_8043960(packetState);
        }
        _unk30001C8[0] = sub_804A0E0(0);
        _unk30001C8[1] = sub_804A0E0(1);
        _unk30001C8[2] = sub_804A0E0(2);
        _unk30001C8[3] = sub_804A0E0(3);
        _unk30001C8[4] = sub_804A0E0(4);
        _unk30001C8[5] = sub_804A0E0(5);
        _unk30001C8[6] = sub_804A0E0(6);
        _unk30001C8[7] = sub_804A0E0(7);
        _unk30001C8[8] = sub_804A0E0(8);
        _unk30001C8[9] = sub_804A0E0(9);
        break;
    default:
        break;
    }
}

#endif
INCLUDE_ASM("asm/dump/8040d18/804444c.s");

#if 0
void sub_80448F4(FrontendState* state, unk32 arg1)
{
    unk32 mask;
    GameData* data;
    SpriteEntry* sprite;
    FrontendPacketState* packetState;
    FrontendPacketState* record;

    record = &_gameData->unk15D4[1 - isMultiplayer()];
    packetState = &_gameData->unk15C4;
    switch (arg1) {
    case 0:
        sprite = allocSprite(0);
        _unk30001F0 = sprite;
        if (sprite != NULL) {
            LoadSpriteSheet(sprite, SpriteSheet_823BF04, 0xFFFF0000, 0x5400, 0, 0, 0, 0);
        }
        sprite = allocSprite(0);
        _unk30001F4 = sprite;
        if (sprite != NULL) {
            LoadSpriteSheet(sprite, SpriteSheet_823BF04, 0x18000, 0x5400, 0, 0, 1, 0);
        }
        _unk30001F8 = 0x800;
        _unk30001FC = 0xD800;
        newIconMenu(&state->menuState.menu, _8069108, 0);
        sub_8050FEC(&state->menuState.menu, 0x9600);
        _unk3000200 = 0;
        if (sub_805FFE4() == 0 || sub_8060070() == 0) {
            break;
        }
        mask = 0x10;
        mask = -mask;
        packetState->unk2 = ((packetState->unk2 & mask) | 8) & 0xF;
        sub_8043960(packetState);
        break;
    case 7:
        sub_8051028(&state->menuState.menu);
        if (_unk30001F0 != NULL) {
            sub_8060A94(_unk30001F0);
        }
        if (_unk30001F4 != NULL) {
            sub_8060A94(_unk30001F4);
        }
        if (_unk3000200 == 0) {
            break;
        }
        state->unk7F = 0;
        data = _gameData;
        data->unk1618 = 0;
        data->unk1619 = 0;
        data->unk161A = 0;
        sub_80600B4();
        break;
    case 1:
        if (_unk30001F0 != NULL) {
            _unk30001F0->x += ((_unk30001F8 - _unk30001F0->x) >> 3)
                + Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        if (_unk30001F4 != NULL) {
            _unk30001F4->x += ((_unk30001FC - _unk30001F4->x) >> 3)
                - Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        sub_80439A0(&state->unk140);
        sub_8050C18(&state->menuState.menu);
        if (sub_805FFE4() == 0 || sub_8060070() == 0) {
            break;
        }
        if (sub_8060040() != 0) {
            if ((_unk3005DA0 & 0x20) != 0) {
                sub_8050F0C(&state->menuState.menu);
            }
            if ((_unk3005DA0 & 0x10) != 0) {
                sub_8050E80(&state->menuState.menu);
            }
            packetState->unk4 = state->menuState.menu.selection;
            sub_8043960(packetState);
            break;
        }
        if (sub_8043970(record, 8) != 0) {
            if (record->unk4 != state->menuState.menu.selection) {
                sub_8050DF8(&state->menuState.menu);
            }
        }
        break;
    case 2:
        if (sub_805FFE4() == 0 || sub_8060070() == 0) {
            break;
        }
        if (sub_8060040() != 0 && (_unk3005DA0 & 1) != 0) {
            packetState->unk2 = (packetState->unk2 & 0xF) | 0x10;
            sub_8043960(packetState);
        }
        if (sub_8043970(record, 8) != 0 && (record->unk2 & 0xF0) == 0x10) {
            packetState->unk2 = (packetState->unk2 & 0xF) | 0x10;
            sub_8043960(packetState);
            _unk30001F8 = 0xFFFF0000;
            _unk30001FC = 0x1E000;
            sub_8050F98(&state->menuState.menu);
            if (state->menuState.menu.selection != 0) {
                _unk3000200 = 1;
                sub_80490F8(0xA);
                break;
            }
            sub_80490F8(0x1B);
        }
        break;
    }
}

#endif
INCLUDE_ASM("asm/dump/8040d18/80448f4.s");

void sub_8044C48(FrontendState* state, unk32 arg1)
{
    unk8 value;
    unk32 difference;
    GameData* data;
    SpriteEntry* sprite;
    s32 initialScroll;
    s32 scrollDelta;
    s32 textAValue;
    s32 textBValue;

    switch (arg1) {
    case 0:
        value = _currentGameState->unk6A7;
        difference = (_currentGameState->unk6A6 - _currentGameState->unk6A8) - value;
        state->unk7F = 0;
        data = _gameData;
        data->unk1618 = 0;
        data->unk1619 = 0;
        data->unk161A = 0;
        sub_80600B4();
        sprite = allocSprite(0);
        _unk3000204 = sprite;
        _unk3000208 = 0x5800;
        _unk3000278 = 0;
        _unk300020C = 0;
        _unk3000210.value = 0x10000;
        initialScroll = 0x10000;
        sub_80596AC(&state->unk250, -initialScroll, 0);
        if (_unk3000204 != NULL) {
            LoadSpriteSheet(_unk3000204, SpriteSheet_823FF84, initialScroll, 0x2300, 0, 0, 0, 0);
        }
        allocFont(&_unk3000218, SpriteSheet_82B05EC, ShadowFontMeta, 0x100, 0x6E, 0xF0, 2);
        sub_8061660(&_unk3000218, _806DB8C[1][getLanguage()], 0xF);
        allocFont(&_unk3000248, SpriteSheet_82B05EC, ShadowFontMeta, 0x100, 0x78, 0xF0, 2);
        sub_8061660(&_unk3000248, _806DB8C[0][getLanguage()], 0xF);
        showNumber(&_unk3000248, value, 0xF);
        showString(&_unk3000248, Str_86FD470, 0xF);
        showNumber(&_unk3000248, difference, 0xF);
        break;
    case 7:
        sub_8061204(&_unk3000218);
        sub_8061204(&_unk3000248);
        if (_unk3000204 != NULL) {
            sub_8060A94(_unk3000204);
        }
        break;
    case 1:
        textAValue = _unk3000218.x;
        textBValue = _unk3000248.x;
        _unk3000204->x += (_unk3000208 - _unk3000204->x) >> 2;
        textAValue += (_unk3000278 - textAValue) >> 2;
        textBValue += (_unk3000278 - textBValue) >> 2;
        sub_8061844(&_unk3000218, textAValue >> 8, 0x6E);
        sub_8061844(&_unk3000248, textBValue >> 8, 0x78);
        scrollDelta = (_unk300020C - _unk3000210.value) >> 2;
        sub_80596AC(&state->unk250, -scrollDelta, 0);
        _unk3000210.value += scrollDelta;
        if (((sub_8057C40() >> 4) & 3) == 0) {
            _unk3000204->frame.word++;
            if (_unk3000204->frame.word > 3) {
                _unk3000204->frame.word = 0;
            }
        }
        break;
    case 2:
        if ((_unk3005DA0 & 1) != 0) {
            _unk3000208 = 0x10000;
            _unk3000278 = 0x10000;
            _unk300020C = 0x10000;
            sub_80490F8(0xA);
        }
        break;
    default:
        break;
    }
}

void sub_8044ED4(FrontendState* state, unk32 arg1)
{
    unk8 value;
    unk32 difference;
    GameData* data;
    SpriteEntry* sprite;
    s32 initialScroll;
    s32 scrollDelta;
    s32 textAValue;
    s32 textBValue;

    switch (arg1) {
    case 0:
        value = _currentGameState->unk6A7;
        difference = (_currentGameState->unk6A6 - _currentGameState->unk6A8) - value;
        state->unk7F = 0;
        data = _gameData;
        data->unk1618 = 0;
        data->unk1619 = 0;
        data->unk161A = 0;
        sub_80600B4();
        sprite = allocSprite(0);
        _unk300027C = sprite;
        _unk3000280 = 0x5800;
        _unk30002F0 = 0;
        _unk3000284 = 0;
        _unk3000288.value = 0x10000;
        initialScroll = 0x10000;
        sub_80596AC(&state->unk250, -initialScroll, 0);
        if (_unk300027C != NULL) {
            LoadSpriteSheet(_unk300027C, SpriteSheet_82411A0, initialScroll, 0x2300, 0, 0, 0, 0);
        }
        allocFont(&_unk3000290, SpriteSheet_82B05EC, ShadowFontMeta, 0x100, 0x6E, 0xF0, 2);
        sub_8061660(&_unk3000290, _806DB8C[2][getLanguage()], 0xF);
        allocFont(&_unk30002C0, SpriteSheet_82B05EC, ShadowFontMeta, 0x100, 0x78, 0xF0, 2);
        sub_8061660(&_unk30002C0, _806DB8C[0][getLanguage()], 0xF);
        showNumber(&_unk30002C0, value, 0xF);
        showString(&_unk30002C0, Str_86FD470, 0xF);
        showNumber(&_unk30002C0, difference, 0xF);
        break;
    case 7:
        sub_8061204(&_unk30002C0);
        sub_8061204(&_unk3000290);
        if (_unk300027C != NULL) {
            sub_8060A94(_unk300027C);
        }
        break;
    case 1:
        textAValue = _unk3000290.x;
        textBValue = _unk30002C0.x;
        _unk300027C->x += (_unk3000280 - _unk300027C->x) >> 2;
        textAValue += (_unk30002F0 - textAValue) >> 2;
        textBValue += (_unk30002F0 - textBValue) >> 2;
        sub_8061844(&_unk3000290, textAValue >> 8, 0x6E);
        sub_8061844(&_unk30002C0, textBValue >> 8, 0x78);
        scrollDelta = (_unk3000284 - _unk3000288.value) >> 2;
        sub_80596AC(&state->unk250, -scrollDelta, 0);
        _unk3000288.value += scrollDelta;
        if (((sub_8057C40() >> 4) & 3) == 0) {
            _unk300027C->frame.word++;
            if (_unk300027C->frame.word > 3) {
                _unk300027C->frame.word = 0;
            }
        }
        break;
    case 2:
        if ((_unk3005DA0 & 1) != 0) {
            _unk3000280 = 0x10000;
            _unk30002F0 = 0x10000;
            _unk3000284 = 0x10000;
            sub_80490F8(0xA);
        }
        break;
    default:
        break;
    }
}

void sub_8045160(FrontendState* state, unk32 arg1, unk32 arg2)
{
    unk8 value;
    GameData* data;
    SpriteEntry* sprite;
    s32 initialScroll;
    s32 scrollDelta;
    s32 textAValue;
    s32 textBValue;

    switch (arg1) {
    case 0:
        value = _currentGameState->unk6A7;
        state->unk7F = 0;
        data = _gameData;
        data->unk1618 = 0;
        data->unk1619 = 0;
        data->unk161A = 0;
        sub_80600B4();
        sprite = allocSprite(0);
        _unk30002F4 = sprite;
        _unk30002F8 = 0x5800;
        _unk3000368 = 0;
        _unk30002FC = 0;
        _unk3000300.value = 0x10000;
        initialScroll = 0x10000;
        sub_80596AC(&state->unk250, -initialScroll, 0);
        if (_unk30002F4 != NULL) {
            LoadSpriteSheet(_unk30002F4, SpriteSheet_8243874, initialScroll, 0x2300, 0, 0, 0, 0);
        }
        allocFont(&_unk3000308, SpriteSheet_82B05EC, ShadowFontMeta, 0x100, 0x6E, 0xF0, 2);
        sub_8061660(&_unk3000308, _806DB8C[3][getLanguage()], 0xF);
        allocFont(&_unk3000338, SpriteSheet_82B05EC, ShadowFontMeta, 0x100, 0x78, 0xF0, 2);
        sub_8061660(&_unk3000338, _806DB8C[0][getLanguage()], 0xF);
        showNumber(&_unk3000338, value, 0xF);
        showString(&_unk3000338, Str_86FD470, 0xF);
        showNumber(&_unk3000338, value, 0xF);
        break;
    case 7:
        sub_8061204(&_unk3000338);
        sub_8061204(&_unk3000308);
        if (_unk30002F4 != NULL) {
            sub_8060A94(_unk30002F4);
        }
        break;
    case 1:
        textAValue = _unk3000308.x;
        textBValue = _unk3000338.x;
        _unk30002F4->x += (_unk30002F8 - _unk30002F4->x) >> 2;
        textAValue += (_unk3000368 - textAValue) >> 2;
        textBValue += (_unk3000368 - textBValue) >> 2;
        sub_8061844(&_unk3000308, textAValue >> 8, 0x6E);
        sub_8061844(&_unk3000338, textBValue >> 8, 0x78);
        scrollDelta = (_unk30002FC - _unk3000300.value) >> 2;
        sub_80596AC(&state->unk250, -scrollDelta, 0);
        _unk3000300.value += scrollDelta;
        if (((sub_8057C40() >> 4) & 3) == 0) {
            _unk30002F4->frame.word++;
            if (_unk30002F4->frame.word > 3) {
                _unk30002F4->frame.word = 0;
            }
        }
        break;
    case 2:
        if ((_unk3005DA0 & 1) != 0) {
            _unk30002F8 = 0x10000;
            _unk3000368 = 0x10000;
            _unk30002FC = 0x10000;
            sub_80490F8(0xA);
        }
        break;
    default:
        break;
    }
}

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

#if 0
void sub_8045CB4(FrontendState* state, unk32 arg1, unk32 arg2)
{
    SpriteEntry* sprite;
    SpriteEntry* sprite2;
    SpriteEntry* sprite3;
    SpriteEntry* sprite4;
    s32 zero;
    s32 initialScroll;
    unk32 frame;

    switch (arg1) {
    case 0:
        _unk30003C8 = 0;
        zero = 0;
        _unk30003CC = 0x10000;
        initialScroll = 0x10000;
        sub_80596AC(&state->unk250, -initialScroll, zero);
        _unk3000460 = zero;
        sprite = allocSprite(0);
        _unk30003D0 = sprite;
        if (sprite != NULL) {
            LoadSpriteSheet(
                sprite, SpriteSheet_823BF04, 0xFFFF0000, 0x3000, zero, zero, zero, zero);
        }
        sprite2 = allocSprite(0);
        _unk30003D4 = sprite2;
        if (sprite2 != NULL) {
            LoadSpriteSheet(sprite2, SpriteSheet_823BF04, 0x18000, 0x3000, zero, zero, 1, zero);
        }
        sprite3 = allocSprite(0);
        _unk30003D8 = sprite3;
        if (sprite3 != NULL) {
            LoadSpriteSheet(sprite3, SpriteSheet_8247028, 0x18000, 0x2800, zero, zero, zero, zero);
        }
        sprite4 = allocSprite(0);
        _unk30003DC = sprite4;
        if (_unk30003D8 != NULL) {
            LoadSpriteSheet(sprite4, SpriteSheet_824B01C, 0x18000, 0x5800, zero, zero, zero, zero);
        }
        _unk30003E0 = 0x1900;
        _unk30003E4 = 0xC700;
        _unk30003EC = 0x7800;
        _unk30003F0.value = 0x2900;
        _unk30003E8 = 0x3000;
        _unk3000458 = _currentGameState->unk6E4 >> 5;
        _unk300045C = _currentGameState->unk6E6 >> 5;
        _unk30003DC->frame.word = _unk300045C;
        _unk30003D8->frame.word = _currentGameState->unk6E4 >> 5;
        allocFont(&_unk30003F8, SpriteSheet_82B1A84, LargeFontMeta, 0x100, 0x38, 0xF0, zero);
        sub_8061660(&_unk30003F8, _806DFD0[0][getLanguage()], 0xE);
        allocFont(&_unk3000428, SpriteSheet_82B1A84, LargeFontMeta, 0x100, 0x68, 0xF0, zero);
        sub_8061660(&_unk3000428, _806DFD0[1][getLanguage()], 0xE);
        break;
    case 7:
        if (_unk30003D0 != NULL) {
            sub_8060A94(_unk30003D0);
        }
        if (_unk30003D4 != NULL) {
            sub_8060A94(_unk30003D4);
        }
        if (_unk30003D8 != NULL) {
            sub_8060A94(_unk30003D8);
        }
        if (_unk30003DC != NULL) {
            sub_8060A94(_unk30003DC);
        }
        sub_8061204(&_unk30003F8);
        sub_8061204(&_unk3000428);
        break;
    case 1: {
        s32 value;
        s32 value2;
        s32 scroll;
        s32 offset;

        value = _unk30003F8.x;
        value2 = _unk3000428.x;
        sub_80439A0(&state->unk140);
        value += (_unk30003F0.value - value) >> 2;
        value2 += (_unk30003F0.value - value2) >> 2;
        sub_8061844(&_unk30003F8, value >> 8, 0x38);
        sub_8061844(&_unk3000428, value2 >> 8, 0x68);
        scroll = (_unk30003C8 - _unk30003CC) >> 2;
        sub_80596AC(&state->unk250, -scroll, 0);
        _unk30003CC += scroll;
        if (_unk30003D0 != NULL) {
            offset = ((_unk30003E0 - _unk30003D0->x) >> 3)
                + Unk_874CC3C[((sub_8057C40() & 0x1FE) >> 1)];
            offset -= _unk30003C8;
            _unk30003D0->x += offset;
            _unk30003D0->y += (_unk30003E8 - _unk30003D0->y) >> 2;
        }
        if (_unk30003D4 != NULL) {
            _unk30003D4->y += (_unk30003E8 - _unk30003D4->y) >> 2;
            offset = ((_unk30003E4 - _unk30003D4->x) >> 3)
                - Unk_874CC3C[((sub_8057C40() & 0x1FE) >> 1)];
            offset += _unk30003C8;
            _unk30003D4->x += offset;
        }
        _unk30003D8->x += (_unk30003EC - _unk30003D8->x) >> 2;
        _unk30003DC->x += (_unk30003EC - _unk30003DC->x) >> 2;
        break;
    }
    case 2:
        if (_unk3005DA0 == 2) {
            _unk30003C8 = 0x10000;
            _unk30003E0 = 0xFFFF0000;
            _unk30003E4 = 0x1E000;
            _unk30003EC = 0x12C00;
            _unk30003F0.value = 0x11800;
            sub_804B00C(_unk3000458 << 5);
            sub_804AFD4(_unk300045C << 5);
            sub_8049178();
            sub_804ABFC(9);
            break;
        }
        if (_unk3005DA0 == 1) {
            _unk30003E0 = 0xFFFF0000;
            _unk30003E4 = 0x1E000;
            _unk30003EC = 0x12C00;
            _unk30003C8 = 0x10000;
            _unk30003F0.value = 0x11800;
            sub_80490F8(0xC);
            sub_804ABFC(8);
            break;
        }
        if ((_unk3005DA0 & 0xC0) != 0) {
            if (_unk3000460 == 0) {
                _unk3000460 = 1;
            } else {
                _unk3000460 = 0;
            }
            _unk30003E8 = _unk3000460 * 0x3000 + 0x3000;
            break;
        }
        if (_unk3005DA0 == 0x20) {
            if (_unk3000460 == 0) {
                frame = _unk30003D8->frame.word;
                if (frame != 0) {
                    frame--;
                    _unk30003D8->frame.word = frame;
                    sub_804B00C(frame << 5);
                    sub_804A310();
                }
            } else {
                frame = _unk30003DC->frame.word;
                if (frame != 0) {
                    frame--;
                    _unk30003DC->frame.word = frame;
                    sub_804AFD4(frame << 5);
                }
            }
        } else if (_unk3005DA0 == 0x10) {
            if (_unk3000460 == 0) {
                frame = _unk30003D8->frame.word;
                if (frame <= 9) {
                    frame++;
                    _unk30003D8->frame.word = frame;
                    sub_804B00C(frame << 5);
                    sub_804A310();
                }
            } else {
                frame = _unk30003DC->frame.word;
                if (frame <= 9) {
                    frame++;
                    _unk30003DC->frame.word = frame;
                    sub_804AFD4(frame << 5);
                }
            }
        }
        break;
    default:
        break;
    }
}
#endif

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

void sub_8046A0C(FrontendState* state, unk32 arg1)
{
    unk8 result;
    s32 delta;

    switch (arg1) {
    case 0:
        sub_8049168();
        _unk30004B8 = 0xFFFF0000;
        _unk30004B4 = 0;
        sub_80596AC(&state->unk250, -0x10000, 0);
        _unk30004C0 = 0;
        _unk30004C1 = 0;
        _unk30004BC = 0;
        break;
    case 1:
        sub_80439A0(&state->unk140);
        sub_8061844(sub_804A0E0(0), (s16)(-(_unk30004B8 >> 8) + 0x10), 0x4A);
        if (_unk30004C1 != 0 && _unk30004C0 == 0) {
            result = sub_80515A4();
            if (result != 0) {
                sub_8051640(1);
            }
            _unk30004C0 = arg1;
            sub_8061660(sub_804A0E0(0), _806E0DC[result != 0 ? 1 : 2][getLanguage()], 0xF);
        }
        delta = (_unk30004B4 - _unk30004B8) >> 2;
        sub_80596AC(&state->unk250, delta, 0);
        _unk30004B8 += delta;
        if (delta == 0 && _unk30004C1 == 0) {
            sub_8061660(sub_804A0E0(0), _806E0DC[0][getLanguage()], 0xF);
            _unk30004C1 = 1;
        }
        _unk30004BC++;
        break;
    case 2:
        if (_unk30004C0 != 0
            && (((_unk3005DA0 & 1) != 0 && _unk30004BC > 0x78) || _unk30004BC > 0x258)) {
            sub_80490F8(_unk3000648);
            _unk30004B4 = 0xFFFF0000;
        }
        break;
    default:
        break;
    }
}

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

void sub_8047E5C(FrontendState* state, unk32 arg1)
{
    SpriteEntry* sprite1;
    SpriteEntry* sprite2;
    SpriteEntry* sprite3;
    s32 initialScroll;
    s32 fontX;
    s32 scrollDelta;
    GameData* gameData;

    switch (arg1) {
    case 0:
        sub_8049168();
        state->unk7F = 0;
        gameData = _gameData;
        gameData->unk1618 = 0;
        gameData->unk1619 = 0;
        gameData->unk161A = 0;
        sub_80600B4();
        sprite1 = allocSprite(0);
        _unk3000568 = sprite1;
        sprite2 = allocSprite(0);
        _unk300056C = sprite2;
        sprite3 = allocSprite(0);
        _unk3000570 = sprite3;
        _unk3000574 = (0xA0 << 5);
        LoadSpriteSheet(_unk3000568, SpriteSheet_8251F40, 0x10000, 0x3600, 0, 0, 0, 0);
        LoadSpriteSheet(_unk300056C, SpriteSheet_8251F40, 0x18000, 0x3600, 0, 0, 0, 0);
        LoadSpriteSheet(_unk3000570, SpriteSheet_8252994, 0x14000, 0x4000, 0, 0, 0, 0);
        _unk3000570->frame.word = 8;
        _unk3000578 = 0;
        initialScroll = 0x10000;
        _unk300057C = initialScroll;
        sub_80596AC(&state->unk250, -initialScroll, 0);
        allocFont(&_unk3000580, SpriteSheet_82B05EC, ShadowFontMeta, 0x100, 0x69, 0xC8, 2);
        sub_8061660(&_unk3000580, _806E3B0[0][getLanguage()], 0xF);
        break;
    case 1:
        fontX = _unk3000580.x;
        sub_80439A0(&state->unk140);
        fontX += (_unk3000574 - fontX) >> 2;
        sub_8061844(&_unk3000580, fontX >> 8, 0x69);
        _unk3000568->x += (_unk3000574 - _unk3000568->x + (0x80 << 3)) >> 2;
        _unk300056C->x += (_unk3000574 - _unk300056C->x + (0x84 << 8)) >> 2;
        _unk3000570->x += (_unk3000574 - _unk3000570->x + (0x88 << 7)) >> 2;
        scrollDelta = (_unk3000578 - _unk300057C) >> 2;
        sub_80596AC(&state->unk250, -scrollDelta, 0);
        _unk300057C += scrollDelta;
        if (((sub_8057C40() >> 4) & 0xF) == 0) {
            _unk3000570->frame.word++;
            if (_unk3000570->frame.word > 0xA) {
                _unk3000570->frame.word = 8;
            }
        }
        break;
    case 7:
        if (_unk3000568 != NULL) {
            sub_8060A94(_unk3000568);
        }
        if (_unk300056C != NULL) {
            sub_8060A94(_unk300056C);
        }
        if (_unk3000570 != NULL) {
            sub_8060A94(_unk3000570);
        }
        sub_8061204(&_unk3000580);
        break;
    case 2:
        if (_unk3005DA0 == 1) {
            _unk3000574 = 0x10000;
            _unk3000578 = 0x10000;
            sub_80490F8(0xA);
        }
        break;
    default:
        break;
    }
}

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

#if 0
void sub_8048310(FrontendState* state, unk32 arg1)
{
    CurrentGameState* currentGameState;
    SpriteEntry* sprite;
    FrontendPacketState* packetState;
    FrontendPacketState* record;

    record = &_gameData->unk15D4[1 - isMultiplayer()];
    packetState = &_gameData->unk15C4;
    switch (arg1) {
    case 0:
        sprite = allocSprite(0);
        _unk30005C0 = sprite;
        if (sprite != NULL) {
            LoadSpriteSheet(sprite, SpriteSheet_823BF04, 0xFFFF0000, 0x5400, 0, 0, 0, 0);
        }
        sprite = allocSprite(0);
        _unk30005C4 = sprite;
        if (sprite != NULL) {
            LoadSpriteSheet(sprite, SpriteSheet_823BF04, 0x18000, 0x5400, 0, 0, 1, 0);
        }
        _unk30005C8 = 0x800;
        _unk30005CC = 0xD800;
        newIconMenu(&state->menuState.menu, _8069D50, 0);
        sub_8050FEC(&state->menuState.menu, 0x9600);
        sub_8049168();
        if (sub_805FFE4() == 0 || sub_8060070() == 0) {
            return;
        }
        packetState->unk2 = 5;
        break;
    case 7:
        sub_8051028(&state->menuState.menu);
        if (_unk30005C0 != NULL) {
            sub_8060A94(_unk30005C0);
        }
        if (_unk30005C4 == NULL) {
            return;
        }
        sub_8060A94(_unk30005C4);
        return;
    case 1:
        if (_unk30005C0 != NULL) {
            _unk30005C0->x += ((_unk30005C8 - _unk30005C0->x) >> 3)
                + Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        if (_unk30005C4 != NULL) {
            _unk30005C4->x += ((_unk30005CC - _unk30005C4->x) >> 3)
                - Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        sub_80439A0(&state->unk140);
        sub_8050C18(&state->menuState.menu);
        if (sub_805FFE4() != 0 && sub_8060070() != 0 && sub_8060040() != 0
            && (_unk3005DA0 & 0x30) != 0) {
            if ((_unk3005DA0 & 0x20) != 0) {
                sub_8050F0C(&state->menuState.menu);
            } else {
                sub_8050E80(&state->menuState.menu);
            }
        }
        if (sub_805FFE4() == 0 || sub_8060070() == 0) {
            return;
        }
        if (sub_8060040() != 0) {
            packetState->unk4 = state->menuState.menu.selection;
        }
        break;
    case 2:
        if (sub_805FFE4() == 0 || sub_8060070() == 0) {
            if (_unk3005DA0 == 1) {
                sub_80490F8(0x21);
            }
            return;
        }
        if (sub_8060040() != 0 && (_unk3005DA0 & 1) != 0) {
            packetState->unk2 = (packetState->unk2 & 0xF) | 0x10;
        }
        if (sub_8043970(record, 5) == 0) {
            return;
        }
        if (sub_8060040() == 0
            && record->unk4 != state->menuState.menu.selection) {
            sub_8050DF8(&state->menuState.menu);
        }
        if ((record->unk2 & 0xF0) == 0x10) {
            packetState->unk2 = (packetState->unk2 & 0xF) | 0x10;
            currentGameState = _currentGameState;
            if (state->menuState.menu.selection == 0) {
                currentGameState->unk6A4 = 1;
                currentGameState->unk6A9 = state->menuState.menu.selection;
            } else {
                currentGameState->unk6A4 = 2;
                currentGameState->unk6A9 = 6;
            }
            currentGameState->unk6A6 = 0;
            currentGameState->unk6A7 = 0;
            currentGameState->unk6A8 = 0;
            _unk30005C8 = 0xFFFF0000;
            _unk30005CC = 0x1E000;
            sub_8050F98(&state->menuState.menu);
            sub_80490F8(0x21);
        }
        break;
    default:
        return;
    }
    sub_8043960(packetState);
}

#endif
INCLUDE_ASM("asm/dump/8040d18/8048310.s");

#if 0
void sub_804868C(FrontendState* state, unk32 arg1)
{
    FrontendMenu* menu;
    FrontendPacketState* packetState;
    FrontendPacketState* record;

    record = (FrontendPacketState*)_gameData->unk15D4 + (1 - isMultiplayer());
    packetState = (FrontendPacketState*)_gameData->unk15C4;
    switch (arg1) {
    case 0:
        _unk30005D0 = allocSprite(0);
        if (_unk30005D0 != NULL) {
            LoadSpriteSheet(_unk30005D0, SpriteSheet_823BF04, 0xFFFF0000, 0x5400, 0, 0, 0, 0);
        }
        _unk30005D4 = allocSprite(0);
        if (_unk30005D4 != NULL) {
            LoadSpriteSheet(_unk30005D4, SpriteSheet_823BF04, 0x18000, 0x5400, 0, 0, 1, 0);
        }
        _unk30005D8 = 0x800;
        _unk30005DC = 0xD800;
        menu = &state->menuState.menu;
        newIconMenu(menu, _8069D9C, 0);
        sub_8050FEC(menu, 0x9600);
        sub_8049168();
        if (sub_805FFE4() == 0 || sub_8060070() == 0) {
            return;
        }
        packetState->unk2 = 6;
        break;
    case 7:
        sub_8051028(&state->menuState.menu);
        if (_unk30005D0 != NULL) {
            sub_8060A94(_unk30005D0);
        }
        if (_unk30005D4 == NULL) {
            return;
        }
        sub_8060A94(_unk30005D4);
        return;
    case 1:
        if (_unk30005D0 != NULL) {
            _unk30005D0->x += ((_unk30005D8 - _unk30005D0->x) >> 3)
                + Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        if (_unk30005D4 != NULL) {
            _unk30005D4->x += ((_unk30005DC - _unk30005D4->x) >> 3)
                - Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1];
        }
        sub_80439A0(&state->unk140);
        menu = &state->menuState.menu;
        sub_8050C18(menu);
        if (sub_805FFE4() != 0 && sub_8060070() != 0 && sub_8060040() != 0
            && (_unk3005DA0 & 0x30) != 0) {
            if ((_unk3005DA0 & 0x20) != 0) {
                sub_8050F0C(menu);
            } else {
                sub_8050E80(menu);
            }
        }
        if (sub_805FFE4() == 0 || sub_8060070() == 0) {
            return;
        }
        if (sub_8060040() != 0) {
            packetState->unk4 = menu->selection;
        }
        break;
    case 2:
        if (sub_805FFE4() == 0 || sub_8060070() == 0) {
            if (_unk3005DA0 == 1) {
                sub_80490F8(0x1B);
            }
            return;
        }
        if (sub_8060040() != 0) {
            if ((_unk3005DA0 & 1) != 0) {
                packetState->unk2 = (packetState->unk2 & 0xF) | 0x10;
            }
            if ((_unk3005DA0 & 2) != 0) {
                packetState->unk2 = (packetState->unk2 & 0xF) | 0x20;
            }
        }
        if (sub_8043970(record, 6) == 0) {
            return;
        }
        if (sub_8060040() == 0 && record->unk4 != state->menuState.menu.selection) {
            sub_8050DF8(&state->menuState.menu);
        }
        if ((record->unk2 & 0xF0) == 0x10) {
            packetState->unk2 = (packetState->unk2 & 0xF) | 0x10;
            switch (state->menuState.menu.selection) {
            case 0:
                _currentGameState->unk6A5 = 1;
                break;
            case 1:
                _currentGameState->unk6A5 = 3;
                break;
            case 2:
                _currentGameState->unk6A5 = 5;
                break;
            case 3:
                _currentGameState->unk6A5 = 7;
                break;
            case 4:
                _currentGameState->unk6A5 = 9;
                break;
            }
            _unk30005D8 = 0xFFFF0000;
            _unk30005DC = 0x1E000;
            sub_8050F98(&state->menuState.menu);
            sub_80490F8(0x1B);
        }
        if ((record->unk2 & 0xF0) == 0x20) {
            packetState->unk2 = (packetState->unk2 & 0xF) | 0x20;
            _unk30005D8 = 0xFFFF0000;
            _unk30005DC = 0x1E000;
            sub_8050FC8(&state->menuState.menu);
            sub_80490F8(0x20);
        }
        break;
    default:
        return;
    }
    sub_8043960(packetState);
}

#endif
INCLUDE_ASM("asm/dump/8040d18/804868c.s");

void sub_8048A74(FrontendSpriteTriple* arg0, s32 arg1)
{
    unk16 value;

    if ((arg0->state & 1) != 0) {
        arg0->sprite2->frame.word = arg0->timer & 3;
    } else if ((arg0->state & 2) != 0) {
        value = arg0->timer;
        if (value <= 3) {
            arg0->sprite2->frame.word = value + 4;
        }
    }
    if (((sub_8057C40() >> 4) & 0xF) == 0) {
        arg0->timer++;
    }
    if (arg0->sprite0 != NULL) {
        arg0->sprite0->x = arg1 + (0xC0 << 5);
    }
    if (arg0->sprite1 != NULL) {
        arg0->sprite1->x = arg1 + (0x98 << 8);
    }
    if (arg0->sprite2 != NULL) {
        arg0->sprite2->x = arg1 + (0xB0 << 7);
    }
}

void sub_8048AE8(FrontendState* state, unk32 arg1, unk32 arg2)
{
    GameData* data;
    s32 initialScroll;
    s32 scrollDelta;

    switch (arg1) {
    case 0:
        _unk30005F0.sprite0 = allocSprite(0);
        _unk30005F0.sprite1 = allocSprite(0);
        _unk30005F0.sprite2 = allocSprite(0);
        if (_unk30005F0.sprite0 != NULL) {
            LoadSpriteSheet(_unk30005F0.sprite0, SpriteSheet_8251F40, 0x10000, 0x4000, 0, 0, 0, 0);
        }
        if (_unk30005F0.sprite1 != NULL) {
            LoadSpriteSheet(_unk30005F0.sprite1, SpriteSheet_8251F40, 0x18000, 0x4000, 0, 0, 0, 0);
        }
        if (_unk30005F0.sprite2 != NULL) {
            LoadSpriteSheet(_unk30005F0.sprite2, SpriteSheet_8252994, 0x14000, 0x4A00, 0, 0, 0, 0);
        }
        _unk30005F0.state = 1;
        _unk30005F0.timer = 0;
        sub_8049168();
        _unk30005E2 = 0x40;
        _unk30005EC = 0;
        data = _gameData;
        data->unk1618 = 0;
        data->unk1619 = 0;
        data->unk161A = 0;
        _unk30005E0 = 0;
        _unk30005E8 = 0x10000;
        initialScroll = 0x10000;
        _unk30005E4 = 0;
        sub_80596AC(&state->unk250, -initialScroll, 0);
        break;
    case 7:
        if (_unk30005F0.sprite0 != NULL) {
            sub_8060A94(_unk30005F0.sprite0);
        }
        if (_unk30005F0.sprite1 != NULL) {
            sub_8060A94(_unk30005F0.sprite1);
        }
        if (_unk30005F0.sprite2 != NULL) {
            sub_8060A94(_unk30005F0.sprite2);
        }
        break;
    case 1:
        sub_80439A0(&state->unk140);
        if (_unk30005E4 != _unk30005E8) {
            scrollDelta = (_unk30005E4 - _unk30005E8) >> 2;
            sub_80596AC(&state->unk250, -scrollDelta, 0);
            _unk30005E8 += scrollDelta;
        }
        sub_8048A74(&_unk30005F0, _unk30005E8);
        break;
    case 8:
        if (arg2 == 1) {
            _unk30005EC = arg2;
        }
        break;
    case 2:
        state->unk7F = 1;
        if (_unk3005DA0 == 2) {
            if (_gameData->unk1618 == 0) {
                state->unk7F = 0;
                sub_80600B4();
                sub_80490F8(0xA);
                sub_804ABFC(9);
                _unk30005E4 = 0x10000;
            }
        }
        if (sub_805FFE4() != 0 && sub_8060070() != 0) {
            _unk30005F0.state = 2;
            _gameData->unk1618 = 1;
            _gameData->unk1619 = 0;
            if (_unk30005E2 == 0x40) {
                _unk30005F0.timer = 0;
            }
            if (--_unk30005E2 == 0) {
                sub_80490F8(0x20);
                sub_804ABFC(8);
                _unk30005E4 = 0x10000;
            }
        }
        _unk30005E0++;
        if (_unk30005E0 > 0x3E7) {
            state->unk7F = 0;
            _gameData->unk1618 = 0;
            sub_80600B4();
            sub_80490F8(0x1E);
            _unk30005E4 = 0x10000;
        }
        break;
    default:
        break;
    }
}

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
