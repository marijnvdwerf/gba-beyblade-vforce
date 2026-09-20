
#include <agb/macro.h>
#include <agb/memory_map.h>

#include "common.h"
#include "debug.h"
#include "include_asm.h"
#include "memory.h"

extern const char Str_875566C[];

typedef struct AnimFrameState AnimFrameState;

typedef struct AnimFrameData {
    unk32 unk0;
    unk16 unk4;
    unk16 unk6;
    unk32 unk8;
    unk32 unkC;
    unk8 pad10[4];
    unk32 unk14;
    unk16 unk18;
    unk16 unk1A;
    unk32 unk1C;
} AnimFrameData;

typedef struct AnimFrameRecord {
    unk32 unk0;
    s32 unk4;
    unk32 unk8;
    unk8 padC[4];
} AnimFrameRecord;

typedef struct AnimFrameCommand {
    unk16 unk0;
    unk16 unk2;
    unk16 unk4;
    unk8 pad6[2];
} AnimFrameCommand;

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
    AnimFrameCommand* unk8;
    AllocatedBlock* unkC;
    AnimFrameRecord* unk10;
    unk8* unk14;
    unk8* unk18;
    unk8* unk1C;
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
    unk8* unk64;
    unk16 unk68;
    unk8 pad6A[2];
    AnimFrameCallback unk6C;
    void* unk70;
};

void sub_805F784(AnimFrameState*, unk16, unk16);
void sub_805F1F4(AnimFrameState*);
void sub_805F378(AnimFrameState*, s16);
void sub_805F3A8(AnimFrameState*, s16);
void sub_805F47C(AnimFrameState*);

void sub_805F0B4(AnimFrameState* state, AnimFrameData* data, AnimFrameData* sharedData, unk32 arg3,
    unk8 useSlowHeap)
{
    state->unk0 = data;
    state->unk4 = (unk8*)data + data->unk8;
    state->unk8 = (AnimFrameCommand*)((unk8*)data + data->unkC);
    state->unk24 = (AnimFrameEntry*)((unk8*)data + data->unk14);
    state->unk64 = data->unk1C != 0 ? (unk8*)data + data->unk1C : NULL;
    if (state->unkC != NULL) {
        sub_805F1F4(state);
    }
    if (sharedData != NULL) {
        state->unk1C = (unk8*)sharedData;
        state->unk20 = (unk8*)sharedData + sharedData->unk8;
    } else {
        state->unk1C = (unk8*)data;
        state->unk20 = state->unk4;
    }
    if (sharedData != NULL) {
        state->unk14 = (unk8*)sharedData + state->unk0->unk0;
    } else {
        state->unk14 = (unk8*)data + state->unk0->unk0;
    }
    if (sharedData == NULL) {
        if (useSlowHeap == 0) {
            state->unkC = fastAllocate(state->unk0->unk4 << 4);
        } else {
            state->unkC = slowAllocate(state->unk0->unk4 << 4);
        }
        state->unk4 = (unk8*)state->unkC->address + (state->unk0->unk4 << 5);
        sub_805F3A8(state, -1);
    } else {
        if (useSlowHeap == 0) {
            state->unkC = fastAllocate(state->unk0->unk4 << 4);
        } else {
            state->unkC = slowAllocate(state->unk0->unk4 << 4);
        }
    }
    if (state->unkC == NULL) {
        printf(Str_875566C, state->unk0->unk4 << 5);
        state->unk10 = NULL;
    } else {
        state->unk10 = state->unkC->address;
        state->unk18 = (unk8*)state->unkC->address + (state->unk0->unk4 << 4);
    }
    state->unk2A = 0;
    state->unk28 |= -1;
    state->unk30 |= -1;
    state->unk2C = 0;
    state->unk2E = 0;
    state->unk44 = 0;
    state->unk32 = 0;
    state->unk3C = 0;
    state->unk3E = 0;
    state->unk40 = 0;
    state->unk68 = 0;
    state->unk38 = 0;
    state->unk58 = 0;
    state->unk3A = 0;
    state->unk52 = 0;
    state->unk6C = NULL;
    state->unk70 = NULL;
    sub_805F378(state, state->unk2C);
}

void sub_805F1E4(AnimFrameState* arg0, AnimFrameCallback arg1, void* arg2)
{
    arg0->unk6C = arg1;
    arg0->unk70 = arg2;
}

