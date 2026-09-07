#ifndef _RIDERSTATE_H
#define _RIDERSTATE_H

#include "common.h"
#include "packet.h"

void sub_804FF88(unk16);
void sub_804FF5C(Packet*);
void sub_804FFD4(void);
void sub_80501F8(RiderState* state, RiderBase* riders);
void sub_805024C(RiderState* arg0);
void sub_8050050(RiderState* state, RiderState* other);
void sub_8050184(RiderState* arg0, u8 arg1);
void sub_80501A8(RiderState* arg0, u8 arg1);

void sub_805000C(RiderState*, RiderBase*);
unk8 sub_8050114(RiderState*);
u8 sub_80501C8(RiderState*, u8);

#endif
