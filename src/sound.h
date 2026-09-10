#ifndef _SOUND_H
#define _SOUND_H

#include "common.h"

typedef struct SoundStructE SoundStructE;

typedef struct {
    u8 var00;
    unk8 unk1;
    unk8 pad2[2];
    unk32 var04;
} SoundStructG;

typedef struct {
    SoundStructE* var00;
    SoundStructG var04[4];
} SoundStructF;

extern SoundStructF (*_unk3005E28)[16];
extern unk8* _unk3005E00;
extern s32 _unk3005E08;
extern unk32 _unk3005E10;

typedef struct SfxTable {
    u32 var00;
    u32 count;
    unk8* (*var08)[][2];
    SoundStructE* (*data)[];
} SfxTable;

extern unk8* _unk3005E20;

void sub_80627F0(void);
void Sound_8062694(void);
void Sound_80626E0(void);
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

#endif
