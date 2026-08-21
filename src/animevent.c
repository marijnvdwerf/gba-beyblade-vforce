#include "debug.h"
#include "include_asm.h"
#include "memory.h"
#include "unsorted.h"

void sub_805FA4C(PolyTable* arg0);
void sub_805FA68(PolyTable* arg0);
extern const u8 Str_87556B0[];
extern const u8 Str_87556F4[];

void newPolyTable(PolyTable* arg0, unk16 arg1, unk16 arg2)
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

INCLUDE_ASM("asm/dump/8057b80-debug/805fa8c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805fae8.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805fb60.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805fbe0.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805fcc8.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805fcec.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805fd80.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805fe04.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805fe68.s");
