#include "effects.h"

#include "include_asm.h"
#include "projectile.h"
#include "ram.h"
#include "rider.h"

#if 0
void sub_805529C(void)
{
    s32 angle;
    s32 i;
    ProjectileSystem* effect;
    EffectLayer* layer;

    effect = &_gameData->projectileSystem;
    if (effect->unk28 != 0) {
        angle = _unk3000E30[0] >> 4;
        angle = (angle << 29) >> 23;
        angle = Unk_874CC3C[angle];
        angle = (angle << 16) >> 23;
        _gameData->projectileSystem.unk2C = angle;
        _gameData->projectileSystem.unk30 = -angle;
        layer = _gameData->unk434;
        i = 2;
        do {
            *GetBGLayerHOffsetPtr(layer->layerIndex) = (layer->x >> 8) + angle;
            *GetBGLayerVOffsetPtr(layer->layerIndex) = (layer->y >> 8) - angle;
            layer++;
            i--;
        } while (i >= 0);
        _gameData->projectileSystem.unk28--;
    } else {
        _gameData->projectileSystem.unk2C = 0;
        _gameData->projectileSystem.unk30 = 0;
    }
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/805529c.s");

INCLUDE_ASM("asm/dump/804a388-tutorial/8055340.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80555f4.s");

void sub_8055624(void)
{
    _gameData->projectileSystem.unk7E = 0;
    _gameData->projectileSystem.unk78 = 0xFFFF;
    _gameData->projectileSystem.unk80 &= ~1;
}

void sub_805565C(void)
{
    _gameData->projectileSystem.unk7E = 0;
}
void sub_8055674(void)
{
    _gameData->projectileSystem.unk7E = 0x560;
}

void sub_805568C(void)
{
    GameData* gameData;

    gameData = _gameData;
    gameData->projectileSystem.unk84 = 0;
    gameData->projectileSystem.unk7A = 0xA1;
    gameData->projectileSystem.unk88 = sub_804B7FC(gameData);
}

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
