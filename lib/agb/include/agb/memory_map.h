#ifndef AGB_MEMORY_MAP_H
#define AGB_MEMORY_MAP_H

/* Memory map */

#define BOOT_ROM 0x00000000
#define BOOT_ROM_END (BOOT_ROM + 0x4000)
#define EX_WRAM 0x02000000 /* CPU external work RAM */
#define EX_WRAM_END (EX_WRAM + 0x40000)
#define CPU_WRAM 0x03000000 /* CPU internal work RAM */
#define CPU_WRAM_END (CPU_WRAM + 0x8000)
#define WRAM EX_WRAM
#define WRAM_END CPU_WRAM_END
#define SOUND_AREA_ADDR_BUF (CPU_WRAM_END - 0x10) /* sound driver work address */
#define INTR_CHECK_BUF (CPU_WRAM_END - 0x8) /* interrupt check */
#define SOFT_RESET_DIRECT_BUF (CPU_WRAM_END - 0x6)
#define INTR_VECTOR_BUF (CPU_WRAM_END - 0x4) /* interrupt branch address */
#define REG_BASE 0x04000000
#define REG_END (REG_BASE + 0x300)
#define PLTT 0x05000000
#define PLTT_END (PLTT + 0x400)
#define BG_PLTT (PLTT + 0x0)
#define BG_PLTT_END (PLTT + 0x200)
#define OBJ_PLTT (PLTT + 0x200)
#define OBJ_PLTT_END (PLTT + 0x400)
#define VRAM 0x06000000
#define VRAM_END (VRAM + 0x18000)
#define BG_VRAM (VRAM + 0x0)
#define BG_BITMAP0_VRAM (VRAM + 0x0)
#define BG_BITMAP1_VRAM (VRAM + 0xa000)
#define OBJ_MODE0_VRAM (VRAM + 0x10000)
#define OBJ_MODE1_VRAM (VRAM + 0x10000)
#define OBJ_MODE2_VRAM (VRAM + 0x10000)
#define OBJ_MODE3_VRAM (VRAM + 0x14000)
#define OBJ_MODE4_VRAM (VRAM + 0x14000)
#define OBJ_MODE5_VRAM (VRAM + 0x14000)
#define OBJ_VRAM_END (VRAM + 0x18000)
#define OAM 0x07000000
#define OAM_END (OAM + 0x400)

#define ROM_BANK0 0x08000000
#define ROM_BANK0_END 0x0a000000
#define ROM_BANK1 0x0a000000
#define ROM_BANK1_END 0x0c000000
#define ROM_BANK2 0x0c000000
#define ROM_BANK2_END 0x0e000000
#define RAM_BANK 0x0c000000
#define RAM_BANK_END 0x10000000

/* Memory sizes */

#define BOOT_ROM_SIZE 0x4000
#define EX_WRAM_SIZE 0x40000
#define CPU_WRAM_SIZE 0x8000
#define WRAM_SIZE 0x48000
#define PLTT_SIZE (2 * 256 * 2)
#define BG_PLTT_SIZE (2 * 256)
#define OBJ_PLTT_SIZE (2 * 256)
#define VRAM_SIZE 0x18000
#define OAM_SIZE (8 * 128)
#define ROM_BANK_SIZE 0x02000000

/* Register addresses */

#define REG_IME (REG_BASE + 0x208) /* interrupt master enable */
#define REG_IE (REG_BASE + 0x200) /* interrupt enable */
#define REG_IF (REG_BASE + 0x202) /* interrupt request */

#define REG_WAITCNT (REG_BASE + 0x204) /* game pak wait control */

#define REG_DISPCNT (REG_BASE + 0x0) /* display control */

#define REG_STAT (REG_BASE + 0x4) /* status */
#define REG_VCOUNT (REG_BASE + 0x6) /* V counter */

#define REG_MOSAIC (REG_BASE + 0x4c) /* mosaic size */

#define REG_BLDCNT (REG_BASE + 0x50) /* blend mode control */
#define REG_BLDALPHA (REG_BASE + 0x52) /* semi-transparent parameter */
#define REG_BLDY (REG_BASE + 0x54) /* brightness change parameter */

