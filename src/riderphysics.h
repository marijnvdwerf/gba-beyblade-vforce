#ifndef _RIDERPHYSICS_H
#define _RIDERPHYSICS_H

#include "common.h"

void sub_804E1FC(RiderBase*, u8);
void sub_804C888(RiderBase*, unk8);
void SetRiderFlag(RiderBase*, unk32);
void UnsetRiderFlag(RiderBase*, unk32);
void sub_804CEF4(RiderBase*, unk32);
void convert3DCoordsto2DCoords(void);
unk8 RiderHasFlag(RiderBase*, unk32);
unk32 sub_804E440(RiderBase*, unk32);
void sub_804DAA0(RiderBase*, RiderBase*);
unk32 rider_vs_rider_collision_804DB94(RiderBase*, RiderBase*);

#endif