void sub_805F1EC(AnimFrameState* arg0, AnimFrameData* arg1)
{
    arg0->unk8 = (AnimFrameCommand*)((unk8*)arg1 + arg1->unkC);
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

typedef struct AnimFrameDrawInput AnimFrameDrawInput;

typedef void (*AnimFrameDrawCallback)(
    AnimFrameState*, unk32, unk32, AnimFrameDrawInput*, unk32, unk32, unk32, unk32);

typedef struct AnimFrameDrawer {
    unk8 pad0[0x30];
    AnimFrameDrawCallback callback;
} AnimFrameDrawer;

struct AnimFrameDrawInput {
    unk8 pad0[0x30];
    s16 unk30;
};

void sub_805F27C(
    AnimFrameState* arg0, AnimFrameDrawer* arg1, unk32 arg2, unk32 arg3, AnimFrameDrawInput* arg4)
{
    s16 offset;
    s16 block;
    unk32 rows;

    if ((arg0->unk52 & 2) == 0) {
        arg1->callback(
            arg0, arg2, arg3, arg4, arg0->unk60, 0, 0x40, VRAM + 0x10000 + (arg0->unk4E << 5));
        return;
    }

    offset = arg4->unk30 >> 6;
    block = offset >> 1;
    if ((block & 7) > 3) {
        block += 8 - (block & 7);
    } else {
        block &= ~3;
    }
    offset -= block;
    rows = offset; // TODO: fakematch? (staging temp + duplicated else store)
    if ((rows & 7) != 0) {
        rows += 8 - (rows & 7);
        offset = rows;
    } else {
        offset = rows;
    }
    if (arg0->unk4D == 0) {
        arg1->callback(
            arg0, arg2, arg3, arg4, arg0->unk60, 0, block, VRAM + 0x10000 + (arg0->unk4E << 5));
    } else {
        arg1->callback(arg0, arg2, arg3, arg4, arg0->unk60, block, offset,
            VRAM + 0x10000 + (arg0->unk4E << 5) + ((block >> 3) << 9));
    }
}

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

void sub_805F3A8(AnimFrameState* arg0, s16 arg1)
{
    AnimFrameData* data;
    unk32 stride;

    data = arg0->unk0;
    stride = data->unk4 * 10;
    if (arg1 < data->unk18) {
        if (arg1 >= 0) {
            arg0->unk4 = arg0->unk14 + arg1 * stride;
        } else {
            arg0->unk4 = arg0->unk20;
        }
    }
}

void sub_805F3D8(AnimFrameState* arg0)
{
    s32 stride;
    unk8* dest;
    AnimFrameRecord* src;

    stride = arg0->unk0->unk4 * 10;
    dest = arg0->unk4;
    src = arg0->unk10;
    DmaCopy(3, src, dest, stride, 32);
}

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

void sub_805F47C(AnimFrameState* arg0)
{
    AnimFrameEntry* entry;
    s32 speed;
    unk8 advance;

    entry = &arg0->unk24[arg0->unk28];
    speed = arg0->unk3A + arg0->unk44;
    if (arg0->unk0->unk1A == 0 || arg0->unk0->unk18 == 0) {
        return;
    }
    arg0->unk3E = arg0->unk3C;
    if (arg0->unk3C == 0 && !(arg0->unk32 & 8) && arg0->unk28 >= 0) {
        sub_805F784(arg0, arg0->unk42, arg0->unk42);
        return;
    }
    if (speed > 0) {
        arg0->unk40 += speed >> 1;
    }
    if (arg0->unk32 & 0x10) {
        arg0->unk32 &= ~0x20;
        if (arg0->unk38 < 0) {
            arg0->unk40 = -arg0->unk38 & 0x3FF;
        } else {
            arg0->unk40 = arg0->unk38 & 0x3FF;
        }
        if ((arg0->unk58 >= 0 && arg0->unk38 < 0) || (arg0->unk58 < 0 && arg0->unk38 >= 0)) {
            if (arg0->unk38 < 0) {
                arg0->unk2E = arg0->unk2A;
                arg0->unk2C = arg0->unk2A + 2;
            } else {
                arg0->unk2E = arg0->unk2A;
                arg0->unk2C = arg0->unk2A + 1;
            }
        }
        arg0->unk58 = arg0->unk38;
    }
    if (arg0->unk40 <= 0x3FF) {
        return;
    }
    arg0->unk40 -= 0x400;
    arg0->unk2E = arg0->unk2C;
    if (arg0->unk32 & 4) {
        arg0->unk3A = 0;
        arg0->unk38 = 0;
        arg0->unk58 = 0;
        arg0->unk40 = 0;
        arg0->unk32 |= 0x10;
    }
    if (arg0->unk32 & 2) {
        arg0->unk2C--;
    } else {
        arg0->unk2C++;
    }
    if (arg0->unk2C - arg0->unk2A >= entry->unk2) {
        if (arg0->unk32 & 8) {
            arg0->unk3A = 0;
            arg0->unk2C = arg0->unk2A + entry->unk2 - 1;
            sub_805F3A8(arg0, arg0->unk2C);
        } else if (arg0->unk32 & 1) {
            arg0->unk32 ^= 2;
            arg0->unk2C = arg0->unk2A + entry->unk2 - 2;
        } else {
            arg0->unk2C = arg0->unk2A;
        }
        if (arg0->unk3C != 0) {
            arg0->unk3C--;
            if (arg0->unk3C < -3000) {
                arg0->unk3C |= -1;
            }
            if (arg0->unk3C != 0 && arg0->unk6C != NULL) {
                arg0->unk6C(arg0, arg0->unk70, arg0->unk28, 2);
            }
        }
        if (arg0->unk3C == 0 && !(arg0->unk32 & 8)) {
            advance = 1;
            if (arg0->unk6C != NULL) {
                advance = arg0->unk6C(arg0, arg0->unk70, arg0->unk28, 1);
            }
            if (advance != 0) {
                sub_805F784(arg0, arg0->unk42, arg0->unk42);
            }
        }
    }
    if (arg0->unk2C < arg0->unk2A) {
        if (arg0->unk32 & 8) {
            arg0->unk3A = 0;
            sub_805F3A8(arg0, arg0->unk2C);
            arg0->unk2C = arg0->unk2A + entry->unk2 - 1;
        } else if (arg0->unk32 & 1) {
            arg0->unk32 ^= 2;
            arg0->unk2C = arg0->unk2A + 1;
        } else {
            arg0->unk2C = arg0->unk2A + entry->unk2 - 1;
        }
        if (arg0->unk3C != 0) {
            arg0->unk3C--;
            if (arg0->unk3C < -3000) {
                arg0->unk3C |= -1;
            }
        }
        if (arg0->unk3C == 0 && !(arg0->unk32 & 8)) {
            advance = 1;
            if (arg0->unk6C != NULL) {
                advance = arg0->unk6C(arg0, arg0->unk70, arg0->unk28, 1);
            }
            if (advance != 0) {
                sub_805F784(arg0, arg0->unk42, arg0->unk42);
            }
        }
    }
}

void sub_805F730(AnimFrameState* arg0)
{
    AnimFrameData* data;
    unk16 frame;
    unk16 current;

    data = arg0->unk0;
    if (data->unk1A != 0 && data->unk18 != 0) {
        frame = arg0->unk2E;
        current = arg0->unk2C;
        if (frame != current || arg0->unk30 != arg0->unk28 || arg0->unk3E != arg0->unk3C) {
            arg0->unk68 = frame;
            sub_805F3A8(arg0, arg0->unk2E);
            sub_805F378(arg0, arg0->unk2C);
            arg0->unk2E = arg0->unk2C;
            arg0->unk30 = arg0->unk28;
        }
    }
}

void sub_805F784(AnimFrameState* arg0, unk16 arg1, unk16 arg2)
{
    AnimFrameEntry* current;
    AnimFrameEntry* entry;
    s8 value;

    current = &arg0->unk24[arg0->unk28];
    entry = &arg0->unk24[arg1];
    if ((arg0->unk32 & 4) != 0) {
        arg0->unk2E = current->unk0;
    }
    arg0->unk2A = entry->unk0;
    arg0->unk28 = arg1;
    arg0->unk40 = 0;
    arg0->unk3C = entry->unk6;
    arg0->unk3E = entry->unk6;
    arg0->unk3A = entry->unk4;
    value = entry->unk7;
    arg0->unk32 = value;
    if ((value & 2) != 0) {
        arg0->unk2C = arg0->unk2A + entry->unk2 - 1;
    } else {
        arg0->unk2C = arg0->unk2A;
    }
    arg0->unk42 = arg2;
    arg0->unk44 = 0;
}

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

typedef void (*AnimFrameVisitCallback)(s16*, s32, unk32);

typedef struct AnimFrameVisitor {
    unk8 pad0[0x10];
    AnimFrameVisitCallback callback;
} AnimFrameVisitor;

void sub_805F910(AnimFrameState* state, s16* limit, AnimFrameVisitor* visitor)
{
    AnimFrameCommand* command;
    AnimFrameRecord* first;
    AnimFrameRecord* second;
    AnimFrameRecord* third;
    AnimFrameRecord* selected;
    unk16 i;
    s32 value;

    for (i = 0; i < state->unk0->unk6; i++) {
        command = &state->unk8[i];
        first = &state->unk10[command->unk0];
        second = &state->unk10[command->unk2];
        third = &state->unk10[command->unk4];
        selected = first->unk4 <= second->unk4 ? first : second;
        if (selected->unk4 > third->unk4) {
            selected = third;
        }
        value = (selected->unk4 << 10) >> 16;
        if (value >= 0 && value < *limit) {
            visitor->callback(limit, value, i);
        }
    }
}

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
