#include "bios.h"
#include "common.h"
#include "io_reg.h"
#include "keystate.h"
#include "sound.h"
#include "unsorted.h"

extern SfxTable dword_8040CC4;

typedef struct UnkStruct3005e40 {
    u8 pad[8];
    u32 tm1cntL;
} UnkStruct3005e40;

extern UnkStruct3005e40 _unk3005E40;

void mainLoop(void)
{
    REG_WAITCNT = 0x4014;
    sub_8057944();
    InitStuff_SetDispStat(0x8);
    EnableInterrupt(0x11);
    sub_805791C();
    initBlockVariables();
    initKeyState();
    initBattery();
    sub_8063A50();
    sub_8063A68(2, 0);
    sub_8063A7C(0);
    initMultiPlayer(2, 16, 3);
    allocateSoundTables(11025, 2);
    sub_8062B20(&dword_8040CC4);
    allocateActorHeaps();
    SpriteVRamFree(128, 32);
    initGame();
    InitCurrentGameState();
    sub_8055CB8();
    nullsub_11();
    allocateRenderCode(&_gameData->varBA0, 0);
    sub_8052514();
    sub_8049264();

    while (true) {
        do {
            SpriteVRamFree(128, 32);
            sub_8049458();
            VBlankIntrWait();
            sub_80627F0();
            updateKeyState();
            SpriteVRamFree(128, 32);
            REG_DISPCNT = 0;

            initGameLoop();
            gameLoop();
            REG_DISPCNT = 0;

            VBlankIntrWait();
            sub_80627F0();
            sub_8053B94();
            closeGame();
        } while (sub_8051780(2));

        sub_80512AC();
    }
}

void onVBlank()
{
    _unk3005E40.tm1cntL = REG_TM1CNT_L;

    ((u16*)0x3007FF8)[0] = 1;
}

void nullsub_37()
{
}
ASM_ZEROPAD

void onTimer1Overflow()
{
    sound_onTimer1Overflow();
}
ASM_ZEROPAD

void sub_80506C0()
{
    sub_805AC28(0, 0, 0, 0);
    Mod(10, 1);
    Div(10, 1);
    CpuSet(NULL, NULL, 0x4000000);
    Sqrt(128);
}