#define REG_WINCNT (REG_BASE + 0x40) /* window control */
#define REG_WIN0H (REG_BASE + 0x40)
#define REG_WIN1H (REG_BASE + 0x42)
#define REG_WIN0V (REG_BASE + 0x44)
#define REG_WIN1V (REG_BASE + 0x46)
#define REG_WININ (REG_BASE + 0x48)
#define REG_WIN0 (REG_BASE + 0x48)
#define REG_WIN1 (REG_BASE + 0x49)
#define REG_WINOUT (REG_BASE + 0x4a)
#define REG_OBJWIN (REG_BASE + 0x4b)

#define REG_BGCNT (REG_BASE + 0x8) /* BG control */
#define REG_BG0CNT (REG_BASE + 0x8)
#define REG_BG1CNT (REG_BASE + 0xa)
#define REG_BG2CNT (REG_BASE + 0xc)
#define REG_BG3CNT (REG_BASE + 0xe)
#define REG_BGOFS (REG_BASE + 0x10) /* BG offset */
#define REG_BG0HOFS (REG_BASE + 0x10)
#define REG_BG0VOFS (REG_BASE + 0x12)
#define REG_BG1HOFS (REG_BASE + 0x14)
#define REG_BG1VOFS (REG_BASE + 0x16)
#define REG_BG2HOFS (REG_BASE + 0x18)
#define REG_BG2VOFS (REG_BASE + 0x1a)
#define REG_BG3HOFS (REG_BASE + 0x1c)
#define REG_BG3VOFS (REG_BASE + 0x1e)
#define REG_BG2AFFINE (REG_BASE + 0x20) /* BG 2 affine transformation parameters */
#define REG_BG2PA (REG_BASE + 0x20)
#define REG_BG2PB (REG_BASE + 0x22)
#define REG_BG2PC (REG_BASE + 0x24)
#define REG_BG2PD (REG_BASE + 0x26)
#define REG_BG2X (REG_BASE + 0x28)
#define REG_BG2X_L (REG_BASE + 0x28)
#define REG_BG2X_H (REG_BASE + 0x2a)
#define REG_BG2Y (REG_BASE + 0x2c)
#define REG_BG2Y_L (REG_BASE + 0x2c)
#define REG_BG2Y_H (REG_BASE + 0x2e)
#define REG_BG3AFFINE (REG_BASE + 0x30) /* BG 3 affine transformation parameters */
#define REG_BG3PA (REG_BASE + 0x30)
#define REG_BG3PB (REG_BASE + 0x32)
#define REG_BG3PC (REG_BASE + 0x34)
#define REG_BG3PD (REG_BASE + 0x36)
#define REG_BG3X (REG_BASE + 0x38)
#define REG_BG3X_L (REG_BASE + 0x38)
#define REG_BG3X_H (REG_BASE + 0x3a)
#define REG_BG3Y (REG_BASE + 0x3c)
#define REG_BG3Y_L (REG_BASE + 0x3c)
#define REG_BG3Y_H (REG_BASE + 0x3e)

#define REG_SOUNDCNT (REG_BASE + 0x80) /* sound control */
#define REG_SOUNDCNT_L (REG_BASE + 0x80)
#define REG_SOUNDCNT_H (REG_BASE + 0x82)
#define REG_SOUNDCNT_X (REG_BASE + 0x84)

#define REG_SOUNDBIAS (REG_BASE + 0x88) /* sound BIAS */

#define REG_SOUND1CNT (REG_BASE + 0x60) /* sound 1 control */
#define REG_SOUND1CNT_L (REG_BASE + 0x60)
#define REG_SOUND1CNT_H (REG_BASE + 0x62)
#define REG_SOUND1CNT_X (REG_BASE + 0x64)
#define REG_SOUND2CNT (REG_BASE + 0x68) /* sound 2 control */
#define REG_SOUND2CNT_L (REG_BASE + 0x68)
#define REG_SOUND2CNT_H (REG_BASE + 0x6c)
#define REG_SOUND3CNT (REG_BASE + 0x70) /* sound 3 control */
#define REG_SOUND3CNT_L (REG_BASE + 0x70)
#define REG_SOUND3CNT_H (REG_BASE + 0x72)
#define REG_SOUND3CNT_X (REG_BASE + 0x74)
#define REG_SOUND4CNT (REG_BASE + 0x78) /* sound 4 control */
#define REG_SOUND4CNT_L (REG_BASE + 0x78)
#define REG_SOUND4CNT_H (REG_BASE + 0x7c)

