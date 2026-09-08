.include "asm/common.inc"

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
		add	R2, R1,	R2,LSL#1
		LDMEQDB	R11, {R11,SP,LR}
		BXEQ	LR
		LDR	R3, off_8757AFC
		LDRB	R3, [R3]
		CMP	R3, #0
		BEQ	loc_8757AD0

loc_8757AA4:
		LDRSH	R0, [R2],#2
		MOV	R0, R0,ASR#4
		cmn	R0, #0x80
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
		cmn	R12, #1
		LDMEQDB	R11, {R11,SP,LR}
		BXEQ	LR

loc_8757AE0:
		SUB	R12, R12, #1
		STRB	R3, [LR],#1
		cmn	R12, #1
		BNE	loc_8757AE0
		LDMDB	R11, {R11,SP,LR}
		BX	LR

off_8757AF8:
    .4byte 0x3005E50
off_8757AFC:
    .4byte _unk3005E78

    arm_func_end sound_8757A64





