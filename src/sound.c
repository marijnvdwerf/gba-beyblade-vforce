#include "sound.h"

#include <agb/macro.h>

#include "include_asm.h"
#include "memory.h"
#include "unsorted.h"

typedef struct {
    u8 var00;
    unk32 var04;
} SoundStructG;

typedef struct {
    /* 0x00 */ unk32 var00;
    /* 0x04 */ SoundStructG var04[4];
} SoundStructF;

struct SoundStructE {
    /* 0x00 */ unk8 pad00[4];
    /* 0x04 */ unk32 var04;
    /* 0x08 */ unk32 var08;
    /* 0x0C */ unk8 pad0C[4];
    /* 0x10 */ unk8 data[0];
};

typedef struct {
    /* 0x00 */ SoundStructE* var00;
    /* 0x04 */ unk8 (*var04)[];
    /* 0x10 */ void* var08;
    /* 0x0C */ unk32 var0C;
    /* 0x10 */ unk16 var10;
    /* 0x12 */ unk8 pad12[2];
    /* 0x14 */ unk16 var14;
    /* 0x16 */ u8 var16;
    /* 0x17 */ unk8 var17;
    /* 0x18 */ unk32 var18;
    /* 0x1C */ void* var1C;
    /* 0x20 */ void* var20;
    /* 0x24 */ unk16 var24;
    /* 0x26 */ unk8 pad26[2];
} SoundStructA;

typedef struct SoundStructC {
    u32 var00;
    unk32 var04;
    unk32 var08;
} SoundStructC;

typedef struct {
    /* 0x00 */ unk16 var00;
} SoundStructB;

typedef struct {
    /* 0x00 */ unk8 var00;
} SoundStructD;

#define ceil2(x, y) (((x) + (y) - 1) & (~((y) - 1)))

extern unk8* _unk3000D90;
extern unk32 _unk3000D94;
extern unk32 (*_soundTables)[];
extern unk32 _unk3000D9C;
extern u16 _unk3000DA0;
extern u16 _unk3000DA2;

extern unk8 (*_unk3005E00)[];
extern u8 _unk3005E04;
extern unk32 _unk3005E08;
extern unk32 _unk3005E0C;
extern unk32 _unk3005E10;
extern SfxTable* _unk3005E14;
extern u16 _unk3005E18;
extern unk8 (*_soundMixer)[];
extern unk32 _unk3005E20;
extern SoundStructA (*_unk3005E24)[2];
extern SoundStructF (*_unk3005E28)[16];
extern AllocatedBlock* _soundMixerBlock;
extern AllocatedBlock* _soundTableBlock;

extern SoundStructC _unk3005E40;
extern u16 _unk3005E4C;
extern unk16 (*_soundMixerPlus)[];

extern unk8 _unk3005E78;

void (*__sub_87577B4)(SoundStructA*, unk32, unk32);
void (*__sound_8757A64)(unk32, unk32, unk32);

#define FIXED_16_16(hz) ((unk32)((hz) * 65536.0))

