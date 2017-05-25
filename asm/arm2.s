    .include "asm/common.inc"

    .set SpriteEntry.next, 0x4
    .set SpriteEntry.x, 0x8
    .set SpriteEntry.y, 0xC
    .set SpriteEntry.anonymous_4, 0x10
    .set SpriteEntry.oam_attr_2, 0x14
    .set SpriteEntry.field_16, 0x16
    .set SpriteEntry.frame, 0x18
    .set SpriteEntry.field_1A, 0x1A
    .set SpriteEntry.flip_h_v, 0x1C
    .set SpriteEntry.field_20, 0x20
    .set SpriteEntry.characterName, 0x24
    .set SpriteEntry.imageData, 0x28
    .set SpriteEntry.spriteSheet, 0x2C
    .set SpriteEntry.rotationScale, 0x30

    .set SpriteSheetHeader.palette, 0xC
    .set SpriteSheetHeader.field_D, 0xD
    .set SpriteSheetHeader.tileCount, 0xE
    .set SpriteSheetHeader.imageFirstOffset, 0x10
    .set SpriteSheetHeader.imageListOffset, 0x1C

    .set RotationScale.scale_x, 0x14
    .set RotationScale.scale_y, 0x16

    .set OAMAttribute, 0

    arm_func_start ARM_sub_87569F4
