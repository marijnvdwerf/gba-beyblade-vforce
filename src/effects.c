#include "common.h"
#include "include_asm.h"
#include "projectile.h"
#include "ram.h"

INCLUDE_ASM("asm/dump/804a388-tutorial/805529c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055340.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80555f4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055624.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805565c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055674.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805568c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80556c4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80556dc.s");

void sub_80556F4(void)
{
    GameData* gameData;

    gameData = _gameData;
    sub_804C484(&gameData->projectileSystem);
    deallocate_80637CC(&gameData->projectileSystem.palette34);
    deallocate_80637CC(&gameData->projectileSystem.palette48);
    deallocate_80637CC(&gameData->projectileSystem.palette5C);
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8055734.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805582c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805589c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80558b8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80558d0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80558e8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055914.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805599c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055b64.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055b7c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055ba0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055bb0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055bc0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055c04.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055c18.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055c30.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055c4c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055c58-getDecompressorData.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055ca0.s");
