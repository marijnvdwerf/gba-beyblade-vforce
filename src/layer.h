#ifndef _LAYER_H
#define _LAYER_H

#include "common.h"

typedef struct DisplayRecord {
    unk8 pad0[0x14];
    unk32 unk14;
    unk32 unk18;
    unk32 unk1C;
    unk32 unk20;
    unk32 unk24;
    unk8 pad28[0x2C];
    unk32 unk54;
    unk32 unk58;
    unk8 pad5C[8];
    unk16 unk64;
    unk8 pad66[0x22];
} DisplayRecord;

void sub_8058EF4(DisplayRecord*);
void sub_80596AC(void*, unk32, unk32);
vu16* GetBGLayerCntPtr(u8 layer);

#endif /* _LAYER_H */
