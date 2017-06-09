#ifndef _UNSORTED_H
#define _UNSORTED_H

#include "common.h"
#include "ram.h"

int printf(const char* format, ...);

void sub_8057944(void);
void InitStuff_SetDispStat(u16);
void EnableInterrupt(u16);
void sub_805791C(void);
void initBattery(void);
void sub_8063A50(void);
void sub_8063A68(int, int);
void sub_8063A7C(int);
void initMultiPlayer(int, int, int);
void allocateActorHeaps(void);
void SpriteVRamFree(int, int);
void initGame(void);
void InitCurrentGameState(void);
void sub_8055CB8(void);
void nullsub_11(void);
void sub_8052514(void);
void sub_8049264(void);
void sub_8049458(void);
void VBlankIntrWait(void);
void sub_80627F0(void);
void updateKeyState(void);
void initGameLoop(void);
void gameLoop(void);
void sub_8053B94(void);
void closeGame(void);
void sub_80512AC(void);
int sub_8051780(int);

void allocateRenderCode(RenderData*, int);

void sub_805AC28(int, int, int, u16);

#endif // _UNSORTED_H
