#include "sound.h"
#include "io_reg.h"
#include "macro.h"
#include "memory.h"
#include "unsorted.h"

typedef struct {
    u8 var00;
    u32 var04;
} SoundStructG;

typedef struct {
    /*0x00*/ u32 var00;
    /*0x04*/ SoundStructG var04[4];
} SoundStructF;

typedef struct {
    /*0x00*/ u8 pad00[4];
    /*0x04*/ u32 var04;
    /*0x08*/ u32 var08;
    /*0x0C*/ u8 pad0C[4];
    /*0x10*/ u8 data[0];
} SoundStructE;

typedef struct {
    /*0x00*/ SoundStructE* var00;
    /*0x04*/ u8 (*var04)[];
    /*0x10*/ void* var08;
    /*0x0C*/ u32 var0C;
    /*0x10*/ u16 var10;
    /*0x12*/ u8 pad12[2];
    /*0x14*/ u16 var14;
    /*0x16*/ u8 var16;
    /*0x17*/ u8 var17;
    /*0x18*/ int var18;
    /*0x1C*/ void* var1C;
    /*0x20*/ void* var20;
    /*0x24*/ u16 var24;
    /*0x26*/ u8 pad26[2];
} SoundStructA;

typedef struct SoundStructC {
    u32 var00;
    u32 var04;
    u32 var08;
} SoundStructC;

typedef struct {
    /*0x00*/ s16 var00;
} SoundStructB;

typedef struct {
    /*0x00*/ u8 var00;
} SoundStructD;

#define FIFO_ENABLE 7
#define DMA_A_VOLUME_100 2
#define DMA_A_ENABLE_RIGHT 8
#define DMA_A_ENABLE_LEFT 9
#define DMA_A_RESET_FIFO 11

#define min(a, b) (((a) < (b)) ? (a) : (b))

// Rounds an integer up to the given power of 2. y must be a power of 2.
#define ceil2(x, y) (((x) + (y)-1) & (~((y)-1)))

typedef void(ClearFn)(int, void*, int);

extern u8* _unk3000D90;
extern u32 _unk3000D94;
extern u32 (*_soundTables)[];
extern u32 _unk3000D9C;
extern u16 _unk3000DA0;
extern u16 _unk3000DA2;

extern u8 (*_unk3005E00)[];
extern u8 _unk3005E04;
extern s32 _unk3005E08;
extern u32 _unk3005E0C;
extern s32 _unk3005E10;
extern SfxTable* _unk3005E14;
extern u16 _unk3005E18;
extern u8 (*_soundMixer)[];
extern u32 _unk3005E20;
extern SoundStructA (*_unk3005E24)[2];
extern SoundStructF (*_unk3005E28)[16];
extern AllocatedBlock* _soundMixerBlock;
extern AllocatedBlock* _soundTableBlock;
// ???
extern SoundStructC _unk3005E40;
extern u16 _unk3005E4C;
extern u16 (*_soundMixerPlus)[];

// Actor?
extern u8 _unk3005E78;

void (*__sub_87577B4)(SoundStructA*, int, int);
void (*__sub_8757A64)(int, int, int);

extern ClearFn* __fastMemoryClearARM;

extern u32 Unk_8755B90[];

void sub_8062C24(void);

void Sound_8062B2C(void);

void Sound_8062328(u32 arg0)
{
    arg0 = min(arg0, 256);
    _unk3000DA0 = arg0;
}

u16 Sound_8062340(void)
{
    return _unk3000DA0;
}

static void Sound_806234C(void)
{
    if (_soundMixerBlock == NULL) {
        return;
    }

    REG_DMA1CNT = 0;
    REG_DMA2CNT = 0;
    REG_TM1CNT = 0;
    REG_TM0CNT = 0;

    deallocateBlock(_soundMixerBlock);

    if (_soundTableBlock != NULL) {
        deallocateBlock(_soundTableBlock);
    }

    _unk3005E28 = NULL;
    _soundMixerBlock = NULL;
    _soundMixer = NULL;
    _soundMixerPlus = NULL;
}

static void Sound_80623A8(u32 arg0)
{
    s32 i;

    u32* table = *_soundTables;
    u32* val = &Unk_8755B90[0];
    for (i = 127; i != -1; i--) {
        s64 longVal = *(val++) * (u64)11025;

        table[0] = ((longVal << 12) / 261) / arg0;
        table++;
    }

    _unk3000D90 = (u8*)_soundMixer;
    _unk3000D94 = 0x10000 - _unk3005E4C;
    _unk3000DA2 = -1;
    _unk3000DA0 = 256;
}

