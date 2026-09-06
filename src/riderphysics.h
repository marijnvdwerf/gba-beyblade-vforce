#ifndef _RIDERPHYSICS_H
#define _RIDERPHYSICS_H

#include "common.h"

void sub_804E1FC(RiderBase*, u8);
void sub_804C870(RiderBase*, s32);
void sub_804C888(RiderBase*, unk8);
void sub_804CB08(RiderBase*, Actor*);
void SetRiderFlag(RiderBase*, unk32);
void UnsetRiderFlag(RiderBase*, unk32);
void sub_804CEF4(RiderBase*, unk32);
void sub_804D104(RiderBase*);
void sub_804E154(RiderBase*, unk32, unk32);
void initGameloop2(void);
s16 sub_804E358(unk8, unk8);
void sub_804D110(RiderBase*, Actor*);
void convert3DCoordsto2DCoords(Actor*, unk32*);
unk8 RiderHasFlag(RiderBase*, unk32);
unk32 sub_804E440(RiderBase*, unk32);
void sub_804DAA0(RiderBase*, RiderBase*);
unk32 rider_vs_rider_collision_804DB94(RiderBase*, RiderBase*);

#endif
