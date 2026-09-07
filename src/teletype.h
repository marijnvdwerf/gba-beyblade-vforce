#ifndef _TELETYPE_H
#define _TELETYPE_H

#include "common.h"

typedef struct TeletypeState TeletypeState;

TeletypeState* sub_8063E18(const unk8*, const unk8*, unk32, unk32, unk32, unk32, unk32);
void sub_8063F5C(TeletypeState*, void (*)(void));
void sub_8063F64(TeletypeState*);
void sub_8063F84(TeletypeState*);
void sub_806415C(TeletypeState*);
unk8 sub_806417C(TeletypeState*);
unk8 sub_8064188(TeletypeState*);

#endif