const u32 MidiNoteFrequencies[128] = {
    FIXED_16_16(8.1758),
    FIXED_16_16(8.66196),
    FIXED_16_16(9.17702),
    FIXED_16_16(9.72272),
    FIXED_16_16(10.30086),
    FIXED_16_16(10.91338),
    FIXED_16_16(11.56232),
    FIXED_16_16(12.24985),
    FIXED_16_16(12.9782715),
    FIXED_16_16(13.75),
    FIXED_16_16(14.567612),
    FIXED_16_16(15.43385315),
    FIXED_16_16(16.3516),
    FIXED_16_16(17.323914),
    FIXED_16_16(18.354034424),
    FIXED_16_16(19.445435),
    FIXED_16_16(20.60172),
    FIXED_16_16(21.826752),
    FIXED_16_16(23.12465),
    FIXED_16_16(24.4997101),
    FIXED_16_16(25.956543),
    FIXED_16_16(27.5),
    FIXED_16_16(29.1352234),
    FIXED_16_16(30.86771),
    FIXED_16_16(32.7032),
    FIXED_16_16(34.64783),
    FIXED_16_16(36.70808411),
    FIXED_16_16(38.89087),
    FIXED_16_16(41.2034302),
    FIXED_16_16(43.65352),
    FIXED_16_16(46.2493),
    FIXED_16_16(48.9994202),
    FIXED_16_16(51.9131),
    FIXED_16_16(55),
    FIXED_16_16(58.27046204),
    FIXED_16_16(61.735413),
    FIXED_16_16(65.4064),
    FIXED_16_16(69.2956543),
    FIXED_16_16(73.4161835),
    FIXED_16_16(77.78174),
    FIXED_16_16(82.40688),
    FIXED_16_16(87.307053),
    FIXED_16_16(92.4986),
    FIXED_16_16(97.99886),
    FIXED_16_16(103.826172),
    FIXED_16_16(110),
    FIXED_16_16(116.54094),
    FIXED_16_16(123.47083),
    FIXED_16_16(130.812775),
    FIXED_16_16(138.59131),
    FIXED_16_16(146.83238220215),
    FIXED_16_16(155.5635),
    FIXED_16_16(164.81377),
    FIXED_16_16(174.61411),
    FIXED_16_16(184.99721),
    FIXED_16_16(195.9977112),
    FIXED_16_16(207.652344),
    FIXED_16_16(220),
    FIXED_16_16(233.08188),
    FIXED_16_16(246.9416504),
    FIXED_16_16(261.625565),
    FIXED_16_16(277.18262),
    FIXED_16_16(293.6647644043),
    FIXED_16_16(311.126984),
    FIXED_16_16(329.62755),
    FIXED_16_16(349.22823),
    FIXED_16_16(369.99442),
    FIXED_16_16(391.9954224),
    FIXED_16_16(415.3047),
    FIXED_16_16(440),
    FIXED_16_16(466.16376),
    FIXED_16_16(493.883301),
    FIXED_16_16(523.25113),
    FIXED_16_16(554.36525),
    FIXED_16_16(587.32953),
    FIXED_16_16(622.25397),
    FIXED_16_16(659.255112),
    FIXED_16_16(698.45645142),
    FIXED_16_16(739.988831),
    FIXED_16_16(783.99086),
    FIXED_16_16(830.6094),
    FIXED_16_16(880),
    FIXED_16_16(932.327515),
    FIXED_16_16(987.766602),
    FIXED_16_16(1046.50226),
    FIXED_16_16(1108.730515),
    FIXED_16_16(1174.65906),
    FIXED_16_16(1244.507935),
    FIXED_16_16(1318.5102234),
    FIXED_16_16(1396.91292),
    FIXED_16_16(1479.97768),
    FIXED_16_16(1567.98174),
    FIXED_16_16(1661.218781),
    FIXED_16_16(1760),
    FIXED_16_16(1864.655045),
    FIXED_16_16(1975.533203125),
    FIXED_16_16(2093.00452),
    FIXED_16_16(2217.461044312),
    FIXED_16_16(2349.3181305),
    FIXED_16_16(2489.01587),
    FIXED_16_16(2637.02045),
    FIXED_16_16(2793.82585144043),
    FIXED_16_16(2959.95537),
    FIXED_16_16(3135.9635),
    FIXED_16_16(3322.43758),
    FIXED_16_16(3520),
    FIXED_16_16(3729.3101),
    FIXED_16_16(3951.06641),
    FIXED_16_16(4186.009033203125),
    FIXED_16_16(4434.9221),
    FIXED_16_16(4698.63628),
    FIXED_16_16(4978.03174),
    FIXED_16_16(5274.04091),
    FIXED_16_16(5587.651703),
    FIXED_16_16(5919.910751343),
    FIXED_16_16(6271.92697144),
    FIXED_16_16(6644.875153),
    FIXED_16_16(7040),
    FIXED_16_16(7458.62018),
    FIXED_16_16(7902.1328125),
    FIXED_16_16(8372.018082),
    FIXED_16_16(8869.84418),
    FIXED_16_16(9397.27257),
    FIXED_16_16(9956.06348),
    FIXED_16_16(10548.08182),
    FIXED_16_16(11175.30341),
    FIXED_16_16(11839.82152),
    FIXED_16_16(12543.853943),
};

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

    *(vu32*)REG_DMA1CNT = 0;
    *(vu32*)REG_DMA2CNT = 0;
    *(vu32*)REG_TM1CNT = 0;
    *(vu32*)REG_TM0CNT = 0;

    deallocateBlock(_soundMixerBlock);

    if (_soundTableBlock != NULL) {
        deallocateBlock(_soundTableBlock);
    }

    _unk3005E28 = NULL;
    _soundMixerBlock = NULL;
    _soundMixer = NULL;
    _soundMixerPlus = NULL;
}

#define SAMPLE_RATE 11025
#define MIDDLE_C_HZ 261

