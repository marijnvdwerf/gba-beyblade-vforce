#ifndef _COLLECTION_H
#define _COLLECTION_H

#include "common.h"

typedef struct CollectionListData {
    SpriteTextCleanup unk0[5];
    SpriteEntry* unkF0[5];
    SpriteTextCleanup unk104;
} CollectionListData;

typedef union CollectionSelection {
    s32 word;
    unk16 half[2];
} CollectionSelection;

extern s32 _unk30000F8;
extern s32 _unk30000FC;
extern s32 _unk3000100;
extern s32 _unk3000104;
extern unk32 _unk3000108;
extern s32 _unk300010C;
extern s32 _unk3000110;

extern CollectionSelection _unk3000114;
extern s32 _unk3000118;
extern s32 _unk300011C;
extern AllocatedBlock* _collectionListFontBlock;
extern SpriteTextCleanup* _collectionListFont;
extern SpriteTextCleanup* _unk3000128;
extern SpriteEntry** _unk300012C;
extern SpriteEntry* _unk3000130;
extern SpriteEntry* _unk3000134;
extern SpriteEntry* _unk3000138;
extern SpriteEntry* _unk300013C;

void collectionListFrontendHandler(FrontendState*, unk32);

#endif
