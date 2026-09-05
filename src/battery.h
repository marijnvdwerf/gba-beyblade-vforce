#ifndef _BATTERY_H
#define _BATTERY_H

#include "common.h"

typedef struct BackupBlock {
    unk32 magic;
    unk8 unk4;
    unk8 unk5;
    unk8 unk6;
    unk8 unk7;
} BackupBlock;

void initBattery(void);
u32 sub_80574D0(BackupBlock*, u32, s32);
u32 sub_8057568(u16, BackupBlock*, s32);

#endif
