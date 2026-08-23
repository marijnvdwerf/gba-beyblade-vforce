#include "gamestate.h"
#include "include_asm.h"
#include "ram.h"
#include "sprite.h"
#include "spritetext.h"

extern const u8 SpriteSheet_82B1A84[];
extern const u8 LargeFontMeta[];
extern const u8 SpriteSheet_82B05EC[];
extern const u8 ShadowFontMeta[];
extern const u8 SpriteSheet_821CF10[];
extern const u8 SpriteSheet_821DB5C[];
extern const u8 SpriteSheet_821DEA8[];
extern const u8 Str_8727048[];

void LoadHUD(void)
{
    GameData* gameData;

    gameData = _gameData;
    allocFont(&gameData->levelHud0, SpriteSheet_82B1A84, LargeFontMeta, 0, -0x10, 0xF0, 2);
    allocFont(&gameData->levelHud1, SpriteSheet_82B1A84, LargeFontMeta, 0, 0xA0, 0xF0, 2);
    sub_80611FC(&gameData->levelHud0, 4);
    sub_80611FC(&gameData->levelHud1, 4);
    sub_80611EC(&gameData->levelHud1, 0xE);
    allocFont(&gameData->levelHud2, SpriteSheet_82B05EC, ShadowFontMeta, 0, -0x20, 0xEE, 0);
    gameData->unk1044 = 0;
    gameData->unk1048 = 0;
    gameData->unk104C = 0;
    gameData->unk1050 = 0;
    gameData->unk105C = 0;
    gameData->unk1054 = 0;
    gameData->unk1056 = 0;
    gameData->unk1058 = 0;
    gameData->levelHudStatus = 0;
    gameData->unk105A = 0;
    gameData->unk1060 = allocSprite(0);
    gameData->unk1064 = allocSprite(0);
    gameData->unk1074 = allocSprite(0);
    gameData->unk1068 = 0;
    gameData->unk106C = 0;
    LoadSpriteSheet(gameData->unk1060, SpriteSheet_821CF10, 0x200, -0x2000, 0, 0, 0, 0);
    LoadSpriteSheet(gameData->unk1064, SpriteSheet_821DB5C, 0x4200, -0x2000, 0, 0, 0, 0);
    LoadSpriteSheet(gameData->unk1074, SpriteSheet_821DEA8, 0xCE00, -0x2000, 0, 0, 0, 0);
    allocFont(&gameData->levelHud3, SpriteSheet_82B05EC, ShadowFontMeta, 0, -0x20, 0x1C, 2);
    gameData->unk107D = sub_80518F0();
    showNumber_2(&gameData->levelHud3, gameData->unk107D, 0xF);
    showString(&gameData->levelHud3, Str_8727048, 0xF);
    showNumber(&gameData->levelHud3, getLevelDescription2()->unk1, 0xF);
    gameData->unk107A = 0;
    gameData->unk1078 = 0;
    gameData->unk1070 = 0;
    gameData->unk107C = 0;
    gameData->unk1080 = -0x4000;
    gameData->unk105E = 0;
}

void sub_804EE2C(void)
{
    GameData* base;

    base = _gameData;
    sub_8061228(&base->levelHud0);
    sub_8061228(&base->levelHud1);
}

extern void sub_804FD64(void);
extern void sub_804F478(void*);
extern void sub_804F05C(void*);
extern void sub_804F2A0(void*);
extern void sub_805041C(UnkMotion*);
extern void sub_80504E4(MotionGroup*, s32, s32, s32, s32);
extern void sub_805052C(MotionGroup*, s32, s32, s32, s32);
extern void sub_8050578(unk32*, unk32, s16);
extern unk32 sub_8051780(unk32);
extern unk32 sub_8057C40(void);
extern void sub_8061844(void*, s32, s32);
extern void sub_806185C(void*, s32);

void sub_804EE54(void)
{
    HudGameDataView* base;
    LevelHudData* hud;
    MotionGroup* group;
    LevelHudText* motion;
    unk16 state;
    s32 value;
    s32 target;
    s32 delta;
    s32 random;

    base = (HudGameDataView*)_gameData;
    hud = (LevelHudData*)&base->text0;
    value = base->status;
    if (value == 0) {
        sub_804FD64();
    } else {
        value--;
        base->status = value;
        if (value == 0) {
            sub_804FD64();
        } else {
            state = base->state;
            if ((unk32)(state - 1) <= 5) {
                switch (state) {
                case 1:
                    if (hud->status == 0x20) {
                        group = (MotionGroup*)&hud->motion0;
                        sub_80504E4(group, -0x80, 0, 0x18, 0);
                        sub_805052C(group, 0, -0x100, 0, 0x100);
                        if (sub_8051780(4) == 0) {
                            group = (MotionGroup*)&hud->motion1;
                            sub_80504E4(group, 0x80, 0, -0x18, 0);
                            sub_805052C(group, 0, 0x100, 0, 0x100);
                        }
                    }
                    break;
                case 6:
                    value = hud->status;
                    target = 0x7C00;
                    if (value <= 0x1F) {
                        target = 0xC800;
                    }
                    motion = &hud->text1;
                    if (value == 0x20) {
                        group = (MotionGroup*)&hud->motion0;
                        sub_80504E4(group, -0x80, 0, 0x18, 0);
                        sub_805052C(group, 0, -0x100, 0, 0x100);
                    }
                    delta = motion->y;
                    delta = target - delta;
                    delta = delta + (delta >> 3);
                    sub_8061844(motion, (hud->text1.x << 8) >> 16, (delta << 8) >> 16);
                    break;
                case 2:
                case 3:
                case 4:
                    random = (sub_8057C40() >> 4) & 7;
                    if ((random & 3) == 0) {
                        value = 0xF;
                        if ((random >> 2) != 0) {
                            value = 0xD;
                        }
                        sub_806185C(hud, value);
                    }
                    if (hud->status == 0x20) {
                        group = (MotionGroup*)&hud->motion0;
                        sub_80504E4(group, 0, 0x30, 0, 0x20);
                        sub_8050578((unk32*)group, 0, 0x100);
                    }
                    break;
                case 5:
                    random = (sub_8057C40() >> 4) & 7;
                    if ((random & 3) == 0) {
                        value = 0xF;
                        if ((random >> 2) != 0) {
                            value = 0xD;
                        }
                        sub_806185C(hud, value);
                    }
                    if (hud->status == 0x20) {
                        group = (MotionGroup*)&hud->motion0;
                        sub_80504E4(group, 0, 0x30, 0, 0x20);
                        sub_8050578((unk32*)group, 0, 0x100);
                    }
                    break;
                }
            }
            if ((hud->flags & 2) != 0) {
                sub_805041C((UnkMotion*)&hud->motion0);
            }
            if ((hud->flags & 4) != 0) {
                sub_805041C((UnkMotion*)&hud->motion1);
            }
        }
    }
    sub_804F478(hud);
    sub_804F05C(hud);
    sub_804F2A0(hud);
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804f05c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804f2a0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804f37c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804f478.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804f794.s");

void sub_804F800(s32 arg0)
{
    GameData* base;

    base = _gameData;
    if (arg0 < 0) {
        arg0 = 0;
    }
    if (arg0 > 5) {
        arg0 = 5;
    }
    base->unk107C = arg0;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804f824.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804f84c.s");
