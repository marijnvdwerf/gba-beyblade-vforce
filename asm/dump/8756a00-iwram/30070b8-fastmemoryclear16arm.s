.include "asm/common.inc"

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






