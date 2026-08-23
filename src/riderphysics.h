#ifndef _RIDERPHYSICS_H
#define _RIDERPHYSICS_H

#include "common.h"

void sub_804E1FC(RiderBase*, u8);
void sub_804C888(RiderBase*, u8);
void SetRiderFlag(RiderBase*, unk32);
void UnsetRiderFlag(RiderBase*, unk32);
void sub_804CEF4(RiderBase*, unk32);
void convert3DCoordsto2DCoords(void);
u8 RiderHasFlag(RiderBase*, unk32);
unk32 sub_804E440(RiderBase*, unk32);

#endif /* _RIDERPHYSICS_H */
