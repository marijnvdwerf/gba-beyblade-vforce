#ifndef _BEYBLADE_H
#define _BEYBLADE_H

#include "common.h"
#include "ram.h"

const SpriteSheet* getBeyBladeActorDataForIndex(s32);
void emptyBeybladeActorData(void);
void deallocBeybladeActorData(void);
BeybladeActorData* getBeybladeActorData(unk32);

void allocateBeyBladeActorPalette(unk32, unk32);
unk8 sub_805749C(unk32);

typedef struct BeybladeData {
    const unk8* unk0[5];
    const unk8* unk14[5];
    const unk8* palette;
    const SpriteSheet* spriteSheet;
    unk8 pad30;
    unk8 unk31;
    unk8 pad32[2];
} BeybladeData;

const BeybladeData* getBeybladeData0(unk32);
const unk8* sub_80573C8(unk32);
const unk8* sub_80573DC(unk32);
const unk8* sub_80573FC(unk32);
const unk8* sub_805741C(unk32);
const unk8* sub_805743C(unk32);
const unk8* sub_805745C(unk32);
const unk8* sub_805747C(unk32);
extern const unk8* RiderPalettes[];
extern BeybladeData _807ac28[];

void allocateBeybladeObjectPalettes(void);

#endif
