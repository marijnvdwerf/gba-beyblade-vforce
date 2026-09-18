#include "common.h"
#include "include_asm.h"
#include "memory.h"

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
    unk8 pad2[2];
    unk16 unk4;
    s8 unk6;
    unk8 pad7;
} AnimFrameEntry;

typedef void (*AnimFrameCallback)(AnimFrameState*, void*, unk32, unk32);

struct AnimFrameState {
    AnimFrameData* unk0;
    unk8 pad4[4];
    unk8* unk8;
    AllocatedBlock* unkC;
    AnimFrameRecord* unk10;
    unk8* unk14;
    unk8* unk18;
    unk8 pad1C[4];
    unk8* unk20;
    AnimFrameEntry* unk24;
    s16 unk28;
    unk16 unk2A;
    unk16 unk2C;
    s16 unk2E;
    unk16 unk30;
    s16 unk32;
    unk8 pad34[6];
    unk16 unk3A;
    unk16 unk3C;
    unk16 unk3E;
    unk16 unk40;
    unk16 unk42;
    unk16 unk44;
    unk8 pad46[6];
    unk8 unk4C;
    unk8 unk4D;
    unk16 unk4E;
    unk16 unk50;
    unk16 unk52;
    unk8 pad54[8];
    AllocatedBlock* unk5C;
    unk32 unk60;
    unk8 pad64[4];
    unk16 unk68;
    unk8 pad6A[2];
    AnimFrameCallback unk6C;
    void* unk70;
};

void sub_805F784(AnimFrameState*, unk16, unk16);
void sub_805F3A8(AnimFrameState*, s16);
void sub_805F47C(AnimFrameState*);

INCLUDE_ASM("asm/dump/8057b80-debug/805f0b4.s");

void sub_805F1E4(AnimFrameState* arg0, AnimFrameCallback arg1, void* arg2)
{
    arg0->unk6C = arg1;
    arg0->unk70 = arg2;
}

void sub_805F1EC(AnimFrameState* arg0, unk32* arg1)
{
    arg0->unk8 = (unk8*)arg1 + arg1[3];
}

void sub_805F1F4(AnimFrameState* arg0)
{
    if (arg0->unk5C != NULL) {
        deallocateBlock(arg0->unk5C);
    }
    arg0->unk60 = 0;
    if (arg0->unkC != NULL) {
        deallocateBlock(arg0->unkC);
    }
    arg0->unkC = NULL;
}

void sub_805F218(AnimFrameState* arg0, unk16 arg1, unk16 arg2)
{
    arg0->unk4C = 0;
    arg0->unk4E = arg2;
    arg0->unk50 = arg1;
    arg0->unk52 |= 1;
}

void sub_805F23C(AnimFrameState* arg0, unk16 arg1)
{
    arg0->unk4C = 0;
    arg0->unk4E = arg1;
    arg0->unk50 = arg1;
    arg0->unk52 = 0;
}

void sub_805F258(AnimFrameState* arg0, unk16 arg1, unk16 arg2)
{
    arg0->unk4C = 0;
    arg0->unk4D = 0;
    arg0->unk4E = arg2;
    arg0->unk50 = arg1;
    arg0->unk52 |= 3;
}

INCLUDE_ASM("asm/dump/8057b80-debug/805f27c.s");

void sub_805F378(AnimFrameState* arg0, s16 arg1)
{
    AnimFrameData* data;
    unk32 stride;

    data = arg0->unk0;
    stride = data->unk4 * 10;
    if (arg1 < data->unk18) {
        if (arg1 >= 0) {
            arg0->unk18 = arg0->unk14 + arg1 * stride;
        } else {
            arg0->unk18 = arg0->unk20;
        }
    }
}

INCLUDE_ASM("asm/dump/8057b80-debug/805f3a8.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805f3d8.s");

