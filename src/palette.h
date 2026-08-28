#ifndef _PALETTE_H
#define _PALETTE_H

#include "common.h"
#include "memory.h"

#define BG_PLTT_PTR ((unk16*)BG_PLTT)
#define OBJ_PLTT_PTR ((unk16*)OBJ_PLTT)

void sub_80631B0(Palette*, unk8*, unk32, unk32, unk32);
void sub_80631EC(Palette*, unk8*, s32);
void sub_8063220(Palette*, unk32, unk32, unk32);
void sub_8063544(Palette*, s32, s32, s32, s32, s32, s32, s32, s32);
void sub_8063640(Palette*, s32);
void sub_8063704(Palette*, s32);
void deallocate_80637CC(Palette*);
void sub_80637E4(Palette*, u16*, u32, u32, u32);
void sub_8063830(Palette*, unk16*, s32, s32, s32, s32);

#endif
