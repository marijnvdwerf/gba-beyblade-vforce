#include "include_asm.h"
#include "ram.h"
#include "spritetext.h"

extern const unk32 _806E6FC[];
extern const unk32 _806E710[];
extern void sub_804FD64(void);
extern void sub_804F84C(unk32);
extern void sub_8061660(void*, unk32, unk32);
extern void newMotionGroup(void*, void*, unk32);
extern unk32 getLanguage(void);

INCLUDE_ASM("asm/dump/804a388-tutorial/804f878.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804f9b4.s");

void sub_804FA40(void)
{
    GameData* state;
    const unk32* table;
    SpriteTextCleanup* hud;
    unk32 language;
    UnkMotion* motion;

    state = _gameData;
    hud = &state->levelHud0;
    sub_804FD64();
    state->unk105E |= 2;
    table = _806E6FC;
    language = getLanguage();
    sub_8061660(hud, table[language], 0xD);
    motion = &state->levelHudMotion0;
    newMotionGroup(motion, (unk8*)state + 0xF64, 2);
    sub_8050578((unk32*)motion, 0x4800, 0x100);
    sub_80504E4((MotionGroup*)motion, 0, 0x34, 0, 0x14);
    state->levelHudStatus = 0x80;
    state->unk105A = 2;
}

void sub_804FAD4(void)
{
    GameData* state;
    const unk32* table;
    SpriteTextCleanup* hud;
    unk32 language;
    UnkMotion* motion;

    state = _gameData;
    hud = &state->levelHud0;
    sub_804F84C(0);
    sub_804FD64();
    state->unk105E |= 2;
    table = _806E710;
    language = getLanguage();
    sub_8061660(hud, table[language], 0xB);
    motion = &state->levelHudMotion0;
    newMotionGroup(motion, (unk8*)state + 0xF64, 2);
    sub_8050578((unk32*)motion, 0x4800, 0x100);
    sub_80504E4((MotionGroup*)motion, 0, 0x34, 0, 0x14);
    state->levelHudStatus = 0x5A;
    state->unk105A = 3;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804fb6c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fc00.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fcac-getItem.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fd64.s");
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
