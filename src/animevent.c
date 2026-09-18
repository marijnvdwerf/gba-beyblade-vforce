#include "animevent.h"

#include <agb/macro.h>

#include "debug.h"
#include "include_asm.h"
#include "memory.h"
#include "system.h"
#include "unsorted.h"

typedef struct PolyBucket {
    s16 head;
    s16 tail;
} PolyBucket;

typedef struct PolyNode {
    s16 value;
    s16 next;
} PolyNode;

typedef struct UnkAnimEventRow {
    unk8 pad0[2];
    s16 next;
    s16 prev;
    unk8 pad6[2];
} UnkAnimEventRow;

typedef struct UnkAnimEventBucket {
    s16 head;
    s16 tail;
} UnkAnimEventBucket;

typedef struct UnkAnimEventData {
    unk16 unk0;
    unk16 unk2;
    unk16 unk4;
    unk16 unk6;
    UnkAnimEventRow* unk8;
    UnkAnimEventBucket* unkC;
    unk32* unk10;
    unk32* unk14;
    AllocatedBlock* unk18;
    AllocatedBlock* unk1C;
    unk8* unk20;
    unk16 unk24;
    unk16 unk26;
    AllocatedBlock* unk28;
    unk16 unk2C;
    unk16 unk2E;
    unk16 unk30;
    unk8* unk34;
} UnkAnimEventData;

void sub_805FCC8(UnkAnimEventData* arg0);
void sub_805FA4C(PolyTable* arg0);
void sub_805FA68(PolyTable* arg0);
extern const char Str_87556B0[];
extern const char Str_87556F4[];
extern const char Str_8755730[];
extern const char Str_8755738[];
extern const char Str_8755748[];
extern const char Str_8755754[];
extern const char Str_875575C[];
extern const char Str_8755764[];
extern const char Str_8755794[];
extern const char Str_87557C8[];

void newPolyTable(PolyTable* arg0, u16 arg1, u16 arg2)
{
    if (arg0->unk10 != NULL) {
        sub_805FA4C(arg0);
    }
    arg0->unk10 = fastAllocate(arg2 << 2);
    arg0->unk14 = fastAllocate(arg1 << 2);
    if (arg0->unk10 == NULL) {
        printf(Str_87556B0);
    }
    if (arg0->unk14 == NULL) {
        printf(Str_87556F4);
    }
    arg0->unk8 = arg0->unk10->address;
    arg0->unkC = arg0->unk14->address;
    arg0->unk0 = arg2;
    arg0->unk2 = arg1;
    arg0->unk4 = 0;
    sub_805FA68(arg0);
}

void sub_805FA4C(PolyTable* arg0)
{
    deallocateBlock(arg0->unk10);
    deallocateBlock(arg0->unk14);
    arg0->unk10 = NULL;
    arg0->unk14 = NULL;
}

void sub_805FA68(PolyTable* arg0)
{
    arg0->unk4 = 0;
    __fastMemoryClearARM(-1, arg0->unk8, arg0->unk10->size);
}

void sub_805FA8C(PolyTable* arg0, unk16 arg1, unk16 arg2)
{
    PolyBucket* bucket;
    PolyNode* node;
    unk32 offset;

    bucket = &arg0->unk8[arg1];
    node = &arg0->unkC[arg0->unk4];
    if (arg0->unk4 < arg0->unk2) {
        node->next = -1;
        node->value = arg2;
        if (bucket->head == -1) {
            bucket->head = arg0->unk4;
        } else {
            offset = bucket->tail;
            node = arg0->unkC + offset;
            node->next = arg0->unk4;
        }
        bucket->tail = arg0->unk4;
        arg0->unk4++;
    }
}

INCLUDE_ASM("asm/dump/8057b80-debug/805fae8.s");

void sub_805FB60(PolyTable* arg0, unk16 arg1)
{
    PolyBucket* bucket;
    PolyNode* node;

    bucket = &arg0->unk8[arg1];
    node = NULL;
    nullsub_10(Str_8755730, arg1, Str_8755738, bucket->head);
    nullsub_9(Str_8755748, bucket->tail);
    if (bucket->head != -1) {
        node = &arg0->unkC[bucket->head];
    }
    while (node != NULL) {
        nullsub_10(Str_8755754, node->value, Str_875575C, node->next);
        if (node->next != -1) {
            node = arg0->unkC + node->next;
        } else {
            node = NULL;
        }
    }
}

