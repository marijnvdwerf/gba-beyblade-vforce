.include "asm/common.inc"

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






