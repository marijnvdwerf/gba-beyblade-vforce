#ifndef BEY_COMMON
#define BEY_COMMON

#include <agb/types.h>

typedef u8 bool8;
typedef u16 bool16;
typedef u32 bool32;

typedef u8 unk8;
typedef u16 unk16;
typedef u32 unk32;

typedef struct Unk3000650 {
    unk8 unk0[0xC];
    unk32 unkC;
    unk32 unk10;
    unk8 unk14[0x40];
} Unk3000650;

typedef struct UnkMenu {
    unk8 unk0[0x24];
    unk32 unk24;
} UnkMenu;

typedef struct UnkTrail {
    unk8 unk0[0x10];
    unk32 unk10;
    unk32 unk14;
    unk8 unk18[0x14];
    unk16 unk2C;
} UnkTrail;

typedef struct UnkActor {
    unk8 unk0[0x8D];
    unk8 unk8D;
} UnkActor;

typedef struct UnkSpriteText {
    unk8 unk0[0x28];
    unk8 unk28;
    unk8 unk29;
    unk8 unk2A;
} UnkSpriteText;

typedef struct SpriteTextCleanup {
    unk8 unk0[0x14];
    unk8 unk14[0x18];
    void* ptr2C;
} SpriteTextCleanup;

typedef struct LevelState {
    unk16 unk0;
    unk16 unk2;
    s32 unk4;
} LevelState;

typedef struct ActiveLevelDescription {
    unk8 pad0[0x11];
    unk8 unk11;
    unk8 pad12[6];
    unk32 unk18;
} ActiveLevelDescription;

typedef struct LevelDescription {
    unk8 unk0[8];
    s32 unk8;
    unk8 unkC[0x10];
    unk8 unk1C;
    unk8 unk1D[3];
    s32 unk20;
    s32 unk24;
    s32 unk28;
} LevelDescription;

typedef struct LevelGeometryTable {
    unk8 pad0[8];
    s32 unk8;
} LevelGeometryTable;

typedef struct LevelGeometryAddresses {
    LevelGeometryTable* unk0;
    void* unk4;
    void* unk8;
    void* unkC;
    unk32 unk10;
    void* spline[0x40];
    void* metadata;
    u16 lineCount;
} LevelGeometryAddresses;

#define true 1
#define false 0

#define min(a, b) (((a) < (b)) ? (a) : (b))
#define max(a, b) (((a) > (b)) ? (a) : (b))

#define ASM_ZEROPAD asm(".align 2, 0\n");

#endif // BEY_COMMON
