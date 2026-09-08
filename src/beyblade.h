#ifndef _BEYBLADE_H
#define _BEYBLADE_H

#include "common.h"
#include "ram.h"

typedef struct TalkingHead {
    unk8 pad0[0x18];
    const unk8* unk18;
    const unk16* unk1C;
    const unk8* unk20;
    const unk16* unk24;
} TalkingHead;

void emptyBeybladeActorData(void);
void deallocBeybladeActorData(void);
BeybladeActorData* getBeybladeActorData(unk32);
void sub_8057104(s32, unk8);
const unk8* sub_8057048(unk32);
unk8 sub_805703C(unk32);
const unk8* sub_8057068(unk32);
unk8* sub_8057094(unk32);
unk8 sub_80570D4(s32);

struct ItemDescriptionEntry {
    unk8 data[24];
};

extern const ItemDescriptionEntry ItemDescription[];
const ItemDescriptionEntry* sub_80570C0(unk32);

struct InputSequence {
    unk32 count;
    u16 keys[1];
};

void sub_8057158(FrontendResource*, const InputSequence*);
void sub_8057164(FrontendResource*);
unk8 sub_80571D0(FrontendResource*);
void allocateBeyBladeActorPalette(unk32, unk32);
unk8 sub_805749C(unk32);

typedef struct BeybladeData {
    unk8 pad0[0x28];
    unk8* palette;
    unk8* spriteSheet;
    unk8 pad30[4];
} BeybladeData;

const BeybladeData* getBeybladeData0(unk32);
const unk8* sub_80573C8(unk32);
const unk8* sub_80573DC(unk32);
const unk8* sub_80573FC(unk32);
const unk8* sub_805741C(unk32);
const unk8* sub_805743C(unk32);
const unk8* sub_805745C(unk32);
const unk8* sub_805747C(unk32);
extern void* RiderPalettes[];
extern const BeybladeData _807ac28[];

void allocateBeybladeObjectPalettes(void);

extern TalkingHead TalkingHeads[];
TalkingHead* GetTalkingHead(s32);

#endif
