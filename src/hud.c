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
extern const unk8 SpriteSheet_8224DC4[];
extern const unk8 SpriteSheet_821DFF0[];
extern const unk8 SpriteSheet_8224868[];
extern const unk8 Str_8727048[];

void sub_804F478(SpriteTextCleanup*);
void sub_804F05C(SpriteTextCleanup*);
void sub_804F2A0(SpriteTextCleanup*);
void sub_8061C48(SpriteTextCleanup*, unk32, unk8);

void LoadHUD(void)
{
    GameData* gameData;

    gameData = _gameData;
    allocFont(&gameData->levelHud.text0, SpriteSheet_82B1A84, LargeFontMeta, 0, -0x10, 0xF0, 2);
    allocFont(&gameData->levelHud.text1, SpriteSheet_82B1A84, LargeFontMeta, 0, 0xA0, 0xF0, 2);
    sub_80611FC(&gameData->levelHud.text0, 4);
    sub_80611FC(&gameData->levelHud.text1, 4);
    sub_80611EC(&gameData->levelHud.text1, 0xE);
    allocFont(&gameData->levelHud.text2, SpriteSheet_82B05EC, ShadowFontMeta, 0, -0x20, 0xEE, 0);
    gameData->levelHud.unkF4 = 0;
    gameData->levelHud.unkF8 = 0;
    gameData->levelHud.unkFC = 0;
    gameData->levelHud.unk100 = 0;
    gameData->levelHud.unk10C = 0;
    gameData->levelHud.unk104 = 0;
    gameData->levelHud.unk106 = 0;
    gameData->levelHud.unk108 = 0;
    gameData->levelHud.status = 0;
    gameData->levelHud.state = 0;
    gameData->levelHud.unk110 = allocSprite(0);
    gameData->levelHud.unk114 = allocSprite(0);
    gameData->levelHud.unk124 = allocSprite(0);
    gameData->levelHud.unk118 = 0;
    gameData->levelHud.unk11C = 0;
    LoadSpriteSheet(gameData->levelHud.unk110, SpriteSheet_821CF10, 0x200, -0x2000, 0, 0, 0, 0);
    LoadSpriteSheet(gameData->levelHud.unk114, SpriteSheet_821DB5C, 0x4200, -0x2000, 0, 0, 0, 0);
    LoadSpriteSheet(gameData->levelHud.unk124, SpriteSheet_821DEA8, 0xCE00, -0x2000, 0, 0, 0, 0);
    allocFont(&gameData->levelHud.text3, SpriteSheet_82B05EC, ShadowFontMeta, 0, -0x20, 0x1C, 2);
    gameData->levelHud.unk12D = sub_80518F0();
    showNumber_2(&gameData->levelHud.text3, gameData->levelHud.unk12D, 0xF);
    showString(&gameData->levelHud.text3, Str_8727048, 0xF);
    showNumber(&gameData->levelHud.text3, getLevelDescription2()->unk1, 0xF);
    gameData->levelHud.unk12A = 0;
    gameData->levelHud.unk128 = 0;
    gameData->levelHud.unk120 = 0;
    gameData->levelHud.unk12C = 0;
    gameData->levelHud.unk130 = -0x4000;
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
    unk32 mode2;
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

void sub_804F05C(SpriteTextCleanup* arg0)
{
    LevelHudData* state;
    SpriteEntry* sprite;
    SpriteEntry* sprite110;
    unk16 value;
    s32 temp;
    s32 time;
    s32 y;
    unk8 finalMode;

    state = (LevelHudData*)arg0;
    state->unk128 = state->unk128 + ((state->unk12A - state->unk128) >> 4);
    temp = (state->unk128 * 0x29) >> 0x10;
    if (temp == 0) {
        if (state->unk118 != NULL) {
            sub_8060A94(state->unk118);
            state->unk118 = NULL;
        }
        if (state->unk11C != NULL) {
            sub_8060A94(state->unk11C);
            state->unk11C = NULL;
        }
    } else {
        if (state->unk118 == NULL) {
            state->unk118 = allocSprite(0);
            if (state->unk118 != NULL) {
                LoadSpriteSheet(state->unk118, SpriteSheet_821DFF0, 0x200, 0x200, 0, 0, 0, 0);
            }
        }
        if (state->unk11C == NULL) {
            if (temp > 0x19) {
                state->unk11C = allocSprite(0);
                if (state->unk11C != NULL) {
                    LoadSpriteSheet(state->unk11C, SpriteSheet_8224868, 0x4200, 0x200, 0, 0, 0, 0);
                }
            }
        }
        if (temp <= 0x19) {
            if (state->unk11C != NULL) {
                sub_8060A94(state->unk11C);
                state->unk11C = NULL;
            }
        }
        sprite = state->unk118;
        if (sprite != NULL) {
            sprite->frame.word = temp <= 0x1A ? temp - 1 : 0x19;
        }
        if (state->unk11C != NULL) {
            state->unk11C->frame.word = temp - 0x1A;
        }
    }
    value = state->unk12A;
    if (value > 0xBD00) {
        SpriteEntry* top110;
        SpriteEntry* top114;
        unk16 topMode;

        top110 = state->unk110;
        top114 = state->unk114;
        topMode = 0;
        if (((_unk3000E30[0] >> 4) & 3) <= 1) {
            topMode = 1;
        }
        top114->frame.word = topMode;
        top110->frame.word = topMode;
    } else if (value <= 0x2FFF) {
        SpriteEntry* low110;
        SpriteEntry* low114;
        unk16 lowMode;

        low110 = state->unk110;
        low114 = state->unk114;
        lowMode = (((_unk3000E30[0] >> 4) & 3) <= 1) ? 2 : 0;
        low114->frame.word = lowMode;
        low110->frame.word = lowMode;
    } else {
        state->unk110->frame.word = 0;
        state->unk114->frame.word = 0;
    }
    sprite110 = state->unk110;
    y = sprite110->y;
    y += (state->unk130 - y) >> 3;
    state->unk114->y = y;
    sprite110->y = y;
    if (state->unk118 != NULL) {
        state->unk118->y = y;
    }
    if (state->unk11C != NULL) {
        state->unk11C->y = y;
    }
    {
        SpriteTextCleanup* text2;

        text2 = &state->text2;
        temp = y >> 8;
        sub_8061844(text2, 0xA, (s16)(temp + 0x14));
    }
    if (sub_8051780(4) == 0) {
        sub_8061844(&state->text3, 0xD0, (s16)(temp + 4));
        state->unk124->y = y;
    }
    time = _gameData->base.unk234 << 4;
    if (time < sub_8051734()->unk4) {
        if (((sub_8057C40() >> 4) & 7) <= 3) {
            finalMode = 0xE;
        } else {
            finalMode = 0xF;
        }
    } else {
        finalMode = 0xF;
    }
    sub_8061C48(&state->text2, time, finalMode);
}

void sub_804F2A0(SpriteTextCleanup* arg0)
{
    LevelHudData* state;
    SpriteEntry* sprite;
    unk32 mode;

    state = (LevelHudData*)arg0;
    if (state->unk12C == 0) {
        if (state->unk120 != NULL) {
            sub_8060A94(state->unk120);
            state->unk120 = NULL;
        }
    } else {
        if (state->unk120 == NULL) {
            state->unk120 = allocSprite(0);
            if (state->unk120 != NULL) {
                LoadSpriteSheet(state->unk120, SpriteSheet_8224DC4, 0xD00, 0, 0, 0, 0, 0);
            }
        }
    }
    if (state->unk120 != NULL) {
        if ((state->flags & 1) != 0) {
            sprite = state->unk120;
            if (((_unk3000E30[0] >> 4) & 3) <= 1) {
                mode = state->unk12C - 1;
            } else {
                mode = 5;
            }
            sprite->frame.word = mode;
        } else {
            state->unk120->frame.word = state->unk12C - 1;
        }
        if (state->unk118 != NULL) {
            state->unk120->y = state->unk110->y + 0x400;
        }
    }
}

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
    base->levelHud.unk12C = arg0;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804f824.s");

void sub_804F84C(u8 arg0)
{
    GameData* base;

    base = _gameData;
    if (arg0 != 0)
        base->levelHud.unk130 = 0x280;
    else
        base->levelHud.unk130 = -0x3000;
}
