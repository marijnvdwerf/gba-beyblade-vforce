#include "include_asm.h"
#include "ram.h"
#include "sprite.h"

extern void allocFont(void*, const void*, const void*, unk32, unk32, unk32, unk32);
extern void LoadSpriteSheet(void*, const void*, unk32, unk32, unk32, unk32, unk32, unk32);
extern void sub_80611EC(void*, unk8);
extern void sub_80611FC(void*, unk8);
extern unk32 sub_80518F0(void);
extern unk8 showNumber(void*, unk32, unk8);
extern unk8 showNumber_2(void*, unk32, unk8);
extern unk8 showString(void*, const u8*, unk8);
extern LevelDescription* getLevelDescription2(void);

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
    SpriteTextCleanup* temp_r0;
    SpriteTextCleanup* temp_r4;
    GameData* temp_r5;
    SpriteTextCleanup* temp_r6;
    unk8 temp_r1;

    temp_r5 = _gameData;
    temp_r0 = &temp_r5->levelHud0;
    allocFont(temp_r0, SpriteSheet_82B1A84, LargeFontMeta, 0, -0x10, 0xF0, 2);
    temp_r4 = &temp_r5->levelHud1;
    allocFont(temp_r4, SpriteSheet_82B1A84, LargeFontMeta, 0, 0xA0, 0xF0, 2);
    sub_80611FC(temp_r0, 4);
    sub_80611FC(temp_r4, 4);
    sub_80611EC(temp_r4, 0xE);
    allocFont(&temp_r5->levelHud2, SpriteSheet_82B05EC, ShadowFontMeta, 0, -0x20, 0xEE, 0);
    temp_r5->unk1044 = 0;
    temp_r5->unk1048 = 0;
    temp_r5->unk104C = 0;
    temp_r5->unk1050 = 0;
    temp_r5->unk105C = 0;
    temp_r5->unk1054 = 0;
    temp_r5->unk1056 = 0;
    temp_r5->unk1058 = 0;
    temp_r5->levelHudStatus = 0;
    temp_r5->unk105A = 0;
    temp_r5->unk1060 = allocSprite(0);
    temp_r5->unk1064 = allocSprite(0);
    temp_r5->unk1074 = allocSprite(0);
    temp_r5->unk1068 = 0;
    temp_r5->unk106C = 0;
    LoadSpriteSheet(temp_r5->unk1060, SpriteSheet_821CF10, 0x200, -0x2000, 0, 0, 0, 0);
    LoadSpriteSheet(temp_r5->unk1064, SpriteSheet_821DB5C, 0x4200, -0x2000, 0, 0, 0, 0);
    LoadSpriteSheet(temp_r5->unk1074, SpriteSheet_821DEA8, 0xCE00, -0x2000, 0, 0, 0, 0);
    temp_r6 = &temp_r5->levelHud3;
    allocFont(temp_r6, SpriteSheet_82B05EC, ShadowFontMeta, 0, -0x20, 0x1C, 2);
    temp_r1 = sub_80518F0();
    temp_r5->unk107D = temp_r1;
    showNumber_2(temp_r6, temp_r5->unk107D, 0xF);
    showString(temp_r6, Str_8727048, 0xF);
    showNumber(temp_r6, getLevelDescription2()->unk1, 0xF);
    temp_r5->unk107A = 0;
    temp_r5->unk1078 = 0;
    temp_r5->unk1070 = 0;
    temp_r5->unk107C = 0;
    temp_r5->unk1080 = -0x4000;
    temp_r5->unk105E = 0;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804ee2c.s");
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
INCLUDE_ASM("asm/dump/804a388-tutorial/804f84c.s");
