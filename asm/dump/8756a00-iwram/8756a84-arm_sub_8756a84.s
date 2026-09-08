.include "asm/common.inc"

    .set SpriteEntry.field_16, 0x16
    .set SpriteEntry.frame, 0x18
    .set SpriteEntry.imageData, 0x28
    .set SpriteEntry.spriteSheet, 0x2C
    .set SpriteSheetHeader.palette, 0xC
    .set SpriteSheetHeader.field_D, 0xD
    .set SpriteSheetHeader.tileCount, 0xE
    .set SpriteSheetHeader.imageFirstOffset, 0x10
    .set SpriteSheetHeader.imageListOffset, 0x1C

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
		add	R0, R3,	R4,LSL R2
		BNE	loc_8756AF4
		MOV	R1, #VRAM
		LDR	R2, [R11,#objNo]
		add	R1, R1, #(VRAM_OBJ - VRAM)
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
		add	R2, R12, R5
		LDR	R3, [R12,#SpriteSheetHeader.imageFirstOffset]
		CMP	LR, #4
		LDR	R1, [R2,R4,LSL#2]
		add	R3, R12, R3
		LDR	R4, [R3,R1]
		add	R0, R3,	R1
		LDRHI	R2, [R0,#4]
		STRHI	R2, [R11,#var_30]
		AND	R3, LR,	#0xFC
		add	R10, R0, R3
		LDR	R3, [R11,#objNo]
		LDRH	R8, [R12,#SpriteSheetHeader.tileCount]
		LDRB	R1, [R12,#SpriteSheetHeader.palette]
		MOV	R2, R3,LSL#22
		MOV	R2, R2,LSR#22
		MOV	R3, #0x6000000
		add	R3, R3,	#0x10000
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
		add	R10, R10, R5
		LDR	R3, off_8756C94
		add	R7, R7,	R5
		LDR	R12, [R3]
		MOV	LR, PC
		BX	R12
		B	loc_8756B58


loc_8756BB4:
		add	R6, R6,	#4
		MOV	R4, R4,LSR#4

loc_8756BBC:
		AND	R3, R4,	#0xF
		CMP	R3, #0xF
		BEQ	loc_8756BB4
		B	loc_8756BD4


loc_8756BCC:
		add	R6, R6,	#2
		MOV	R4, R4,LSR#2

loc_8756BD4:
		AND	R3, R4,	#3
		CMP	R3, #3
		BEQ	loc_8756BCC
		TST	R4, #1
		BEQ	loc_8756BF8

loc_8756BE8:
		add	R6, R6,	#1
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
		add	R7, R7,	R5
		LDR	R12, [R3]
		MOV	LR, PC
		BX	R12
		B	loc_8756C80


loc_8756C28:
		add	R6, R6,	#4
		MOV	R4, R4,LSR#4

loc_8756C30:
		TST	R4, #0xF
		BEQ	loc_8756C28
		TST	R4, #3
		BNE	loc_8756C5C

loc_8756C40:
		add	R6, R6,	#2
		MOV	R4, R4,LSR#2
		TST	R4, #3
		BEQ	loc_8756C40
		B	loc_8756C5C


loc_8756C54:
		add	R6, R6,	#1
		MOV	R4, R4,LSR#1

loc_8756C5C:

		TST	R4, #1
		BEQ	loc_8756C54
		MOV	R5, R6,LSL R9
		MOV	R0, R10
		MOV	R1, R7
		MOV	R2, R5
		BL	fastMemoryCopyARM
		add	R10, R10, R5
		add	R7, R7,	R5

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
		add	R3, R3,	#1
		STR	R3, [R2]
		B	loc_8756CB8

off_8756CB4:
    .4byte 0x3005E70



loc_8756CB8:
		LDMDB	R11, {R4-R11,SP,LR}
		BX	LR

    arm_func_end ARM_sub_8756A84







