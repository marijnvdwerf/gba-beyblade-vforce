#include "results.h"

#include <agb/types.h>

#include "beyblade.h"
#include "frontend.h"
#include "gameinit.h"
#include "gamestate.h"
#include "include_asm.h"
#include "keystate.h"
#include "menu.h"
#include "menuobject.h"
#include "multiplayer.h"
#include "music.h"
#include "packet.h"
#include "ram.h"
#include "rider.h"
#include "riderstate.h"
#include "sprite.h"
#include "spritetext.h"
#include "unsorted.h"

extern const unk8* _806E724[];
extern const MenuItemDescriptor _806E7B0[];
extern const MenuItemDescriptor _806E810[];
extern const MenuItemDescriptor _806E870[];
extern const InputSequence _8078954[];
extern const InputSequence _8078968[];
extern const InputSequence _807897c[];
extern const u16 _807894c[];
extern const unk8 SpriteSheet_82B1A84[];
extern const unk8 LargeFontMeta[];
extern const unk8 SpriteSheet_82B05EC[];
extern const unk8 ShadowFontMeta[];
extern void (*__oam_8756CC0)(void);

#if 0

struct ResultsLocals {
    SpriteTextCleanup font;
    FrontendResource record0;
    FrontendResource record1;
    FrontendResource record2;
};

typedef struct ResultsGameDataScratch {
    unk8 pad0[0x870];
    SpriteTextCleanup unk870; /* 0x870 */
    unk16 unk8A0; /* 0x8A0 */
} ResultsGameDataScratch;

extern ResultsGameDataScratch* _gameDataResultsScratch;

