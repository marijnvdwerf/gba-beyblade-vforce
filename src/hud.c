#include "gamestate.h"
#include "include_asm.h"
#include "levelhud.h"
#include "motion.h"
#include "ram.h"
#include "sprite.h"
#include "spritetext.h"
#include "unsorted.h"

extern const unk8 SpriteSheet_82B1A84[];
extern const unk8 LargeFontMeta[];
extern const unk8 SpriteSheet_82B05EC[];
extern const unk8 ShadowFontMeta[];
extern const unk8 SpriteSheet_821CF10[];
extern const unk8 SpriteSheet_821DB5C[];
extern const unk8 SpriteSheet_821DEA8[];
extern const unk8 Str_8727048[];

void sub_804F478(SpriteTextCleanup*);
void sub_804F05C(SpriteTextCleanup*);
void sub_804F2A0(SpriteTextCleanup*);

void LoadHUD(void)
{
    GameData* gameData;

    gameData = _gameData;
    allocFont(&gameData->levelHud.text0, SpriteSheet_82B1A84, LargeFontMeta, 0, -0x10, 0xF0, 2);
    allocFont(&gameData->levelHud.text1, SpriteSheet_82B1A84, LargeFontMeta, 0, 0xA0, 0xF0, 2);
    sub_80611FC(&gameData->levelHud.text0, 4);
    sub_80611FC(&gameData->levelHud.text1, 4);
    sub_80611EC(&gameData->levelHud.text1, 0xE);
    allocFont(
        &gameData->levelHud.levelHud2, SpriteSheet_82B05EC, ShadowFontMeta, 0, -0x20, 0xEE, 0);
    gameData->levelHud.unk1044 = 0;
    gameData->levelHud.unk1048 = 0;
    gameData->levelHud.unk104C = 0;
    gameData->levelHud.unk1050 = 0;
    gameData->levelHud.unk105C = 0;
    gameData->levelHud.unk1054 = 0;
    gameData->levelHud.unk1056 = 0;
    gameData->levelHud.unk1058 = 0;
    gameData->levelHud.status = 0;
    gameData->levelHud.state = 0;
    gameData->unk1060 = allocSprite(0);
    gameData->unk1064 = allocSprite(0);
    gameData->unk1074 = allocSprite(0);
    gameData->unk1068 = 0;
    gameData->unk106C = 0;
    LoadSpriteSheet(gameData->unk1060, SpriteSheet_821CF10, 0x200, -0x2000, 0, 0, 0, 0);
    LoadSpriteSheet(gameData->unk1064, SpriteSheet_821DB5C, 0x4200, -0x2000, 0, 0, 0, 0);
    LoadSpriteSheet(gameData->unk1074, SpriteSheet_821DEA8, 0xCE00, -0x2000, 0, 0, 0, 0);
    allocFont(
        &gameData->levelHud.levelHud3, SpriteSheet_82B05EC, ShadowFontMeta, 0, -0x20, 0x1C, 2);
    gameData->unk107D = sub_80518F0();
    showNumber_2(&gameData->levelHud.levelHud3, gameData->unk107D, 0xF);
    showString(&gameData->levelHud.levelHud3, Str_8727048, 0xF);
    showNumber(&gameData->levelHud.levelHud3, getLevelDescription2()->unk1, 0xF);
    gameData->unk107A = 0;
    gameData->unk1078 = 0;
    gameData->unk1070 = 0;
    gameData->unk107C = 0;
    gameData->unk1080 = -0x4000;
    gameData->levelHud.flags = 0;
}

void sub_804EE2C(void)
{
    GameData* base;

    base = _gameData;
    sub_8061228(&base->levelHud.text0);
    sub_8061228(&base->levelHud.text1);
}

void sub_804EE54(void)
{
    GameData* base;
    LevelHudData* state;
    s32 maxY;
    s32 mode;
    s32 mode2;
    SpriteTextCleanup* text1;

    base = _gameData;
    state = &base->levelHud;
    if (state->status != 0 && --state->status != 0) {
        switch (state->state) {
        case 1:
            if (state->status == 0x20) {
                sub_80504E4(&state->motion0, -0x80, 0, 0x18, 0);
                sub_805052C(&state->motion0, 0, -0x100, 0, 0x100);
                if (sub_8051780(4) == 0) {
                    sub_80504E4(&state->motion1, 0x80, 0, -0x18, 0);
                    sub_805052C(&state->motion1, 0, 0x100, 0, 0x100);
                }
            }
            break;
        case 6: {
            s32 status;

            status = state->status;
            maxY = 0x7C00;
            if (status <= 0x1F) {
                maxY = 0xC800;
            }
            text1 = &state->text1;
            if (status == 0x20) {
                sub_80504E4(&state->motion0, -0x80, 0, 0x18, 0);
                sub_805052C(&state->motion0, 0, -0x100, 0, 0x100);
            }
            sub_8061844(text1, state->text1.x >> 8, (text1->y + ((maxY - text1->y) >> 3)) >> 8);
            break;
        }
        case 2:
            mode = (sub_8057C40() >> 4) & 7;
            if ((mode & 3) == 0) {
                mode2 = mode >> 2;
                mode = 0xF;
                if (mode2 != 0) {
                    mode = 0xD;
                }
                sub_806185C(&state->text0, mode);
            }
        case 3:
        case 4:
            if (state->status == 0x20) {
                sub_80504E4(&state->motion0, 0, 0x30, 0, state->status);
                sub_8050578(&state->motion0, 0, 0x100);
            }
            break;
        case 5:
            mode = (sub_8057C40() >> 4) & 7;
            if ((mode & 3) == 0) {
                mode2 = mode >> 2;
                mode = 0xF;
                if (mode2 != 0) {
                    mode = 0xD;
                }
                sub_806185C(&state->text0, mode);
            }
            if (state->status == 0x20) {
                sub_80504E4(&state->motion0, 0, 0x30, 0, state->status);
                sub_8050578(&state->motion0, 0, 0x100);
            }
            break;
        }
        if ((state->flags & 2) != 0) {
            sub_805041C(&state->motion0);
        }
        if ((state->flags & 4) != 0) {
            sub_805041C(&state->motion1);
        }
    } else {
        sub_804FD64();
    }
    sub_804F478(&state->text0);
    sub_804F05C(&state->text0);
    sub_804F2A0(&state->text0);
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

void sub_804F84C(u8 arg0)
{
    GameData* base;

    base = _gameData;
    if (arg0 != 0)
        base->unk1080 = 0x280;
    else
        base->unk1080 = -0x3000;
}
