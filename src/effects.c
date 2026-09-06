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

#if 0
void sub_8055340(void)
{
    GameData* gameData;
    ProjectileSystem* effect;
    unk8 trigger;
    s32 value;
    s32 blend;

    gameData = _gameData;
    effect = &gameData->projectileSystem;
    sub_804C208(effect);
    if (effect->unk7A != 0) {
        trigger = 0;
        effect->unk7A--;
        if ((effect->unk7A & 0x1F) == 0) {
            effect->unk84++;
            trigger = 1;
        }
        if (trigger != 0) {
            switch (effect->unk84) {
            case 1:
                sub_8055734(5, NULL, &effect->unk88->unk238);
                effect->unk74 = 8;
                sub_8051868();
                sub_804FC00();
                sub_804ABFC(0x14);
                break;
            case 2:
                SetRiderFlag(effect->unk88, 0x2000);
                sub_8055734(6, &effect->unk88->unk238, NULL);
                break;
            case 3: {
                RiderBase* rider;

                rider = effect->unk88;
                effect->unk74 = 8;
                switch (sub_8051868()) {
                case 0:
                    sub_804CEF4(rider, 0);
                    break;
                case 1:
                    sub_804CEF4(rider, 2);
                    break;
                case 2:
                    sub_804CEF4(rider, 1);
                    break;
                case 3:
                    sub_804CEF4(rider, 4);
                    break;
                }
                sub_804ABFC(1);
                break;
            }
            case 4:
                sub_80558D0();
                break;
            case 5:
                UnsetRiderFlag(effect->unk88, 0x2000);
                break;
            default:
                sub_804F84C(1);
                break;
            }
        }
    }
    if (((_unk3000E30[0] >> 4) & 3) == 0) {
        if (effect->unk74 != 0) {
            Palette* palette;

            palette = &effect->palette34;
            if ((effect->unk74 & 1) != 0) {
                value = 0;
            } else {
                value = 7;
            }
            sub_80631EC(palette, PLTT, value);
            effect->unk74--;
        } else if (effect->unk76 != 0) {
            effect->unk76 += effect->unk78;
            if (effect->unk76 > 7) {
                effect->unk76 = 7;
                effect->unk78 = 0;
                effect->unk80 |= 1;
            }
            sub_80631EC(&effect->palette5C, PLTT, effect->unk76);
        } else if (effect->unk70 != 0) {
            effect->unk70--;
            sub_80631EC(&effect->palette34, PLTT, effect->unk70);
            effect->unk72 = effect->unk76;
        } else if (effect->unk72 != 0) {
            effect->unk72--;
            sub_80631EC(&effect->palette48, PLTT, effect->unk72);
        }
        *(vu16*)PLTT = 0;
    }
    if (effect->unk7C_4 != 0) {
        effect->unk7C_4 += (effect->unk7E - effect->unk7C_4) >> 3;
        *(vu16*)REG_MOSAIC = 0;
        *(vu16*)(REG_MOSAIC + 2) = 0xFFFF;
        *(vu16*)REG_WIN0H = 0xF0;
        *(vu16*)REG_WIN1H = 0xF0;
        blend = effect->unk7C_4;
        *(vu16*)REG_WIN0V = blend;
        blend = 0xA0 - (effect->unk7C_4);
        *(vu16*)REG_WIN1V = (blend << 8) | 0xA0;
        *(vu16*)REG_DISPCNT |= 0x6000;
        if ((effect->unk7C_4) == 0) {
            effect->unk7C_4 = 0;
            *(vu16*)REG_DISPCNT &= 0x9FFF;
        }
    }
}
#endif
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

extern const ProjectileTemplate _8078a08[];
extern const ProjectileTemplate _8078a98[];
extern const ProjectileTemplate _8078b28[];
extern const ProjectileTemplate _8078bb8[];
extern const ProjectileTemplate _8078c48[];
extern const ProjectileTemplate _8078cd8[];
extern const ProjectileTemplate _8078d68[];
extern const ProjectileTemplate _8078df8[];

void sub_8055734(unk32 arg0, Actor* arg1, Actor* arg2)
{
    GameData* gameData;
    ProjectileSystem* effect;
    Actor* base;
    const ProjectileTemplate* resource;

    gameData = _gameData;
    effect = &gameData->projectileSystem;
    base = gameData->base.unk0;
    resource = _8078a08;
    switch (arg0) {
    case 0:
        resource = _8078a08;
        break;
    case 1:
        resource = _8078a98;
        break;
    case 2:
        resource = _8078b28;
        break;
    case 3:
        resource = _8078bb8;
        break;
    case 5:
        resource = _8078cd8;
        break;
    case 6:
        resource = _8078d68;
        break;
    case 7:
        resource = _8078df8;
        break;
    case 4:
    case 8:
        resource = _8078c48;
        break;
    }
    if (arg1 != NULL) {
        sub_804C3D4(effect, arg1->x, arg1->y, arg1->z, resource);
    } else {
        sub_804C3D4(effect, base->x, base->y, base->z, resource);
    }
    if (arg2 == NULL) {
        if (arg1 != NULL) {
            sub_804C34C(effect, arg1->x, arg1->y, arg1->z);
        } else {
            sub_804C34C(effect, base->x, base->y, base->z);
        }
    } else {
        sub_804C34C(effect, arg2->x, arg2->y, arg2->z);
    }
    sub_804C354(effect, 0, 0, 0);
}

INCLUDE_ASM("asm/dump/804a388-tutorial/805582c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805589c.s");

void sub_80558B8(void)
{
    ProjectileSystem* effect;

    effect = &_gameData->projectileSystem;
    effect->unk28 = 6;
}

void sub_80558D0(void)
{
    ProjectileSystem* effect;

    effect = &_gameData->projectileSystem;
    effect->unk28 = 0x20;
}

void sub_80558E8(unk32 arg0)
{
    GameData* gameData;

    gameData = _gameData;
    switch (arg0) {
    case 0:
        gameData->projectileSystem.unk72 = 8;
        break;
    case 1:
        gameData->projectileSystem.unk70 = 8;
        break;
    }
}

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