ARM_sub_87569F4:
		MOV	R12, SP
		STMFD	SP!, {R4,R11,R12,LR,PC}
		LDR	R2, off_8756A74
		SUB	R11, R12, #4
		MOV	R12, #0x3FC
		LDR	R0, [R0,#0x24]
		ADD	R12, R12, #3
		LDR	LR, [R2]
		MOV	R4, R2
		RSB	R3, R0,	LR
		CMP	R3, R12
		BLS	loc_8756A70
		AND	R0, LR,	R12
		MOV	R2, R1,LSR#5
		ADD	R3, R0,	R2
		CMP	R3, #0x400
		LDR	R12, off_8756A78
		MOV	R1, R2
		BHI	loc_8756A4C
		LDR	R3, [R12]
		CMP	R0, R3
		BCS	loc_8756A64

loc_8756A4C:
		ADD	R3, LR,	#0x400
		BIC	R3, R3,	#0x3FC
		LDR	R2, [R12]
		BIC	R3, R3,	#3
		ADD	R3, R3,	R2
		STR	R3, [R4]

loc_8756A64:
		LDR	R0, [R4]
		ADD	R3, R0,	R1
		STR	R3, [R4]

loc_8756A70:
		B	loc_8756A7C

off_8756A74:
    .4byte _unk3005E74
off_8756A78:
    .4byte _unk3005E6C


loc_8756A7C:
		LDMDB	R11, {R4,R11,SP,LR}
		BX	LR
    arm_func_end ARM_sub_87569F4








    arm_func_start ARM_sub_8756A84
ARM_sub_8756A84:

var_30		= -0x30
objNo		= -0x2C

		MOV	R12, SP
		STMFD	SP!, {R4-R12,LR,PC}
		SUB	R11, R12, #4
		SUB	SP, SP,	#8
		LDR	R12, [R0,#SpriteEntry.spriteSheet]
		LDRH	R4, [R0,#SpriteEntry.frame]
		LDR	R5, [R12,#SpriteSheetHeader.imageListOffset]
		STR	R2, [R11,#objNo]
		MOV	R1, R1,LSL#16
		LDRH	R2, [R0,#SpriteEntry.field_16]
		MOV	LR, R1,ASR#16
		LDR	R3, [R0,#SpriteEntry.imageData]
		CMP	R5, #0
		ADD	R0, R3,	R4,LSL R2
		BNE	loc_8756AF4
		MOV	R1, #VRAM
		LDR	R2, [R11,#objNo]
		ADD	R1, R1, #(VRAM_OBJ - VRAM)
		MOV	R3, R2,LSL#22
		MOV	R3, R3,LSR#22
		ORR	R1, R1,	R3,LSL#5
		MOV	R2, LR,LSL#16
		LDR	R3, off_8756C94
		MOV	R2, R2,LSR#16
		LDR	R12, [R3]
		MOV	LR, PC
		BX	R12
		B	loc_8756C9C


loc_8756AF4:
		LDRB	LR, [R12,#SpriteSheetHeader.field_D]
		MOV	R3, #0
		STR	R3, [R11,#var_30]
		ADD	R2, R12, R5
		LDR	R3, [R12,#SpriteSheetHeader.imageFirstOffset]
		CMP	LR, #4
		LDR	R1, [R2,R4,LSL#2]
		ADD	R3, R12, R3
		LDR	R4, [R3,R1]
		ADD	R0, R3,	R1
		LDRHI	R2, [R0,#4]
		STRHI	R2, [R11,#var_30]
		AND	R3, LR,	#0xFC
		ADD	R10, R0, R3
		LDR	R3, [R11,#objNo]
		LDRH	R8, [R12,#SpriteSheetHeader.tileCount]
		LDRB	R1, [R12,#SpriteSheetHeader.palette]
		MOV	R2, R3,LSL#22
		MOV	R2, R2,LSR#22
		MOV	R3, #0x6000000
		ADD	R3, R3,	#0x10000
		ORR	R7, R3,	R2,LSL#5
		TST	R1, #1
		MOVEQ	R9, #6
		MOVNE	R9, #5

loc_8756B58:

		CMP	R8, #0
		BLE	loc_8756C9C
		MOV	R6, #0
		CMP	R4, R6
		BNE	loc_8756BBC
		CMP	R8, #0x20
		MOVLE	R3, #0
		MOVGT	R3, #1
		MOV	R6, R3,LSL#5
		RSB	R6, R6,	R8
		RSB	R8, R6,	R8
		MOV	R5, R6,LSL R9
		MOV	R0, R10
		MOV	R1, R7
		MOV	R2, R5
		LDR	R4, [R11,#var_30]
		ADD	R10, R10, R5
		LDR	R3, off_8756C94
		ADD	R7, R7,	R5
		LDR	R12, [R3]
		MOV	LR, PC
		BX	R12
		B	loc_8756B58


loc_8756BB4:
		ADD	R6, R6,	#4
		MOV	R4, R4,LSR#4

loc_8756BBC:
		AND	R3, R4,	#0xF
		CMP	R3, #0xF
		BEQ	loc_8756BB4
		B	loc_8756BD4


loc_8756BCC:
		ADD	R6, R6,	#2
		MOV	R4, R4,LSR#2

loc_8756BD4:
		AND	R3, R4,	#3
		CMP	R3, #3
		BEQ	loc_8756BCC
		TST	R4, #1
		BEQ	loc_8756BF8

loc_8756BE8:
		ADD	R6, R6,	#1
		MOV	R4, R4,LSR#1
		TST	R4, #1
		BNE	loc_8756BE8

loc_8756BF8:
		CMP	R6, #0
		BEQ	loc_8756C30
		MOV	R5, R6,LSL R9
		MOV	R0, #0
		MOV	R1, R7
		MOV	R2, R5
		LDR	R3, off_8756C98
		ADD	R7, R7,	R5
		LDR	R12, [R3]
		MOV	LR, PC
		BX	R12
		B	loc_8756C80


loc_8756C28:
		ADD	R6, R6,	#4
		MOV	R4, R4,LSR#4

loc_8756C30:
		TST	R4, #0xF
		BEQ	loc_8756C28
		TST	R4, #3
		BNE	loc_8756C5C

loc_8756C40:
		ADD	R6, R6,	#2
		MOV	R4, R4,LSR#2
		TST	R4, #3
		BEQ	loc_8756C40
		B	loc_8756C5C


loc_8756C54:
		ADD	R6, R6,	#1
		MOV	R4, R4,LSR#1

loc_8756C5C:

		TST	R4, #1
		BEQ	loc_8756C54
		MOV	R5, R6,LSL R9
		MOV	R0, R10
		MOV	R1, R7
		MOV	R2, R5
		BL	fastMemoryCopyARM
		ADD	R10, R10, R5
		ADD	R7, R7,	R5

loc_8756C80:
		RSB	R8, R6,	R8
		LDR	R2, [R11,#var_30]
		CMP	R8, #0x20
		MOVEQ	R4, R2
		B	loc_8756B58

off_8756C94:
    .4byte __fastMemoryCopyARM

off_8756C98:
    .4byte __fastMemoryClearARM


loc_8756C9C:

		LDR	R2, off_8756CB4
		LDR	R3, [R2]
		LDR	R0, [R11,#objNo]
		ADD	R3, R3,	#1
		STR	R3, [R2]
		B	loc_8756CB8

off_8756CB4:
    .4byte 0x3005E70



loc_8756CB8:
		LDMDB	R11, {R4-R11,SP,LR}
		BX	LR

    arm_func_end ARM_sub_8756A84







    arm_func_start oam_8756CC0
oam_8756CC0:

var_30		= -0x30
var_2C		= -0x2C

		MOV	R12, SP
		STMFD	SP!, {R4-R12,LR,PC}
		LDR	R3, off_8756F60
		LDR	R2, off_8756F64
		LDR	R1, off_8756F68
		SUB	SP, SP,	#8
		LDR	R4, [R3]
		SUB	R11, R12, #4
		LDR	R7, [R2]
		MOV	R10, #OAM
		LDR	R8, [R1]
		CMP	R4, #0
		BEQ	loc_8756DF0
		MOV	R0, #0x1FC00
		ADD	R0, R0,	#0x300
		STR	R0, [R11,#var_2C]

loc_8756D00:
		LDR	R6, [R4,#SpriteEntry.x]
		LDR	R5, [R4,#SpriteEntry.anonymous_4]
		MOV	R9, R10
		LDR	LR, [R4,#SpriteEntry.y]
		TST	R5, #0x200
		BEQ	loc_8756D70
		AND	R3, R5,	#0xC000
		MOV	R2, R5,LSR#30
		ORR	R2, R2,	R3,LSR#12
		LDR	R1, off_8756F6C
		MOV	R2, R2,LSL#1
		LDRH	R3, [R1,R2]
		AND	R12, R3, #0xFF00
		AND	R3, R3,	#0xFF
		LDR	R2, [R4,#SpriteEntry.rotationScale]
		MOV	R0, R3,LSL#8
		CMP	R2, #0
		BEQ	loc_8756D68
		LDRH	R3, [R2,#RotationScale.scale_x]
		MUL	R1, R12, R3
		LDRH	R2, [R2,#RotationScale.scale_y]
		MUL	R3, R0,	R2
		RSB	R1, R12, R1,ASR#8
		RSB	R12, R1, R12
		RSB	R3, R0,	R3,ASR#8
		RSB	R0, R3,	R0

loc_8756D68:
		RSB	R6, R12, R6
		RSB	LR, R0,	LR

loc_8756D70:
		ADD	R2, R6,	#0x8000
		CMN	LR, #0x5000
		MOVGE	R3, #0
		MOVLT	R3, #1
		CMP	R2, #0x17000
		MOVHI	R3, #1
		CMP	R3, #0
		BNE	loc_8756D98
		CMP	LR, #0xA000
		BLE	loc_8756D9C

loc_8756D98:
		MOV	LR, #0xA000

loc_8756D9C:
		MOV	R2, LR,ASR#8
		AND	R2, R2,	#0xFF
		LDR	R0, [R11,#var_2C]
		ORR	R2, R5,	R2
		LDRH	R3, [R4,#SpriteEntry.flip_h_v]
		AND	R1, R6,	R0
		AND	R3, R3,	#3
		MOV	R3, R3,LSL#28
		ORR	R3, R3,	R1,LSL#8
		ORR	R2, R2,	R3
		STR	R2, [R9],#4
		LDRH	R3, [R4,#SpriteEntry.characterName]
		ADD	R10, R10, #8
		LDRH	R2, [R4,#SpriteEntry.oam_attr_2]

		MOV	R3, R3,LSL#22
		MOV	R3, R3,LSR#22
		LDR	R4, [R4,#SpriteEntry.next]
		ORR	R2, R2,	R3
		STRH	R2, [R9,#OAMAttribute]
		CMP	R4, #0
		BNE	loc_8756D00

loc_8756DF0:
		LDR	R1, off_8756F60
		MOV	R10, #OAM
		LDR	R4, [R1]
		SUB	R8, R8,	#1
		STR	R8, [R11,#var_30]

loc_8756E04:

		CMP	R4, #0
		BEQ	loc_8756F38
		MOV	R9, #0
		LDRH	R3, [R4,#SpriteEntry.field_20]
		ADD	R8, R10, #4
		TST	R3, #1
		BNE	loc_8756EB8
		LDR	R5, [R4,#SpriteEntry.characterName]
		LDRH	R1, [R4,#SpriteEntry.frame]
		LDRH	R2, [R4,#SpriteEntry.field_1A]
		LDRH	R3, [R4,#SpriteEntry.field_16]
		CMP	R1, R2
		SUB	R3, R3,	#5
		MOV	R2, #1
		MOV	R6, R2,LSL R3
		BEQ	loc_8756E70
		CMP	R5, #0
		BLT	loc_8756E68
		MOV	R0, R5
		MOV	R1, R6
		LDR	R3, off_8756F70
		MVN	R5, #0
		LDR	R12, [R3]
		MOV	LR, PC
		BX	R12

loc_8756E68:
		LDRH	R3, [R4,#SpriteEntry.frame]
		STRH	R3, [R4,#SpriteEntry.field_1A]

loc_8756E70:
		CMP	R5, #0
		BGE	loc_8756E94
		MOV	R0, R6
		LDR	R3, off_8756F74
		MOV	R9, #1
		LDR	R12, [R3]
		MOV	LR, PC
		BX	R12
		MOV	R5, R0

loc_8756E94:
		STR	R5, [R4,#SpriteEntry.characterName]
		CMP	R5, #0
		BGE	loc_8756EC4
		LDR	R0, off_8756F78
		LDR	R2, off_8756F7C
		MOV	R1, R6
		LDR	R12, [R2]
		MOV	LR, PC
		BX	R12

loc_8756EB8:
		LDR	R4, [R4,#SpriteEntry.next]
		ADD	R10, R10, #8
		B	loc_8756E04


loc_8756EC4:
		LDRH	R3, [R4,#SpriteEntry.characterName]
		LDRH	R2, [R4,#SpriteEntry.oam_attr_2]

		BIC	R3, R3,	#0b1111110000000000
		ORR	R2, R2,	R3
		STRH	R2, [R8]
		CMP	R9, #0
		BEQ	loc_8756F2C
		LDR	R3, off_8756F80
		LDR	R2, [R3]
		CMP	R5, R2
		BCS	loc_8756F0C
		LDR	R0, off_8756F84
		LDR	R2, [R4,#SpriteEntry.spriteSheet]
		LDR	R3, off_8756F7C
		MOV	R1, R5
		LDR	R12, [R3]
		MOV	LR, PC
		BX	R12

loc_8756F0C:
		MOV	R0, R4
		MOV	R2, R5
		LDRH	R1, [R4,#SpriteEntry.field_16]
		MOV	R3, #1
		MOV	R1, R3,LSL R1
		MOV	R1, R1,LSL#16
		MOV	R1, R1,LSR#16
		BL	ARM_sub_8756A84

loc_8756F2C:
		ADD	R10, R10, #8
		LDR	R4, [R4,#4]
		B	loc_8756E04


loc_8756F38:
		LDR	R8, [R11,#var_30]
		CMN	R8, #1
		BEQ	loc_8756FB0
		MOV	R3, #0xA0

loc_8756F48:
		SUB	R8, R8,	#1
		STR	R3, [R10]
		CMN	R8, #1
		ADD	R10, R10, #8
		BNE	loc_8756F48
		B	loc_8756FB0

off_8756F60:
    .4byte _unk3005DE4

off_8756F64:
    .4byte _unk3005DF8
off_8756F68:
    .4byte _spriteEntryCount
off_8756F6C:
    .4byte word_807D90C
off_8756F70:
    .4byte off_807D938
off_8756F74:
    .4byte off_807D934
off_8756F78:
    .4byte Str_8755EAC

off_8756F7C:
    .4byte off_807D930

off_8756F80:
    .4byte _unk3005E6C
off_8756F84:
    .4byte Str_8755EE0



loc_8756F88:
		LDR	R3, [R7,#8]
		LDRH	R0, [R7,#0xC]
		STRH	R0, [R3,#6]
		LDRH	R1, [R7,#0xE]
		STRH	R1, [R3,#0xE]
		LDRH	R2, [R7,#0x10]
		STRH	R2, [R3,#0x16]
		LDRH	R0, [R7,#0x12]
		STRH	R0, [R3,#0x1E]
		LDR	R7, [R7,#4]

loc_8756FB0:

		CMP	R7, #0
		BNE	loc_8756F88
		LDMDB	R11, {R4-R11,SP,LR}
		BX	LR

    arm_func_end oam_8756CC0








    arm_func_start sub_8756FC0
sub_8756FC0:

var_6C		= -0x6C
var_68		= -0x68
var_64		= -0x64
var_60		= -0x60
var_5C		= -0x5C
var_58		= -0x58
var_54		= -0x54
var_50		= -0x50
var_4C		= -0x4C
var_48		= -0x48
var_44		= -0x44
var_40		= -0x40
var_3C		= -0x3C
var_38		= -0x38
var_34		= -0x34
var_30		= -0x30
var_2C		= -0x2C
arg_0		=  4
arg_4		=  8
arg_8		=  0xC

		MOV	R12, SP
		STMFD	SP!, {R4-R12,LR,PC}
		SUB	R11, R12, #4
		SUB	SP, SP,	#0x44
		MOV	R10, R0
		LDR	R12, [R10]
		STR	R1, [R11,#var_2C]
		MOV	R0, R1
		MLA	R0, R12, R2, R0
		LDR	R4, [R11,#arg_0]
		LDR	R1, [R10,#0x70]
		LDRB	R2, [R10,#0x7C]
		STR	R1, [R11,#var_34]
		TST	R2, #4
		LDR	R2, [R11,#arg_8]
		LDR	LR, [R11,#var_34]
		ADD	R1, R4,	R2
		LDRB	R2, [R10,#0x5C]
		ADD	LR, LR,	R0,LSL#1
		MOV	R2, R2,LSL#11
		STR	LR, [R11,#var_34]
		ADD	R2, R2,	#0x6000000
		STR	R2, [R11,#var_38]
		STR	R12, [R11,#var_3C]
		MOVEQ	R7, #0
		MOVNE	R7, #2
		LDRB	R0, [R10,#0x5F]
		CMP	R4, R1
		LDRB	R1, [R10,#0x60]
		MOV	R2, #1
		LDRH	R12, [R10,#0x64]
		MOV	R0, R2,LSL R0
		MOV	R2, R2,LSL R1
		SUB	R2, R2,	#1
		STR	R2, [R11,#var_40]
		LDR	R1, [R10,#0x68]
		STR	R0, [R11,#var_44]
		LDR	R2, [R1,#0xC]
		AND	R12, R12, #2
		STR	R12, [R11,#var_48]
		LDR	R8, [R10,#4]
		ADD	R2, R1,	R2
		STR	R2, [R11,#var_4C]
		LDRH	R1, [R1,#0x1A]
		SUB	LR, R0,	#1
		STR	R1, [R11,#var_50]
		AND	R3, R3,	LR
		STR	R3, [R11,#var_30]
		BGE	loc_8757378
		RSB	R9, R3,	R0
		LDR	R0, [R11,#arg_4]
		STR	R1, [R11,#var_54]
		RSB	R0, R9,	R0
		STR	R0, [R11,#var_58]

loc_8757098:
		MOV	R5, R4
		TST	R7, #2
		BEQ	loc_875711C
		LDR	R1, [R11,#var_40]
		LDR	R2, [R11,#var_30]
		LDR	LR, [R11,#var_3C]
		CMP	R4, R8
		LDR	R3, [R11,#arg_4]
		MOV	LR, LR,LSL#1
		STR	LR, [R11,#var_60]
		ADD	R0, R2,	R3
		LDR	R3, [R11,#arg_0]
		AND	R12, R4, R1
		LDR	LR, [R11,#arg_8]
		ADD	R1, R4,	#1
		STR	R1, [R11,#var_64]
		ADD	R3, R3,	LR
		STR	R3, [R11,#var_5C]
		MOV	R2, R2,LSL#1
		LDRB	R1, [R10,#0x5F]
		ORR	R3, R7,	#1
		BLT	loc_87570FC

loc_87570F0:
		RSB	R5, R8,	R5
		CMP	R5, R8
		BGE	loc_87570F0

loc_87570FC:
		CMP	R4, #0
		BGE	loc_8757114
		CMP	R5, #0
		BGE	loc_8757114

loc_875710C:
		ADDS	R5, R5,	R8
		BMI	loc_875710C

loc_8757114:

		MOV	R7, R3
		B	loc_87571C4


loc_875711C:
		CMP	R4, R8
		MOVGE	R3, #0
		MOVLT	R3, #1
		CMP	R4, #0
		MOVLT	R3, #0
		CMP	R3, #0
		BEQ	loc_8757180
		LDR	R0, [R11,#var_40]
		LDR	R1, [R11,#var_30]
		LDR	R2, [R11,#arg_4]
		LDR	R3, [R11,#var_3C]
		LDR	LR, [R11,#arg_0]
		AND	R12, R4, R0
		MOV	R3, R3,LSL#1
		STR	R3, [R11,#var_60]
		ADD	R4, R4,	#1
		STR	R4, [R11,#var_64]
		ADD	R0, R1,	R2
		LDR	R3, [R11,#arg_8]
		MOV	R2, R1,LSL#1
		LDRB	R1, [R10,#0x5F]
		ADD	LR, LR,	R3
		STR	LR, [R11,#var_5C]
		ORR	R7, R7,	#1
		B	loc_87571C4


loc_8757180:
		LDR	LR, [R11,#var_40]
		LDR	R1, [R11,#var_30]
		LDR	R2, [R11,#arg_4]
		LDR	R3, [R11,#var_3C]
		AND	R12, R4, LR
		MOV	R3, R3,LSL#1
		STR	R3, [R11,#var_60]
		ADD	R0, R1,	R2
		LDR	LR, [R11,#arg_0]
		MOV	R2, R1,LSL#1
		LDR	R1, [R11,#arg_8]
		ADD	R4, R4,	#1
		STR	R4, [R11,#var_64]
		ADD	LR, LR,	R1
		STR	LR, [R11,#var_5C]
		BIC	R7, R7,	#1
		LDRB	R1, [R10,#0x5F]

loc_87571C4:

		LDR	LR, [R11,#var_4C]
		LDR	R3, [LR,R5,LSL#2]
		LDR	LR, [R11,#var_44]
		CMP	R0, LR
		LDR	R0, [R11,#var_4C]
		ADD	R3, R0,	R3
		ADD	R6, R3,	#2
		MOV	R3, R12,LSL R1
		BLS	loc_87572C8
		LDR	R1, [R11,#var_48]
		CMP	R1, #0
		BEQ	loc_8757294
		TST	R7, #1
		BEQ	loc_875726C
		LDR	R12, [R11,#var_38]
		LDR	R1, [R11,#var_2C]
		ADD	R4, R12, R3,LSL#1
		ADD	R3, R4,	R2
		STR	R3, [SP,#0x6C+var_6C]
		LDR	LR, [R11,#var_54]
		MOV	R0, R6
		LDR	R12, off_8757338
		MOV	R2, R5
		STR	LR, [SP,#0x6C+var_68]
		MOV	R3, R9
		LDR	R12, [R12]
		MOV	LR, PC
		BX	R12
		LDR	LR, [R11,#var_2C]
		STR	R4, [SP,#0x6C+var_6C]
		LDR	R3, [R11,#var_54]
		STR	R3, [SP,#0x6C+var_68]
		MOV	R0, R6
		LDR	R12, [R11,#arg_4]
		MOV	R2, R5
		RSB	R3, R9,	R12
		LDR	R12, off_8757338
		ADD	R1, LR,	R9
		LDR	R12, [R12]
		MOV	LR, PC
		BX	R12
		B	loc_8757358


loc_875726C:
		LDR	LR, [R11,#var_38]
		LDR	R0, [R11,#var_50]
		ADD	R4, LR,	R3,LSL#1
		ADD	R1, R4,	R2
		MOV	R2, R9,LSL#1
		BL	fastMemoryClear16ARM
		LDR	R3, [R11,#var_58]
		MOV	R1, R4
		LDR	R0, [R11,#var_50]
		B	loc_875732C


loc_8757294:
		LDR	R12, [R11,#var_38]
		LDR	R0, [R11,#var_34]
		ADD	R4, R12, R3,LSL#1
		ADD	R1, R4,	R2
		MOV	R2, R9,LSL#1
		BL	fastMemoryCopy16ARM
		LDR	LR, [R11,#var_34]
		MOV	R1, R4
		LDR	R3, [R11,#var_58]
		ADD	R0, LR,	R9
		MOV	R2, R3,LSL#1
		BL	fastMemoryCopy16ARM
		B	loc_8757358


loc_87572C8:
		LDR	R12, [R11,#var_48]
		CMP	R12, #0
		BEQ	loc_875733C
		TST	R7, #1
		BEQ	loc_8757318
		LDR	R1, [R11,#var_2C]
		LDR	LR, [R11,#var_38]
		LDR	R12, off_8757338
		ADD	R3, LR,	R3,LSL#1
		ADD	R3, R3,	R2
		STR	R3, [SP,#0x6C+var_6C]
		LDR	R3, [R11,#var_54]
		STR	R3, [SP,#0x6C+var_68]
		MOV	R0, R6
		LDR	R3, [R11,#arg_4]
		MOV	R2, R5
		LDR	R12, [R12]
		MOV	LR, PC
		BX	R12
		B	loc_8757358


loc_8757318:
		LDR	LR, [R11,#var_38]
		LDR	R0, [R11,#var_50]
		ADD	R1, LR,	R3,LSL#1
		LDR	R3, [R11,#arg_4]
		ADD	R1, R1,	R2

loc_875732C:
		MOV	R2, R3,LSL#1
		BL	fastMemoryClear16ARM
		B	loc_8757358

off_8757338:
    .4byte __sub_8757494



loc_875733C:
		LDR	R0, [R11,#var_34]
		LDR	R12, [R11,#var_38]
		LDR	LR, [R11,#arg_4]
		ADD	R1, R12, R3,LSL#1
		ADD	R1, R1,	R2
		MOV	R2, LR,LSL#1
		BL	fastMemoryCopy16ARM

loc_8757358:

		LDR	R0, [R11,#var_34]
		LDR	R1, [R11,#var_60]
		LDR	R4, [R11,#var_64]
		LDR	R2, [R11,#var_5C]
		ADD	R0, R0,	R1
		STR	R0, [R11,#var_34]
		CMP	R4, R2
		BLT	loc_8757098

loc_8757378:
		LDMDB	R11, {R4-R11,SP,LR}
		BX	LR
    arm_func_end sub_8756FC0







    arm_func_start sub_8757380
sub_8757380:

var_40		= -0x40
var_3C		= -0x3C
var_38		= -0x38
var_34		= -0x34
var_30		= -0x30
var_2C		= -0x2C
arg_0		=  4

		MOV	R12, SP
		STMFD	SP!, {R4-R12,LR,PC}
		SUB	R11, R12, #4
		SUB	SP, SP,	#0x18
		STR	R2, [R11,#var_2C]
		MOV	R10, R0
		LDR	R12, [R11,#arg_0]
		MOV	R5, R2
		ADD	R2, R5,	R12
		CMP	R5, R2
		LDRB	R2, [R10,#0x5C]
		MOV	R2, R2,LSL#11
		STR	R3, [R11,#var_30]
		ADD	R2, R2,	#0x6000000
		STR	R2, [R11,#var_34]
		LDRB	R0, [R10,#0x5F]
		MOV	R3, #1
		LDRB	R2, [R10,#0x60]
		MOV	R0, R3,LSL R0
		MOV	R3, R3,LSL R2
		SUB	R3, R3,	#1
		STR	R3, [R11,#var_38]
		LDR	R2, [R10,#0x68]
		STR	R0, [R11,#var_3C]
		SUB	R12, R0, #1
		LDRH	R6, [R2,#0x1A]
		AND	R8, R1,	R12
		BGE	loc_875748C
		MOV	R7, R8,LSL#1
		LDR	R1, [R11,#var_30]
		RSB	R9, R8,	R0
		RSB	R1, R9,	R1
		STR	R1, [R11,#var_40]

loc_8757404:
		LDR	R2, [R11,#var_30]
		LDR	R12, [R11,#var_3C]
		LDR	R1, [R11,#var_38]
		ADD	R3, R8,	R2
		CMP	R3, R12
		LDRB	R2, [R10,#0x5F]
		AND	R3, R5,	R1
		MOV	R3, R3,LSL R2
		BLS	loc_8757458
		LDR	R2, [R11,#var_34]
		MOV	R0, R6
		ADD	R4, R2,	R3,LSL#1
		ADD	R1, R4,	R7
		MOV	R2, R9,LSL#1
		BL	fastMemoryClear16ARM
		MOV	R0, R6
		LDR	R3, [R11,#var_40]
		MOV	R1, R4
		MOV	R2, R3,LSL#1
		BL	fastMemoryClear16ARM
		B	loc_8757474


loc_8757458:
		LDR	R12, [R11,#var_34]
		MOV	R0, R6
		ADD	R1, R12, R3,LSL#1
		LDR	R3, [R11,#var_30]
		ADD	R1, R1,	R7
		MOV	R2, R3,LSL#1
		BL	fastMemoryClear16ARM

loc_8757474:
		LDR	R12, [R11,#var_2C]
		LDR	R1, [R11,#arg_0]
		ADD	R5, R5,	#1
		ADD	R3, R12, R1
		CMP	R5, R3
		BLT	loc_8757404

loc_875748C:
		LDMDB	R11, {R4-R11,SP,LR}
		BX	LR
    arm_func_end sub_8757380







    arm_func_start sub_8757494
sub_8757494:

var_2C		= -0x2C
arg_0		=  4
arg_4		=  8

		MOV	R12, SP
		STMFD	SP!, {R4-R12,LR,PC}
		MOV	R2, R1
		MOV	R1, #0
		SUB	R11, R12, #4
		SUB	SP, SP,	#4
		MOV	R5, R0
		LDR	R9, [R11,#arg_0]
		MOV	R10, R3
		LDRSH	R0, [R11,#arg_4]

loc_87574BC:
		LDRSH	R7, [R5],#2
		EOR	R8, R7,	R7,ASR#31
		SUB	R8, R8,	R7,ASR#31
		ADD	R3, R1,	R8
		CMP	R3, R2
		BGT	loc_87574E4
		CMP	R7, #0
		ADDGE	R5, R5,	R8,LSL#1
		MOV	R1, R3
		B	loc_87574BC


loc_87574E4:
		CMP	R7, #0
		RSB	R1, R1,	R2
		ADDGE	R5, R5,	R1,LSL#1
		RSB	R8, R1,	R8
		CMP	R10, #0
		BLE	loc_875756C
		MOV	R0, R0,LSL#16
		STR	R0, [R11,#var_2C]

loc_8757504:
		CMP	R8, R10
		MOVLT	R6, R8
		MOVGE	R6, R10
		CMP	R7, #0
		BLT	loc_8757530
		MOV	R0, R5
		MOV	R1, R9
		MOV	R4, R6,LSL#1
		MOV	R2, R4
		BL	fastMemoryCopy16ARM
		B	loc_8757548


loc_8757530:
		MOV	R1, R9
		MOV	R4, R6,LSL#1
		LDR	R3, [R11,#var_2C]
		MOV	R2, R4
		MOV	R0, R3,LSR#16
		BL	fastMemoryClear16ARM

loc_8757548:
		RSB	R10, R6, R10
		ADD	R9, R9,	R4
		CMP	R7, #0
		ADDGE	R5, R5,	R8,LSL#1
		LDRSH	R7, [R5],#2
		EOR	R8, R7,	R7,ASR#31
		SUB	R8, R8,	R7,ASR#31
		CMP	R10, #0
		BGT	loc_8757504

loc_875756C:
		LDMDB	R11, {R4-R11,SP,LR}
		BX	LR
    arm_func_end sub_8757494







    arm_func_start sub_8757574
sub_8757574:
		MOV	R12, SP
		STMFD	SP!, {R4-R12,LR,PC}
		SUB	R11, R12, #4
		MOV	R9, R1
		MOV	R12, R2
		MOV	R4, R3
		SUB	R4, R4,	#1
		CMP	R3, #0
		MOV	R7, R0
		BEQ	loc_87576D0
		MOV	R6, #0x3FC
		ADD	R6, R6,	#3

loc_87575A4:
		MOV	R5, #7
		SUB	R10, R4, #1
		ADD	R8, R12, #0x20
		LDRH	LR, [R9],#2
		ADD	R3, R12, #0x1C
		AND	R2, LR,	R6
		MOV	R2, R2,LSL#3
		ADD	R1, R7,	R2
		ADD	R1, R1,	#4
		TST	LR, #0x800
		MOVEQ	R0, R12
		MOVNE	R0, R3
		LDR	R12, [R7,R2]

loc_87575D8:
		TST	LR, #0x400
		BEQ	loc_8757640
		TST	R12, #1
		MOVEQ	R2, #0
		MOVNE	R2, #0x10000000
		TST	R12, #2
		ORR	R3, R2,	#0x1000000
		MOVNE	R2, R3
		TST	R12, #4
		ORR	R3, R2,	#0x100000
		MOVNE	R2, R3
		TST	R12, #8
		ORR	R3, R2,	#0x10000
		MOVNE	R2, R3
		TST	R12, #0x10
		ORR	R3, R2,	#0x1000
		MOVNE	R2, R3
		TST	R12, #0x20
		ORR	R3, R2,	#0x100
		MOVNE	R2, R3
		TST	R12, #0x40
		ORR	R3, R2,	#0x10
		MOVNE	R2, R3
		TST	R12, #0x80
		ORRNE	R2, R2,	#1
		B	loc_8757698


loc_8757640:
		AND	R2, R12, #1
		TST	R12, #2
		ORR	R3, R2,	#0x10
		MOVNE	R2, R3
		TST	R12, #4
		ORR	R3, R2,	#0x100
		MOVNE	R2, R3
		TST	R12, #8
		ORR	R3, R2,	#0x1000
		MOVNE	R2, R3
		TST	R12, #0x10
		ORR	R3, R2,	#0x10000
		MOVNE	R2, R3
		TST	R12, #0x20
		ORR	R3, R2,	#0x100000
		MOVNE	R2, R3
		TST	R12, #0x40
		ORR	R3, R2,	#0x1000000
		MOVNE	R2, R3
		TST	R12, #0x80
		ORR	R3, R2,	#0x10000000
		MOVNE	R2, R3

loc_8757698:
		TST	LR, #0x800
		STRNE	R2, [R0],#-4
		STREQ	R2, [R0],#4
		CMP	R5, #4
		LDREQ	R12, [R1],#4
		MOVNE	R12, R12,LSR#8
		SUB	R5, R5,	#1
		CMN	R5, #1
		BNE	loc_87575D8
		MOV	R12, R8
		MOV	R3, R4
		MOV	R4, R10
		CMP	R3, #0
		BNE	loc_87575A4

loc_87576D0:
		LDMDB	R11, {R4-R11,SP,LR}
		BX	LR
    arm_func_end sub_8757574







    arm_func_start sub_87576D8
sub_87576D8:

arg_0		=  4
arg_4		=  8

		MOV	R12, SP
		STMFD	SP!, {R4-R12,LR,PC}
		SUB	R11, R12, #4
		MOV	R6, R0
		MOV	R0, R1
		MOV	R10, R3
		LDR	R3, [R6,R2,LSL#2]
		MOV	R1, #0
		LDR	R9, [R11,#arg_0]
		ADD	R3, R6,	R3
		ADD	R6, R3,	#2

loc_8757704:
		LDRSH	R7, [R6],#2
		EOR	R8, R7,	R7,ASR#31
		SUB	R8, R8,	R7,ASR#31
		ADD	R3, R1,	R8
		CMP	R3, R0
		BGT	loc_875772C
		CMP	R7, #0
		ADDGE	R6, R6,	R8,LSL#1
		MOV	R1, R3
		B	loc_8757704


loc_875772C:
		CMP	R7, #0
		RSB	R1, R1,	R0
		ADDGE	R6, R6,	R1,LSL#1
		RSB	R8, R1,	R8
		CMP	R10, #0
		BLE	loc_87577AC

loc_8757744:
		CMP	R8, R10
		MOVLT	R5, R8
		MOVGE	R5, R10
		CMP	R7, #0
		BLT	loc_8757774
		MOV	R1, R6
		MOV	R2, R9
		LDR	R0, [R11,#arg_4]
		MOV	R3, R5
		BL	sub_8757574
		MOV	R4, R5,LSL#5
		B	loc_8757788


loc_8757774:
		MOV	R0, #0
		MOV	R1, R9
		MOV	R4, R5,LSL#5
		MOV	R2, R4
		BL	fastMemoryClear16ARM

loc_8757788:
		RSB	R10, R5, R10
		ADD	R9, R9,	R4
		CMP	R7, #0
		ADDGE	R6, R6,	R8,LSL#1
		LDRSH	R7, [R6],#2
		EOR	R8, R7,	R7,ASR#31
		SUB	R8, R8,	R7,ASR#31
		CMP	R10, #0
		BGT	loc_8757744

loc_87577AC:
		LDMDB	R11, {R4-R11,SP,LR}
		BX	LR
    arm_func_end sub_87576D8







    arm_func_start sub_87577B4
sub_87577B4:

var_38		= -0x38
var_34		= -0x34
var_30		= -0x30
var_2C		= -0x2C

		MOV	R12, SP
		STMFD	SP!, {R4-R12,LR,PC}
		SUB	SP, SP,	#0x10
		MOV	R7, R0
		LDRH	R3, [R7,#0x10]
		SUB	R11, R12, #4
		MUL	R12, R2, R3
		LDR	R2, [R7,#0xC]
		LDR	R3, off_87578D8
		STR	R2, [R11,#var_30]
		LDR	R3, [R3]
		LDR	R8, [R7,#4]
		STR	R3, [R11,#var_2C]
		LDR	LR, [R7]
		MOV	R6, R1
		LDR	R4, [R7,#8]
		MOV	R9, R12,LSR#12
		LDR	R3, [LR,#4]
		ADD	R0, R8,	R6,LSR#1
		LDRB	R2, [LR]
		ADD	R3, R3,	#0x10
		ADD	R3, LR,	R3
		RSB	R10, R3, R0
		CMP	R2, #0
		BNE	loc_8757828
		SUB	R3, R6,	R10,LSL#1
		CMP	R10, #0
		MOVLE	R6, R1
		MOVGT	R6, R3

loc_8757828:
		LDR	R2, off_87578DC
		LDRB	R3, [R2]
		ADD	R3, R3,	#1
		STRB	R3, [R2]
		AND	R3, R3,	#0xFF
		CMP	R3, #1
		BEQ	loc_8757890
		LDRB	R3, [LR]
		CMP	R3, #0
		BEQ	loc_8757A44
		CMP	R3, #1
		BNE	loc_8757A44
		CMP	R6, #0
		BEQ	loc_8757A44
		LDR	R3, [R11,#var_30]
		LDR	R2, [R11,#var_2C]

loc_8757868:
		LDRSB	R0, [R8]
		LDRSH	R1, [R2]
		ADDS	R3, R3,	R4,LSL#4
		ADC	R8, R8,	R4,LSR#28
		MLA	R1, R0,	R9, R1
		STRH	R1, [R2],#2
		SUBS	R6, R6,	#1
		BPL	loc_8757868
		STR	R3, [R11,#var_30]
		B	loc_8757A44


loc_8757890:
		LDRB	R3, [LR]
		CMP	R3, #0
		BEQ	loc_87578E0
		CMP	R3, #1
		BNE	loc_8757A44
		CMP	R6, #0
		BEQ	loc_8757A44
		LDR	R3, [R11,#var_30]
		LDR	R1, [R11,#var_2C]

loc_87578B4:
		LDRSB	R0, [R8]
		ADDS	R3, R3,	R4,LSL#4
		ADC	R8, R8,	R4,LSR#28
		MUL	R0, R9,	R0
		STRH	R0, [R1],#2
		SUBS	R6, R6,	#1
		BPL	loc_87578B4
		STR	R3, [R11,#var_30]
		B	loc_8757A44

off_87578D8:
    .4byte 0x3005E50
off_87578DC:
    .4byte _unk3005E78


loc_87578E0:
		MOV	R6, R6,LSR#1
		LDRSH	LR, [R7,#0x14]
		SUB	R6, R6,	#1
		LDRB	R5, [R7,#0x17]
		CMN	R6, #1
		BEQ	loc_8757A3C
		MOV	R2, #0x7F0
		ADD	R2, R2,	#0xF
		MOV	R3, #0x80000000
		STR	R2, [R11,#var_34]
		MOV	R3, R3,ASR#20
		STR	R3, [R11,#var_38]

loc_8757910:
		LDRB	R12, [R8],#1
		MOV	R3, R5,LSL#5
		LDR	R1, off_8757A54
		EOR	R12, R12, #0xEC
		MOV	R0, R12,LSR#4
		ORR	R3, R3,	R0,LSL#1
		LDRSH	R2, [R1,R3]
		ADD	LR, LR,	R2
		LDR	R2, [R11,#var_34]
		MVN	R1, #0x800
		LDR	R3, [R11,#var_38]
		CMP	LR, R2
		MOVGE	LR, R2
		CMP	LR, R1
		MOVLE	LR, R3
		MOV	R4, LR,ASR#3
		MUL	R4, R9,	R4
		AND	R0, R0,	#7
		LDR	R2, off_8757A58
		ORR	R0, R0,	R5,LSL#3
		LDRB	R5, [R2,R0]
		AND	R1, R12, #0xF
		MOV	R3, R5,LSL#5
		ORR	R3, R3,	R1,LSL#1
		LDR	R1, off_8757A54
		LDRSH	R2, [R1,R3]
		ADD	LR, LR,	R2
		LDR	R2, [R11,#var_34]
		LDR	R3, [R11,#var_2C]
		CMP	LR, R2
		MOVGE	LR, R2
		STRH	R4, [R3],#2
		MVN	R2, #0x800
		LDR	R1, [R11,#var_38]
		CMP	LR, R2
		MOVLE	LR, R1
		MOV	R4, LR,ASR#3
		MUL	R4, R9,	R4
		STR	R3, [R11,#var_2C]
		LDR	R1, [R11,#var_2C]
		AND	R12, R12, #7
		LDR	R3, off_8757A58
		ORR	R12, R12, R5,LSL#3
		LDRB	R5, [R3,R12]
		STRH	R4, [R1],#2
		STR	R1, [R11,#var_2C]
		CMP	R10, #0
		CMPGE	R6, #0
		BNE	loc_8757A30
		LDR	R0, [R7,#0x1C]
		CMP	R0, #0
		BEQ	loc_8757A30
		LDRH	R2, [R7,#0x24]
		LDR	R1, [R7,#0x20]
		ADD	R3, R2,	#1
		MOV	R2, R2,LSL#16
		STRH	R3, [R7,#0x24]
		MOV	R2, R2,ASR#15
		LDRSH	R3, [R2,R1]
		CMN	R3, #1
		MOVEQ	R2, #1
		STREQH	R2, [R7,#0x24]
		LDREQSH	R3, [R1]
		CMN	R3, #1
		LDR	R3, [R0,R3,LSL#2]
		MOV	R6, #0
		MOVNE	R6, R10
		ADDNE	R8, R3,	#0x10
		STRNE	R3, [R7]
		MVN	R10, #0
		MOV	LR, #0
		MOV	R5, LR

loc_8757A30:

		SUB	R6, R6,	#1
		CMN	R6, #1
		BNE	loc_8757910

loc_8757A3C:
		STRB	R5, [R7,#0x17]
		STRH	LR, [R7,#0x14]

loc_8757A44:

		LDR	R3, [R11,#var_30]
		STR	R3, [R7,#0xC]
		STR	R8, [R7,#4]
		B	loc_8757A5C

off_8757A54:
    .4byte Unk_8755F00

off_8757A58:
    .4byte Unk_8756520



loc_8757A5C:
		LDMDB	R11, {R4-R11,SP,LR}
		BX	LR
    arm_func_end sub_87577B4






    arm_func_start sound_8757A64
sound_8757A64:
		MOV	R12, SP
		STMFD	SP!, {R11,R12,LR,PC}
		LDR	R3, off_8757AF8
		SUB	R11, R12, #4
		MOV	R12, R1
		MOV	LR, R0
		LDR	R1, [R3]
		CMP	LR, #0
		CMPNE	R12, #0
		ADD	R2, R1,	R2,LSL#1
		LDMEQDB	R11, {R11,SP,LR}
		BXEQ	LR
		LDR	R3, off_8757AFC
		LDRB	R3, [R3]
		CMP	R3, #0
		BEQ	loc_8757AD0

loc_8757AA4:
		LDRSH	R0, [R2],#2
		MOV	R0, R0,ASR#4
		CMN	R0, #0x80
		MVNLT	R0, #0x7F
		CMP	R0, #0x7F
		MOVGT	R0, #0x7F
		STRB	R0, [LR],#1
		SUBS	R12, R12, #1
		BPL	loc_8757AA4
		LDMDB	R11, {R11,SP,LR}
		BX	LR


loc_8757AD0:
		SUB	R12, R12, #1
		CMN	R12, #1
		LDMEQDB	R11, {R11,SP,LR}
		BXEQ	LR

loc_8757AE0:
		SUB	R12, R12, #1
		STRB	R3, [LR],#1
		CMN	R12, #1
		BNE	loc_8757AE0
		LDMDB	R11, {R11,SP,LR}
		BX	LR

off_8757AF8:
    .4byte 0x3005E50
off_8757AFC:
    .4byte _unk3005E78

    arm_func_end sound_8757A64





    arm_func_start fastMemoryClearARM
fastMemoryClearARM:
		MOV	R12, SP
		STMFD	SP!, {R11,R12,LR,PC}
		SUBS	R3, R2,	#0
		SUB	R11, R12, #4
		MOV	LR, R0
		MOV	R12, R1
		LDMEQDB	R11, {R11,SP,LR}
		BXEQ	LR
		TST	R3, #3
		BEQ	loc_8757B44
		LDR	R0, off_8757B80
		LDR	R3, off_8757B84
		LDR	R12, [R3]
		MOV	LR, PC
		BX	R12
		LDMDB	R11, {R11,SP,LR}
		BX	LR


loc_8757B44:
		MOV	R3, R3,LSR#2
		MOV	R0, LR
		MOV	R1, LR
		MOV	R2, LR
		TST	R3, #1
		STRNE	R0, [R12],#4
		TST	R3, #2
		STMNEIA	R12!, {R0,R1}
		MOVS	R3, R3,LSR#2
		BEQ	loc_8757B78

loc_8757B6C:
		STMIA	R12!, {R0-R2,LR}
		SUBS	R3, R3,	#1
		BNE	loc_8757B6C

loc_8757B78:
		LDMDB	R11, {R11,SP,LR}
		BX	LR



off_8757B80:
    .4byte Str_87566A8

off_8757B84:
    .4byte off_807D96C

    arm_func_end fastMemoryClearARM






    arm_func_start fastMemoryCopyARM
fastMemoryCopyARM:
		MOV	R12, SP
		STMFD	SP!, {R4,R11,R12,LR,PC}
		SUB	R11, R12, #4
		SUBS	R12, R2, #0
		MOV	R4, R0
		MOV	LR, R1
		BEQ	loc_8757C04
		TST	R12, #3
		BEQ	loc_8757BD0
		LDR	R0, off_8757BC8
		LDR	R3, off_8757BCC
		MOV	R1, R12
		LDR	R12, [R3]
		MOV	LR, PC
		BX	R12
		B	loc_8757C04

off_8757BC8:
    .4byte Str_87566F8

off_8757BCC:
    .4byte off_807D96C


loc_8757BD0:
		MOV	R12, R12,LSR#2
		TST	R12, #1
		LDRNE	R0, [R4],#4
		STRNE	R0, [LR],#4
		TST	R12, #2
		LDMNEIA	R4!, {R0,R1}
		STMNEIA	LR!, {R0,R1}
		MOVS	R12, R12,LSR#2
		BEQ	loc_8757C04

loc_8757BF4:
		LDMIA	R4!, {R0-R3}
		STMIA	LR!, {R0-R3}
		SUBS	R12, R12, #1
		BNE	loc_8757BF4

loc_8757C04:

		LDMDB	R11, {R4,R11,SP,LR}
		BX	LR







    arm_func_start fastMemoryClear16ARM
fastMemoryClear16ARM:

		MOV	R12, SP
		STMFD	SP!, {R11,R12,LR,PC}
		SUBS	R3, R2,	#0
		SUB	R11, R12, #4
		MOV	LR, R0
		MOV	R12, R1
		LDMEQDB	R11, {R11,SP,LR}
		BXEQ	LR
		TST	R3, #1
		BEQ	loc_8757C50
		LDR	R0, off_8757C68
		LDR	R3, off_8757C6C
		LDR	R12, [R3]
		MOV	LR, PC
		BX	R12
		LDMDB	R11, {R11,SP,LR}
		BX	LR


loc_8757C50:
		MOV	R3, R3,LSR#1

loc_8757C54:
		STRH	LR, [R12],#2
		SUBS	R3, R3,	#1
		BNE	loc_8757C54
		LDMDB	R11, {R11,SP,LR}
		BX	LR



off_8757C68:
    .4byte Str_8756748

off_8757C6C:
    .4byte off_807D96C
    arm_func_end fastMemoryCopyARM






    arm_func_start fastMemoryCopy16ARM
fastMemoryCopy16ARM:

		MOV	R12, SP
		STMFD	SP!, {R4,R11,R12,LR,PC}
		SUB	R11, R12, #4
		SUBS	R12, R2, #0
		MOV	R4, R0
		MOV	LR, R1
		BEQ	loc_8757CC8
		TST	R12, #1
		BEQ	loc_8757CB4
		LDR	R0, off_8757CAC
		LDR	R3, off_8757CB0
		LDR	R12, [R3]
		MOV	LR, PC
		BX	R12
		B	loc_8757CC8

off_8757CAC:
    .4byte Str_8756798

off_8757CB0:
    .4byte off_807D96C


loc_8757CB4:
		MOV	R12, R12,LSR#1

loc_8757CB8:
		LDRH	R0, [R4],#2
		STRH	R0, [LR],#2
		SUBS	R12, R12, #1
		BNE	loc_8757CB8

loc_8757CC8:

		LDMDB	R11, {R4,R11,SP,LR}
		BX	LR
    arm_func_end fastMemoryCopyARM







    arm_func_start sub_8757CD0
sub_8757CD0:
		MOV	R12, SP
		STMFD	SP!, {R11,R12,LR,PC}
		LDR	R3, off_8757D20
		LDR	R0, [R3]
		SUB	R11, R12, #4
		LDR	R12, [R0,#0x3C]
		MOV	R1, #0x128
		LDRH	R2, [R12],#2
		ADD	R3, R1,	#(SIOMLT_SEND-0x128)
		STRH	R2, [R3]
		ADD	R1, R1,	#(SIOCNT-0x128)
		LDRH	R3, [R1]
		ORR	R3, R3,	#0x80
		STRH	R3, [R1]
		LDRB	R2, [R0]
		STR	R12, [R0,#0x3C]
		ADD	R2, R2,	#1
		STRB	R2, [R0]
		LDMDB	R11, {R11,SP,LR}
		BX	LR

off_8757D20:
    .4byte _unk3005DC4
    arm_func_end sub_8757CD0




    arm_func_start sub_8757D24

sub_8757D24:
		MOV	R12, SP
		STMFD	SP!, {R4-R7,R11,R12,LR,PC}
		MOV	R3, #0x128
		LDR	R1, off_8757E38
		ADD	R3, R3,	#(SIOCNT-0x128)
		LDRH	R2, [R3]
		SUB	R11, R12, #4
		LDR	R0, [R1]
		TST	R2, #0x40
		LDRB	R2, [R0,#3]
		MOV	R7, R1
		LDRNE	R3, [R0,#0x14]
		ORRNE	R3, R3,	#0x80
		STRNE	R3, [R0,#0x14]
		LDR	R3, [R7]
		MOV	R0, #0
		LDRB	R1, [R3,#1]
		MOV	R5, R2
		LDR	R2, [R3,#0x34]
		CMP	R0, R5
		ADD	R12, R2, R1,LSL#1
		BCS	loc_8757DFC
		MOV	R4, #0x120
		ADD	R4, R4,	#0x4000000
		MOV	LR, #0xFD00
		ADD	LR, LR,	#0xD9
		MOV	R6, R7

loc_8757D90:
		MOV	R3, R0,LSL#16
		MOV	R1, R3,LSR#16
		MOV	R2, R1,LSL#1
		LDRH	R3, [R2,R4]
		MOV	R3, R3,LSL#16
		MOV	R3, R3,ASR#16
		MOV	R0, R3
		MOV	R2, R0,LSL#16
		CMP	LR, R2,LSR#16
		MOVNE	R3, #0
		MOVEQ	R3, #1
		CMP	R3, #0
		CMPNE	R1, #0
		LDRNE	R2, [R6]
		LDRNE	R3, [R2,#0x14]
		ORRNE	R3, R3,	#0x40
		STRNE	R3, [R2,#0x14]
		ADD	R3, R1,	#1
		STRH	R0, [R12]
		MOV	R3, R3,LSL#16
		LDR	R1, [R6]
		CMP	R5, R3,LSR#16
		LDR	R2, [R1,#0x18]
		MOV	R0, R3,ASR#16
		BIC	R2, R2,	#1
		ADD	R12, R12, R2
		BHI	loc_8757D90

loc_8757DFC:
		LDR	R2, [R7]
		LDRB	R3, [R2,#1]
		ADD	R3, R3,	#1
		STRB	R3, [R2,#1]
		BL	sub_8757CD0
		LDR	R2, [R7]
		LDRB	R1, [R2]
		LDR	R3, [R2,#0x18]
		CMP	R1, R3,LSR#1
		BNE	loc_8757E44
		LDR	R3, off_8757E3C
		LDR	R1, off_8757E40
		LDR	R2, [R3]
		STR	R2, [R1,#0x18]
		B	loc_8757E44

off_8757E38:
    .4byte _unk3005DC4
off_8757E3C:
    .4byte __sub_8757E4C
off_8757E40:
    .4byte _unk3000DF0


loc_8757E44:

		LDMDB	R11, {R4-R7,R11,SP,LR}
		BX	LR

    arm_func_end sub_8757D24







    arm_func_start sub_8757E4C

sub_8757E4C:
		MOV	R12, SP
		STMFD	SP!, {R4-R8,R11,R12,LR,PC}
		MOV	R3, #0x10C
		SUB	R11, R12, #4
		LDR	R12, off_8757FBC
		ADD	R3, R3,	#0x4000002
		LDR	R1, [R12]
		MOV	R2, #0x200
		LDRB	R8, [R1,#3]
		MOV	R0, #0
		STRH	R0, [R3]
		ADD	R2, R2,	#DISPCNT
		LDRH	R3, [R2]
		BIC	R3, R3,	#0x40
		MOV	R3, R3,LSL#16
		MOV	R3, R3,LSR#16
		STRH	R3, [R2]
		MOV	R7, R12
		LDRB	R2, [R1,#1]
		MOV	R5, R8
		LDR	R3, [R1,#0x34]
		CMP	R0, R5
		ADD	LR, R3,	R2,LSL#1
		BCS	loc_8757F2C
		MOV	R4, #0x120
		ADD	R4, R4,	#0x4000000
		MOV	R12, #0xFD00
		ADD	R12, R12, #0xD9
		MOV	R6, R7

loc_8757EC0:
		MOV	R3, R0,LSL#16
		MOV	R0, R3,LSR#16
		MOV	R2, R0,LSL#1
		LDRH	R3, [R2,R4]
		MOV	R3, R3,LSL#16
		MOV	R3, R3,ASR#16
		MOV	R1, R3
		MOV	R2, R1,LSL#16
		CMP	R12, R2,LSR#16
		MOVNE	R3, #0
		MOVEQ	R3, #1
		CMP	R3, #0
		CMPNE	R0, #0
		LDRNE	R2, [R6]
		LDRNE	R3, [R2,#0x14]
		ORRNE	R3, R3,	#0x40
		STRNE	R3, [R2,#0x14]
		ADD	R3, R0,	#1
		STRH	R1, [LR]
		MOV	R3, R3,LSL#16
		LDR	R1, [R6]
		MOV	R0, R3,ASR#16
		LDR	R2, [R1,#0x18]
		CMP	R5, R3,LSR#16
		BIC	R2, R2,	#1
		ADD	LR, LR,	R2
		BHI	loc_8757EC0

loc_8757F2C:
		MOV	R4, R7
		LDR	R1, [R4]
		LDR	R3, [R1,#0x14]
		TST	R3, #0x40
		BNE	loc_8757F60
		LDR	R3, [R1,#0x18]
		MUL	R2, R8,	R3
		LDR	R0, [R1,#0x34]
		LDR	R12, off_8757FC0
		LDR	R1, [R1,#0x38]
		LDR	R12, [R12]
		MOV	LR, PC
		BX	R12

loc_8757F60:
		MVN	R3, #0x224
		SUB	R3, R3,	#2
		MOV	R2, #0x128
		ADD	R1, R2,	#(SIOMLT_SEND-0x128)
		STRH	R3, [R1]
		ADD	R2, R2,	#(SIOCNT-0x128)
		LDRH	R3, [R2]
		ORR	R3, R3,	#0x80
		STRH	R3, [R2]
		LDRH	R1, [R2]
		TST	R1, #0x40
		LDRNE	R2, [R4]
		LDRNE	R3, [R2,#0x14]
		ORRNE	R3, R3,	#0x80
		STRNE	R3, [R2,#0x14]
		LDR	R2, [R7]
		MOV	R3, #0
		STRB	R3, [R2,#1]
		LDR	R1, [R7]
		LDR	R3, [R1,#0x14]
		ORR	R3, R3,	#0x200
		STR	R3, [R1,#0x14]
		B	loc_8757FC4

off_8757FBC:
    .4byte _unk3005DC4
off_8757FC0:
    .4byte __fastMemoryCopyARM


loc_8757FC4:
		LDMDB	R11, {R4-R8,R11,SP,LR}
		BX	LR


    arm_func_end sub_8757E4C







    arm_func_start sub_8757FCC
sub_8757FCC:
		MOV	R12, SP
		STMFD	SP!, {R4-R8,R10-R12,LR,PC}
		LDR	R1, off_87580EC
		LDR	LR, [R1]
		LDR	R2, [LR,#0x18]
		SUB	R11, R12, #4
		LDRB	R4, [LR]
		MOV	R8, #0
		LDR	R3, [LR,#0x14]
		MOV	R6, R1
		LDRB	R0, [LR,#3]
		MOV	R2, R2,LSL#15
		CMP	R4, R2,LSR#16
		ORR	R3, R3,	#0x20
		STR	R3, [LR,#0x14]
		MOV	R7, R2,ASR#16
		BCC	loc_8758020
		STRB	R8, [LR]
		B	loc_8758028


loc_8758018:
		MOV	R8, #1
		B	loc_87580C4


loc_8758020:
		ADD	R3, R4,	#1
		STRB	R3, [LR]

loc_8758028:
		MOV	R12, #0
		MOV	R0, R0,LSL#16
		MOV	R5, R0,LSR#16
		LDR	R2, [R6]
		CMP	R12, R5
		LDRB	R1, [R2,#1]
		MOV	R7, R7,LSL#16
		LDR	R3, [R2,#0x34]
		MOV	R10, R0
		ADD	LR, R3,	R1,LSL#1
		BCS	loc_87580C4
		MOV	R4, #0x120
		ADD	R4, R4,	#0x4000000
		MOV	R0, #0xFD00
		ADD	R0, R0,	#0xD9

loc_8758064:
		MOV	R3, R12,LSL#16
		MOV	R12, R3,LSR#16
		MOV	R2, R12,LSL#1
		LDRH	R1, [R2,R4]
		MOV	R1, R1,LSL#16
		CMP	R12, #0
		MOVNE	R2, #0
		MOVEQ	R2, #1
		CMP	R0, R1,LSR#16
		MOVNE	R3, #0
		MOVEQ	R3, #1
		TST	R2, R3
		MOV	R1, R1,ASR#16
		BNE	loc_8758018
		ADD	R3, R12, #1
		STRH	R1, [LR]
		MOV	R3, R3,LSL#16
		LDR	R1, [R6]
		MOV	R12, R3,ASR#16
		LDR	R2, [R1,#0x18]
		CMP	R5, R3,LSR#16
		BIC	R2, R2,	#1
		ADD	LR, LR,	R2
		BHI	loc_8758064

loc_87580C4:

		LDR	R2, [R6]
		MOV	R1, #0x128
		LDRB	R3, [R2]
		ADD	R1, R1,	#0x4000002
		CMP	R3, R7,LSR#16
		BCS	loc_87580F0
		LDR	R2, [R2,#0x3C]
		MOV	R3, R3,LSL#1
		LDRH	R3, [R3,R2]
		B	loc_87580F8

off_87580EC:
    .4byte _unk3005DC4


loc_87580F0:
		MVN	R3, #0x224
		SUB	R3, R3,	#2

loc_87580F8:
		STRH	R3, [R1]
		CMP	R8, #0
		BNE	loc_8758118
		LDR	R2, [R6]
		LDRB	R3, [R2,#1]
		ADD	R3, R3,	#1
		STRB	R3, [R2,#1]
		BEQ	loc_8758180

loc_8758118:
		LDR	R1, [R6]
		LDRB	R3, [R1,#1]
		MOV	R0, R7,LSR#16
		LDR	R12, [R1,#0x3C]
		CMP	R3, R0
		LDRNE	R3, [R1,#0x14]
		ORRNE	R3, R3,	#0x40
		STRNE	R3, [R1,#0x14]
		MOV	R0, R0,LSL#1
		MOV	R3, R10,LSR#16
		MUL	R2, R3,	R0
		LDR	R1, [R6]
		LDR	R3, [R1,#0x40]
		MOV	R0, #0
		STRB	R0, [R1,#1]
		STR	R3, [R1,#0x3C]
		STR	R12, [R1,#0x40]
		LDR	R3, [R6]
		STRB	R0, [R3]
		LDR	R12, [R6]
		LDR	R3, off_87581A8
		ADD	R0, R12, #0x34
		LDMIA	R0, {R0,R1}
		LDR	R12, [R3]
		MOV	LR, PC
		BX	R12

loc_8758180:
		MOV	R3, #0x128
		ADD	R3, R3,	#0x4000000
		LDRH	R2, [R3]
		TST	R2, #0x40
		BEQ	loc_87581AC
		LDR	R2, [R6]
		LDR	R3, [R2,#0x14]
		ORR	R3, R3,	#0x80
		STR	R3, [R2,#0x14]
		B	loc_87581AC

off_87581A8:
    .4byte __fastMemoryCopyARM


loc_87581AC:

		LDMDB	R11, {R4-R8,R10,R11,SP,LR}
		BX	LR
    arm_func_end sub_8757FCC

