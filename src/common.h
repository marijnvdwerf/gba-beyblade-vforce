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

typedef struct UnkMotion {
    unk8 unk0[0xE];
    unk16 unkE;
} UnkMotion;

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

#define true 1
#define false 0

#define min(a, b) (((a) < (b)) ? (a) : (b))
#define max(a, b) (((a) > (b)) ? (a) : (b))

#define ASM_ZEROPAD asm(".align 2, 0\n");

#endif // BEY_COMMON
