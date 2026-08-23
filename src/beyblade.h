#ifndef _BEYBLADE_H
#define _BEYBLADE_H

#include "common.h"

void emptyBeybladeActorData(void);
void deallocBeybladeActorData(void);
void sub_8057104(unk32, unk32);
void allocateBeyBladeActorPalette(unk32, unk32);
unk32 getBeybladeData0(unk32);
extern void* RiderPalettes[];

#endif /* _BEYBLADE_H */
