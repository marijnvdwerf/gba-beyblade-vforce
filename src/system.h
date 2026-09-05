#ifndef _SYSTEM_H
#define _SYSTEM_H

#include "common.h"

void sub_8057944(void);
void InitStuff_SetDispStat(unk16);
void EnableInterrupt(unk16);
void DisableInterrupt(unk16);
void sub_805791C(void);
void nullsub_8(const unk8*);
void nullsub_9(const unk8*, unk16);
void nullsub_10(const unk8*, unk16, const unk8*, unk16);
void sub_8057A1C(unk32);
void loadPalette(void*);
void loadPalette2(void*);
void nullsub_31(void);
void sub_8057B30(unk32*, unk32, unk32);

#endif
