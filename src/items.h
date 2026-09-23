#ifndef _ITEMS_H
#define _ITEMS_H

#include "common.h"

typedef struct TalkingHead {
    unk8 pad0[0x18];
    const SpriteSheet* unk18;
    const unk16* unk1C;
    const SpriteSheet* unk20;
    const unk16* unk24;
} TalkingHead;

struct ItemDescriptionEntry {
    unk8 data[24];
};

struct InputSequence {
    unk32 count;
    u16 keys[1];
};

unk8 sub_805703C(unk32);
const unk8* sub_8057048(unk32);
const unk8* sub_8057068(unk32);
unk8* sub_8057094(unk32);
const ItemDescriptionEntry* sub_80570C0(unk32);
unk8 sub_80570D4(s32);
void sub_8057104(s32, unk8);
void sub_8057158(FrontendResource*, const InputSequence*);
void sub_8057164(FrontendResource*);
unk8 sub_80571D0(FrontendResource*);
TalkingHead* GetTalkingHead(s32);

extern const ItemDescriptionEntry ItemDescription[];
extern TalkingHead TalkingHeads[];

#endif