static void Sound_80623A8(u32 mixerOutputRate)
{
    unk32 i;

    unk32* table = *_soundTables;
    const u32* frequencyCursor = MidiNoteFrequencies;
    for (i = 127; i != -1; i--) {
        s64 scaledFrequency = *(frequencyCursor++) * (u64)SAMPLE_RATE;

        *table++ = ((scaledFrequency << 12) / MIDDLE_C_HZ) / mixerOutputRate;
    }

    _unk3000D90 = (unk8*)_soundMixer;
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

    DmaClear(3, 0, _soundMixer, bytes, 32);
    Sound_80623A8(arg0);

    *(vu16*)REG_SOUNDCNT_X = SOUND_DMG_ON;
    *(vu16*)REG_SOUNDCNT_H
        = SOUND_A_MIX_FULL | ((SOUND_A_FIFO_RESET | SOUND_A_SO2_ON | SOUND_A_SO1_ON) << 8);

    *(vu32*)REG_DMA1SAD = (uintptr_t)_soundMixer;
    *(vu32*)REG_DMA1DAD = REG_FIFO_A;
    *(vu32*)REG_DMA1CNT = DMA_ENABLE | DMA_TIMMING_SOUND | DMA_32BIT_BUS | DMA_CONTINUOUS_ON;

    *(vu32*)REG_TM1CNT = (0xC4 << 16) | (_unk3005E18 - 2);
    *(vu32*)REG_TM0CNT = (0x80 << 16) | (0x10000 - (16780000 / arg0));

    _unk3005E00 = NULL;
    _unk3005E0C = 0;
}

void Sound_806261C(void)
{
    _unk3005E40.var04 = 0;
    *(vu32*)REG_DMA1CNT = 0;
    *(vu32*)REG_DMA2CNT = 0;
    *(vu32*)REG_TM1CNT = 0;
    *(vu32*)REG_TM0CNT = 0;
}

void Sound_806263C()
{
    *(vu32*)REG_DMA1CNT = DMA_ENABLE | DMA_TIMMING_SOUND | DMA_32BIT_BUS | DMA_CONTINUOUS_ON;
    *(vu32*)REG_TM1CNT = (0xC4 << 16) | (_unk3005E18 - 2);
    *(vu32*)REG_TM0CNT = (0x80 << 16) | (0x10000 - (16780000 / _unk3005E40.var00));
    _unk3005E40.var04 = 1;
}

void Sound_8062694(void)
{
    *(vu16*)REG_SOUNDCNT_X = 0;
    *(vu16*)REG_SOUNDCNT_H = 0;
    *(vu32*)REG_DMA1CNT = 0;
    *(vu32*)REG_DMA2CNT = 0;
    *(vu32*)REG_TM1CNT = 0;
    *(vu32*)REG_TM0CNT = 0;

    __fastMemoryClearARM(0, _soundMixer, _unk3005E4C * 3);
}

void Sound_80626E0(void)
{
    *(vu16*)REG_SOUNDCNT_X = SOUND_DMG_ON;
    *(vu16*)REG_SOUNDCNT_H
        = SOUND_A_MIX_FULL | ((SOUND_A_FIFO_RESET | SOUND_A_SO2_ON | SOUND_A_SO1_ON) << 8);

    *(vu32*)REG_DMA1SAD = (uintptr_t)_soundMixer;
    *(vu32*)REG_DMA1DAD = REG_FIFO_A;
    *(vu32*)REG_DMA1CNT = DMA_ENABLE | DMA_TIMMING_SOUND | DMA_32BIT_BUS | DMA_CONTINUOUS_ON;

    *(vu32*)REG_TM1CNT = (0xC4 << 16) | (_unk3005E18 - 2);
    *(vu32*)REG_TM0CNT = (0x80 << 16) | (0x10000 - (16780000 / _unk3005E40.var00));

    _unk3000D90 = (unk8*)_soundMixer;
    _unk3000D94 = 0x10000 - _unk3005E4C;
}

void Sound_onTimer1Overflow(void)
{
    *(vu32*)REG_DMA1CNT = 0;
    *(vu32*)REG_DMA2CNT = 0;
    *(vu32*)REG_TM1CNT = 0;
    *(vu32*)REG_TM1CNT = (0xC4 << 16) | _unk3005E18;
    *(vu32*)REG_DMA1CNT = DMA_ENABLE | DMA_TIMMING_SOUND | DMA_32BIT_BUS | DMA_CONTINUOUS_ON;
}

void Sound_80627A8(SoundStructA* arg0, unk32 arg1, unk32 arg2)
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
        arg0->var04 = (unk8(*)[])(start + (current - end) % (end - start));
    } else {
        arg0->var16 = 0;
    }
}

