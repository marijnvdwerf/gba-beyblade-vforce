#ifndef _RAM_H
#define _RAM_H

#include "common.h"
#include "memory.h"

typedef struct RenderData {
    u8 data;
} RenderData;

typedef struct GameData {
    u8 padBA0[0xBA0];
    RenderData varBA0;
} GameData;

extern GameData* _gameData;
extern u32 _unk3000E30[3];
extern u8 _unk3000FE0[304];
extern u32 _unk3001110[16];

extern void* _unk3000DF0[14];

#endif // _RAM_H