void allocateSoundTables(u32 arg0, u32 arg1)
{
    u32 bytes;

    Sound_806234C();

    arg1 = min(arg1, 16);
    arg0 = min(arg0, 44010);

    _unk3005E40.var00 = arg0;
    _unk3005E40.var04 = 1;
    _unk3005E40.var08 = 0;

    _unk3005E4C = ceil2(arg0 / 40, 16);
    _unk3005E18 = -_unk3005E4C;

    bytes = _unk3005E4C * 3 + arg1 * 40;
    _soundMixerBlock = fastAllocate(bytes);
    if (_soundMixerBlock == NULL) {
        printf("Not enough RAM for sound mixer: requires %i bytes\n", bytes);
    }
    _soundMixer = _soundMixerBlock->address;

    _soundTableBlock = slowAllocate(0x200 + 0x240);
    if (_soundTableBlock == NULL) {
        printf("Not enough EXRAM for sound tables: requires %i bytes\n", 0x200 + 0x240);
    }
    _soundTables = _soundTableBlock->address;
    _unk3005E28 = (void*)((uintptr_t)_soundTableBlock->address + 0x200);

    _soundMixerPlus = (void*)((uintptr_t)_soundMixer + _unk3005E4C);
    _unk3005E04 = arg1;

    _unk3005E24 = (SoundStructA(*)[2])(&(*_soundMixerPlus)[_unk3005E4C]);

    DmaFill32(3, 0, _soundMixer, bytes);
    Sound_80623A8(arg0);

    REG_SOUNDCNT_X = 0x80;
    REG_SOUNDCNT_H = 0xB04;

    REG_DMA1SAD = (uintptr_t)_soundMixer;
    REG_DMA1DAD = (uintptr_t)&REG_FIFO_A;
    REG_DMA1CNT = 0xB6000000;

    REG_TM1CNT = (0xC4 << 16) | (_unk3005E18 - 2);
    REG_TM0CNT = (0x80 << 16) | (0x10000 - (16780000 / arg0));

    _unk3005E00 = NULL;
    _unk3005E0C = 0;
}

void Sound_806261C(void)
{
    _unk3005E40.var04 = 0;
    REG_DMA1CNT = 0;
    REG_DMA2CNT = 0;
    REG_TM1CNT = 0;
    REG_TM0CNT = 0;
}

void Sound_806263C()
{
    REG_DMA1CNT = 0xB6000000;
    REG_TM1CNT = (0xC4 << 16) | (_unk3005E18 - 2);
    REG_TM0CNT = (0x80 << 16) | (0x10000 - (16780000 / _unk3005E40.var00));
    _unk3005E40.var04 = 1;
}

void Sound_8062694(void)
{
    REG_SOUNDCNT_X = 0;
    REG_SOUNDCNT_H = 0;
    REG_DMA1CNT = 0;
    REG_DMA2CNT = 0;
    REG_TM1CNT = 0;
    REG_TM0CNT = 0;

    __fastMemoryClearARM(0, _soundMixer, _unk3005E4C * 3);
}

void Sound_80626E0(void)
{
    REG_SOUNDCNT_X = (1 << FIFO_ENABLE);
    REG_SOUNDCNT_H = (1 << DMA_A_RESET_FIFO) | (1 << DMA_A_ENABLE_LEFT) | (1 << DMA_A_ENABLE_RIGHT)
        | (1 << DMA_A_VOLUME_100);

    REG_DMA1SAD = (uintptr_t)_soundMixer;
    REG_DMA1DAD = (uintptr_t)&REG_FIFO_A;
    REG_DMA1CNT = 0xB6000000;

    REG_TM1CNT = (0xC4 << 16) | (_unk3005E18 - 2);
    REG_TM0CNT = (0x80 << 16) | (0x10000 - (16780000 / _unk3005E40.var00));

    _unk3000D90 = (u8*)_soundMixer;
    _unk3000D94 = 0x10000 - _unk3005E4C;
}

void Sound_onTimer1Overflow(void)
{
    REG_DMA1CNT = 0;
    REG_DMA2CNT = 0;
    REG_TM1CNT = 0;
    REG_TM1CNT = (0xC4 << 16) | _unk3005E18;
    REG_DMA1CNT = 0xB6000000;
}

