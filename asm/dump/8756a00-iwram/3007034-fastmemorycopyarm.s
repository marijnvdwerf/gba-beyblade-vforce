.include "asm/common.inc"

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







