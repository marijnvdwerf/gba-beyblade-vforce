#include "levelhud.h"

#include "include_asm.h"
#include "language.h"
#include "motion.h"
#include "ram.h"
#include "spritetext.h"

INCLUDE_ASM("asm/dump/804a388-tutorial/804f878.s");

void sub_804F9B4(void)
{
    GameData* state;

    state = _gameData;
    state->unk1054 = 0x190;
    state->unk105C = 1;
    state->unk1056 = 0;
    state->unk1058 = 0;
    state->unk1044->unk8 = 0x4A00;
    state->unk1048->unk8 = 0x8A00;
    state->unk1050->unk8 = 0x4200;
    state->unk1044->unkC = -0x2000;
    state->unk1048->unkC = -0x2000;
    state->unk1050->unkC = -0x2000;
    state->unk1044->unk18 = 0;
    state->unk1048->unk18 = 0;
    state->unk1050->unk18 = 0;
}

void sub_804FA40(void)
{
    GameData* state;
    const u8* const* table;
    SpriteTextCleanup* hud;
    unk32 language;
    MotionGroup* motion;

    state = _gameData;
    hud = &state->levelHud0;
    sub_804FD64();
    state->unk105E |= 2;
    table = _806E6FC;
    language = getLanguage();
    sub_8061660(hud, table[language], 0xD);
    motion = &state->levelHudMotion0;
    newMotionGroup(motion, &state->levelHud0.unk14, 2);
    sub_8050578(motion, 0x4800, 0x100);
    sub_80504E4(motion, 0, 0x34, 0, 0x14);
    state->levelHudStatus = 0x80;
    state->unk105A = 2;
}

void sub_804FAD4(void)
{
    GameData* state;
    const u8* const* table;
    SpriteTextCleanup* hud;
    unk32 language;
    MotionGroup* motion;

    state = _gameData;
    hud = &state->levelHud0;
    sub_804F84C(0);
    sub_804FD64();
    state->unk105E |= 2;
    table = _806E710;
    language = getLanguage();
    sub_8061660(hud, table[language], 0xB);
    motion = &state->levelHudMotion0;
    newMotionGroup(motion, &state->levelHud0.unk14, 2);
    sub_8050578(motion, 0x4800, 0x100);
    sub_80504E4(motion, 0, 0x34, 0, 0x14);
    state->levelHudStatus = 0x5A;
    state->unk105A = 3;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804fb6c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fc00.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fcac-getItem.s");

void sub_804FD64(void)
{
    GameData* base;
    SpriteTextCleanup* hud;
    unk16* flags;

    base = _gameData;
    hud = &base->levelHud0;
    flags = &base->unk105E;
    if ((*flags & 2) != 0) {
        sub_8061228(hud);
        sub_8050584(&base->levelHudMotion0);
        *flags &= 0xFFFD;
    }
    if ((*flags & 4) != 0) {
        sub_8061228(&base->levelHud1);
        sub_8050584(&base->levelHudMotion1);
        *flags &= 0xFFFB;
    }
    if ((*flags & 0x10) != 0) {
        sub_8061228(hud);
        *flags &= 0xFFEF;
    }
    if ((*flags & 0x20) != 0) {
        sub_8061228(&base->levelHud1);
        *flags &= 0xFFDF;
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804fe14.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fe30.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fe50.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fe9c.s");

void sub_804FEE8(void)
{
    GameData* base;
    SpriteTextCleanup* hud;
    base = _gameData;
    hud = &base->levelHud0;
    if (base->levelHudStatus != 0) {
        sub_8061228(hud);
        sub_8061228(&base->levelHud1);
        sub_8050584(&base->levelHudMotion0);
        sub_8050584(&base->levelHudMotion1);
        base->levelHudStatus = 0;
    }
    sub_8061204(hud);
    sub_8061204(&base->levelHud1);
    sub_8061204(&base->levelHud2);
    sub_8061204(&base->levelHud3);
}
