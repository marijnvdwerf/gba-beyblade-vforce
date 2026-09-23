#ifndef _FRONTEND_H
#define _FRONTEND_H

#include "common.h"

extern const SpriteSheet SpriteSheet_823BF04;
extern const SpriteSheet SpriteSheet_823FF84;
extern const SpriteSheet SpriteSheet_82411A0;
extern const SpriteSheet SpriteSheet_8243874;
extern const SpriteSheet SpriteSheet_8251F40;
extern const SpriteSheet SpriteSheet_8252994;
extern const unk8* _806DB8C[][5];
extern const unk8* _806E3B0[][5];
extern const unk8* _806E8D8[][5];
extern const unk8* _806E914[][5];
extern const unk8* _806E97C[][5];

extern const FrontendObject _8069FC8[];
extern const SpriteSheet SpriteSheet_82B05EC;
extern const unk8 ShadowFontMeta[];
extern const unk8* _806E650[];
extern FrontendSelectionPalette _8068924;
extern FrontendSelectionPalette _806892C;
extern FrontendSelectionPalette _8068934;
extern FrontendSelectionPalette _806893C;
extern FrontendSelectionPalette _8068944;
extern FrontendSelectionPalette _806894C;
extern FrontendMotionData _8068954;
extern FrontendMotionData _806897C;

FrontendState* sub_8048FCC(void);
void sub_8049018(void);
void StoreFunction(FrontendStateCallback);
void sub_8049DE0(FrontendState*, u32);
void sub_80490CC(unk32, unk32);
void sub_80490F8(unk32);
void sub_8049168(void);
unk32 sub_804915C(void);
void sub_8049178(void);
void sub_8046468(FrontendSelectionObject*, const ItemDescriptionEntry*, unk32);
void sub_80464C0(FrontendSelectionObject*, s32);
SpriteTextCleanup* sub_804A0E0(s32);
void sub_8048FE4(void);
s32 sub_80491E0(unk32, s32);
void sub_8049234(unk32);
void sub_804924C(unk32);
unk32 sub_8049258(void);
void sub_8049344(u32);
unk32 sub_80493C8(void);
void sub_804903C(BGLayer*, unk32, unk32);
unk8 sub_8048FFC(void);
void sub_80495C4(void);
void sub_804967C(void);

#endif
