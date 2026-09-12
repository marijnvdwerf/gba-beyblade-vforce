#ifndef _TRANSITION_H
#define _TRANSITION_H

#include "common.h"

typedef struct TransitionImage {
    TileMapHeader* unk0;
    void* unk4;
} TransitionImage;

void sub_804257C(FrontendState*, unk32);

#endif
