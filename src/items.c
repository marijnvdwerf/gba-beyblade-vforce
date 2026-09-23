#include "items.h"

#include "language.h"
#include "ram.h"

extern const unk8** ItemNames[];
extern const unk8 _807a53c[];
extern const unk8 Pal_836067C[];
extern unk8 SpriteSheet_836087C[];
extern const unk8* CollectionPalettes[];
extern unk8* CollectionSpriteSheets[];

unk8 sub_805703C(unk32 arg0)
{
    return _807a53c[arg0];
}

const unk8* sub_8057048(unk32 arg0)
{
    unk32 language;

    language = getLanguage();
    return ItemNames[language][arg0];
}

const unk8* sub_8057068(unk32 arg0)
{
    if (sub_80570D4(arg0) != 0) {
        return CollectionPalettes[arg0];
    }
    return Pal_836067C;
}

unk8* sub_8057094(unk32 arg0)
{
    if (sub_80570D4(arg0) != 0) {
        return CollectionSpriteSheets[arg0];
    }
    return SpriteSheet_836087C;
}

const ItemDescriptionEntry* sub_80570C0(unk32 index)
{
    return &ItemDescription[index];
}

unk8 sub_80570D4(s32 arg0)
{
    if ((_currentGameState->unk594[arg0 >> 5] & (1 << (arg0 & 0x1F))) != 0) {
        return 1;
    }
    return 0;
}

void sub_8057104(s32 arg0, unk8 arg1)
{
    if (arg1) {
        _currentGameState->unk594[arg0 >> 5] |= 1 << (arg0 & 0x1F);
    } else {
        _currentGameState->unk594[arg0 >> 5] &= ~(1 << (arg0 & 0x1F));
    }
}

void sub_8057158(FrontendResource* arg0, const InputSequence* arg1)
{
    arg0->state = 0;
    arg0->data = arg1;
    arg0->timer = 0;
}

void sub_8057164(FrontendResource* arg0)
{
    const u16* values;

    values = arg0->data->keys;
    if (arg0->state == arg0->data->count) {
        arg0->state = -1;
    } else if (arg0->state != -1) {
        if (arg0->timer == 0) {
            if (arg0->state != 0) {
                return;
            }
        } else {
            arg0->timer--;
        }
        if (_unk3005DA0 == values[arg0->state]) {
            arg0->timer = 0x3C;
            arg0->state++;
        } else if (_unk3005DA0 != 0) {
            arg0->timer = 0;
            arg0->state = 0;
        }
    }
}

unk8 sub_80571D0(FrontendResource* arg0)
{
    return arg0->state == arg0->data->count;
}

TalkingHead* GetTalkingHead(s32 index)
{
    return &TalkingHeads[index];
}
