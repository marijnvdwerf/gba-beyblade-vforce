#ifndef _SOUND_H
#define _SOUND_H

#include "common.h"

typedef struct SoundStructE SoundStructE;

typedef struct SfxTable {
    u32 var00;
    u32 count;
    unk8* (*var08)[][2];
    unk8* (*data)[];
} SfxTable;

void sub_80627F0(void);
void Sound_8062B20(SfxTable* table);
unk32 Sound_8062990(SoundStructE* (*)[], s16 (*)[]);
void allocateSoundTables(u32, u32);
void Sound_onTimer1Overflow(void);
void Sound_8062A90(unk32);
void Sound_8062AA4(unk32);
void Sound_8062AB8(unk32);
void Sound_8062AD4(unk32, u32);
void Sound_8062AF4(unk32, u32);
unk32 Sound_8062BFC(unk32, unk32);

#endif // _SOUND_H
