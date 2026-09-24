#include <agb/memory_map.h>

#include <string.h>

#include "actor.h"
#include "animevent.h"
#include "beyblade.h"
#include "bios.h"
#include "camera.h"
#include "collectable.h"
#include "collision.h"
#include "effects.h"
#include "envactor.h"
#include "frontend.h"
#include "gameinit.h"
#include "gamestate.h"
#include "hud.h"
#include "include_asm.h"
#include "iwram.h"
#include "keystate.h"
#include "levelhud.h"
#include "math.h"
#include "multiplayer.h"
#include "music.h"
#include "packet.h"
#include "palette.h"
#include "particle.h"
#include "projectile.h"
#include "ram.h"
#include "results.h"
#include "rider.h"
#include "riderphysics.h"
#include "riderstate.h"
#include "sound.h"
#include "sprite.h"
#include "spritetext.h"
#include "tutorial.h"
#include "unsorted.h"

extern Sub8052140Data _unk3000F50;
void sub_8052978(unk32, void (*)(void));
void sub_8052140(Sub8052140Data*, unk32);
void sub_805FA68(PolyTable*);
void sub_80526C8(GameData*, SpriteEntry*, Actor*);
void sub_805295C(void);

extern const SpriteSheet SpriteSheet_86FBC4C;

