#include "gamestate.h"
#include "include_asm.h"
#include "ram.h"
#include "sprite.h"
#include "spritetext.h"

extern const unk8 SpriteSheet_82B1A84[];
extern const unk8 LargeFontMeta[];
extern const unk8 SpriteSheet_82B05EC[];
extern const unk8 ShadowFontMeta[];
extern const unk8 SpriteSheet_821CF10[];
extern const unk8 SpriteSheet_821DB5C[];
extern const unk8 SpriteSheet_821DEA8[];
extern const unk8 Str_8727048[];

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

INCLUDE_ASM("asm/dump/804a388-tutorial/804ee54.s");

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

void sub_804F84C(u8 arg0)
{
    GameData* base;

    base = _gameData;
    if (arg0 != 0)
        base->unk1080 = 0x280;
    else
        base->unk1080 = -0x3000;
}