#if 0
void sub_80627F0(void)
{
    unk8* audioCursor;
    unk32 channelCount;
    unk32 firstChunkLength;
    unk32 mixLength;
    unk32 wrapDistance;
    unk32 alignedFrameCount;
    unk32 nextTimerPosition;
    unk32 previousTimerPosition;
    SoundStructA* channel;
    SoundStructC* state;
    unk32* position;

    channel = &(*_unk3005E24)[0];
    channelCount = _unk3005E04;
    if (_soundMixer != 0) {
        state = &_unk3005E40;
        if (state->var04 == 0) {
            return;
        }
        sub_8062C24();
        position = &_unk3000D94;
        previousTimerPosition = *position;
        alignedFrameCount = (state->var08 + 1) & -2;
        nextTimerPosition = (*(vu16*)REG_TM1CNT + 1) & ~1;
        if (nextTimerPosition == 0x10000) {
            nextTimerPosition = _unk3005E18;
        }
        *position = nextTimerPosition;
        if (nextTimerPosition > previousTimerPosition) {
            firstChunkLength = nextTimerPosition - previousTimerPosition;
            wrapDistance = 0;
        } else {
            firstChunkLength = 0x10000 - previousTimerPosition;
            wrapDistance = _unk3005E4C + 0xFFFF0000 + nextTimerPosition;
        }
        mixLength = firstChunkLength + wrapDistance;
        _unk3005E78 = 0;
        channelCount -= 1;
        if (channelCount != -1) {
            do {
                Sound_80627A8(channel, mixLength, _unk3000DA0);
                channel++;
                channelCount -= 1;
            } while (channelCount != -1);
        }
        __sound_8757A64((unk32)_unk3000D90, firstChunkLength, 0);
        audioCursor = _unk3000D90 + firstChunkLength;
        _unk3000D90 = audioCursor;
        if (wrapDistance != 0) {
            audioCursor -= _unk3005E4C;
            _unk3000D90 = audioCursor;
            __sound_8757A64((unk32)audioCursor, wrapDistance, firstChunkLength);
            audioCursor += wrapDistance;
            _unk3000D90 = audioCursor;
        }
        if (_unk3000D90 == ((unk8*)_soundMixer + _unk3005E4C)) {
            _unk3000D90 -= _unk3005E4C;
        }
    }
}

#endif

INCLUDE_ASM("asm/dump/sound/80627f0.s");

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