void Sound_80627A8(SoundStructA* arg0, int arg1, int arg2)
{
    uintptr_t start, end, current;

    if (arg0->var16 != 1) {
        return;
    }

    __sub_87577B4(arg0, arg1, arg2);

    end = 16 + ((uintptr_t)arg0->var00) + arg0->var00->var04;
    start = 16 + ((uintptr_t)arg0->var00) + arg0->var00->var08;
    current = (uintptr_t)arg0->var04;

    if (current < end) {
        return;
    }

    if (arg0->var00->var08 != 0) {
        arg0->var04 = (u8(*)[])(start + (current - end) % (end - start));
    } else {
        arg0->var16 = 0;
    }
}

#if 0
void sub_80627F0(void)
{
    u32 varA, varB;
    int r10, r5;
    u16 var;
    int i;

    SoundStructA* channel = *_unk3005E24;
    u8 e04 = _unk3005E04;

    if (_soundMixer == NULL) {
        return;
    }

    if (_unk3005E40.var04 == 0) {
        return;
    }

    sub_8062C24();

    varA = _unk3000D94;
    varB = (_unk3005E40.var08 + 1) & -2;

    var = (REG_TM1CNT + 1) & -2;
    if (var == 0x10000) {
        var = _unk3005E18;
    }
    _unk3000D94 = var;

    if (_unk3000D94 > varA) {
        r5 = _unk3000D94 - _unk3000D94;
        r10 = 0;
    } else {
        r5 = 0x10000 - _unk3000D94;
        r10 = _unk3005E4C + 0xFFFF0000 + _unk3000D94;
    }

    _unk3005E78 = 0;

    for (i = e04 - 1; i != -1; i--) {
        sub_80627A8(channel, r5 + r10, _unk3000DA0);
        channel++;
    }
    // loop

    __sub_8757A64((int)*_unk3000D90, r5, 0);
    _unk3000D90 += r5;

    if (r10 != 0) {
        _unk3000D90 -= _unk3005E4C;
        __sub_8757A64((int)*_unk3000D90, r10, r5);
        _unk3000D90 += r10;
    }

    if (_unk3000D90 == (u8*)_soundMixer + _unk3005E4C) {
        _unk3000D90 -= _unk3005E4C;
    }
}
#endif

static void Sound_8062910(SoundStructA* arg0, SoundStructE* arg1, u32 arg2)
{
    arg0->var16 = 1;
    arg0->var00 = arg1;
    arg0->var14 = 0;
    arg0->var17 = 0;
    arg0->var10 = 256;
    arg0->var04 = &arg1->data;

    arg2 = (arg2 > 0x7F ? 0x7F : arg2);
    arg0->var08 = (void*)(*_soundTables)[arg2];

    arg0->var0C = 0;
    arg0->var1C = NULL;
    arg0->var20 = NULL;
    arg0->var24 = 0;
}

static void Sound_8062950(SoundStructA* arg0, SoundStructE* (*segments)[], s16 (*order)[])
{
    SoundStructE* data = (*segments)[(*order)[0]];

    arg0->var16 = 1;
    arg0->var00 = data;
    arg0->var14 = 0;
    arg0->var17 = 0;
    arg0->var10 = 256;
    arg0->var04 = &data->data;
    arg0->var08 = (void*)(*_soundTables)[0];
    arg0->var0C = 0;
    arg0->var1C = segments;
    arg0->var20 = order;
    arg0->var24 = 1;
}

s32 Sound_8062990(SoundStructE* (*segments)[], s16 (*order)[])
{
    int i;

    SoundStructA* var1 = &(*_unk3005E24)[0];
    for (i = _unk3005E04 - 1; i != -1; i--) {
        if (var1->var16 == 0) {
            Sound_8062950(var1, segments, order);
            var1->var18 = _unk3000D9C++;

            return var1->var18;
        }

        var1++;
    }

    printf("Out of audio channels\n");
    return -1;
}

s32 Sound_80629F0(SoundStructE* arg0, int arg1)
{
    int i;

    SoundStructA* var1 = &(*_unk3005E24)[0];
    for (i = _unk3005E04 - 1; i != -1; i--) {
        if (var1->var16 == 0) {
            Sound_8062910(var1, arg0, (u32)arg1);
            var1->var18 = _unk3000D9C++;

            return var1->var18;
        }

        var1++;
    }

    printf("Out of audio channels\n");
    return -1;
}

