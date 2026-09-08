.include "asm/common.inc"

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







