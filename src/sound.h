#ifndef _SOUND_H
#define _SOUND_H

#include "common.h"

typedef struct SfxTable {
    u32 var00;
    u32 count;
    s8* (*var08)[][2];
    s8* (*data)[];
} SfxTable;

void sub_80627F0(void);
void Sound_8062B20(SfxTable* table);
void allocateSoundTables(u32, u32);
void Sound_onTimer1Overflow(void);
void Sound_8062A90(int);
void Sound_8062AA4(int);
void Sound_8062AB8(int);
void Sound_8062AD4(int, u32);
void Sound_8062AF4(int, u32);
s32 Sound_8062BFC(int, int);

#endif // _SOUND_H