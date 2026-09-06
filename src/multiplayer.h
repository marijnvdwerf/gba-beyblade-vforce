#ifndef _MULTIPLAYER_H
#define _MULTIPLAYER_H

#include "packet.h"

void initMultiPlayer(unk32, s32, unk16);
void sub_80603E8(void);
unk8 sub_805FFE4(void);
unk8 sub_8060070(void);
unk8 sub_806008C(void);
unk8 sub_806014C(Packet*, Packet*, unk8);
u8 isMultiplayer(void);

#endif
