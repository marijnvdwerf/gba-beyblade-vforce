#ifndef AGB_BIOS_H
#define AGB_BIOS_H

#include <agb/types.h>

#define SystemCall(No) asm("SWI    " #No)

/* System call numbers */

#define SWI_NO_RESTART 0
#define SWI_NO_REGISTER_RAM_RESET 1
#define SWI_NO_HALT 2
#define SWI_NO_STOP 3

#define SWI_NO_INTR_WAIT 4
#define SWI_NO_VBLANK_INTR_WAIT 5

#define SWI_NO_DIV 6
#define SWI_NO_DIV_ARM 7
#define SWI_NO_SQRT 8
#define SWI_NO_ARCTAN 9
#define SWI_NO_ARCTAN2 10

#define SWI_NO_CPU_SET 11
#define SWI_NO_CPU_FAST_SET 12
#define SWI_NO_BG_AFFINE_SET 14
#define SWI_NO_OBJ_AFFINE_SET 15
#define SWI_NO_BIT_UNPACK 16
#define SWI_NO_LZ77_UNCOMP_WRAM 17
#define SWI_NO_LZ77_UNCOMP_VRAM 18
#define SWI_NO_HUFF_UNCOMP 19
#define SWI_NO_RL_UNCOMP_WRAM 20
#define SWI_NO_RL_UNCOMP_VRAM 21
#define SWI_NO_DIFF_8BIT_UNFILTER_WRAM 22
#define SWI_NO_DIFF_8BIT_UNFILTER_VRAM 23
#define SWI_NO_DIFF_16BIT_UNFILTER 24

#define SWI_NO_SOUND_BIAS_CHANGE 25
#define SWI_NO_SOUND_DRIVER_INIT 26
#define SWI_NO_SOUND_DRIVER_MODE 27
#define SWI_NO_SOUND_DRIVER_MAIN 28
#define SWI_NO_SOUND_DRIVER_VSYNC 29
#define SWI_NO_SOUND_DRIVER_VSYNC_OFF 40
#define SWI_NO_SOUND_DRIVER_VSYNC_ON 41
#define SWI_NO_SOUND_CHANNEL_CLEAR 30
#define SWI_NO_MIDI_KEY_2_FREQ 31

#define SWI_NO_MULTI_BOOT 37

/* Reset */

void SoftReset(u32 ResetFlags);
void SoftResetRom(u32 ResetFlags);
void SoftResetExram(u32 ResetFlags);
void RegisterRamReset(u32 ResetFlags);

/* Halt/stop */

#define Halt() SystemCall(2)

#define Stop()                                                                                     \
    {                                                                                              \
        SoundBiasReset();                                                                          \
        SystemCall(3);                                                                             \
        SoundBiasSet();                                                                            \
    }

/* Interrupt wait */

void IntrWait(u8 InitCheckClear, u16 IntrFlags);
void VBlankIntrWait(void);

/* Math */

s32 Div(s32 Number, s32 Denom); /* Number / Denom */
s32 DivArm(s32 Denom, s32 Number);
s32 DivRem(s32 Number, s32 Denom); /* Number % Denom */
s32 DivRemArm(s32 Denom, s32 Number);
u16 Sqrt(u32 X);
s16 ArcTan(s16 Tan);
u16 ArcTan2(s16 X, s16 Y);

/* Memory fill/copy (parameters compatible with the DmaSet macro) */

void CpuSet(void* Srcp, void* Destp, u32 DmaCntData);
void CpuFastSet(void* Srcp, void* Destp, u32 DmaCntData);

/* Decompression/unfiltering */

void LZ77UnCompWram(void* Srcp, void* Destp);
void LZ77UnCompVram(void* Srcp, void* Destp);
void HuffUnComp(void* Srcp, void* Destp);
void RLUnCompWram(void* Srcp, void* Destp);
void RLUnCompVram(void* Srcp, void* Destp);
void Diff8bitUnFilterWram(void* Srcp, void* Destp);
void Diff8bitUnFilterVram(void* Srcp, void* Destp);
void Diff16bitUnFilter(void* Srcp, void* Destp);

/* Sound BIAS */

void SoundBiasSet(void);
void SoundBiasReset(void);

#endif /* AGB_BIOS_H */
