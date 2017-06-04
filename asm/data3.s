    .include "asm/common.inc"

	.section .rodata

	.align 2, 0
global Unk_875687C
	.4byte 0x200
	.4byte 0x3000040
	.4byte 6

	.align 2, 0
global Unk_8756888
	.4byte 0x2000
	.4byte 0x3000400
	.4byte 0xE

	.align 2, 0
global Unk_8756894
	.2byte 0xA
	.2byte 0xFFBD
	.2byte 0xC2

	.align 2, 0
Unk_875689C:
    .4byte _unk_3005E9C
    .4byte Unk_875687C
    .4byte Unk_8756888
    .4byte _unk_3000DAA
    .4byte _unk_3000DAC
    .4byte _batteryBackupTimer
    .4byte _batteryBackupTimer_REG
    .4byte onTimer2Overflow+1
    .4byte _unk_3000DB4
    .4byte _batteryBackupTimer_REG
    .4byte _batteryBackupTimer
    .4byte _unk_3000DAC
    .4byte _unk_3000DAA
    .4byte _batteryBackupTimer_REG
    .4byte _batteryBackupTimer
    .4byte _unk_3000DB4
    .4byte _unk_3005E9C
    .4byte _unk_3005E9C
    .4byte _unk_3005E9C
    .4byte Unk_8756894
    .4byte _unk_3000DAC
    .4byte _unk_3005E9C

