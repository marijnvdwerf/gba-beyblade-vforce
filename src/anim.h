#ifndef _ANIM_H
#define _ANIM_H

#include "common.h"

typedef struct AnimFrameState AnimFrameState;

typedef struct AnimFrameData {
    unk8 pad0[4];
    unk16 unk4;
    unk16 unk6;
    unk8 pad8[0x10];
    unk16 unk18;
    unk16 unk1A;
} AnimFrameData;

typedef struct AnimFrameRecord {
    unk32 unk0;
    unk32 unk4;
    unk32 unk8;
    unk8 padC[4];
} AnimFrameRecord;

typedef struct AnimFrameEntry {
    unk16 unk0;
    unk16 unk2;
    unk16 unk4;
    s8 unk6;
    s8 unk7;
} AnimFrameEntry;

typedef unk8 (*AnimFrameCallback)(AnimFrameState*, void*, unk32, unk32);

struct AnimFrameState {
    AnimFrameData* unk0;
    unk8* unk4;
    unk8* unk8;
    AllocatedBlock* unkC;
    AnimFrameRecord* unk10;
    unk8* unk14;
    unk8* unk18;
    unk8 pad1C[4];
    unk8* unk20;
    AnimFrameEntry* unk24;
    s16 unk28;
    s16 unk2A;
    s16 unk2C;
    s16 unk2E;
    unk16 unk30;
    s16 unk32;
    unk8 pad34[4];
    s16 unk38;
    s16 unk3A;
    s16 unk3C;
    unk16 unk3E;
    s16 unk40;
    unk16 unk42;
    s16 unk44;
    unk8 pad46[6];
    unk8 unk4C;
    unk8 unk4D;
    unk16 unk4E;
    unk16 unk50;
    unk16 unk52;
    unk8 pad54[4];
    s16 unk58;
    unk8 pad5A[2];
    AllocatedBlock* unk5C;
    unk32 unk60;
    unk8 pad64[4];
    unk16 unk68;
    unk8 pad6A[2];
    AnimFrameCallback unk6C;
    void* unk70;
};

#endif
