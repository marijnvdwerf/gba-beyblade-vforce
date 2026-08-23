#ifndef _MUSIC_H
#define _MUSIC_H

#include "common.h"
#include "sound.h"

typedef struct MusicTrack {
    SoundStructE* (*first)[];
    s16 (*second)[];
} MusicTrack;

extern const MusicTrack _807561C[];

void sub_804ACF0(void);
void sub_804AD28(void);
void sub_804AD44(void);
void sub_804AD50(void);
unk32 sub_804AD60(void);
void sub_804AD74(void);
void sub_804AE34(unk32, unk32);
void sub_804AE8C(void);
void sub_804AECC(unk32);
void sub_804AF04(unk32);
void sub_804AF5C(void);
void sub_804AF9C(void);
void sub_804AFB8(void);
void sub_804AFD4(u16);
void sub_804B00C(u16);
void sub_804B044(void);
void sub_804B060(void);

#endif /* _MUSIC_H */
