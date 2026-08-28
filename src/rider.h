#ifndef _RIDER_H
#define _RIDER_H

#include "common.h"

void nullsub_2(void);
void nullsub_4(void);
void initRider(void*, void*, unk32, unk32, unk32, unk32, unk32);
void processRiderMetadata(RiderBase*, LevelGeometryAddresses*, unk32);
void sub_804B4A4(RiderBase*);
void sub_804C098(RiderBase*);

void sub_804C0EC(RiderTemp*, unk8);

#endif