void sub_805F400(AnimFrameState* arg0)
{
    unk16 value;

    if ((arg0->unk52 & 2) == 0 || arg0->unk4D == 0) {
        sub_805F47C(arg0);
    }
    if ((arg0->unk52 & 1) != 0) {
        value = arg0->unk50;
        if ((arg0->unk52 & 2) == 0 || arg0->unk4D != 0) {
            arg0->unk4C ^= 1;
            arg0->unk50 = arg0->unk4E;
            arg0->unk4E = value;
        }
        if ((arg0->unk52 & 2) != 0) {
            arg0->unk4D ^= 1;
        }
    }
}

INCLUDE_ASM("asm/dump/8057b80-debug/805f47c.s");

void sub_805F730(AnimFrameState* arg0)
{
    AnimFrameData* data;
    unk16 frame;

    data = arg0->unk0;
    if (data->unk1A != 0 && data->unk18 != 0) {
        frame = arg0->unk2E;
        if (frame != arg0->unk2C || arg0->unk30 != arg0->unk28 || arg0->unk3E != arg0->unk3C) {
            arg0->unk68 = frame;
            sub_805F3A8(arg0, arg0->unk2E);
            sub_805F378(arg0, arg0->unk2C);
            arg0->unk2E = arg0->unk2C;
            arg0->unk30 = arg0->unk28;
        }
    }
}

INCLUDE_ASM("asm/dump/8057b80-debug/805f784.s");

void sub_805F7FC(AnimFrameState* arg0, unk16 arg1, unk16 arg2)
{
    AnimFrameEntry* entry;

    entry = &arg0->unk24[arg1];
    arg0->unk2A = entry->unk0;
    arg0->unk28 = arg1;
    arg0->unk40 = 0;
    arg0->unk3C = entry->unk6;
    arg0->unk3E = entry->unk6;
    arg0->unk3A = entry->unk4;
    arg0->unk2E = arg0->unk2A;
    arg0->unk2C = arg0->unk2A + 1;
    arg0->unk32 = 0;
    arg0->unk42 = arg2;
    arg0->unk44 = 0;
}

void sub_805F848(AnimFrameState* arg0)
{
    AnimFrameEntry* entry;

    entry = &arg0->unk24[arg0->unk28];
    arg0->unk32 &= ~8;
    arg0->unk3A = entry->unk4;
}

void sub_805F864(AnimFrameState* arg0, unk16 arg1, unk16 arg2)
{
    sub_805F784(arg0, arg1, arg2);
    arg0->unk32 |= 8;
}

void sub_805F884(AnimFrameState* arg0, unk16 arg1, unk16 arg2)
{
    if (arg1 == arg0->unk28 && (arg0->unk32 & 4) != 0) {
        arg0->unk42 = arg2;
    } else {
        sub_805F784(arg0, arg1, arg2);
        arg0->unk32 |= 4;
    }
}

void sub_805F8C0(AnimFrameState* arg0)
{
    sub_805F784(arg0, arg0->unk42, arg0->unk42);
}

void sub_805F8D4(AnimFrameState* arg0, unk16 arg1, AnimFrameRecord* arg2)
{
    AnimFrameRecord* src;

    src = &arg0->unk10[arg1];
    arg2->unk0 = src->unk0;
    arg2->unk4 = src->unk4;
    arg2->unk8 = src->unk8;
}

AnimFrameRecord* sub_805F8EC(AnimFrameState* arg0, unk16 arg1)
{
    return &arg0->unk10[arg1];
}

void sub_805F8F8(AnimFrameState* arg0)
{
    unk16 i;

    for (i = 0; i < arg0->unk0->unk6; i++) { }
}

INCLUDE_ASM("asm/dump/8057b80-debug/805f910.s");

void sub_805F98C(AnimFrameState* arg0)
{
    unk16 i;

    if (arg0->unk10 != NULL) {
        for (i = 0; i < arg0->unk0->unk4; i++) { }
    }
}

void sub_805F9AC(AnimFrameState* arg0)
{
    if (arg0->unkC != NULL) {
        deallocateBlock(arg0->unkC);
    }
    if (arg0->unk5C != NULL) {
        deallocateBlock(arg0->unk5C);
    }
    arg0->unkC = NULL;
    arg0->unk10 = NULL;
    arg0->unk5C = NULL;
}

ASM_ZEROPAD
