#ifndef _CREDITS_H
#define _CREDITS_H

#include "common.h"

typedef struct CreditsEntry {
    const unk8* text;
    unk16 unk4;
    unk16 width;
    unk8 color;
    unk8 pad9[3];
} CreditsEntry;

void creditsFrontendHandler(FrontendState*, unk32);

#endif
