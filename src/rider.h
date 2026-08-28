#ifndef _RIDER_H
#define _RIDER_H

#include "common.h"
#include "hud.h"
#include "ram.h"

void nullsub_2(void);
void nullsub_4(void);
void initRider(void*, void*, unk32, unk32, unk32, unk32, unk32);
void processRiderMetadata(RiderBase*, LevelGeometryAddresses*, unk32);
void sub_804B4A4(RiderBase*);
void sub_804B754(void);
void sub_804C098(RiderBase*);
unk32 sub_804DA48(unk8*, unk8*, unk32);
void sub_804FE14(void);
void sub_804FE30(void);
void sub_805568C(void);

void sub_80501F8(RiderState*, RiderBase*);
void sub_804C0EC(RiderTemp*, unk8);

#endif
