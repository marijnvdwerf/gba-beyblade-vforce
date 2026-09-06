#ifndef BEY_PACKET_H
#define BEY_PACKET_H

#include "common.h"

extern const s16 Unk_874CC3C[];

typedef struct Packet {
    unk8 unk0;
    unk8 unk1;
    unk8 unk2_0 : 4;
    unk8 unk3;
    unk8 unk4[12];
} Packet;

typedef char PacketSizeCheck[(sizeof(Packet) == 0x10) ? 1 : -1];

void sub_8043960(Packet*);

unk32 sub_8043970(Packet*, unk8);
void sub_80439A0(FrontendSubobject* arg0);

#endif
