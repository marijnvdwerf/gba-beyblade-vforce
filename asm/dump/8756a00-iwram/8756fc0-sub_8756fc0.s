.include "asm/common.inc"

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
		add	R1, R4,	R2
		LDRB	R2, [R10,#0x5C]
		add	LR, LR,	R0,LSL#1
		MOV	R2, R2,LSL#11
		STR	LR, [R11,#var_34]
		add	R2, R2,	#0x6000000
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
		add	R2, R1,	R2
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
		add	R0, R2,	R3
		LDR	R3, [R11,#arg_0]
		AND	R12, R4, R1
		LDR	LR, [R11,#arg_8]
		add	R1, R4,	#1
		STR	R1, [R11,#var_64]
		add	R3, R3,	LR
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
		add	R4, R4,	#1
		STR	R4, [R11,#var_64]
		add	R0, R1,	R2
		LDR	R3, [R11,#arg_8]
		MOV	R2, R1,LSL#1
		LDRB	R1, [R10,#0x5F]
		add	LR, LR,	R3
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
		add	R0, R1,	R2
		LDR	LR, [R11,#arg_0]
		MOV	R2, R1,LSL#1
		LDR	R1, [R11,#arg_8]
		add	R4, R4,	#1
		STR	R4, [R11,#var_64]
		add	LR, LR,	R1
		STR	LR, [R11,#var_5C]
		bic	R7, R7,	#1
		LDRB	R1, [R10,#0x5F]

loc_87571C4:

		LDR	LR, [R11,#var_4C]
		LDR	R3, [LR,R5,LSL#2]
		LDR	LR, [R11,#var_44]
		CMP	R0, LR
		LDR	R0, [R11,#var_4C]
		add	R3, R0,	R3
		add	R6, R3,	#2
		MOV	R3, R12,LSL R1
		BLS	loc_87572C8
		LDR	R1, [R11,#var_48]
		CMP	R1, #0
		BEQ	loc_8757294
		TST	R7, #1
		BEQ	loc_875726C
		LDR	R12, [R11,#var_38]
		LDR	R1, [R11,#var_2C]
		add	R4, R12, R3,LSL#1
		add	R3, R4,	R2
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
		add	R1, LR,	R9
		LDR	R12, [R12]
		MOV	LR, PC
		BX	R12
		B	loc_8757358


loc_875726C:
		LDR	LR, [R11,#var_38]
		LDR	R0, [R11,#var_50]
		add	R4, LR,	R3,LSL#1
		add	R1, R4,	R2
		MOV	R2, R9,LSL#1
		BL	fastMemoryClear16ARM
		LDR	R3, [R11,#var_58]
		MOV	R1, R4
		LDR	R0, [R11,#var_50]
		B	loc_875732C


loc_8757294:
		LDR	R12, [R11,#var_38]
		LDR	R0, [R11,#var_34]
		add	R4, R12, R3,LSL#1
		add	R1, R4,	R2
		MOV	R2, R9,LSL#1
		BL	fastMemoryCopy16ARM
		LDR	LR, [R11,#var_34]
		MOV	R1, R4
		LDR	R3, [R11,#var_58]
		add	R0, LR,	R9
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
		add	R3, LR,	R3,LSL#1
		add	R3, R3,	R2
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
		add	R1, LR,	R3,LSL#1
		LDR	R3, [R11,#arg_4]
		add	R1, R1,	R2

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
		add	R1, R12, R3,LSL#1
		add	R1, R1,	R2
		MOV	R2, LR,LSL#1
		BL	fastMemoryCopy16ARM

loc_8757358:

		LDR	R0, [R11,#var_34]
		LDR	R1, [R11,#var_60]
		LDR	R4, [R11,#var_64]
		LDR	R2, [R11,#var_5C]
		add	R0, R0,	R1
		STR	R0, [R11,#var_34]
		CMP	R4, R2
		BLT	loc_8757098

loc_8757378:
		LDMDB	R11, {R4-R11,SP,LR}
		BX	LR
    arm_func_end sub_8756FC0







