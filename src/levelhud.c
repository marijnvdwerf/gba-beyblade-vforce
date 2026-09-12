#include "levelhud.h"

#include "beyblade.h"
#include "gamestate.h"
#include "include_asm.h"
#include "language.h"
#include "motion.h"
#include "ram.h"
#include "spritetext.h"
#include "unsorted.h"

extern const unk8* _806E724[];
extern const unk8* _806E8C4[];
extern const unk8 Str_8727048[];

void sub_804F878(void)
{
    GameData* state;
    LevelHudData* hud;
    LevelDescription* description;
    MotionGroup* motion;

    state = _gameData;
    hud = &state->levelHud;
    description = getLevelDescription2();
    sub_804FD64();
    state->levelHud.flags |= 2;
    if (sub_8051780(4) != 0) {
        if (_currentGameState->unk6A4 == 2) {
            sub_8061660(&hud->text0, description->unk94[getLanguage()], 0xD);
        } else {
            sub_8061660(&hud->text0, description->unkA8[getLanguage()], 0xD);
        }
    } else {
        sub_8061660(&hud->text0, description->unk68[getLanguage()], 0xD);
        sub_8061660(&state->levelHud.text1, description->unk7C[getLanguage()], 0xD);
        motion = &state->levelHud.motion1;
        newMotionGroup(motion, &state->levelHud.text1.unk14, 2);
        sub_8050578(motion, 0x5800, 0x100);
        sub_80504E4(motion, 0, -0x34, 0, -10);
        state->levelHud.flags |= 4;
    }
    motion = &hud->motion0;
    newMotionGroup(motion, &hud->text0.unk14, 2);
    sub_8050578(motion, 0x4800, 0x100);
    sub_80504E4(motion, 0, 0x34, 0, 0x14);
    hud->status = 0x80;
    hud->state = 1;
}

void sub_804F9B4(void)
{
    GameData* state;

    state = _gameData;
    state->levelHud.unk104 = 0x190;
    state->levelHud.unk10C = 1;
    state->levelHud.unk106 = 0;
    state->levelHud.unk108 = 0;
    state->levelHud.unkF4->x = 0x4A00;
    state->levelHud.unkF8->x = 0x8A00;
    state->levelHud.unk100->x = 0x4200;
    state->levelHud.unkF4->y = -0x2000;
    state->levelHud.unkF8->y = -0x2000;
    state->levelHud.unk100->y = -0x2000;
    state->levelHud.unkF4->frame.word = 0;
    state->levelHud.unkF8->frame.word = 0;
    state->levelHud.unk100->frame.word = 0;
}

void sub_804FA40(void)
{
    GameData* state;
    const unk8* const* table;
    SpriteTextCleanup* hud;
    unk32 language;
    MotionGroup* motion;

    state = _gameData;
    hud = &state->levelHud.text0;
    sub_804FD64();
    state->levelHud.flags |= 2;
    table = _806E6FC;
    language = getLanguage();
    sub_8061660(hud, table[language], 0xD);
    motion = &state->levelHud.motion0;
    newMotionGroup(motion, &state->levelHud.text0.unk14, 2);
    sub_8050578(motion, 0x4800, 0x100);
    sub_80504E4(motion, 0, 0x34, 0, 0x14);
    state->levelHud.status = 0x80;
    state->levelHud.state = 2;
}

void sub_804FAD4(void)
{
    GameData* state;
    const unk8* const* table;
    SpriteTextCleanup* hud;
    unk32 language;
    MotionGroup* motion;

    state = _gameData;
    hud = &state->levelHud.text0;
    sub_804F84C(0);
    sub_804FD64();
    state->levelHud.flags |= 2;
    table = _806E710;
    language = getLanguage();
    sub_8061660(hud, table[language], 0xB);
    motion = &state->levelHud.motion0;
    newMotionGroup(motion, &state->levelHud.text0.unk14, 2);
    sub_8050578(motion, 0x4800, 0x100);
    sub_80504E4(motion, 0, 0x34, 0, 0x14);
    state->levelHud.status = 0x5A;
    state->levelHud.state = 3;
}