unk32 Sound_8062990(SoundStructE* (*segments)[], s16 (*order)[])
{
    unk32 i;

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

unk32 Sound_80629F0(SoundStructE* arg0, unk32 arg1)
{
    unk32 i;

    SoundStructA* var1 = &(*_unk3005E24)[0];
    for (i = _unk3005E04 - 1; i != -1; i--) {
        if (var1->var16 == 0) {
            Sound_8062910(var1, arg0, (unk32)arg1);
            var1->var18 = _unk3000D9C++;

            return var1->var18;
        }

        var1++;
    }

    printf("Out of audio channels\n");
    return -1;
}

static SoundStructA* Sound_8062A50(unk32 arg0)
{
    unk32 i;

    SoundStructA* var1 = &(*_unk3005E24)[0];
    for (i = _unk3005E04 - 1; i != -1; i--) {
        if (var1->var16 != 0 && var1->var18 == arg0) {
            return var1;
        }

        var1++;
    }

    return NULL;
}

void Sound_8062A90(unk32 arg0)
{
    SoundStructA* var;

    var = Sound_8062A50(arg0);
    if (var != NULL) {
        var->var16 = 0;
    }
}

void Sound_8062AA4(unk32 arg0)
{
    SoundStructA* var;

    var = Sound_8062A50(arg0);
    if (var != NULL) {
        var->var16 = 2;
    }
}

void Sound_8062AB8(unk32 arg0)
{
    SoundStructA* var;

    var = Sound_8062A50(arg0);
    if (var != NULL && var->var16 == 2) {
        var->var16 = 1;
    }
}

void Sound_8062AD4(unk32 arg0, u32 arg1)
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

void Sound_8062AF4(unk32 arg0, u32 arg1)
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

void Sound_8062BA8(unk32 arg0)
{
    if (arg0 >= _unk3005E14->var00) {
        return;
    }

    Sound_8062B2C();

    _unk3005E00 = (unk8(*)[])(*_unk3005E14->var08)[arg0][0];
    _unk3005E20 = (unk32)(*_unk3005E14->var08)[arg0][1];

    _unk3005E08 = 0;
    _unk3005E10 = 0;
    _unk3005E0C = 1;
}

unk32 Sound_8062BFC(unk32 arg0, unk32 arg1)
{
    if (arg0 >= _unk3005E14->count) {
        return;
    }

    return Sound_80629F0((SoundStructE*)(*_unk3005E14->data)[arg0], arg1);
}

#if 0
void sub_8062C24(void)
{
    unk8 opcode;
    SoundStructF* event;
    SoundStructG* channel;
    unk32 i;
    unk32 found;

    if (_unk3005E0C != 1) {
        return;
    }

    _unk3005E08 -= _unk3005E10;
    if (_unk3005E08 > 0) {
        return;
    }


    do {
        opcode = (*_unk3005E00)[0];
        _unk3005E00 = (unk8(*)[])((unk8*)_unk3005E00 + 1);

        if ((opcode & 0x80) == 0) {
            unk8 value;

            value = (*_unk3005E00)[0];
            _unk3005E00 = (unk8(*)[])((unk8*)_unk3005E00 + 1);
            _unk3005E08 += (opcode << 8 | value) << 16;
            continue;
        }

        switch (opcode >> 4) {
        case 8: {
            unk8 value8;

            value8 = (*_unk3005E00)[0];
            _unk3005E00 = (unk8(*)[])((unk8*)_unk3005E00 + 2);
            event = &(*_unk3005E28)[opcode & 0xF];
            channel = &event->var04[0];
            i = 4;
            while (i-- != 0) {
                if (channel->var00 != 0 && channel->var01 == value8) {
                    Sound_8062A90(channel->var04);
                    channel->var00 = 0;
                    break;
                }
                channel++;
            }
            break;
        }
        case 9: {
            unk8 value9;
            unk8 value2;

            value9 = (*_unk3005E00)[0];
            _unk3005E00 = (unk8(*)[])((unk8*)_unk3005E00 + 1);
            value2 = (*_unk3005E00)[1];
            _unk3005E00 = (unk8(*)[])((unk8*)_unk3005E00 + 1);
            event = &(*_unk3005E28)[opcode & 0xF];
            if (event->var00 == 0) {
                break;
            }

            channel = &event->var04[0];
            found = 0;
            i = 3;
            for (;;) {
                if (channel->var00 != 0 && channel->var01 == value9) {
                    found = 1;
                    break;
                }
                channel++;
                if (i-- == -1) {
                    break;
                }
            }
            if (found != 0) {
                break;
            }

            channel = &(*_unk3005E28)[opcode & 0xF].var04[0];
            i = 3;
            for (;;) {
                if (channel->var00 == 0) {
                    channel->var04 = Sound_80629F0(event->var00, value9);
                    Sound_8062AD4(channel->var04, value2);
                    channel->var00 = 1;
                    channel->var01 = value9;
                    break;
                }
                channel++;
                if (i-- == -1) {
                    break;
                }
            }
            break;
        }
        case 0xB:
            switch (opcode & 0xF) {
            case 0:
                _unk3005E00 = (unk8(*)[])_unk3005E20;
                break;
            case 1:
                _unk3005E00 = (unk8(*)[])((unk8*)_unk3005E00 + 1);
                break;
            case 2:
                _unk3005E10 = (*_unk3005E00)[0] << 24;
                _unk3005E00 = (unk8(*)[])((unk8*)_unk3005E00 + 1);
                _unk3005E10 |= (*_unk3005E00)[0] << 16;
                _unk3005E00 = (unk8(*)[])((unk8*)_unk3005E00 + 1);
                _unk3005E10 |= (*_unk3005E00)[0] << 8;
                _unk3005E00 = (unk8(*)[])((unk8*)_unk3005E00 + 1);
                _unk3005E10 |= (*_unk3005E00)[0];
                _unk3005E00 = (unk8(*)[])((unk8*)_unk3005E00 + 1);
                break;
            case 3:
                printf(Str_8755E14);
                break;
            }
            break;
        case 0xC: {
            unk8 value;

            value = (*_unk3005E00)[0];
            _unk3005E00 = (unk8(*)[])((unk8*)_unk3005E00 + 1);
            event = &(*_unk3005E28)[opcode & 0xF];
            event->var00 = (SoundStructE*)(*_unk3005E14->var08)[value][0];
            break;
        }
        case 0xD:
            _unk3005E00 = (unk8(*)[])((unk8*)_unk3005E00 + 1);
            break;
        }

    } while (_unk3005E08 <= 0);
}

#endif

INCLUDE_ASM("asm/dump/sound/8062c24.s");

unk32 Sound_8062E54(unk32 arg0)
{
    SoundStructA* var1 = Sound_8062A50(arg0);

    if (var1 != NULL && var1->var16 != 0) {
        return true;
    }

    return false;
}

ASM_ZEROPAD
