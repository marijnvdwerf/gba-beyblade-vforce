#ifndef _RIDER_H
#define _RIDER_H

#include "common.h"

void nullsub_2(void);
void nullsub_4(void);
void initRider(void*, void*, unk32, unk32, unk32, unk32, unk32);
void processRiderMetadata(void*, LevelGeometryAddresses*, unk32);
void sub_804B4A4(RiderBase*);

typedef struct RiderTemp {
    unk8 unk0[0x3CC];
    unk16 unk3CC;
    unk8 unk3CE[0x56];
    unk16 unk424;
} RiderTemp;

void sub_804C0EC(unk32, u8);

#endif /* _RIDER_H */