void sub_8052B24(void)
{
    struct ResultsLocals locals;
    MenuState menuData;
    MenuState* menu;
    MenuState* state;
    UnkMenuItem* item;
    unk32 mode;
    SpriteEntry* sprite0;
    SpriteEntry* sprite1;
    LevelDescription* description;
    unk32 done;
    unk32 sequence;
    unk32 sequenceTimer;
    unk32 animationOffset;
    unk32 target;
    s32 fade;
    unk32 fadeStep;
    Packet* packet;
    Packet* riderPacket;
    s32 i;
    unk32 offset;
    unk32 value;
    unk32 count;
    unk32 delta;
    u8 language;
    u8 packetSelection;
    u16 selection;
    u16 keys;
    const unk8* const* table;
    unk32 tableLanguage;
    MenuStateCallback callback;

    getLevelDescription2();
    sprite0 = NULL;
    sprite1 = NULL;
    done = 0;
    sequence = 0;
    sequenceTimer = 0;
    animationOffset = 0;
    target = 0;
    fade = 0;
    fadeStep = 1;
    packet = &_gameData->unk15C4;
    sub_8057158(&locals.record0, _8078954);
    sub_8057158(&locals.record1, _8078968);
    sub_8057158(&locals.record2, _807897c);

    if (sub_8051780(4) != 0 && _gameData->unk1618 != 0) {
        if (sub_8060040() != 0)
            mode = 1;
        else
            mode = 2;
    } else {
        mode = 0;
    }

    sub_8061228(&_gameData->unk8A8);
    sub_8061228(&_gameDataResultsScratch->unk870);
    _gameDataResultsScratch->unk8A0 = 0;
    allocFont(&locals.font, SpriteSheet_82B1A84, LargeFontMeta, -0xF0, 0, 0xF0, 2);
    if (_gameData->unk1640 != 0) {
        table = &_806E724[0x1E];
        tableLanguage = getLanguage();
        sub_8061660(&locals.font, table[tableLanguage], 0xE);
    } else {
        table = &_806E724[0x19];
        tableLanguage = getLanguage();
        sub_8061660(&locals.font, table[tableLanguage], 0xE);
    }

    language = getLanguage();
    callback = sub_8052B08;
    menu = &menuData;
    sub_805AD24(menu, (unk32)SpriteSheet_82B05EC, (unk32)ShadowFontMeta, -0xC8, 0, 0xF0, 0xA, 0xD,
        0xF, 0xA, 0xA, callback, NULL, language);
    state = menu;
    if (mode == 2) {
        allocateMenuItems(state, _806E870, 0);
    } else if (_gameData->unk1640 != 0) {
        allocateMenuItems(state, _806E810, 0);
    } else {
        allocateMenuItems(state, _806E7B0, 0);
    }
    updateKeyState();

    if (mode != 2) {
        sprite0 = allocSprite(0);
        sprite1 = allocSprite(0);
        LoadSpriteSheet(sprite0, SpriteSheet_82B1A84, 0xFFFED400, 0x3C00, 0, 0, 1, 0x62);
        LoadSpriteSheet(sprite1, SpriteSheet_82B1A84, 0xFFFF3800, 0x3C00, 0, 0, 0, 0x62);
    }
    if (_gameData->unk1640 == 0) {
        sub_804AF9C();
        sub_804B044();
    }

    while (done == 0 || state->items->text.x != target) {
        VBlankIntrWait();
        sub_80627F0();

        if (_gameData->unk1618 != 0) {
            riderPacket = &_gameData->unk15D4[1 - isMultiplayer()];
            packetSelection = sub_806014C(&_gameData->unk15D4[0], packet, 1);
            sub_805000C(packet, &_gameData->base);
            if (sub_8050114(riderPacket) == 0)
                sub_80603E8();
            if (packetSelection == 0 && sub_806008C() != 0) {
                _gameData->unk1618 = packetSelection;
                _gameData->unk1619 = 1;
                sub_8049234(8);
                sub_804924C(0x1D);
                sub_8053E18(1);
                done = 1;
                target = 0xFFFF3800;
                fadeStep = -8;
                sub_804AF5C();
                sub_804AE8C();
            }
            if (sub_80501C8(riderPacket, 6) != 0) {
                if (_gameData->unk161A != 0) {
                    sub_80501A8(riderPacket, 2);
                } else {
                    done = 1;
                    target = 0xFFFF3800;
                    fadeStep = -8;
                    if ((riderPacket->rider.unkD_0 & 4) != 0) {
                        sub_804AF5C();
                        sub_804AE8C();
                        sub_8053E18(1);
                    }
                    sub_8050184(riderPacket, 2);
                    sub_80501A8(riderPacket, 5);
                }
            }
        }

        if (mode == 2)
            _unk3005DA0 = 0;
        else
            updateKeyState();

        fade += fadeStep;
        if (fade < 0)
            fade = 0;
        if (fade >> 3 > 0xF) {
            fade = 0x78;
            fadeStep = 0;
        }

        if (sequenceTimer != 0) {
            sequenceTimer = (u8)(sequenceTimer - 1);
            keys = _unk3005DA0;
            if (keys != 0) {
                if (keys == _807894c[sequence]) {
                    sequence = (u8)(sequence + 1);
                    if (sequence == 4 && sub_8051780(4) == 0) {
                        _gameData->unk1641 = 1;
                        sequence = 0;
                        sequenceTimer = 0xC0;
                    }
                } else {
                    sequence = 0;
                    sequenceTimer = 0xC0;
                }
            }
        } else {
            sequence = 0;
            sequenceTimer = 0xC0;
        }

        if (sub_8051780(4) == 0) {
            sub_8057164(&locals.record0);
            if (sub_80571D0(&locals.record0) != 0) {
                _gameData->unk1638 = 5;
                sub_804F800(_gameData->unk1638);
            }
            sub_8057164(&locals.record1);
            if (sub_80571D0(&locals.record1) != 0) {
                for (i = 0; i < _gameData->unk430; i++)
                    sub_804C0C0(&_gameData->unk42C[i]);
            }
            sub_8057164(&locals.record2);
            if (sub_80571D0(&locals.record2) != 0) {
                description = getLevelDescription2();
                if (description->unk1 != 0) {
                    value = _gameData->collectables.collectedBits[0];
                    count = description->unk1;
                    while (count != 0) {
                        count--;
                        value |= 1 << count;
                    }
                    _gameData->collectables.collectedBits[0] = value;
                }
            }
        }

        if (state->itemCount != 0) {
            count = state->objectCount;
            item = state->items;
            delta = target - item->text.x;
            if (delta != 0) {
                value = sub_80491E0(delta, 0x10);
                for (i = count - 1; i != 0; i--) {
                    sub_8061824(&item->text, value, 0);
                    item++;
                }
            }
            item = state->items;
            sub_8061844(&locals.font, (item->text.x << 8) >> 16, (item->text.y >> 8) - 0x14);
            for (i = count; i != 0; i--) {
                if (item->text.ptr2C != NULL)
                    sub_8061880(&item->text, -0x10, -8);
                item++;
            }
        }

        if (mode != 2) {
            offset = Unk_874CC3C[animationOffset] * 2;
            offset &= 0xFFFFFF00;
            sprite0->x -= offset;
            sprite1->x += offset;
            item = state->items + sub_805B240(state);
            animationOffset = (u8)(animationOffset + 4);
            delta = sub_8061D54(&item->text) - (sprite0->x + 0x1400);
            if (delta != 0)
                sprite0->x += sub_80491E0(delta, 0x1C) << 8;
            delta = sub_8061E44(&item->text) - (sprite0->y + 0x400);
            if (delta != 0)
                sprite0->y += sub_80491E0(delta, 4) << 8;
            delta = sub_8061E08(&item->text) - (sprite1->x - 0x400);
            if (delta != 0)
                sprite1->x += sub_80491E0(delta, 0x1C) << 8;
            delta = sub_8061E44(&item->text) - (sprite1->y + 0x400);
            if (delta != 0)
                sprite1->y += sub_80491E0(delta, 4) << 8;
            offset = Unk_874CC3C[animationOffset] * 2;
            offset &= 0xFFFFFF00;
            sprite0->x += offset;
            sprite1->x -= offset;
        }

        __oam_8756CC0();
        if (done == 0 && state->items->text.x == target) {
            if (_gameData->unk1618 == 0 || (_gameData->unk161A != 0 && sub_8060040() != 0)) {
                selection = sub_805B240(state);
                keys = _unk3005DA0;
                if ((keys & 0x40) != 0)
                    sub_805AFBC(state, 0);
                if ((keys & 0x80) != 0)
                    sub_805AFBC(state, 1);
                if ((keys & 1) != 0) {
                    if ((s16)selection == 0)
                        done = 1;
                    if ((s16)selection == 1) {
                        done = 1;
                        sub_804AF5C();
                        sub_804AE8C();
                        sub_8053E18(1);
                        if (_gameData->unk1618 != 0)
                            sub_8050184(packet, 4);
                    }
                }
                if ((keys & 8) != 0)
                    done = 1;
            }
            if (done != 0) {
                if (_gameData->unk1618 != 0) {
                    sub_8050184(packet, 2);
                    sub_80501A8(packet, 1);
                }
                target = 0xFFFF3800;
                fadeStep = -8;
            }
        }

    }

    if (_gameData->unk1640 == 0) {
        sub_804AFB8();
        sub_804B060();
    }
    if (mode != 2) {
        sub_8060A94(sprite1);
        sub_8060A94(sprite0);
    }
    sub_805AD9C(state);
    sub_8061204(&locals.font);
    VBlankIntrWait();

}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/8052b24.s");
