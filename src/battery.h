#ifndef _BATTERY_H
#define _BATTERY_H

#include "common.h"

typedef struct BackupBlock {
    unk8 data[8];
} BackupBlock;

void initBattery(void);
unk32 sub_80574D0(BackupBlock*, unk32, s32);
unk32 sub_8057568(unk16, BackupBlock*, s32);

#endif /* _BATTERY_H */
