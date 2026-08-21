#include "include_asm.h"
#include "ram.h"

extern void sub_8061228(SpriteTextCleanup*);
extern void sub_8061204(SpriteTextCleanup*);

INCLUDE_ASM("asm/dump/804a388-tutorial/804f878.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804f9b4.s");
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
    unk32* status;

    base = _gameData;
    hud = &base->levelHud0;
    status = &base->levelHudStatus;
    if (*status != 0) {
        sub_8061228(hud);
        sub_8061228(&base->levelHud1);
        sub_8050584(&base->levelHudMotion0);
        sub_8050584(&base->levelHudMotion1);
        *status = 0;
    }
    sub_8061204(hud);
    sub_8061204(&base->levelHud1);
    sub_8061204(&base->levelHud2);
    sub_8061204(&base->levelHud3);
}
