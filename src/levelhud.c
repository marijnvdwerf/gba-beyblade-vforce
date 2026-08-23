#include "gamestate.h"
#include "include_asm.h"
#include "motion.h"
#include "ram.h"
#include "spritetext.h"

typedef struct LevelHudFullData {
    SpriteTextCleanup text0;
    SpriteTextCleanup text1;
    unk8 pad60[0x60];
    UnkMotion motion0;
    UnkMotion motion1;
    unk32 status;
    unk8 padF4[0x16];
    unk16 state;
    unk16 pad10C;
    unk16 flags;
} LevelHudFullData;

typedef struct LevelDescriptionHud {
    unk8 pad0[0x68];
    unk32 text68[5];
    unk32 text7C[5];
    unk8 pad90[4];
    unk32 text94[5];
    unk32 textA8[5];
} LevelDescriptionHud;

typedef struct LevelHudObject {
    unk8 pad0[8];
    unk32 unk8;
    unk32 unkC;
    unk8 pad10[4];
    unk8 data14[4];
    unk16 unk18;
} LevelHudObject;

typedef struct LevelHudSetupState {
    unk8 pad0[0x1040];
    unk32 unk1040;
    LevelHudObject* unk1044;
    LevelHudObject* unk1048;
    unk8 pad104C[4];
    LevelHudObject* unk1050;
    unk16 unk1054;
    unk16 unk1056;
    unk16 unk1058;
    unk16 unk105A;
    unk16 unk105C;
    unk16 unk105E;
} LevelHudSetupState;

__asm__(".equ _LanguageTable, 0x0806E6FC");
__asm__(".equ _LanguageTable2, 0x0806E710");
extern const unk32 _LanguageTable[];
extern const unk32 _LanguageTable2[];
extern void newMotionGroup(MotionGroup*, void*, unk32);
extern void sub_8061660(void*, unk32, unk32);
extern unk32 sub_8051780(unk32);
extern unk32 getLanguage(void);
extern void sub_804FD64(void);

void sub_804F878(void)
{
    GameData* state;
    LevelHudFullData* hud;
    unk16* flags;
    void* temp_r4;
    LevelDescriptionHud* description;
    MotionGroup* motion;
    unk32 flagValue;

    state = _gameData;
    hud = (LevelHudFullData*)&state->levelHud0;
    description = (LevelDescriptionHud*)getLevelDescription2();
    sub_804FD64();
    flags = &state->unk105E;
    flagValue = 2;
    asm volatile("" : "+r"(flagValue));
    temp_r4 = (void*)0;
    asm volatile("" : "+r"(temp_r4));
    *flags |= flagValue;
    if (sub_8051780(4) != 0) {
        if (_currentGameState->unk6A4 == 2) {
            sub_8061660(hud, description->text94[getLanguage()], 0xD);
        } else {
            sub_8061660(hud, description->textA8[getLanguage()], 0xD);
        }
    } else {
        sub_8061660(hud, description->text68[getLanguage()], 0xD);
        temp_r4 = &state->levelHud1;
        sub_8061660(temp_r4, description->text7C[getLanguage()], 0xD);
        temp_r4 = &state->levelHudMotion1;
        newMotionGroup((MotionGroup*)temp_r4, &state->levelHud1.unk14, 2);
        sub_8050578((unk32*)temp_r4, 0x5800, 0x100);
        sub_80504E4((MotionGroup*)temp_r4, 0, -0x34, 0, -0xA);
        *flags |= 4;
    }
    motion = (MotionGroup*)&hud->motion0;
    newMotionGroup(motion, &hud->text0.unk14, 2);
    sub_8050578((unk32*)motion, 0x4800, 0x100);
    sub_80504E4(motion, 0, 0x34, 0, 0x14);
    hud->status = 0x80;
    hud->state = 1;
}

void sub_804F9B4(void)
{
    LevelHudSetupState* state;

    state = (LevelHudSetupState*)_gameData;
    state->unk1054 = 0x190;
    state->unk105C = 1;
    state->unk1056 = 0;
    state->unk1058 = 0;
    state->unk1044->unk8 = 0x4A00;
    state->unk1048->unk8 = 0x8A00;
    state->unk1050->unk8 = 0x4200;
    state->unk1044->unkC = -0x2000;
    state->unk1048->unkC = -0x2000;
    state->unk1050->unkC = -0x2000;
    state->unk1044->unk18 = 0;
    state->unk1048->unk18 = 0;
    state->unk1050->unk18 = 0;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804fa40.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fad4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fb6c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fc00.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fcac-getItem.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fd64.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fe14.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fe30.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fe50.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804fe9c.s");

void sub_804FEE8(void)
{
    GameData* base;
    SpriteTextCleanup* hud;
    base = _gameData;
    hud = &base->levelHud0;
    if (base->levelHudStatus != 0) {
        sub_8061228(hud);
        sub_8061228(&base->levelHud1);
        sub_8050584(&base->levelHudMotion0);
        sub_8050584(&base->levelHudMotion1);
        base->levelHudStatus = 0;
    }
    sub_8061204(hud);
    sub_8061204(&base->levelHud1);
    sub_8061204(&base->levelHud2);
    sub_8061204(&base->levelHud3);
}
