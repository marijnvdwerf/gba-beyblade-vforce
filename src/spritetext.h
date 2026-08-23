#ifndef _SPRITETEXT_H
#define _SPRITETEXT_H

#include "common.h"

void sub_8061660(unk32, unk32, unk32);
void sub_8061844(unk32, unk32, unk32);
void allocFont(SpriteTextCleanup*, const u8*, const u8*, s16, s16, unk16, unk16);
void sub_80611EC(SpriteTextCleanup*, unk8);
void sub_80611FC(SpriteTextCleanup*, unk8);
void sub_8061204(SpriteTextCleanup*);
unk8 showString(SpriteTextCleanup*, const u8*, unk8);
unk8 showNumber(SpriteTextCleanup*, s32, unk8);
unk8 showNumber_2(SpriteTextCleanup*, unk32, unk8);
void sub_8061228(SpriteTextCleanup*);
void sub_8061824(SpriteTextCleanup*, s32, s32);

#endif /* _SPRITETEXT_H */
