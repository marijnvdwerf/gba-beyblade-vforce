#ifndef _RIDER_H
#define _RIDER_H

#include "common.h"
#include "hud.h"
#include "packet.h"
#include "ram.h"

void nullsub_2(void);
void nullsub_4(void);
void initRider(void*, void*, unk32, unk32, unk32, unk32, unk32);
void processRiderMetadata(RiderBase*, LevelGeometryAddresses*, unk32);
void sub_804B4A4(RiderBase*);
void allocFXSprite(RiderBase*);
struct GameData;
unk32 sub_804B7FC(struct GameData*);
void sub_804B754(void);
void sub_804C098(RiderBase*);
void sub_804C0C0(RiderBase*);
void sub_804C118(RiderBase*);
unk8 sub_804DA48(RiderBase*, RiderBase*, s32);
void sub_804FE14(void);
void sub_804FE30(void);
void sub_805568C(void);

void sub_80501F8(RiderState*, RiderBase*);
void sub_804C0EC(RiderBase*, unk8);
void sub_804B4FC(LevelGeometryAddresses*, RiderState*);
void sub_804B5C0(void);
void sub_804B8F0(RiderBase*, LevelGeometryAddresses*);
void renderRider(RiderBase*);
void nullsub_1(void);
void nullsub_3(void);

#endif
