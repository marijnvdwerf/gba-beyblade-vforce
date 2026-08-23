#include "include_asm.h"
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

INCLUDE_ASM("asm/dump/804a388-tutorial/804fa40.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fad4.s");
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