#define REG_WAVE_RAM (REG_BASE + 0x90) /* sound 3 waveform RAM */
#define REG_WAVE_RAM0 (REG_BASE + 0x90)
#define REG_WAVE_RAM1 (REG_BASE + 0x94)
#define REG_WAVE_RAM2 (REG_BASE + 0x98)
#define REG_WAVE_RAM3 (REG_BASE + 0x9c)

#define REG_FIFO (REG_BASE + 0xa0) /* sound FIFO */
#define REG_FIFO_A (REG_BASE + 0xa0)
#define REG_FIFO_B (REG_BASE + 0xa4)

#define REG_DMA0 (REG_BASE + 0xb0) /* DMA 0 (internal -> internal) */
#define REG_DMA0SAD (REG_BASE + 0xb0)
#define REG_DMA0DAD (REG_BASE + 0xb4)
#define REG_DMA0CNT (REG_BASE + 0xb8)
#define REG_DMA0CNT_L (REG_BASE + 0xb8)
#define REG_DMA0CNT_H (REG_BASE + 0xba)
#define REG_DMA1 (REG_BASE + 0xbc) /* DMA 1 (internal -> FIFO/internal) */
#define REG_DMA1SAD (REG_BASE + 0xbc)
#define REG_DMA1DAD (REG_BASE + 0xc0)
#define REG_DMA1CNT (REG_BASE + 0xc4)
#define REG_DMA1CNT_L (REG_BASE + 0xc4)
#define REG_DMA1CNT_H (REG_BASE + 0xc6)
#define REG_DMA2 (REG_BASE + 0xc8) /* DMA 2 (internal -> FIFO/internal) */
#define REG_DMA2SAD (REG_BASE + 0xc8)
#define REG_DMA2DAD (REG_BASE + 0xcc)
#define REG_DMA2CNT (REG_BASE + 0xd0)
#define REG_DMA2CNT_L (REG_BASE + 0xd0)
#define REG_DMA2CNT_H (REG_BASE + 0xd2)
#define REG_DMA3 (REG_BASE + 0xd4) /* DMA 3 (game pak/internal <-> internal) */
#define REG_DMA3SAD (REG_BASE + 0xd4)
#define REG_DMA3DAD (REG_BASE + 0xd8)
#define REG_DMA3CNT (REG_BASE + 0xdc)
#define REG_DMA3CNT_L (REG_BASE + 0xdc)
#define REG_DMA3CNT_H (REG_BASE + 0xde)

#define REG_TM0CNT (REG_BASE + 0x100) /* timer 0 */
#define REG_TM0CNT_L (REG_BASE + 0x100)
#define REG_TM0CNT_H (REG_BASE + 0x102)
#define REG_TM1CNT (REG_BASE + 0x104) /* timer 1 */
#define REG_TM1CNT_L (REG_BASE + 0x104)
#define REG_TM1CNT_H (REG_BASE + 0x106)
#define REG_TM2CNT (REG_BASE + 0x108) /* timer 2 */
#define REG_TM2CNT_L (REG_BASE + 0x108)
#define REG_TM2CNT_H (REG_BASE + 0x10a)
#define REG_TM3CNT (REG_BASE + 0x10c) /* timer 3 */
#define REG_TM3CNT_L (REG_BASE + 0x10c)
#define REG_TM3CNT_H (REG_BASE + 0x10e)

#define REG_RCNT (REG_BASE + 0x134) /* general input/output control */

#define REG_SIOCNT (REG_BASE + 0x128) /* serial communication control */
#define REG_SIODATA8 (REG_BASE + 0x12a)
#define REG_SIODATA32 (REG_BASE + 0x120)
#define REG_SIOMLT_SEND (REG_BASE + 0x12a)
#define REG_SIOMLT_RECV (REG_BASE + 0x120)
#define REG_SIOMULTI0 (REG_BASE + 0x120)
#define REG_SIOMULTI1 (REG_BASE + 0x122)
#define REG_SIOMULTI2 (REG_BASE + 0x124)
#define REG_SIOMULTI3 (REG_BASE + 0x126)

#define REG_JOYCNT (REG_BASE + 0x140) /* JOY bus communication control */
#define REG_JOYSTAT (REG_BASE + 0x158)
#define REG_JOY_RECV (REG_BASE + 0x150)
#define REG_JOY_TRANS (REG_BASE + 0x154)

#define REG_KEYINPUT (REG_BASE + 0x130) /* key input */
#define REG_KEYCNT (REG_BASE + 0x132) /* key control */

#endif /* AGB_MEMORY_MAP_H */
