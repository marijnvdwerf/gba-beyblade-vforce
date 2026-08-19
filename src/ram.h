#ifndef _RAM_H
#define _RAM_H

#include "common.h"
#include "memory.h"

typedef struct RenderData {
    u8 data;
} RenderData;

typedef struct GameData {
    unk8 pad0[0xB88];
    unk8 unkB88[0x18];
    RenderData varBA0;
    unk8 unkBA1[0x185];
    unk16 unkC26;
} GameData;

typedef struct CurrentGameState {
    unk8 unk0;
    unk8 unk1;
    unk8 unk2;
    unk8 unk3;
    unk8 unk4[0x6A8];
    unk16 unk6AC;
    unk16 unk6AE;
    AllocatedBlock* unk6B0;
    unk32 unk6B4;
    unk8 unk6B8[0x2C];
    unk16 unk6E4;
    unk16 unk6E6;
    unk8 unk6E8[2];
    unk16 unk6EA;
    unk8 unk6EC[0x578];
    unk32 unkC64;
    unk32 unkC68;
} CurrentGameState;

extern GameData* _gameData;
extern u32 _unk3000E30[3];
extern CurrentGameState* _currentGameState;
extern u8 _unk3000FE0[304];
extern u32 _unk3001110[16];

extern void* _unk3000DF0[14];

#endif // _RAM_H
