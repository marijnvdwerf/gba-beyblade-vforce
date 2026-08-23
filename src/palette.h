#ifndef _PALETTE_H
#define _PALETTE_H

#include "common.h"
#include "memory.h"

#define BG_PLTT_PTR ((u16*)BG_PLTT)
#define OBJ_PLTT_PTR ((u16*)OBJ_PLTT)

typedef struct Palette {
    unk8* source; /* 0x00 */
    unk16 unk4; /* 0x04 */
    unk16 unk6; /* 0x06 */
    s16 unk8; /* 0x08 */
    unk8 unkA[2]; /* 0x0A */
    unk16* unkC; /* 0x0C */
    AllocatedBlock* block; /* 0x10 */
} Palette;

void sub_80631B0(Palette*, unk8*, unk32, unk32, unk32);
void sub_80631EC(Palette*, unk8*, s32);
void sub_8063220(Palette*, s32, s32, s32);
void sub_8063544(Palette*, s32, s32, s32, s32, s32, s32, s32, s32);
void sub_8063640(Palette*, s32);
void sub_8063704(Palette*, s32);
void deallocate_80637CC(Palette*);
void sub_80637E4(Palette*, u16*, unk32, unk32, unk32);
void sub_8063830(Palette*, u16*, s32, s32, s32, s32);

#endif /* _PALETTE_H */