void gameLoop(void)
{
    SpriteEntry* sprite = NULL;
    Packet* item = NULL;
    Packet* cleanup;
    s8 fadeStep;
    s8 fadeDir;
    s8 vblankPending;
    Actor* object;
    LevelGeometryAddresses* target;
    RiderBase* rider;
    void (*transition)(unk32, void (*)(void)) = sub_8052978;
    s32 i;

    cleanup = &_gameData->unk15C4;
    fadeStep = 0xF;
    fadeDir = -1;
    nullsub_12(&_gameData->unk434);
    rider = &_gameData->base;
    object = rider->unk0;
    *(vu16*)REG_DISPCNT = 0;
    sub_80539E8(&rider->unk238);
    target = sub_805EEE0(&_gameData->unk434);
    sub_8052140(&_unk3000F50, 0x12C);
    if (sub_8051780(2) != 0 && sub_8051780(8) == 0) {
        sprite = allocSprite(0);
        LoadSpriteSheet(sprite, &SpriteSheet_86FBC4C, 0x400, 0x8C00, 1, 0, 0, 0);
        if (sub_8051780(0x20) != 0) {
            sprite->frame = 2;
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

    while (_gameData->unkC6C != 0) {
        if (*(vu16*)REG_VCOUNT <= 0x9F || vblankPending == 0) {
            VBlankIntrWait();
        }
        vblankPending = 0;
        sub_80627F0();
        sub_804AD74();
        if (_gameData->unk1618 != 0) {
            *(vu16*)REG_VCOUNT;
            item = &_gameData->unk15D4[1 - isMultiplayer()];
            if (sub_806014C(&_gameData->unk15D4[0], &_gameData->unk15C4, 1) == 0 && sub_806008C() != 0) {
                _gameData->unk1618 = vblankPending;
                _gameData->unk1619 = 1;
                sub_8049234(STATE_8);
                sub_804924C(STATE_29);
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
        if (_gameData->unk434.unk224 == NULL) {
            if (RiderHasFlag(rider, 2) == 0) {
                _gameData->unk434.unk224 = &_gameData->base.unk238;
                _gameData->unkB53 = 0;
            }
        } else if (rider->unk0->z < 0) {
            _gameData->unk434.unk224 = NULL;
            sub_804ABFC(0xF);
        }
        if (_gameData->unkC6E != 0) {
            if (_gameData->unkB53 == 0) {
                _gameData->unkC6E--;
            }
            if (_gameData->unkC6E == 0) {
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
        if ((unk16)(_gameData->unkC6C - 1) <= 0x1E && fadeDir == 0) {
            transition(4, 0);
            fadeDir = 1;
        }
        fadeStep += fadeDir;
        if (fadeStep < 0) {
            fadeStep = 0;
            fadeDir = 0;
        }
        if (fadeStep == 0 && (_unk3005DA0 & 8) != 0 && RiderHasFlag(rider, 0x20000) == 0 && _gameData->unk1618 != 0 && sub_8060040() != 0) {
            sub_8050184(cleanup, 1);
            _gameData->unk161A = 1;
        }
        if ((fadeStep == 0 && (_unk3005DA0 & 8) != 0 && RiderHasFlag(rider, 0x20000) == 0 && (_gameData->unk1618 == 0 || sub_8060040() != 0)) || (_gameData->unk1618 != 0 && sub_8060040() == 0 && RiderHasFlag(rider, 0x20000) == 0 && sub_80501C8(item, 1) != 0)) {
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
                    sprite->frame = sprite->frame == 2 ? 3 : 2;
                } else {
                    sprite->frame = sprite->frame == 0;
                }
            }
            if (sub_805AB58() == 0 || (~*(vu16*)REG_KEYINPUT & 9) != 0) {
                sub_8053E18(1);
            }
            if (sub_805AB58() != 0 && fadeStep == 0 && sub_8051780(0x20) == 0 && ((unk16) ~*(vu16*)REG_KEYINPUT & 0x100) != 0) {
                sub_805295C();
            }
            if (sub_805AB58() != 0 && fadeStep == 0 && sub_8051780(0x20) == 0 && ((unk16) ~*(vu16*)REG_KEYINPUT & 2) != 0) {
                while (((unk16) ~*(vu16*)REG_KEYINPUT & 2) != 0) {
                    VBlankIntrWait();
                    sub_80627F0();
                    sprite->frame = 4;
                    __oam_8756CC0();
                }
                if (sub_8051780(0x20) != 0) {
                    sprite->frame = 2;
                } else {
                    sprite->frame = 0;
                }
            }
        }
        if (sub_804E440(rider, 0x20000) != 0 && RiderHasFlag(rider, 0x20000) != 0) {
            if (_gameData->unk1618 != 0) {
                sub_8050184(cleanup, 4);
            }
            if (_gameData->unkC6C == -1) {
                sub_8053E18(0);
            }
        }
        if (_gameData->unk1618 != 0 && sub_80501C8(item, 4) != 0 && _gameData->unkC6C == -1) {
            SetRiderFlag(rider, 0x20000);
            sub_8053E18(0);
        }
        if (fadeStep > 0x20) {
            _gameData->unkC6C = 0;
        }
        if (_gameData->unkC6C > 0) {
            if ((RiderHasFlag(rider, 0x400) == 0 && rider->unkB8 == NULL && RiderHasFlag(rider, 2) == 0) || _gameData->unk1618 != 0) {
                SetRiderFlag(rider, 0x400);
            } else if (_gameData->unk161B != 0) {
                SetRiderFlag(rider, 0x400);
            }
        }
        if (_gameData->unkC6C > 0 && RiderHasFlag(rider, 0x400) != 0) {
            _gameData->unkC6C--;
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

typedef struct ActorEffectState ActorEffectState;

struct ActorEffectState {
    unk8 pad0[0x18];
    unk32 unk18; /* 0x18 */
    unk8 pad1C[0x24];
    unk16 unk40; /* 0x40 */
};

typedef struct ActorEffectCallbacks {
    unk8 pad0[0x34];
    void (*unk34)(ActorEffectState*, unk32, Sub8052140Data*, unk32); /* 0x34 */
    unk8 pad38[0x40];
    void (*unk78)(ActorEffectState*, Sub8052140Data*, unk32); /* 0x78 */
} ActorEffectCallbacks;

void sub_8052180(ActorEffectState*, Sub8052140Data*, unk32);

void sub_80520F4(ActorEffectState* arg0, ActorEffectCallbacks* arg1, PolyTable* arg2, Sub8052140Data* arg3)
{
    arg3->unk1A = arg0->unk40;
    sub_805FA68(arg2);
    sub_8052180(arg0, arg3, 0);
    arg1->unk34(arg0, 0, arg3, arg0->unk18);
    arg1->unk78(arg0, arg3, 1);
}

void sub_8052140(Sub8052140Data* arg0, unk32 arg1)
{
    arg0->unk0 = 0xA00;
    arg0->unk4 = 0x800;
    arg0->unk8 = 0;
    arg0->unk14 = 6;
    arg0->unk16 = 6;
    arg0->unk18 = 6;
    arg0->unkC.parts.unkE = 0;
    arg0->unk1A = 0;
    arg0->unk24 = 0x81;
    arg0->unk25 = 0;
    arg0->unk26 = 0;
    arg0->unk32 = 0;
    arg0->unk58 = arg1;
}

// TODO: fakematch?
void sub_8052180(ActorEffectState* arg0, Sub8052140Data* arg1, unk32 arg2)
{
    s32 tmp0[4];
    s32 tmp1[4];
    s32 tmp2[4];
    s32 q0[4];
    s32 q1[4];
    s32 q2[4];
    const s16* table;
    unk32 phase;
    unk32 angle;
    unk32 index0;
    unk32 index2;
    unk32 index1;
    unk32 index;
    s32 sin0;
    s32 cos0;
    s32 sin1;
    s32 cos1;
    s32 sin2;
    s32 cos2;
    s32 sin3;
    s32 cos3;

    angle = ~((_gameData->base.unk10 >> 4) + 0x40) & 0xFF;
    table = SinTable;
    phase = _gameData->base.unk16C;
    index = phase - 1;
    index0 = ((angle - index) & 0xFF) >> 1;
    sin0 = table[index0];
    index0 += 0x40;
    cos0 = table[index0];
    index2 = (_gameData->base.unk174 & 0xFF) >> 1;
    sin2 = table[index2];
    index2 += 0x40;
    cos2 = table[index2];
    index1 = ~(_gameData->base.unk6C >> 4) & 0xFF;
    index1 >>= 1;
    sin1 = table[index1];
    index1 += 0x40;
    cos1 = table[index1];
    phase &= 0xFF;
    phase >>= 1;
    sin3 = table[phase];
    phase += 0x40;
    cos3 = table[phase];
    index = (unk8)~angle + 0x40;
    arg1->unk24 = table[index] * 0x7F >> 8;
    arg1->unk26 = table[(unk8)~angle] * 0x7F >> 8;
    q0[0] = 0;
    q0[1] = sin0;
    q0[2] = 0;
    q0[3] = cos0;
    q1[0] = 0;
    q1[1] = 0;
    q1[2] = -sin1;
    q1[3] = cos1;
    q2[0] = 0;
    q2[1] = 0;
    q2[2] = sin2;
    q2[3] = cos2;
    {
        s32 q3[4] = { 0, sin3, 0, cos3 };
        multiplyQuaternions(q1, q0, tmp0);
        multiplyQuaternions(tmp0, q2, tmp1);
        multiplyQuaternions(tmp1, q3, tmp2);
        convertQuaternionToMatrix(tmp2, arg1->unk34);
    }
}

void sub_80522D4(Actor* actor, CameraState* camera)
{
    s32 actorPosition[3];
    s32 delta[3];
    s32 offset[3];
    s32 distance[3];
    s32 origin[3];
    s32 source[3];
    void* originPtr;
    s32* cursor;
    CameraState* state;
    GameData* gameData;
    s32 x;
    s32 y;
    s16 scale;
    s16 i;
    BGLayer* record;

    state = nullsub_12(camera);
    gameData = _gameData;
    originPtr = origin;
    memset(source, 0, 0xC);
    cursor = source;
    *cursor++ = gameData->base.unk1A0;
    *cursor = gameData->base.unk1A4;
    memcpy(originPtr, source, 0xC);
    sub_8058754(actor, actorPosition);
    delta[0] = origin[0] - origin[1];
    delta[1] = (origin[0] + origin[1]) >> 1;
    offset[0] = 0x7800 - delta[0] * 0x12;
    offset[1] = ((actor->unkA2 + (0x50 - (actor->unk11 >> 1))) << 8) - delta[1] * 0x12;
    delta[0] = actorPosition[0] - (state->records[0].field_40 + offset[0]);
    if (_gameData->unkB53 != 0) {
        s32 top;

        top = state->records[0].field_44 + offset[1] - 0x8000;
        delta[1] = actorPosition[1] - top;
    } else {
        delta[1] = actorPosition[1] - (state->records[0].field_44 + offset[1]);
    }
    if (_gameData->unkB53 != 0 && (unk32)(delta[0] + 0x1FF) <= 0x3FE && delta[1] <= 0x1FF && delta[1] > -0x200) {
        _gameData->unkB53 = 0;
        camera->unk224 = NULL;
    }
    if (delta[0] < 0) {
        distance[0] = -delta[0];
    } else {
        distance[0] = delta[0];
    }
    if (delta[1] < 0) {
        distance[1] = -delta[1];
    } else {
        distance[1] = delta[1];
    }
    x = delta[0] < 0 ? -delta[0] : delta[0];
    y = delta[1] < 0 ? -delta[1] : delta[1];
    if (x > 0x4800) {
        x = 0x4800;
    }
    if (y > 0x4800) {
        y = 0x4800;
    }
    if (delta[0] < 0) {
        x = -x;
    }
    delta[0] = x;
    if (delta[1] < 0) {
        y = -y;
    }
    delta[1] = y;
    if (_gameData->unkB50 & 1) {
        state->records[0].field_14 = delta[0] * _gameData->unkB51 >> 9;
    } else {
        state->records[0].field_14 = 0;
    }
    if (_gameData->unkB50 & 2) {
        state->records[0].field_18 = delta[1] * _gameData->unkB52 >> 9;
    } else {
        state->records[0].field_18 = 0;
    }
    for (i = 0; i <= 3; i++) {
        if (camera->unk220->layers[i].unk0 != NULL) {
            scale = camera->unk220->layers[i].unk14;
            record = &camera->records[i];
            if (record != &state->records[0]) {
                record->field_14 = state->records[0].field_14 + (state->records[0].field_14 * scale >> 5);
                record->field_18 = state->records[0].field_18 + (state->records[0].field_18 * scale >> 5);
            }
        }
    }
}

void sub_8052514(void)
{
    newPolyTable(&_gameData->unkB88, 0xA0, 0x20);
}

void sub_8052534(Sub8052140Data* arg0)
{
    arg0->unkC.word = 0xA000;
}

void sub_805253C(void)
{
    _gameData->tileState.unk0 = 0;
    _gameData->tileState.unk4 = 0;
    _gameData->tileState.unk8 = 0;
    _gameData->tileState.unkC = 0;
    __fastMemoryClearARM(0, (void*)(VRAM + 0x12000), 0x800);
}

void sub_8052588(Sub8052140Data* arg0, SpriteEntry* sprite, BGLayer* layer, RiderBase* rider, s32 rows)
{
    s32 x;
    s32 y;
    s32 dx;
    s32 dy;
    s32 fxX;
    s32 fxY;
    s32 clearCount;
    s32 newRows;
    unk32 index;
    RiderTileState* tileState;

    x = (sprite->x + layer->field_C) >> 11;
    y = (sprite->y + layer->field_10) >> 11;
    dx = x - (layer->field_C >> 11);
    dy = y - (layer->field_10 >> 11);
    index = rider->unk1C0;
    tileState = &_gameData->tileState;
    fxX = (dx << 11) - (layer->field_C & 0x700);
    fxY = (dy << 11) - (layer->field_10 & 0x700);
    rows = (rows + 8 + ((sprite->y - fxY) >> 8)) >> 3;
    arg0->unk8 = fxX;
    arg0->unkC.word = fxY;
    if (x != tileState->unk0 || y != tileState->unk4) {
        clearCount = tileState->unkC - rows;
        tileState->unk0 = x;
        tileState->unk4 = y;
        tileState->unkC = rows;
        sub_805EF18(&_gameData->unk434, x, y, 8, rows, index - 1, (RiderTile*)(VRAM + 0x12000));
        if (clearCount > 0) {
            __fastMemoryClearARM(0, (void*)(VRAM + 0x12000 + (rows << 8)), clearCount << 8);
        }
    } else {
        if (rows > tileState->unkC) {
            newRows = rows - tileState->unkC;
            sub_805EF18(&_gameData->unk434, x, tileState->unkC + y, 8, newRows, index - 1, (RiderTile*)(VRAM + 0x12000 + (tileState->unkC << 8)));
            tileState->unkC = rows;
        } else if (rows < tileState->unkC) {
            __fastMemoryClearARM(0, (void*)(VRAM + 0x12000 + (rows << 8)), (tileState->unkC - rows) << 8);
        }
    }
}

void sub_80526C8(GameData* gameData, SpriteEntry* sprite, Actor* targetActor)
{
    s32 actorCount;
    s32 left;
    s32 top;
    s32 minX;
    s32 minY;
    s32 minZ;
    Actor* mainActor;
    SpriteEntry* targetSprite;
    LevelGeometryAddresses* geometry;
    CameraState* camera;
    Actor* current;
    GeometryLine* line;
    GeometryPoint* point0;
    GeometryPoint* point1;
    EnvironmentObject* object;
    SpriteEntry* lineSprite;
    s32 frame;
    SpriteEntry* currentSprite;
    s32 lineIndex;
    unk32 found;
    unk32 overlap;
    s32 x;
    s32 y;
    s32 otherLeft;
    s32 otherTop;
    s32 otherX;
    s32 otherY;
    unk32 otherFound;

    actorCount = _gameData->environmentActors.actorCount;
    frame = sprite->var22;
    current = _gameData->environmentActors.actorContainer;
    mainActor = gameData->base.unk0;
    targetSprite = targetActor->unkB8;
    geometry = &_gameData->unk434.geometry;
    camera = nullsub_12(&_gameData->unk434);
    if (actorCount == 0) {
        return;
    }
    sprite->oam_attr_2 &= 0xF3FF;
    targetActor->unk3C = current->unk3C;
    actorCount--;
    do {
        if (current->unkB8 == NULL) {
            current++;
            continue;
        }
        currentSprite = current->unkB8;
        lineIndex = current->unkB4.lineIndex;
        line = lineIndex >= 0 ? &geometry->unkC[lineIndex] : NULL;
        if (line != NULL) {
            point0 = &geometry->unk4[line->point0];
            point1 = &geometry->unk4[line->point1];
            minX = point0->x < point1->x ? point0->x << 5 : point1->x << 5;
            minY = point0->y < point1->y ? point0->y << 5 : point1->y << 5;
            minZ = point0->z < point1->z ? point0->z << 5 : point1->z << 5;
            object = GetStruct4(lineIndex);
        } else {
            minX = current->x;
            minY = current->y;
            minZ = current->z;
            object = NULL;
        }
        left = currentSprite->x;
        top = currentSprite->y;
        x = currentSprite->x + (sub_80610EC(currentSprite) << 8);
        y = currentSprite->y + (sub_8061110(currentSprite) << 8);
        lineSprite = NULL;
        if (object != NULL && object->sprite != NULL) {
            lineSprite = object->sprite;
        }
        overlap = 0;
        if (x >= sprite->x && left < sprite->x + 0x2000 && y >= sprite->y && top < sprite->y + 0x2000) {
            overlap = 1;
        }
        found = overlap;
        if (lineSprite != NULL && found == 0) {
            otherLeft = lineSprite->x;
            otherTop = lineSprite->y;
            otherX = lineSprite->x + (sub_80610EC(lineSprite) << 8);
            otherY = lineSprite->y + (sub_8061110(lineSprite) << 8);
            otherFound = 0;
            if (otherX >= sprite->x && otherLeft < sprite->x + 0x2000 && otherY >= sprite->y && otherTop < sprite->y + 0x2000) {
                otherFound = 1;
            }
            found = otherFound;
        }
        if (found != 0) {
            if (current->unk3C != &camera->records[0]) {
                sprite->oam_attr_2 &= 0xF3FF;
                sprite->oam_attr_2 |= currentSprite->oam_attr_2 & 0x0C00;
                targetActor->unk3C = current->unk3C;
            }
            if ((mainActor->x > minX && mainActor->y > minY) || (mainActor->z >> 8) + 4 >= (minZ >> 8)) {
                if (frame >= currentSprite->var22) {
                    frame = currentSprite->var22 - 3;
                }
                if (lineSprite != NULL && frame >= lineSprite->var22) {
                    frame = lineSprite->var22 - 3;
                }
            } else {
                if (frame <= currentSprite->var22) {
                    frame = currentSprite->var22 + 3;
                }
                if (lineSprite != NULL && frame <= lineSprite->var22) {
                    frame = lineSprite->var22 + 3;
                }
            }
        }
        current++;
    } while (actorCount-- != 0);
    if (sprite->var22 != frame) {
        sub_8061078(sprite, frame);
        if (gameData->base.unk3E8 != 0) {
            sub_804E530(&gameData->base.unk3EC, frame + 1);
        }
        if (targetSprite != NULL) {
            sub_8061078(targetSprite, frame + 2);
        }
    }
}

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
        *(vu16*)REG_BLDY = 0x10;
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
        *(vu16*)REG_BLDALPHA = 0xE08;
        if (_unk3000C04 < 0) {
            _unk3000C04 = 0;
            _unk3000C08 = 0;
        }
        if (_unk3000C04 > 0x40) {
            _unk3000C04 = 0x40;
            _unk3000C08 = 0;
            if (_unk3000C0C != NULL) {
                _unk3000C0C();
            }
            _unk3000C0C = NULL;
        }
        break;
    case 3:
        _unk3000C08 = -2;
        sub_805565C();
        break;
    case 4:
        _unk3000C08 = 2;
        sub_8055674();
        break;
    }
}

void sub_8052A74(void)
{
    unk32* ptr;
    s32 count;

    ptr = (unk32*)(CPU_WRAM_END - 0x60);
    count = 0;
    printf("Trace Interrupt Stack\n");
    while (count <= 0xF) {
        if (*ptr != 0) {
            count = 0;
        } else {
            count++;
        }
        ptr--;
    }
    printf("intr stack start %x end %x\n\n", (unk32*)(CPU_WRAM_END - 0x60), ptr + 0x10);
}

void sub_8052AB8(void)
{
    unk32* ptr;
    s32 count;

    ptr = (unk32*)(CPU_WRAM_END - 0x140);
    count = 0;
    printf("Trace User Stack\n");
    while (count <= 0xF) {
        if (*ptr != 0) {
            count = 0;
        } else {
            count++;
        }
        ptr--;
    }
    printf("user stack start %x end %x\n\n", (unk32*)(CPU_WRAM_END - 0x140), ptr + 0x10);
}

void nullsub_43(void)
{
}

void nullsub_44(void)
{
}

void nullsub_45(void)
{
}

void sub_8052B08(UnkMenuItem* oldItem, s32 old, UnkMenuItem* item, s32 current)
{
    item->text.unk8 |= 8;
    sub_8061684(&item->text, 0x140, 0x120);
}
