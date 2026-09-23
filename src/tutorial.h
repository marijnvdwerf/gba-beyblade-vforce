#ifndef _TUTORIAL_H
#define _TUTORIAL_H

#include "common.h"
#include "menu.h"

extern const unk8* _806DB8C[][5];
extern const unk8* _806DFD0[][5];
extern const unk8* _806E0DC[][5];
extern const unk8* _806E240[][5];
extern const unk8* _806E31C[][5];
extern const unk8* _806E3B0[][5];
extern const unk8* _806E650[];
extern FrontendSubobjectData _806E664;
extern FrontendSubobjectData _806E690;
extern const unk8* _806E6FC[];
extern const unk8* _806E710[];
extern const unk8* _806E724[][5];
extern const unk8* _806E774[];
extern const unk8* _806E788[];
extern const unk8* _806E79C[];
extern MenuItemDescriptor _806E7B0[];
extern MenuItemDescriptor _806E810[];
extern MenuItemDescriptor _806E870[];
extern const unk8* _806E8B0[];
extern const unk8* _806E8C4[];
extern const unk8* _806E8D8[][5];
extern const unk8* _806E914[][5];
extern const unk8* _806E97C[][5];
extern const unk8* _806EA5C[];
extern const unk8* _806EA70[];

void sub_804A310(void);
unk32 sub_804A504(void);
void initTutorialManagement(u16);
void StoreLevelVar14(unk32);
void sub_804A550(TutorialEntry*);
void sub_804A72C(void);
void turorial_804A488(unk32);

const unk8* const* sub_804A364(void);
const unk8* const* sub_804A378(unk32);

void sub_804A51C(void);

#endif
