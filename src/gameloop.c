#include "animevent.h"
#include "include_asm.h"
#include "ram.h"

extern const u8 SpriteSheet_86FBC4C[];

/* Layout/type assumptions of this draft that main's headers do not yet have:
 * GameData begins with an embedded `RiderBase base` (RiderBase: `Actor* unk0`,
 * `void* unkB8`, `unk16 unk3C8`); `Actor.unkC` is s32; `GameData.unk658` is a
 * pointer, `unk15C4[0x10]`, `unk15D4[0x44]`, bytes `unk1619`/`unk161A`;
 * `timers` is a 4-byte union of s16/u16 views over unkC6C/unkC6E;
 * `SpriteEntry.unk18` is a 4-byte union (`b.frame/b.unk19/b.unk1A` vs
 * `h.hword/h.unk1A`); `LevelDescription.unkBC` is u8; `isMultiplayer` returns
 * u16 and sub_805AB58/RiderHasFlag/sub_804E440/sub_806014C/sub_806008C/
 * sub_8060040/sub_8050114/sub_80501C8 return u8. agbcc pads unions to 32 bits.
 */
/* gameLoop: structurally complete draft (see docs/learnings/red7-gameloop3.md).
 * Everything up to 0x58a matches; the remaining 52 diff rows are the two
 * REG_KEYINPUT mask tests (0x100 built then copied, mask 2 kept live into the
 * key-wait loop) and the reload scratch-register cascade after them. */
#if 0
void gameLoop(void)
{
    SpriteEntry* sprite = NULL;
    unk8* item = NULL;
    unk8* cleanup;
    s8 fadeStep;
    s8 fadeDir;
    s8 vblankPending;
    Actor* object;
    void* target;
    RiderBase* rider;
    void (*transition)(unk32, unk32) = sub_8052978;
    s32 i;

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
            /* The target keeps a dead `ldrh`/`and` of `unk3C8 & 2` here with no
             * consumer: the body must be a statement pair that only cancels in
             * combine (after the last dead-code sweep), so the branch is dropped
             * as jump-to-next in the final jump pass but the test survives. An
             * empty body, `continue`, or a dead assignment is removed earlier. */
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
        if ((u16)(_gameData->timers.s.unkC6C - 1) <= 0x1E && fadeDir == 0) {
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
INCLUDE_ASM("asm/dump/804a388-tutorial/8052140.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052180.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80522d4.s");

void sub_8052514(void)
{
    newPolyTable(&_gameData->unkB88, 0xA0, 0x20);
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8052534.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805253c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052588.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80526c8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805295c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052978.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052a74.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052ab8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052afc-nullsub_43.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052b00-nullsub_44.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052b04-nullsub_45.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8052b08.s");
