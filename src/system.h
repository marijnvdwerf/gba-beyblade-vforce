#ifndef _SYSTEM_H
#define _SYSTEM_H

#include "common.h"

void sub_8057944(void);
void InitStuff_SetDispStat(unk16);
void EnableInterrupt(unk16);
void DisableInterrupt(unk16);
void sub_805791C(void);
void nullsub_8(const char*);
void nullsub_9(const char*, s32);
void nullsub_10(const char*, s32, const char*, s32);
void sub_8057A1C(unk32);
void loadPalette(void*);
void loadPalette2(void*);
void nullsub_31(void);
void sub_8057B30(unk32*, unk32, unk32);

#endif
