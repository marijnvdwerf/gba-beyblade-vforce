#ifndef _SOUND_H
#define _SOUND_H

#include "common.h"

typedef struct SfxTable {
    u8 pad00[4];
    u32 count;
    u8 pad08[4];
    s8* (*data)[];
} SfxTable;

void sub_8062B20(SfxTable* table);

#endif // _SOUND_H