static SoundStructA* Sound_8062A50(int arg0)
{
    int i;

    SoundStructA* var1 = &(*_unk3005E24)[0];
    for (i = _unk3005E04 - 1; i != -1; i--) {
        if (var1->var16 != 0 && var1->var18 == arg0) {
            return var1;
        }

        var1++;
    }

    return NULL;
}

void Sound_8062A90(int arg0)
{
    SoundStructA* var;

    var = Sound_8062A50(arg0);
    if (var != NULL) {
        var->var16 = 0;
    }
}

void Sound_8062AA4(int arg0)
{
    SoundStructA* var;

    var = Sound_8062A50(arg0);
    if (var != NULL) {
        var->var16 = 2;
    }
}

void Sound_8062AB8(int arg0)
{
    SoundStructA* var;

    var = Sound_8062A50(arg0);
    if (var != NULL && var->var16 == 2) {
        var->var16 = 1;
    }
}
ASM_ZEROPAD

void Sound_8062AD4(int arg0, u32 arg1)
{
    SoundStructA* var;

    var = Sound_8062A50(arg0);
    if (var != NULL) {
        if (arg1 > 256) {
            arg1 = 256;
        }
        var->var10 = arg1;
    }
}
ASM_ZEROPAD

void Sound_8062AF4(int arg0, u32 arg1)
{
    SoundStructA* var;

    var = Sound_8062A50(arg0);
    if (var != NULL) {
        if (arg1 > 127) {
            arg1 = 127;
        }

        var->var08 = (void*)(*_soundTables)[arg1];
    }
}

void Sound_8062B20(SfxTable* table)
{
    _unk3005E14 = table;
}

void Sound_8062B2C(void)
{
    u32 i, n;

    if (_unk3005E0C != 1) {
        return;
    }

    for (i = 0; i < 16; i++) {
        for (n = 0; n < 4; n++) {
            if ((*_unk3005E28)[i].var04[n].var00 != 0) {
                Sound_8062A90((*_unk3005E28)[i].var04[n].var04);
                (*_unk3005E28)[i].var04[n].var00 = 0;
            }
        }
    }

    _unk3005E0C = 0;
}

void Sound_8062B90()
{
    if (_unk3005E00 != NULL) {
        _unk3005E0C = 1;
    }
}

void Sound_8062BA8(int arg0)
{
    if (arg0 >= _unk3005E14->var00) {
        return;
    }

    Sound_8062B2C();

    _unk3005E00 = (u8(*)[])(*_unk3005E14->var08)[arg0][0];
    _unk3005E20 = (u32)(*_unk3005E14->var08)[arg0][1];

    _unk3005E08 = 0;
    _unk3005E10 = 0;
    _unk3005E0C = 1;
}

s32 Sound_8062BFC(int arg0, int arg1)
{
    if (arg0 >= _unk3005E14->count) {
        return;
    }

    return Sound_80629F0((SoundStructE*)(*_unk3005E14->data)[arg0], arg1);
}
/*
void sub_8062C24(void) {
    if (_unk3005E0C != 1) {
        return;
    }

    _unk3005E08 -= _unk3005E10;

    while (_unk3005E08 < 0) {
        u8 byte = (*_unk3005E00++)[0];

        if (!(byte & 0x80)) {
            _unk3005E08 += (byte << 8 | (*_unk3005E00++)[0]) << 16;

            continue;
        }
        switch (byte >> 4) {
        case 8: {
            int i;
            u8 byte2 = (*_unk3005E00++)[0];
            _unk3005E00++;

            for (i = 4; i != 0; i--) {

            }
        }

            break;
        case 9:
        {
            u8 byte1 = (*_unk3005E00++)[0];
            u8 byte2 = (*_unk3005E00++)[0];

            u8 index = byte&0xF;

            if(*_unk3005E28[index][0] == 0) {
                break;
            }
        }
            break;
        case 11:
            switch (byte & 0xF) {
            case 0:
                _unk3005E00 = (u8[]) _unk3005E20;
                break;
            case 1:
                _unk3005E00++;
                break;
            case 2:
                break;
            case 3:
                printf("End track here\n");
                break;
            }
            break;
        case 12:
        case 13:
            _unk3005E00++;
            break;
        }
    }

}*/

int Sound_8062E54(int arg0)
{
    SoundStructA* var1 = Sound_8062A50(arg0);

    if (var1 != NULL && var1->var16 != 0) {
        return true;
    }

    return false;
}
ASM_ZEROPAD
