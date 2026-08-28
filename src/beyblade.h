#ifndef _BEYBLADE_H
#define _BEYBLADE_H

#include "common.h"

void emptyBeybladeActorData(void);
void deallocBeybladeActorData(void);
void sub_8057104(unk32, unk32);

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

typedef struct BeybladeData {
    unk8 pad0[0x34];
} BeybladeData;

const BeybladeData* getBeybladeData0(unk32);
extern void* RiderPalettes[];
extern const BeybladeData _807ac28[];

#endif /* _BEYBLADE_H */
