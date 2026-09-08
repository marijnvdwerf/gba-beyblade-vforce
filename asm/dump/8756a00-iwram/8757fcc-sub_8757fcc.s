.include "asm/common.inc"

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
		add	R3, R4,	#1
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
		add	LR, R3,	R1,LSL#1
		BCS	loc_87580C4
		MOV	R4, #0x120
		add	R4, R4,	#0x4000000
		MOV	R0, #0xFD00
		add	R0, R0,	#0xD9

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
		add	R3, R12, #1
		STRH	R1, [LR]
		MOV	R3, R3,LSL#16
		LDR	R1, [R6]
		MOV	R12, R3,ASR#16
		LDR	R2, [R1,#0x18]
		CMP	R5, R3,LSR#16
		bic	R2, R2,	#1
		add	LR, LR,	R2
		BHI	loc_8758064

loc_87580C4:

		LDR	R2, [R6]
		MOV	R1, #0x128
		LDRB	R3, [R2]
		add	R1, R1,	#0x4000002
		CMP	R3, R7,LSR#16
		BCS	loc_87580F0
		LDR	R2, [R2,#0x3C]
		MOV	R3, R3,LSL#1
		LDRH	R3, [R3,R2]
		B	loc_87580F8

off_87580EC:
    .4byte _unk3005DC4


loc_87580F0:
		mvn	R3, #0x224
		SUB	R3, R3,	#2

loc_87580F8:
		STRH	R3, [R1]
		CMP	R8, #0
		BNE	loc_8758118
		LDR	R2, [R6]
		LDRB	R3, [R2,#1]
		add	R3, R3,	#1
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
		add	R0, R12, #0x34
		LDMIA	R0, {R0,R1}
		LDR	R12, [R3]
		MOV	LR, PC
		BX	R12

loc_8758180:
		MOV	R3, #0x128
		add	R3, R3,	#0x4000000
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

