#ifndef _LANGUAGE_H
#define _LANGUAGE_H

#include "common.h"

extern u8 languageTextIndices[21];
extern u32 currentLanguage;

void initLanguages(void);
void addLanguage(u32, u32);
void setLanguage(u32);
u32 getLanguage(void);
u8 getTextIndexForLanguage(u32);
u32 getLanguageTextIndex(void);

#endif
