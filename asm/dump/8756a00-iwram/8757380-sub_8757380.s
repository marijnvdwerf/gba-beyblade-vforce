.include "asm/common.inc"

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
		add	R2, R5,	R12
		CMP	R5, R2
		LDRB	R2, [R10,#0x5C]
		MOV	R2, R2,LSL#11
		STR	R3, [R11,#var_30]
		add	R2, R2,	#0x6000000
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
		add	R3, R8,	R2
		CMP	R3, R12
		LDRB	R2, [R10,#0x5F]
		AND	R3, R5,	R1
		MOV	R3, R3,LSL R2
		BLS	loc_8757458
		LDR	R2, [R11,#var_34]
		MOV	R0, R6
		add	R4, R2,	R3,LSL#1
		add	R1, R4,	R7
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
		add	R1, R12, R3,LSL#1
		LDR	R3, [R11,#var_30]
		add	R1, R1,	R7
		MOV	R2, R3,LSL#1
		BL	fastMemoryClear16ARM

loc_8757474:
		LDR	R12, [R11,#var_2C]
		LDR	R1, [R11,#arg_0]
		add	R5, R5,	#1
		add	R3, R12, R1
		CMP	R5, R3
		BLT	loc_8757404

loc_875748C:
		LDMDB	R11, {R4-R11,SP,LR}
		BX	LR
    arm_func_end sub_8757380







