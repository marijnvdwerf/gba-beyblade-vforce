#ifndef _RIDERPHYSICS_H
#define _RIDERPHYSICS_H

#include "common.h"

void nullsub_5(RiderBase*);
void s_rider_804C4B4(RiderBase*, Actor*);
void sub_804E1FC(RiderBase*, u8);
void sub_804C870(RiderBase*, s32);
void RiderAI_804C8F0(RiderBase*);
void sub_804C888(RiderBase*, unk8);
void sub_804CB08(RiderBase*, Actor*);
void SetRiderFlag(RiderBase*, unk32);
void UnsetRiderFlag(RiderBase*, unk32);
void sub_804CEF4(RiderBase*, unk32);
void sub_804D104(RiderBase*);
void sub_804E090(RiderBase*);
void sub_804E124(RiderBase*, GeometryLine*);
void sub_804E154(RiderBase*, unk32, unk32);
s16 sub_804E358(unk8, unk8);
void sub_804D110(RiderBase*, Actor*);
void convert3DCoordsto2DCoords(Actor*, unk32*);
unk8 RiderHasFlag(RiderBase*, unk32);
unk8 sub_804E440(RiderBase*, unk32);
unk8 sub_804E454(RiderBase*, unk32);
void sub_804E1DC(RiderBase*);
s32 sub_804E224(s32, s32, unk8, s32);
s32 sub_804E258(s32, s32, s32, unk8, unk32, s32);
void sub_804DAA0(RiderBase*, RiderBase*);
unk32 rider_vs_rider_collision_804DB94(RiderBase*, RiderBase*);

void sub_804D710(RiderBase*);
void sub_804D754(RiderBase*);
void sub_804D8D8(RiderBase*);
void sub_804DDF8(RiderBase*, Actor*);
void sub_804DFF4(RiderBase*);

#endif
