#include "effects.h"

#include <agb/bios.h>
#include <agb/memory_map.h>

#include "gamestate.h"
#include "include_asm.h"
#include "levelhud.h"
#include "music.h"
#include "projectile.h"
#include "ram.h"
#include "rider.h"
#include "riderphysics.h"
#include "unsorted.h"

extern const unk8 Str_8729780[];

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

void sub_8055340(void)
{
    ProjectileSystem* effect;
    unk8 trigger;

    effect = &_gameData->projectileSystem;
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
                sub_804FC00(sub_8051868());
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
            sub_80631EC(&effect->palette34, (unk8*)PLTT, (effect->unk74 & 1) ? 0 : 7);
            effect->unk74--;
        } else if (effect->unk76 != 0) {
            effect->unk76 += effect->unk78;
            if (effect->unk76 > 7) {
                effect->unk76 = 7;
                effect->unk78 = 0;
                effect->unk80 |= 1;
            }
            sub_80631EC(&effect->palette5C, (unk8*)PLTT, effect->unk76);
        } else if (effect->unk70 != 0) {
            effect->unk70--;
            sub_80631EC(&effect->palette34, (unk8*)PLTT, effect->unk70);
            effect->unk72 = 0;
        } else if (effect->unk72 != 0) {
            effect->unk72--;
            sub_80631EC(&effect->palette48, (unk8*)PLTT, effect->unk72);
        }
        *(vu16*)PLTT = 0;
    }
    if (effect->unk7C.word != 0) {
        effect->unk7C.parts.unk7C += (effect->unk7C.parts.unk7E - effect->unk7C.parts.unk7C) >> 3;
        *(vu16*)REG_WININ = 0;
        *(vu16*)(REG_WINOUT) = 0xFFFF;
        *(vu16*)REG_WIN0H = 0xF0;
        *(vu16*)REG_WIN1H = 0xF0;
        *(vu16*)REG_WIN0V = effect->unk7C.parts.unk7C >> 4;
        *(vu16*)REG_WIN1V = ((0xA0 - (effect->unk7C.parts.unk7C >> 4)) << 8) | 0xA0;
        *(vu16*)REG_DISPCNT |= 0x6000;
        if ((effect->unk7C.parts.unk7C >> 4) == 0) {
            effect->unk7C.parts.unk7C = 0;
            *(vu16*)REG_DISPCNT &= 0x9FFF;
        }
    }
}

void sub_80555F4(void)
{
    _gameData->projectileSystem.unk7C.parts.unk7E = 0x180;
    _gameData->projectileSystem.unk76 = 1;
    _gameData->projectileSystem.unk78 = 1;
}

void sub_8055624(void)
{
    _gameData->projectileSystem.unk7C.parts.unk7E = 0;
    _gameData->projectileSystem.unk78 = 0xFFFF;
    _gameData->projectileSystem.unk80 &= ~1;
}

void sub_805565C(void)
{
    _gameData->projectileSystem.unk7C.parts.unk7E = 0;
}

void sub_8055674(void)
{
    _gameData->projectileSystem.unk7C.parts.unk7E = 0x560;
}

void sub_805568C(void)
{
    GameData* gameData;

    gameData = _gameData;
    gameData->projectileSystem.unk84 = 0;
    gameData->projectileSystem.unk7A = 0xA1;
    gameData->projectileSystem.unk88 = sub_804B7FC(gameData);
}

void sub_80556C4(void)
{
    _gameData->projectileSystem.unk7A = 0;
}

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
extern const ProjectileTemplate _8078e88[];

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

void sub_805582C(unk32 unused, Actor* arg1, unk32 arg2, unk32 arg3, unk32 arg4)
{
    GameData* gameData;
    ProjectileSystem* effect;
    Actor* base;
    const ProjectileTemplate* resource;
    unk32 velocityX;
    unk32 velocityY;

    velocityX = arg2;
    velocityY = arg3;
    gameData = _gameData;
    effect = &gameData->projectileSystem;
    resource = _8078e88;
    base = gameData->base.unk0;
    if (arg1 != NULL) {
        sub_804C3D4(effect, arg1->x, arg1->y, arg1->z, resource);
    } else {
        sub_804C3D4(effect, base->x, base->y, base->z, resource);
    }
    sub_804C34C(effect, base->x, base->y, base->z);
    sub_804C354(effect, velocityX, velocityY, arg4);
}

void sub_805589C(void)
{
    sub_804C464(&_gameData->projectileSystem);
}

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

void sub_8055914(EffectSprites* effect, const unk8* sheet0, const unk8* sheet1, unk32 y0, unk32 y1)
{
    effect->unk28 = 0;
    effect->unk2A = 0;
    effect->unk24 = 0;
    effect->unk1C = 0;
    effect->unk18 = -0x4400;
    effect->unk8 = -0x4400;
    effect->unk20 = 0xF400;
    effect->unk10 = 0xF400;
    effect->unkC = y0;
    effect->unk14 = y1;
    effect->unk34 = 0;
    effect->unk2C = 0;
    effect->unk38 = 0;
    effect->unk30 = 0;
    effect->unk0 = allocSprite(0);
    LoadSpriteSheet(effect->unk0, sheet0, -0x4400, y0, 0, 0, 0, 0);
    effect->unk4 = allocSprite(0);
    LoadSpriteSheet(effect->unk4, sheet1, 0xF400, y1, 0, 0, 1, 0);
}