void sub_805FBE0(UnkAnimEventData* arg0, unk16 arg1, unk16 arg2, unk16 arg3, unk16 arg4)
{
    unk32 size;
    unk32 entriesSize;

    arg0->unk0 = 0;
    arg0->unk2 = 0;
    arg0->unk4 = arg2;
    arg0->unk6 = arg1;
    arg0->unk26 = 0;
    arg0->unk24 = 0;
    arg0->unk30 = 0;
    arg0->unk2E = 0;
    arg0->unk2C = arg4;
    if (arg0->unk28 != NULL) {
        sub_805FCC8(arg0);
    }
    size = arg3 * 0x20;
    arg0->unk28 = fastAllocate(size + arg4 * sizeof(unk16));
    arg0->unk18 = fastAllocate(arg2 * sizeof(UnkAnimEventRow));
    entriesSize = arg1 * sizeof(UnkAnimEventBucket);
    arg0->unk1C = fastAllocate(entriesSize + (arg1 >> 5) * sizeof(unk32) + arg1 * sizeof(unk16));
    if (arg0->unk28 == NULL) {
        nullsub_9(Str_8755764, size + arg4 * sizeof(unk16));
    }
    if (arg0->unk18 == NULL) {
        nullsub_9(Str_8755794, arg2 * sizeof(UnkAnimEventRow));
    }
    if (arg0->unk1C == NULL) {
        nullsub_9(Str_87557C8, entriesSize + (arg1 >> 5) * sizeof(unk32) + arg1 * sizeof(unk16));
    }
    arg0->unk20 = arg0->unk28->address;
    arg0->unk8 = arg0->unk18->address;
    arg0->unkC = arg0->unk1C->address;
    arg0->unk34 = arg0->unk20 + size;
    arg0->unk10 = arg0->unk1C->address;
    arg0->unk10 += arg1;
    arg0->unk14 = arg0->unk10 + (arg1 >> 5);
}

void sub_805FCC8(UnkAnimEventData* arg0)
{
    deallocateBlock(arg0->unk28);
    deallocateBlock(arg0->unk18);
    deallocateBlock(arg0->unk1C);
    arg0->unk28 = NULL;
    arg0->unk18 = NULL;
    arg0->unk1C = NULL;
}

INCLUDE_ASM("asm/dump/8057b80-debug/805fcec.s");

void sub_805FD80(UnkAnimEventData* arg0, s16 arg1, s16 arg2)
{
    UnkAnimEventRow* row;
    UnkAnimEventRow* prev;
    UnkAnimEventRow* next;
    UnkAnimEventBucket* bucket;

    row = arg0->unk8 + arg1;
    bucket = arg0->unkC + arg2;
    if (row->prev < 0) {
        bucket->head = row->next;
    } else {
        prev = arg0->unk8 + row->prev;
        prev->next = row->next;
    }
    if (row->next < 0) {
        bucket->tail = row->prev;
    } else {
        next = arg0->unk8 + row->next;
        next->prev = row->prev;
    }
    if (bucket->tail < 0 && bucket->head < 0) {
        arg0->unk10[arg2 >> 5] &= ~(1 << (arg2 & 0x1F));
    }
    arg0->unk0--;
}

void sub_805FE04(UnkAnimEventData* arg0)
{
    arg0->unk2 = 0;
    arg0->unk0 = 0;
    arg0->unk24 = 0;
    arg0->unk26 = 0;
    arg0->unk30 = 0;
    arg0->unk2E = 0;
    DmaClear(3, -1, arg0->unk1C->address,
        arg0->unk1C->size - ((arg0->unk6 >> 5) * 4 + arg0->unk6 * 2), 32);
    DmaClear(3, 0, arg0->unk10, (arg0->unk6 >> 5) << 2, 32);
}

INCLUDE_ASM("asm/dump/8057b80-debug/805fe68.s");
