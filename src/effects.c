#include "effects.h"

#include "include_asm.h"
#include "projectile.h"
#include "ram.h"

#if 0
void sub_805529C(void)
{
    s32 angle;
    unk32 i;
    unk32 offset;
    unk8* layer;
    GameData* gameData;
    ProjectileSystem* effect;

    gameData = _gameData;
    effect = &gameData->projectileSystem;
    if (effect->unk28 != 0) {
        angle = _unk3000E30[0] >> 4;
        angle = (angle << 29) >> 23;
        angle = *(const unk16*)((const unk8*)Unk_874CC3C + angle);
        angle = (angle << 16) >> 23;
        effect->unk2C = angle;
        effect->unk30 = -angle;
        offset = 0x434;
        i = 2;
        do {
            layer = (unk8*)gameData + offset;
            *GetBGLayerHOffsetPtr(layer[0x5E]) = (*(s32*)(layer + 0x40) >> 8) + angle;
            *GetBGLayerVOffsetPtr(layer[0x5E]) = (*(s32*)(layer + 0x44) >> 8) - angle;
            offset += 0x88;
            i--;
        } while (i >= 0);
        effect->unk28--;
    } else {
        effect->unk2C = 0;
        effect->unk30 = 0;
    }
}
#else
INCLUDE_ASM("asm/dump/804a388-tutorial/805529c.s");
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/8055340.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80555f4.s");

void sub_8055624(void)
{
    _gameData->projectileSystem.unk7E = 0;
    _gameData->projectileSystem.unk78 = 0xFFFF;
    _gameData->projectileSystem.unk80 &= ~1;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/805565c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055674.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805568c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80556c4.s");

unk32 sub_80556DC(unk32 arg0)
{
    return _gameData->projectileSystem.unk80 & arg0;
}

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
