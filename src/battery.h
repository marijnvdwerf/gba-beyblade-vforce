#ifndef _BATTERY_H
#define _BATTERY_H

#include "common.h"

typedef struct BackupBlock {
    unk8 data[8];
} BackupBlock;

void initBattery(void);
u32 sub_80574D0(BackupBlock*, u32, s32);
u32 sub_8057568(u16, BackupBlock*, s32);

#endif
