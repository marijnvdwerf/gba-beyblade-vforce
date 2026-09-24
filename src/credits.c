#include "credits.h"

#include <agb/memory_map.h>

#include "debug.h"
#include "frontend.h"
#include "include_asm.h"
#include "keystate.h"
#include "layer.h"
#include "packet.h"
#include "ram.h"
#include "spritetext.h"
#include "system.h"
#include "tutorial.h"
#include "version.h"

FrontendSubobject _8067D3C = { 8, { 0 }, &_806E664, 0, NULL, 0, NULL, &_806892C };

CreditsEntry Credits[] = {
    { "Television Animation", 0, 24, 14 },
    { "Director", 0, 16, 14 },
    { "Yoshio Takeuchi", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Character Design", 0, 16, 14 },
    { "Yoshihiro Nagamori", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "d-rights Inc.", 0, 24, 14 },
    { "Vice President", 0, 16, 14 },
    { "Tsuyoshi Kaji", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Producer", 0, 16, 14 },
    { "Mamiko Aoki", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Nelvana", 0, 24, 14 },
    { "Executive Vice President of Worldwide Merchandising", 0, 24, 14 },
    { "Sid Kaufman", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Vice President, Creative Production", 0, 16, 14 },
    { "Jocelyn Hamilton", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Line Producer", 0, 16, 14 },
    { "Tina Karski", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Director of Marketing", 0, 16, 14 },
    { "Jon Graham", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Director, Product Development", 0, 16, 14 },
    { "Marjanne Lyn", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Designed and Developed by", 0, 16, 14 },
    { "Full Fat", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Programming", 0, 16, 14 },
    { "Andrew Docking", 0, 10, 15 },
    { "David Brioso Santos", 0, 10, 15 },
    { "Nicolas Roks", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Levels", 0, 16, 14 },
    { "James Barnard", 0, 10, 15 },
    { NULL, 0, 0, 0 },
#if REGION == REGION_EU
    { "Modelling", 0, 16, 14 },
#else
    { "Modeling", 0, 16, 14 },
#endif
    { "Niall Russell", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Presentation", 0, 16, 14 },
    { "Paul Adams", 0, 10, 15 },
    { "Tony Chen", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Producer", 0, 16, 14 },
    { "James Barnard", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Sound / Music", 0, 16, 14 },
    { "James Barnard", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Head of Game Boy® Advance Development", 0, 16, 14 },
    { "Andrew Docking", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Executive Producer", 0, 16, 14 },
    { "Paul Adams", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "ATARI TEAM", 0, 24, 14 },
    { "Snr VP, International Product Services", 0, 16, 14 },
    { "Jean-Marcel Nicolai", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Executive Producer", 0, 16, 14 },
    { "Roland Kippenhan", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Brand Manager", 0, 16, 14 },
    { "Deborah Montella", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Director of Technology", 0, 16, 14 },
    { "Paul Hellier", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Director of Marketing", 0, 16, 14 },
    { "Steve Arthur", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Director of Creative Services", 0, 16, 14 },
    { "Steve Martin", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Director of Editorial &", 0, 10, 14 },
    { "Documentation Services", 0, 16, 14 },
    { "Elizabeth Mackney", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Art Director", 0, 16, 14 },
    { "Charlie Rizzo", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Graphic Designer", 0, 16, 14 },
    { "Roderick Tilley", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Documentation Specialist", 0, 16, 14 },
    { "Chris Dawley", 0, 10, 15 },
    { "Randi Kravitz", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Copywriter", 0, 16, 14 },
    { "Norm Schrager", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Director of Publishing Support", 0, 16, 14 },
    { "Michael Gilmartin", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Director of Quality Assurance,", 0, 10, 14 },
    { "North America", 0, 16, 14 },
    { "Michael Craighead", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "I.T. Manager/Western Region", 0, 16, 14 },
    { "Ken Ford", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Manager of Technical Support", 0, 16, 14 },
    { "Michael Vetsch", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Atari QA", 0, 16, 14 },
    { "Ken Moodie", 0, 10, 15 },
    { "Dan \"Driger\" Burkhead", 0, 10, 15 },
    { "Kevin Hogan", 0, 10, 15 },
    { "Jeff Kelm", 0, 10, 15 },
    { "Andrew Ma", 0, 10, 15 },
    { "Amy-Elyse Neer", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Republishing Team", 0, 16, 14 },
    { "Rebecka Pernered", 0, 10, 15 },
    { "Sébastien Chaudat", 0, 10, 15 },
    { "Caroline Fauchille", 0, 10, 15 },
    { "Jenny Clark", 0, 10, 15 },
    { "Estelle Baudet", 0, 10, 15 },
    { "Marie Sliwa", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Quality Control Team", 0, 16, 14 },
    { "Lewis Glover", 0, 10, 15 },
    { "Olivier Robin", 0, 10, 15 },
    { "Bruno Trubia", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Software Testing Team", 0, 16, 14 },
    { "RelQ Software PVT Ltd", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Engineering Services ", 0, 16, 14 },
    { "Philippe Louvet", 0, 10, 15 },
    { "Stéphane Enteric", 0, 10, 15 },
    { "Emeric Polin", 0, 10, 15 },
    { NULL, 0, 0, 0 },
#if REGION == REGION_EU
    { "Localisation Support Group", 0, 16, 14 },
#else
    { "Localization Support Group", 0, 16, 14 },
#endif
    { "David Chomard", 0, 10, 15 },
    { "Maud Favier", 0, 10, 15 },
    { "Diane Delaye", 0, 10, 15 },
    { "Monica Steinhauer", 0, 10, 15 },
    { NULL, 0, 0, 0 },
#if REGION == REGION_EU
    { "Localisation Testing", 0, 16, 14 },
#else
    { "Localization Testing", 0, 16, 14 },
#endif
    { "Babel Media Ltd.", 0, 10, 15 },
    { "Translation", 0, 10, 15 },
    { "KBP", 0, 10, 15 },
    { "Synthesis", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Certification and Planning Support Group", 0, 16, 14 },
    { "Sophie Wibaux", 0, 10, 15 },
    { "Jérome Di Tullio", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "International Marketing Team", 0, 16, 14 },
    { "Martin Spiess", 0, 10, 15 },
    { "Cyndi Church", 0, 10, 15 },
    { "Benoit Auguin", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Local Marketing Team", 0, 16, 14 },
    { "Raelene Knowles", 0, 10, 15 },
    { "Simone Goudsmit", 0, 10, 15 },
    { "Beryl Gonnard", 0, 10, 15 },
    { "Jen Hofmann", 0, 10, 15 },
    { "Chris Christopoulos", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Carol Hamias", 0, 10, 15 },
    { "Andrea Colombo", 0, 10, 15 },
    { "Ben Walker", 0, 10, 15 },
    { "Johnny Berggren", 0, 10, 15 },
    { "Joana Teixeira", 0, 10, 15 },
    { "Laura Aznar", 0, 10, 15 },
    { "Tino Pivetta", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Repackaging Agency", 0, 16, 14 },
    { "A Creative Experience, Lyon", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { "Special Thanks", 0, 16, 14 },
    { "Michael MacConnell", 0, 10, 15 },
    { NULL, 0, 0, 0 },
    { NULL, 1, 0, 0 },
};

extern const SpriteSheet SpriteSheet_82B05EC;
extern const unk8 ShadowFontMeta[];

void creditsFrontendHandler(FrontendState* state, unk32 arg1)
{
    s32 totalWidth;
    s32 x;
    s32 i;

    switch (arg1) {
    case 0:
        _3000004 = -0x10000;
        _3000000 = 0;
        sub_80596AC(&state->bgLayers[3], -0x10000, 0);
        _3000008 = 0;
        _3000020 = 0;
        _3000021 = 0;
        _currentCreditsPtr = NULL;
        _creditsPtr = Credits;
        _300000C = 0;
        _3000010 = 0;
        _3000014 = 0;
        _3000024 = NULL;
        _fontPtr = NULL;
        break;
    case 1:

        if (state->transition.value == 0 && state->transition.unk585 == 0) {
            *(vu16*)REG_BLDCNT = 0xF40;
            *(vu16*)REG_BLDALPHA = _300000C | ((0x10 - _300000C) << 8);
            if (_3000014 != 0) {
                _3000014--;
            } else {
                _3000010 = 0;
            }
            if (_300000C != _3000010) {
                s32 next;
                next = _300000C - 1;
                if (_3000010 > _300000C) {
                    next = _300000C + 1;
                }
                _300000C = next;
            }
            if (_300000C == 0) {
                _3000020 = 1;
            }
        }
        if (_3000020 != 0 && (_creditsPtr->unk4 & 1)) {
            _3000021 = 1;
        }
        if ((_unk3005DA0 & 0xB) != 0 && state->transition.value == 0) {
            _3000021 = 1;
        }
        if (_3000021 != 0 && _3000008 != 0) {
            _3000021 = 1;
            if (sub_804915C() == STATE_8) {
                sub_80490F8(STATE_10);
            } else {
                sub_8049178();
            }
            _3000000 = -0x10000;
            while (_3000008-- != 0) {
                sub_8061204(_fontPtr);
                _fontPtr++;
            }
            _3000008 = 0;
            if (_3000024 != NULL) {
                deallocateBlock(_3000024);
            }
            _3000024 = NULL;
            _3000020 = 0;
        }
        if (_3000020 != 0) {
            while (_3000008-- != 0) {
                sub_8061204(_fontPtr);
                _fontPtr++;
            }
            if (_3000024 != NULL) {
                deallocateBlock(_3000024);
            }
            _3000008 = 0;
            totalWidth = 0;
            _currentCreditsPtr = _creditsPtr;
            while (_creditsPtr->text != NULL) {
                totalWidth += _creditsPtr->width;
                _creditsPtr++;
                _3000008++;
            }
            _creditsPtr++;
            _3000024 = slowAllocate(_3000008 * sizeof(SpriteTextCleanup));
            if (_3000024 == NULL) {
                printf("error allocating space for DisplayStrings in creditsFrontendHandler()\n");
            }
            _fontPtr = _3000024->address;
            x = 0x50 - (totalWidth >> 1);
            for (i = 0; i < _3000008; i++) {
                allocFont(&_fontPtr[i], &SpriteSheet_82B05EC, ShadowFontMeta, 0, x, 0xF0, 2);
                sub_8061660(&_fontPtr[i], _currentCreditsPtr[i].text, _currentCreditsPtr[i].color);
                sub_8061E58(&_fontPtr[i], 1);
                x += _currentCreditsPtr[i].width;
            }
            _3000010 = 0x10;
            _3000014 = 0x78;
            _3000020 = 0;
        }
        sub_80439A0(&state->bgLayers[1]);
        if (_3000000 != _3000004) {
            s32 delta;

            delta = (_3000000 - _3000004) >> 2;
            sub_80596AC(&state->bgLayers[3], delta, 0);
            _3000004 += delta;
        }
        break;
    case 2:
    default:
        break;
    }
}
