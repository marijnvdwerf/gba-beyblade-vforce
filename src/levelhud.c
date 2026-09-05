#include "levelhud.h"

#include "gamestate.h"
#include "include_asm.h"
#include "language.h"
#include "motion.h"
#include "ram.h"
#include "spritetext.h"
#include "unsorted.h"

#if 0
void sub_804F878(void)
{
    GameData* state;
    SpriteTextCleanup* hud;
    LevelDescription* description;
    const unk8* const* table;
    MotionGroup* motion;
    unk32 language;

    state = _gameData;
    hud = &state->levelHud.text0;
    description = getLevelDescription2();
    sub_804FD64();
    state->levelHud.flags |= 2;
    if (sub_8051780(4) != 0) {
        if (_currentGameState->unk6A4 == 2) {
            table = description->unk94;
        } else {
            table = description->unkA8;
        }
        language = getLanguage();
        sub_8061660(hud, table[language], 0xD);
    } else {
        language = getLanguage();
        sub_8061660(hud, description->unk68[language], 0xD);
        hud = &state->levelHud.text1;
        language = getLanguage();
        sub_8061660(hud, description->unk68[5 + language], 0xD);
        motion = &state->levelHud.motion1;
        newMotionGroup(motion, &state->levelHud.text1.unk14, 2);
        sub_8050578(motion, 0x5800, 0x100);
        sub_80504E4(motion, 0, -0x34, 0, -10);
        state->levelHud.flags |= 4;
    }
    motion = &state->levelHud.motion0;
    newMotionGroup(motion, &state->levelHud.text0.unk14, 2);
    sub_8050578(motion, 0x4800, 0x100);
    sub_80504E4(motion, 0, 0x34, 0, 0x14);
    state->levelHud.status = 0x80;
    state->levelHud.state = 1;
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/804f878.s");

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

INCLUDE_ASM("asm/dump/804a388-tutorial/804fb6c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fc00.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fcac-getItem.s");

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

INCLUDE_ASM("asm/dump/804a388-tutorial/804fe50.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fe9c.s");

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
