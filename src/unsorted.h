#ifndef _UNSORTED_H
#define _UNSORTED_H

#include "common.h"
#include "debug.h"
#include "language.h"
#include "ram.h"

typedef void CopyFn(void*, void*, unk32);
typedef void ClearFn(unk32, void*, unk32);
extern CopyFn* __fastMemoryCopyARM;
extern ClearFn* __fastMemoryClearARM;

void initMultiPlayer(unk32, unk32, unk32);
void initGame(void);
void InitCurrentGameState(void);
void sub_8055CB8(void);
void nullsub_11(void);
void sub_8052514(void);
void sub_80522D4(void);
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

void sub_805AC28(unk32, unk32, unk32, unk16);

#endif // _UNSORTED_H
