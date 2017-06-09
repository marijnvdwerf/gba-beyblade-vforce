#ifndef _SOUND_H
#define _SOUND_H

#include "common.h"

typedef struct SfxTable {
    u32 var00;
    u32 count;
    s8* (*var08)[][2];
    s8* (*data)[];
} SfxTable;

void sub_8062B20(SfxTable* table);
void allocateSoundTables(u32, u32);
void sub_8062774(void);

#endif // _SOUND_H