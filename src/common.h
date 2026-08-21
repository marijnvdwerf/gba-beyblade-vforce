#ifndef BEY_COMMON
#define BEY_COMMON

#include <agb/types.h>

typedef u8 bool8;
typedef u16 bool16;
typedef u32 bool32;

typedef u8 unk8;
typedef u16 unk16;
typedef u32 unk32;

typedef struct AllocatedBlock AllocatedBlock;

struct AllocatedBlock {
    void* address;
    u32 size;
    AllocatedBlock* previous;
    AllocatedBlock* next;
};

typedef struct UnkMotion {
    AllocatedBlock* block;
    unk32 unk4;
    unk32 unk8;
    unk16 unkC;
    unk16 unkE;
    unk32 unk10;
    unk32 unk14;
} UnkMotion;

typedef struct FrontendSubobject {
    unk8 pad0[0x14];
    unk32 unk14;
    unk8 pad18[8];
    unk32 unk20;
} FrontendSubobject;

typedef struct FrontendObject {
    unk8 pad0[4];
    FrontendSubobject* unk4;
} FrontendObject;

typedef struct FrontendState {
    unk32 unk0;
    unk32 unk4;
    unk32 unk8;
    unk32 unkC;
    unk32 unk10;
    unk8 unk14[0x68];
    unk8 unk7C;
    unk8 unk7D;
    unk8 unk7E;
    unk8 unk7F;
    unk8 unk80;
    unk8 unk81;
    unk8 pad82[0x32];
    FrontendObject* unkB4;
    unk8 padB8[0x36C];
    unk32 unk424;
    unk8 pad428[0x30];
    UnkMotion motion;
    unk32 unk470;
    unk16 unk474;
    unk8 pad476[0xB];
    unk8 unk481;
    unk8 pad482[0xF6];
    unk32 unk578;
    unk32 unk57C;
    unk32 unk580;
    unk8 unk584;
    s8 unk585;
    unk8 unk586;
    unk8 pad587[1];
    unk32 unk588;
    unk32 unk58C;
    unk8 unk590[0x18];
    unk32 unk5A8;
} FrontendState;

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

#define true 1
#define false 0

#define min(a, b) (((a) < (b)) ? (a) : (b))
#define max(a, b) (((a) > (b)) ? (a) : (b))

#define ASM_ZEROPAD asm(".align 2, 0\n");

#endif // BEY_COMMON