void sub_804FB6C(void)
{
    GameData* state;
    const unk8* const* table;
    SpriteTextCleanup* hud;
    MotionGroup* motion;

    state = _gameData;
    hud = &state->levelHud.text0;
    sub_804FD64();
    state->levelHud.flags |= 2;
    table = _806E8C4;
    sub_8061660(hud, table[getLanguage()], 0xD);
    motion = &state->levelHud.motion0;
    newMotionGroup(motion, &state->levelHud.text0.unk14, 2);
    sub_8050578(motion, 0x4800, 0x100);
    sub_80504E4(motion, 0, 0x34, 0, 0x14);
    state->levelHud.status = 0x80;
    state->levelHud.state = 5;
}

void sub_804FC00(unk32 arg0)
{
    GameData* state;
    const unk8* const* table;
    SpriteTextCleanup* hud;
    MotionGroup* motion;

    state = _gameData;
    hud = &state->levelHud.text0;
    sub_804F84C(0);
    sub_804FD64();
    state->levelHud.flags |= 2;
    table = _806E724;
    sub_8061660(hud, table[arg0 * 5 + getLanguage()], 0xD);
    motion = &state->levelHud.motion0;
    newMotionGroup(motion, &state->levelHud.text0.unk14, 2);
    sub_8050578(motion, 0x4800, 0x100);
    sub_80504E4(motion, 0, 0x34, 0, 0x14);
    state->levelHud.status = 0x80;
    state->levelHud.state = 4;
}

void getItem(unk32 item)
{
    GameData* state;
    SpriteTextCleanup* text0;
    MotionGroup* motion;
    const unk8* const* table;

    state = _gameData;
    text0 = &state->levelHud.text0;
    getLevelDescription2();
    sub_804FD64();
    state->levelHud.flags |= 0x22;
    table = &_806E724[0x14];
    sub_8061660(text0, table[getLanguage()], 0xD);
    sub_8061660(&state->levelHud.text1, sub_8057048(item), 0xC);
    motion = &state->levelHud.motion0;
    newMotionGroup(motion, &state->levelHud.text0.unk14, 2);
    sub_8050578(motion, 0x6E00, 0x100);
    sub_80504E4(motion, 0, 0x34, 0, 0x14);
    state->levelHud.status = 0x80;
    state->levelHud.state = 6;
}

void sub_804FD64(void)
{
    GameData* base;
    SpriteTextCleanup* hud;
    u16* flags;

    base = _gameData;
    hud = &base->levelHud.text0;
    flags = &base->levelHud.flags;
    if ((*flags & 2) != 0) {
        sub_8061228(hud);
        sub_8050584(&base->levelHud.motion0);
        *flags &= 0xFFFD;
    }
    if ((*flags & 4) != 0) {
        sub_8061228(&base->levelHud.text1);
        sub_8050584(&base->levelHud.motion1);
        *flags &= 0xFFFB;
    }
    if ((*flags & 0x10) != 0) {
        sub_8061228(hud);
        *flags &= 0xFFEF;
    }
    if ((*flags & 0x20) != 0) {
        sub_8061228(&base->levelHud.text1);
        *flags &= 0xFFDF;
    }
}

void sub_804FE14(void)
{
    _gameData->levelHud.flags |= 1;
}

void sub_804FE30(void)
{
    _gameData->levelHud.flags &= 0xFFFE;
}

void sub_804FE50(void)
{
    GameData* state;

    state = _gameData;
    state->levelHud.unk12D++;
    showNumber_2(&state->levelHud.text3, state->levelHud.unk12D, 0xF);
    showString(&state->levelHud.text3, Str_8727048, 0xF);
    showNumber(&state->levelHud.text3, getLevelDescription2()->unk1, 0xF);
}

void sub_804FE9C(void)
{
    GameData* state;
    SpriteTextCleanup* hud;

    state = _gameData;
    state->levelHud.unk12D = sub_80518F0();
    hud = &state->levelHud.text3;
    showNumber_2(hud, state->levelHud.unk12D, 0xF);
    showString(hud, Str_8727048, 0xF);
    showNumber(hud, getLevelDescription2()->unk1, 0xF);
}

void sub_804FEE8(void)
{
    GameData* base;
    SpriteTextCleanup* hud;
    base = _gameData;
    hud = &base->levelHud.text0;
    if (base->levelHud.status != 0) {
        sub_8061228(hud);
        sub_8061228(&base->levelHud.text1);
        sub_8050584(&base->levelHud.motion0);
        sub_8050584(&base->levelHud.motion1);
        base->levelHud.status = 0;
    }
    sub_8061204(hud);
    sub_8061204(&base->levelHud.text1);
    sub_8061204(&base->levelHud.text2);
    sub_8061204(&base->levelHud.text3);
}