void sub_805599C(EffectSprites* effect)
{
    if ((unk32)(effect->unk8 + 0x4000) > 0x13000) {
        effect->unk28 &= 0xFFFE;
        if (effect->unk2C != NULL) {
            sub_8060A60(effect->unk0);
            LoadSpriteSheet(effect->unk0, effect->unk2C, -0x4400, effect->unkC, 0, 0, 0, 0);
            if (effect->unk30 != NULL) {
                __fastMemoryCopyARM(effect->unk30, (void*)OBJ_PLTT, 0x20);
            }
            effect->unk0->oam_attr_2 &= 0xFFF;
            sub_8055B64(effect, 0);
            effect->unk2C = NULL;
            effect->unk30 = NULL;
        }
    } else {
        effect->unk28 |= 1;
    }
    if ((unk32)(effect->unk10 + 0x4000) > 0x13000) {
        effect->unk2A &= 0xFFFE;
        if (effect->unk34 != NULL) {
            sub_8060A60(effect->unk4);
            LoadSpriteSheet(effect->unk4, effect->unk34, -0x4400, effect->unkC, 0, 0, 1, 0);
            if (effect->unk38 != NULL) {
                __fastMemoryCopyARM(effect->unk38, (void*)(OBJ_PLTT + 0x20), 0x20);
            }
            effect->unk4->oam_attr_2 = (effect->unk4->oam_attr_2 & 0xFFF) | 0x1000;
            sub_8055B64(effect, 1);
            effect->unk34 = NULL;
            effect->unk38 = NULL;
        }
    } else {
        effect->unk2A |= 1;
    }
    effect->unk8 += (effect->unk18 - effect->unk8) >> 2;
    effect->unk10 += (effect->unk20 - effect->unk10) >> 2;
    effect->unk0->x = effect->unk8;
    effect->unk4->x = effect->unk10;
    if ((effect->unk28 & 1) != 0) {
        effect->unk18 += effect->unk1C;
    }
    if ((effect->unk2A & 1) != 0) {
        effect->unk20 += effect->unk24;
    }
    if ((effect->unk28 & 4) != 0) {
        if (((sub_8057C40() >> 4) & 7) == 0) {
            if (effect->unk0->frame.word <= 1) {
                effect->unk0->frame.word++;
            } else {
                effect->unk0->frame.word = 0;
            }
        }
    } else {
        effect->unk0->frame.word = 0;
    }
    if ((effect->unk2A & 4) != 0) {
        if (((sub_8057C40() >> 4) & 7) == 0) {
            if (effect->unk4->frame.word <= 1) {
                effect->unk4->frame.word++;
            } else {
                effect->unk4->frame.word = 0;
            }
        }
    } else {
        effect->unk4->frame.word = 0;
    }
}

void sub_8055B64(EffectSprites* effect, unk8 side)
{
    if (side != 0) {
        effect->unk20 = 0xAE00;
    } else {
        effect->unk18 = 0x1000;
    }
}

void sub_8055B7C(EffectSprites* effect, unk8 side)
{
    if (side != 0) {
        effect->unk20 = 0xF400;
        effect->unk24 = 0;
    } else {
        effect->unk18 = -0x4400;
        effect->unk1C = 0;
    }
}

void sub_8055BA0(EffectSprites* effect, unk8 side, unk32 value)
{
    if (side != 0) {
        effect->unk24 = value;
    } else {
        effect->unk1C = value;
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8055bb0.s");

void sub_8055BC0(EffectSprites* effect, unk8 side, unk8 enabled)
{
    if (side != 0) {
        if (enabled != 0) {
            effect->unk2A |= 4;
        } else {
            effect->unk2A &= ~4;
        }
    } else {
        if (enabled != 0) {
            effect->unk28 |= 4;
        } else {
            effect->unk28 &= ~4;
        }
    }
}

void sub_8055C04(EffectSprites* effect, unk8 side, const unk8* sheet, const unk16* palette)
{
    if (side != 0) {
        effect->unk34 = sheet;
        effect->unk38 = palette;
    } else {
        effect->unk2C = sheet;
        effect->unk30 = palette;
    }
}

unk8 sub_8055C18(EffectSprites* effect, unk8 side)
{
    if (side != 0) {
        return effect->unk2A & 1;
    }
    return effect->unk28 & 1;
}

void sub_8055C30(EffectSprites* arg0)
{
    sub_8060A94(arg0->unk0);
    arg0->unk0 = NULL;
    sub_8060A94(arg0->unk4);
    arg0->unk4 = NULL;
}

void sub_8055C4C(DecompressorState* state)
{
    state->block = NULL;
    state->source = NULL;
    state->data = NULL;
    state->size = 0;
}

unk8* getDecompressorData(DecompressorState* state, unk8* source)
{
    unk8* data;

    data = NULL;
    if (state->block != NULL) {
        deallocateBlock(state->block);
        state->block = NULL;
    }
    state->source = source;
    state->size = *(const unk32*)source >> 8;
    state->block = slowAllocate(state->size);
    if (state->block != NULL) {
        data = state->block->address;
        LZ77UnCompWram(source, data);
    } else {
        printf(Str_8729780, state->size);
    }
    state->data = data;
    return data;
}

void sub_8055CA0(DecompressorState* state)
{
    if (state->block != NULL) {
        deallocateBlock(state->block);
        state->block = NULL;
    }
}
