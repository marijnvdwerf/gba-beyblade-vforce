#include "animevent.h"

#include <agb/macro.h>

#include "debug.h"
#include "include_asm.h"
#include "memory.h"
#include "system.h"
#include "unsorted.h"

typedef struct PolyRecord {
    unk8 pad0[8];
} PolyRecord;

typedef struct PolyDispatchData {
    unk8 pad0[8];
    PolyRecord* unk8;
    unk8 padC[4];
    unk32 unk10;
} PolyDispatchData;

typedef struct PolyDispatchCallbacks {
    unk8 pad0[0x28];
    void (*unk28)(unk32, unk32, PolyRecord*, unk32);
} PolyDispatchCallbacks;

typedef struct PolyBucket {
    s16 head;
    s16 tail;
} PolyBucket;

typedef struct PolyNode {
    s16 value;
    s16 next;
} PolyNode;

typedef struct UnkAnimEventRow {
    unk16 value;
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

void newPolyTable(PolyTable* arg0, u16 arg1, u16 arg2)
{
    if (arg0->unk10 != NULL) {
        sub_805FA4C(arg0);
    }
    arg0->unk10 = fastAllocate(arg2 << 2);
    arg0->unk14 = fastAllocate(arg1 << 2);
    if (arg0->unk10 == NULL) {
        printf("Error allocating memory for PolysPerScan table in newPolyTable()\n");
    }
    if (arg0->unk14 == NULL) {
        printf("Error allocating memory for PolyEntrys in newPolyTable()\n");
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

unk16 sub_805FAE8(PolyTable* arg0, unk32 arg1, PolyDispatchData* arg2, PolyDispatchCallbacks* arg3, unk32 arg4, unk16 arg5)
{
    PolyBucket* bucket;
    PolyNode* node;
    PolyRecord* record;
    unk16 count;

    count = 0;
    bucket = &arg0->unk8[arg5];
    node = NULL;
    if (bucket->head != -1) {
        node = &arg0->unkC[bucket->head];
    }
    while (node != NULL) {
        record = &arg2->unk8[node->value];
        count++;
        arg3->unk28(arg1, arg2->unk10, record, arg4);
        if (node->next != -1) {
            node = &arg0->unkC[node->next];
        } else {
            break;
        }
    }
    return count;
}

void sub_805FB60(PolyTable* arg0, unk16 arg1)
{
    PolyBucket* bucket;
    PolyNode* node;

    bucket = &arg0->unk8[arg1];
    node = NULL;
    nullsub_10("Scan ", arg1, "; startIndex ", bucket->head);
    nullsub_9("endIndex ", bucket->tail);
    if (bucket->head != -1) {
        node = &arg0->unkC[bucket->head];
    }
    while (node != NULL) {
        nullsub_10("poly ", node->value, ", next ", node->next);
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
        nullsub_9("Error allocating memory for edge table entries ", size + arg4 * sizeof(unk16));
    }
    if (arg0->unk18 == NULL) {
        nullsub_9("Error allocating memory for depth table entries ", arg2 * sizeof(UnkAnimEventRow));
    }
    if (arg0->unk1C == NULL) {
        nullsub_9("Error allocating memory for depth table entry list ", entriesSize + (arg1 >> 5) * sizeof(unk32) + arg1 * sizeof(unk16));
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

// TODO: fakematch?
s16 sub_805FCEC(UnkAnimEventData* arg0, unk16 arg1, unk16 arg2)
{
    unk16 index;
    s16 rowIndex;
    s32 bucketIndex;
    unk16 prev;
    s32 next;
    UnkAnimEventRow* row;
    UnkAnimEventRow* tail;
    UnkAnimEventBucket* bucket;

    rowIndex = arg0->unk2++;
    index = rowIndex;
    row = &arg0->unk8[rowIndex];
    bucketIndex = (s16)arg1;
    bucket = &arg0->unkC[bucketIndex];
    if (bucket->head < 0) {
        bucket->head = index;
        bucket->tail = index;
        prev = ~bucketIndex;
        row->prev = prev;
        arg0->unk10[bucketIndex >> 5] |= 1 << (bucketIndex & 0x1F);
    } else {
        tail = &arg0->unk8[bucket->tail];
        tail->next = index;
        row->prev = bucket->tail;
        bucket->tail = index;
    }
    next = ~(s16)arg1;
    row->next = next;
    row->value = arg2;
    arg0->unk0++;
    return index;
}

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
    DmaClear(3, -1, arg0->unk1C->address, arg0->unk1C->size - ((arg0->unk6 >> 5) * 4 + arg0->unk6 * 2), 32);
    DmaClear(3, 0, arg0->unk10, (arg0->unk6 >> 5) << 2, 32);
}

void sub_805FE68(UnkAnimEventData* arg0, unk16 arg1)
{
    unk32 index;
    UnkAnimEventBucket* bucket;
    UnkAnimEventRow* row;

    bucket = &arg0->unkC[arg1];
    index = (unk16)bucket->head;
    nullsub_9("Depth Table: depth ", arg1);
    nullsub_10("startIndex ", bucket->head, ", endIndex ", bucket->tail);
    if ((s16)index >= 0) {
        do {
            row = &arg0->unk8[(s16)index];
            nullsub_10("  previous ", row->prev, ", next ", row->next);
            index = (unk16)row->next;
        } while (row->next >= 0);
    }
}
