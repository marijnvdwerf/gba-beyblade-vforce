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
    .set SpriteEntry.spriteSheet, 0x2C
    .set SpriteEntry.rotationScale, 0x30
    .set RotationScale.scale_x, 0x14
    .set RotationScale.scale_y, 0x16
    .set OAMAttribute, 0

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
		add	R0, R0,	#0x300
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
		add	R2, R6,	#0x8000
		cmn	LR, #0x5000
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
		add	R10, R10, #8
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
		add	R8, R10, #4
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
		mvn	R5, #0
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
		add	R10, R10, #8
		B	loc_8756E04


loc_8756EC4:
		LDRH	R3, [R4,#SpriteEntry.characterName]
		LDRH	R2, [R4,#SpriteEntry.oam_attr_2]

		bic	R3, R3,	#0b1111110000000000
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
		add	R10, R10, #8
		LDR	R4, [R4,#4]
		B	loc_8756E04


loc_8756F38:
		LDR	R8, [R11,#var_30]
		cmn	R8, #1
		BEQ	loc_8756FB0
		MOV	R3, #0xA0

loc_8756F48:
		SUB	R8, R8,	#1
		STR	R3, [R10]
		cmn	R8, #1
		add	R10, R10, #8
		BNE	loc_8756F48
		B	loc_8756FB0

off_8756F60:
    .4byte _unk3005DE4

off_8756F64:
    .4byte _unk3005DF8
off_8756F68:
    .4byte _spritesFree
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








