#include <agb/memory_map.h>

#include "animevent.h"
#include "bios.h"
#include "include_asm.h"
#include "music.h"
#include "ram.h"
#include "sound.h"
#include "spritetext.h"
extern const unk8 SpriteSheet_86FBC4C[];

#if 0
void gameLoop(void)
{
    SpriteEntry* sprite = NULL;
    unk8* item = NULL;
    unk8* cleanup;
    unk8 fadeStep;
    unk8 fadeDir;
    unk8 vblankPending;
    Actor* object;
    void* target;
    RiderBase* rider;
    void (*transition)(unk32, unk32) = sub_8052978;
    unk32 i;

    cleanup = _gameData->unk15C4;
    fadeStep = 0xF;
    fadeDir = -1;
    nullsub_12(&_gameData->unk434);
    rider = &_gameData->base;
    object = rider->unk0;
    *(vu16*)REG_DISPCNT = 0;
    sub_80539E8(&rider->unk238);
    target = sub_805EEE0(&_gameData->unk434);
    sub_8052140(_unk3000F50, 0x12C);
    if (sub_8051780(2) != 0 && sub_8051780(8) == 0) {
        sprite = allocSprite(0);
        LoadSpriteSheet(sprite, SpriteSheet_86FBC4C, 0x400, 0x8C00, 1, 0, 0, 0);
        if (sub_8051780(0x20) != 0) {
            sprite->unk18.h.hword = 2;
        }
    }
    if (sub_8051780(4) != 0 && _gameData->unk1618 != 0) {
        sub_804FF5C(cleanup);
        sub_804FFD4();
    }
    allocateBeybladeObjectPalettes();
    sub_8056FAC();
    VBlankIntrWait();
    sub_80627F0();
    transition(0, 0);
    sub_805EADC(&_gameData->unk434);
    initProjectileSystem();
    transition(3, 0);
    sub_804ACF0();
    sub_804AF04(getLevelDescription2()->unkBC);
    sub_804F878();
    sub_804F9B4();

    while (_gameData->timers.s.unkC6C != 0) {
        if (*(vu16*)REG_VCOUNT <= 0x9F || vblankPending == 0) {
            VBlankIntrWait();
        }
        vblankPending = 0;
        sub_80627F0();
        sub_804AD74();
        if (_gameData->unk1618 != 0) {
            *(vu16*)REG_VCOUNT;
            item = &_gameData->unk15D4[(1 - isMultiplayer()) * 0x10];
            if (sub_806014C(_gameData->unk15D4, _gameData->unk15C4, 1) == 0 && sub_806008C() != 0) {
                _gameData->unk1618 = vblankPending;
                _gameData->unk1619 = 1;
                sub_8049234(8);
                sub_804924C(0x1D);
                sub_8053E18(1);
            }
            sub_805000C(cleanup, rider);
            if (sub_8050114(item) == 0) {
                sub_80603E8();
            }
        } else if (_gameData->unk1619 != 0 && _gameData->unk161B == 0) {
            _gameData->unk430 = vblankPending;
        }
        sub_805EB00(&_gameData->unk434);
        transition(2, 0);
        sub_805529C();
        renderEnvironmentActors();
        if (object->unkB8 != NULL) {
            sub_80526C8(_gameData, object->unkB8, &_gameData->base.unk2FC);
        }
        for (i = 0; i < _gameData->unk430 + 1; i++) {
            RiderBase* current;

            if (i != 0) {
                current = &_gameData->unk42C[i - 1];
            } else {
                current = &_gameData->base;
            }
            renderRider(current);
            if (current->unk3C8 & 2) {
                current++;
                current--;
            }
        }
        __oam_8756CC0();
        updateKeyState();
        sub_8055340();
        sub_804B4FC(target, item);
        nullsub_1();
        if (_gameData->unk1618 != 0) {
            sub_8050050(cleanup, item);
        }
        if (_gameData->unk658 == NULL) {
            if (RiderHasFlag(rider, 2) == 0) {
                _gameData->unk658 = &_gameData->base.unk238;
                _gameData->unkB53 = 0;
            }
        } else if (rider->unk0->unkC < 0) {
            _gameData->unk658 = NULL;
            sub_804ABFC(0xF);
        }
        if (_gameData->timers.s.unkC6E != 0) {
            if (_gameData->unkB53 == 0) {
                _gameData->timers.s.unkC6E--;
            }
            if (_gameData->timers.s.unkC6E == 0) {
                sub_804EE2C();
                if (sub_8051780(4) == 0 && _gameData->unk161B == 0) {
                    _gameData->unk1640 = 1;
                    sub_8052B24();
                    _gameData->unk1640 = 0;
                }
                if (_gameData->unk161B == 0) {
                    sub_804F9B4();
                    sub_804F878();
                }
            }
        }
        nullsub_3();
        updateEnvirenmentActors();
        if (sub_8051780(2) == 0) {
            sub_804EE54();
            sub_804A51C();
        }
        if ((unk16)(_gameData->timers.s.unkC6C - 1) <= 0x1E && fadeDir == 0) {
            transition(4, 0);
            fadeDir = 1;
        }
        fadeStep += fadeDir;
        if (fadeStep < 0) {
            fadeStep = 0;
            fadeDir = 0;
        }
        if (fadeStep == 0 && (_unk3005DA0 & 8) != 0 && RiderHasFlag(rider, 0x20000) == 0
            && _gameData->unk1618 != 0 && sub_8060040() != 0) {
            sub_8050184(cleanup, 1);
            _gameData->unk161A = 1;
        }
        if ((fadeStep == 0 && (_unk3005DA0 & 8) != 0 && RiderHasFlag(rider, 0x20000) == 0
                && (_gameData->unk1618 == 0 || sub_8060040() != 0))
            || (_gameData->unk1618 != 0 && sub_8060040() == 0 && RiderHasFlag(rider, 0x20000) == 0
                && sub_80501C8(item, 1) != 0)) {
            if (sub_8051780(2) == 0) {
                transition(6, 0);
                sub_804B5C0();
                sub_805AAE0();
                sub_8052B24();
                if (_gameData->unk161B == 0) {
                    sub_805AAD4();
                }
                _gameData->unk161A = 0;
            }
        }
        if (sub_8051780(2) != 0) {
            if (sub_8051780(8) == 0 && ((_unk3000E30[0] >> 3) & 0x3F) == 0) {
                if (sub_8051780(0x20) != 0) {
                    sprite->unk18.h.hword = sprite->unk18.h.hword == 2 ? 3 : 2;
                } else {
                    sprite->unk18.h.hword = sprite->unk18.h.hword == 0;
                }
            }
            if (sub_805AB58() == 0 || (~*(vu16*)REG_KEYINPUT & 9) != 0) {
                sub_8053E18(1);
            }
            if (sub_805AB58() != 0 && fadeStep == 0 && sub_8051780(0x20) == 0
                && (~*(vu16*)REG_KEYINPUT & 0x100) != 0) {
                sub_805295C();
            }
            if (sub_805AB58() != 0 && fadeStep == 0 && sub_8051780(0x20) == 0
                && (~*(vu16*)REG_KEYINPUT & 2) != 0) {
                while ((~*(vu16*)REG_KEYINPUT & 2) != 0) {
                    VBlankIntrWait();
                    sub_80627F0();
                    sprite->unk18.h.hword = 4;
                    __oam_8756CC0();
                }
                if (sub_8051780(0x20) != 0) {
                    sprite->unk18.h.hword = 2;
                } else {
                    sprite->unk18.h.hword = 0;
                }
            }
        }
        if (sub_804E440(rider, 0x20000) != 0 && RiderHasFlag(rider, 0x20000) != 0) {
            if (_gameData->unk1618 != 0) {
                sub_8050184(cleanup, 4);
            }
            if (_gameData->timers.s.unkC6C == -1) {
                sub_8053E18(0);
            }
        }
        if (_gameData->unk1618 != 0 && sub_80501C8(item, 4) != 0
            && _gameData->timers.s.unkC6C == -1) {
            SetRiderFlag(rider, 0x20000);
            sub_8053E18(0);
        }
        if (fadeStep > 0x20) {
            _gameData->timers.s.unkC6C = 0;
        }
        if (_gameData->timers.s.unkC6C > 0) {
            if ((RiderHasFlag(rider, 0x400) == 0 && rider->unkB8 == NULL
                    && RiderHasFlag(rider, 2) == 0)
                || _gameData->unk1618 != 0) {
                SetRiderFlag(rider, 0x400);
            } else if (_gameData->unk161B != 0) {
                SetRiderFlag(rider, 0x400);
            }
        }
        if (_gameData->timers.s.unkC6C > 0 && RiderHasFlag(rider, 0x400) != 0) {
            _gameData->timers.s.unkC6C--;
        }
        if (*(vu16*)REG_VCOUNT <= 0x9F) {
            vblankPending = 1;
        }
        sub_8057930();
    }
    sub_804AF5C();
    sub_804AE8C();
    sub_804AD28();
    transition(1, 0);
    sub_80556F4();
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/8051918-gameLoop.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80520f4.s");

void sub_8052140(Sub8052140Data* arg0, unk32 arg1)
{
    arg0->unk0 = 0xA00;
    arg0->unk4 = 0x800;
    arg0->unk8 = 0;
    arg0->unk14 = 6;
    arg0->unk16 = 6;
    arg0->unk18 = 6;
    arg0->unkE = 0;
    arg0->unk1A = 0;
    arg0->unk24 = 0x81;
    arg0->unk25 = 0;
    arg0->unk26 = 0;
    arg0->unk32 = 0;
    arg0->unk58 = arg1;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8052180.s");

#if 0
void sub_80522D4(Actor* actor, CameraState* camera)
{
    s32 actorPosition[3];
    s32 adjustedPosition[3];
    s32 cameraOffset[3];
    s32 absX;
    s32 absY;
    s32 x;
    s32 y;
    s32 signedX;
    s32 signedY;
    s32 originSource[3];
    s32 origin[3];
    s32* originSourcePtr;
    s32* originPtr;
    s16 i;
    s16 scale;
    CameraDisplayEntry* entry;
    DisplayRecord* record;
    GameData* gameData;
    CameraState* state;

    state = nullsub_12(camera);
    gameData = _gameData;
    originPtr = origin;
    originSourcePtr = originSource;
    memset(originSourcePtr, 0, 0xC);
    originSourcePtr[0] = gameData->base.unk1A0;
    originSourcePtr[1] = gameData->base.unk1A4;
    memcpy(originPtr, originSourcePtr, 0xC);
    sub_8058754(actor, (unk32*)actorPosition);
    adjustedPosition[0] = originPtr[0] - originPtr[1];
    adjustedPosition[1] = (originPtr[0] + originPtr[1]) >> 1;
    cameraOffset[0] = 0x7800 - adjustedPosition[0] * 0x12;
    cameraOffset[1]
        = ((actor->unkA2 + 0x50 - (actor->unk11 >> 1)) << 8) - adjustedPosition[1] * 0x12;
    adjustedPosition[0] = actorPosition[0] - (state->records[0].unk40 + cameraOffset[0]);
    if (_gameData->unkB53 != 0)
        y = state->records[0].unk44 + cameraOffset[1] - 0x8000;
    else
        y = state->records[0].unk44 + cameraOffset[1];
    adjustedPosition[1] = actorPosition[1] - y;
    if (gameData->unkB53 != 0 && adjustedPosition[0] + 0x1FF <= 0x3FE
        && adjustedPosition[1] <= 0x1FF && adjustedPosition[1] > -0x200) {
        _gameData->unkB53 = 0;
        camera->unk224 = NULL;
    }
    absX = adjustedPosition[0];
    if (absX < 0)
        absX = -absX;
    absY = adjustedPosition[1];
    if (absY < 0)
        absY = -absY;
    signedX = adjustedPosition[0];
    x = signedX;
    if (signedX < 0)
        signedX = -signedX;
    signedY = adjustedPosition[1];
    if (signedY < 0)
        signedY = -signedY;
    if (signedX > 0x4800)
        signedX = 0x4800;
    if (signedY > 0x4800)
        signedY = 0x4800;
    if (x < 0)
        signedX = -signedX;
    adjustedPosition[0] = signedX;
    if (adjustedPosition[1] < 0)
        signedY = -signedY;
    adjustedPosition[1] = signedY;
    if ((_gameData->unkB50 & 1) != 0)
        state->records[0].unk14 = adjustedPosition[0] * _gameData->unkB51 >> 9;
    else
        state->records[0].unk14 = 1 & _gameData->unkB50;
    if ((_gameData->unkB50 & 2) != 0)
        state->records[0].unk18 = adjustedPosition[1] * _gameData->unkB52 >> 9;
    else
        state->records[0].unk18 = (_gameData->unkB50 & 2) << 24 >> 24;
    i = 0;
    do {
        entry = &camera->unk220->entries[i];
        record = &camera->records[i];
        if (entry->display != NULL && (void*)record != (void*)state) {
            scale = entry->unk14;
            record->unk14 = state->records[0].unk14 + (state->records[0].unk14 * scale >> 5);
            record->unk18 = state->records[0].unk18 + (state->records[0].unk18 * scale >> 5);
        }
        i++;
    } while (i <= 3);
}

#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/80522d4.s");

void sub_8052514(void)
{
    newPolyTable(&_gameData->unkB88, 0xA0, 0x20);
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8052534.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805253c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052588.s");

#if 0
void sub_80526C8(GameData* gameData, SpriteEntry* sprite, Actor* targetActor)
{
    Actor* current;
    GeometryLine* line;
    GeometryPoint* point0;
    GeometryPoint* point1;
    LevelGeometryAddresses* geometry;
    EnvironmentObject* object;
    SpriteEntry* targetSprite;
    SpriteEntry* lineSprite;
    Actor* mainActor;
    unk32 actorCount;
    void* callbackData;
    unk32 frame;
    unk32 found;
    s32 minX;
    s32 minY;
    s32 minZ;
    s32 x;
    s32 y;
    s32 otherY;

    frame = sprite->var22;
    targetSprite = targetActor->unkB8;
    geometry = &gameData->unk65C;
    mainActor = gameData->base.unk0;
    actorCount = gameData->unkC84;
    current = gameData->unkC7C;
    callbackData = nullsub_12(&gameData->unk434);
    if (actorCount == 0) {
        return;
    }
    sprite->oam_attr_2 &= 0xF3FF;
    targetActor->unk3C = current->unk3C;
    actorCount--;
    do {
        if (current->unkB8 != NULL) {
            object = NULL;
            if (current->unkB4 >= 0) {
                line = &geometry->unkC[current->unkB4];
                point0 = &geometry->unk4[line->point0];
                point1 = &geometry->unk4[line->point1];
                minX = point1->x << 5;
                if (point0->x < point1->x)
                    minX = point0->x << 5;
                minY = point1->y << 5;
                if (point0->y < point1->y)
                    minY = point0->y << 5;
                minZ = point1->z << 5;
                if (point0->z < point1->z)
                    minZ = point0->z << 5;
                object = GetStruct4(current->unkB4);
            } else {
                minX = current->x;
                minY = current->y;
                minZ = current->z;
            }
            lineSprite = NULL;
            if (object != NULL)
                lineSprite = object->sprite;
            x = current->unkB8->x + (sub_80610EC(current->unkB8) << 8);
            y = current->unkB8->y + (sub_8061110(current->unkB8) << 8);
            found = 0;
            if (x >= sprite->x && x < sprite->x + 0x2000 && y >= sprite->y
                && y < sprite->y + 0x2000)
                found = 1;
            if (lineSprite != NULL && found == 0) {
                x = lineSprite->x + (sub_80610EC(lineSprite) << 8);
                otherY = lineSprite->y + (sub_8061110(lineSprite) << 8);
                if (x >= sprite->x && x < sprite->x + 0x2000 && otherY >= sprite->y
                    && otherY < sprite->y + 0x2000)
                    found = 1;
            }
            if (found != 0) {
                if (current->unk3C != callbackData) {
                    sprite->oam_attr_2 &= 0xF3FF;
                    sprite->oam_attr_2 |= current->unkB8->oam_attr_2 & 0x0C00;
                    targetActor->unk3C = current->unk3C;
                }
                if (mainActor->x > minX && mainActor->y <= minY) {
                    frame -= 3;
                } else if ((mainActor->z >> 8) + 4 >= (minZ >> 8)) {
                    frame -= 3;
                } else {
                    frame += 3;
                }
            }
        }
        current++;
        actorCount--;
    } while (actorCount != 0);
    if (sprite->var22 != frame) {
        sub_8061078(sprite, frame);
        if (gameData->base.unk3E8 != 0)
            sub_804E530(&gameData->base.unk3EC, frame + 1);
    }
    if (targetSprite != NULL)
        sub_8061078(targetSprite, frame + 2);
}
#endif

INCLUDE_ASM("asm/dump/804a388-tutorial/80526c8.s");

void sub_805295C(void)
{
    unk32 counter;
    unk32 temp;

    counter = 1;
    do {
        VBlankIntrWait();
        sub_80627F0();
        temp = counter;
        counter -= 1;
    } while (temp != 0);
}

void sub_8052978(unk32 arg0, void (*arg1)(void))
{
    switch (arg0) {
    case 0:
        _unk3000C0C = 0;
        _unk3000C04 = 0x40;
        _unk3000C08 = 0;
        *(vu16*)REG_BLDCNT = 0xFF;
        *(vu16*)(REG_BLDCNT + 4) = 0x10;
        break;
    case 5:
        _unk3000C0C = arg1;
        break;
    case 6:
        break;
    case 2:
        *(vu16*)REG_BLDY = 0;
        _unk3000C04 += _unk3000C08;
        *(vu16*)REG_BLDCNT = 0xE41;
        *(vu16*)(REG_BLDCNT + 2) = 0xE08;
        if (_unk3000C04 < 0) {
            _unk3000C04 = 0;
            _unk3000C08 = 0;
        }
        if (_unk3000C04 > 0x40) {
            _unk3000C04 = 0x40;
            _unk3000C08 = 0;
            if (_unk3000C0C != NULL)
                _unk3000C0C();
            _unk3000C0C = NULL;
        }
        break;
    case 3:
        _unk3000C08 = (unk32)-2;
        sub_805565C();
        break;
    case 4:
        _unk3000C08 = 2;
        sub_8055674();
        break;
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8052a74.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052ab8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052afc-nullsub_43.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052b00-nullsub_44.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052b04-nullsub_45.s");

void sub_8052B08(UnkMenuItem* oldItem, unk32 old, UnkMenuItem* item, unk32 current)
{
    item->text.unk8 |= 8;
    sub_8061684(&item->text, 0x140, 0x120);
}
