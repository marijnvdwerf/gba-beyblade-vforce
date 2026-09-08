.include "asm/common.inc"

    arm_func_start sub_8757494
sub_8757494:

var_2C		= -0x2C
arg_0		=  4
arg_4		=  8

		MOV	R12, SP
		STMFD	SP!, {R4-R12,LR,PC}
		MOV	R2, R1
		MOV	R1, #0
		SUB	R11, R12, #4
		SUB	SP, SP,	#4
		MOV	R5, R0
		LDR	R9, [R11,#arg_0]
		MOV	R10, R3
		LDRSH	R0, [R11,#arg_4]

loc_87574BC:
		LDRSH	R7, [R5],#2
		eor	R8, R7,	R7,ASR#31
		SUB	R8, R8,	R7,ASR#31
		add	R3, R1,	R8
		CMP	R3, R2
		BGT	loc_87574E4
		CMP	R7, #0
		ADDGE	R5, R5,	R8,LSL#1
		MOV	R1, R3
		B	loc_87574BC


loc_87574E4:
		CMP	R7, #0
		RSB	R1, R1,	R2
		ADDGE	R5, R5,	R1,LSL#1
		RSB	R8, R1,	R8
		CMP	R10, #0
		BLE	loc_875756C
		MOV	R0, R0,LSL#16
		STR	R0, [R11,#var_2C]

loc_8757504:
		CMP	R8, R10
		MOVLT	R6, R8
		MOVGE	R6, R10
		CMP	R7, #0
		BLT	loc_8757530
		MOV	R0, R5
		MOV	R1, R9
		MOV	R4, R6,LSL#1
		MOV	R2, R4
		BL	fastMemoryCopy16ARM
		B	loc_8757548


loc_8757530:
		MOV	R1, R9
		MOV	R4, R6,LSL#1
		LDR	R3, [R11,#var_2C]
		MOV	R2, R4
		MOV	R0, R3,LSR#16
		BL	fastMemoryClear16ARM

loc_8757548:
		RSB	R10, R6, R10
		add	R9, R9,	R4
		CMP	R7, #0
		ADDGE	R5, R5,	R8,LSL#1
		LDRSH	R7, [R5],#2
		eor	R8, R7,	R7,ASR#31
		SUB	R8, R8,	R7,ASR#31
		CMP	R10, #0
		BGT	loc_8757504

loc_875756C:
		LDMDB	R11, {R4-R11,SP,LR}
		BX	LR
    arm_func_end sub_8757494







