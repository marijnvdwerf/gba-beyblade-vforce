#include "sound.h"
#include "io_reg.h"
#include "macro.h"
#include "memory.h"
#include "unsorted.h"

extern u8 (*_soundMixer)[];
extern void* _unk3005E28;
extern AllocatedBlock* _soundMixerBlock;
extern AllocatedBlock* _soundTableBlock;

extern void* _unk3000D90;
extern u16 _unk3005E4C;
extern u16 _unk3000DA0;
extern u16 _unk3000DA2;
extern u32 _unk3000D94;

extern u32 (*_soundTables)[];

extern u32 Unk_8755B90[];

extern u16 (*_soundMixerPlus)[];

void sub_806234C(void)
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

void sub_80623A8(u32 arg0)
{
    s32 i;

    u32* table = *_soundTables;
    u32* val = &Unk_8755B90[0];
    for (i = 127; i != -1; i--) {
        s64 longVal = *(val++) * (u64)11025;

        table[0] = ((longVal << 12) / 261) / arg0;
        table++;
    }

    _unk3000D90 = _soundMixer;
    _unk3000D94 = 0x10000 - _unk3005E4C;
    _unk3000DA2 = -1;
    _unk3000DA0 = 256;
}

typedef void(ClearFn)(int, void*, int);

extern ClearFn* __fastMemoryClearARM;

void sub_8062694(void)
{
    REG_SOUNDCNT_X = 0;
    REG_SOUNDCNT_H = 0;
    REG_DMA1CNT = 0;
    REG_DMA2CNT = 0;
    REG_TM1CNT = 0;
    REG_TM0CNT = 0;

    __fastMemoryClearARM(0, _soundMixer, _unk3005E4C * 3);
}

#define FIFO_ENABLE 7
#define DMA_A_VOLUME_100 2
#define DMA_A_ENABLE_RIGHT 8
#define DMA_A_ENABLE_LEFT 9
#define DMA_A_RESET_FIFO 11

extern u16 _unk3005E18;
extern u32 _unk3005E40;

void sub_80626E0(void)
{
    REG_SOUNDCNT_X = (1 << FIFO_ENABLE);
    REG_SOUNDCNT_H = (1 << DMA_A_RESET_FIFO) | (1 << DMA_A_ENABLE_LEFT) | (1 << DMA_A_ENABLE_RIGHT)
        | (1 << DMA_A_VOLUME_100);

    REG_DMA1SAD = (uintptr_t)_soundMixer;
    REG_DMA1DAD = (uintptr_t)&REG_FIFO_A;
    REG_DMA1CNT = 0xB6000000;

    REG_TM1CNT = (0xC4 << 16) | (_unk3005E18 - 2);
    REG_TM0CNT = (0x80 << 16) | (0x10000 - (16780000 / _unk3005E40));

    _unk3000D90 = _soundMixer;
    _unk3000D94 = 0x10000 - _unk3005E4C;
}

void sub_8062774()
{
    REG_DMA1CNT = 0;
    REG_DMA2CNT = 0;
    REG_TM1CNT = 0;
    REG_TM1CNT = (0xC4 << 16) | _unk3005E18;
    REG_DMA1CNT = 0xB6000000;
}

extern u8 _unk3005E04;

#if 0
s32 sub_8062990(void*segments[], s16* order) {
s32 channels = _unk3005E04-1;

    while(channels != -1) {

    }

    printf("Out of audio channels\n");
    return -1;
}
#endif

SfxTable* _unk3005E14;

void sub_8062B20(SfxTable* table)
{
    _unk3005E14 = table;
}

void* sub_80629F0(s8* data, int);

void* sub_8062BFC(int arg0, int arg1)
{
    if (arg0 >= _unk3005E14->count) {
        return;
    }

    return sub_80629F0((*_unk3005E14->data)[arg0], arg1);
}
