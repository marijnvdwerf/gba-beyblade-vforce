#ifndef _UNSORTED_H
#define _UNSORTED_H

#include "common.h"
#include "debug.h"
#include "iwram.h"
#include "language.h"
#include "ram.h"

void initGame(void);
void InitCurrentGameState(void);
void sub_8055CB8(void);
void sub_80561A0(Actor*, LevelGeometryAddresses*);
void nullsub_11(void);
void sub_8052514(void);
void sub_8049264(void);
void sub_8049458(void);
void VBlankIntrWait(void);
void initGameLoop(void);
void gameLoop(void);
void sub_8053B94(void);
void closeGame(void);
void sub_80512AC(void);
void sub_80600B4(void);
unk32 sub_8051780(unk32);

extern FrontendState _unk3000650;

#endif
