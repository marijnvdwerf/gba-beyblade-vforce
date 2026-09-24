#include "language.h"

u8 languageTextIndices[21] = { 0 };
u32 currentLanguage = 0;

void initLanguages(void)
{
    s32 i;

    for (i = 0; i < 21; i++) {
        languageTextIndices[i] = 0;
    }
}

void addLanguage(u32 arg0, u32 arg1)
{
    if (arg0 < 21) {
        languageTextIndices[arg0] = arg1;
    }
}

void setLanguage(u32 arg0)
{
    currentLanguage = arg0;
}

u32 getLanguage(void)
{
    return currentLanguage;
}

u8 getTextIndexForLanguage(u32 arg0)
{
    return languageTextIndices[arg0];
}

u32 getLanguageTextIndex(void)
{
    return languageTextIndices[currentLanguage];
}
