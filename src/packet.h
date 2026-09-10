#ifndef BEY_PACKET_H
#define BEY_PACKET_H

#include "common.h"

extern const s16 Unk_874CC3C[];

typedef struct PacketTransport {
    unk8 unk0;
    unk8 unk1;
    unk8 unk2_0 : 4;
    unk8 unk2_4 : 4;
    unk8 unk3;
    s8 unk4[12];
} PacketTransport;

typedef struct RiderStateDataPrefix {
    s16 unk0;
    s16 unk2;
    s16 unk4;
    unk16 unk6_0 : 10;
    unk16 unk6_10 : 6;
} RiderStateDataPrefix;

typedef struct RiderStateData {
    RiderStateDataPrefix prefix;
    u16 unk8;
    u16 unkA;
    u8 unkC;
    u8 unkD_0 : 4;
    u8 unkD_4 : 4;
    unk8 padE[2];
} RiderStateData;

typedef union Packet {
    PacketTransport packet;
    RiderStateData rider;
} Packet;

typedef Packet RiderState;
typedef char PacketSizeCheck[(sizeof(Packet) == 0x10) ? 1 : -1];

void sub_8043960(Packet*);
u8 sub_8043970(Packet*, unk8);
void sub_80439A0(BGLayer* arg0);

#endif
