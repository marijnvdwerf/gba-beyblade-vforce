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
void sub_8063A7C(unk32);
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
void updateKeyState(void);
void initGameLoop(void);
void gameLoop(void);
void sub_8053B94(void);
void closeGame(void);
void sub_80512AC(void);
unk32 sub_8051780(unk32);

void allocateRenderCode(RenderData*, int);

extern Unk3000650 _unk3000650;
extern unk32 _unk3000C10[2];
extern unk32 _unk3000E30[3];
extern unk32 _unk3000C00;
extern unk32 _unk3005E98;

void sub_805AC28(int, int, int, u16);

#endif // _UNSORTED_H
