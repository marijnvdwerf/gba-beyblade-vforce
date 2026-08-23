#ifndef _BEYBLADE_H
#define _BEYBLADE_H

#include "common.h"

void emptyBeybladeActorData(void);
void deallocBeybladeActorData(void);
void sub_8057104(unk32, unk32);
void sub_8057158(FrontendResource*, const unk32*);
void sub_8057164(FrontendResource*);
unk8 sub_80571D0(FrontendResource*);
void allocateBeyBladeActorPalette(unk32, unk32);
unk32 getBeybladeData0(unk32);
extern void* RiderPalettes[];

#endif /* _BEYBLADE_H */
