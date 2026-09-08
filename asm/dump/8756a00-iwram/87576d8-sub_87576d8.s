.include "asm/common.inc"

    arm_func_start sub_87576D8
sub_87576D8:

arg_0		=  4
arg_4		=  8

		MOV	R12, SP
		STMFD	SP!, {R4-R12,LR,PC}
		SUB	R11, R12, #4
		MOV	R6, R0
		MOV	R0, R1
		MOV	R10, R3
		LDR	R3, [R6,R2,LSL#2]
		MOV	R1, #0
		LDR	R9, [R11,#arg_0]
		add	R3, R6,	R3
		add	R6, R3,	#2

loc_8757704:
		LDRSH	R7, [R6],#2
		eor	R8, R7,	R7,ASR#31
		SUB	R8, R8,	R7,ASR#31
		add	R3, R1,	R8
		CMP	R3, R0
		BGT	loc_875772C
		CMP	R7, #0
		ADDGE	R6, R6,	R8,LSL#1
		MOV	R1, R3
		B	loc_8757704


loc_875772C:
		CMP	R7, #0
		RSB	R1, R1,	R0
		ADDGE	R6, R6,	R1,LSL#1
		RSB	R8, R1,	R8
		CMP	R10, #0
		BLE	loc_87577AC

loc_8757744:
		CMP	R8, R10
		MOVLT	R5, R8
		MOVGE	R5, R10
		CMP	R7, #0
		BLT	loc_8757774
		MOV	R1, R6
		MOV	R2, R9
		LDR	R0, [R11,#arg_4]
		MOV	R3, R5
		BL	sub_8757574
		MOV	R4, R5,LSL#5
		B	loc_8757788


loc_8757774:
		MOV	R0, #0
		MOV	R1, R9
		MOV	R4, R5,LSL#5
		MOV	R2, R4
		BL	fastMemoryClear16ARM

loc_8757788:
		RSB	R10, R5, R10
		add	R9, R9,	R4
		CMP	R7, #0
		ADDGE	R6, R6,	R8,LSL#1
		LDRSH	R7, [R6],#2
		eor	R8, R7,	R7,ASR#31
		SUB	R8, R8,	R7,ASR#31
		CMP	R10, #0
		BGT	loc_8757744

loc_87577AC:
		LDMDB	R11, {R4-R11,SP,LR}
		BX	LR
    arm_func_end sub_87576D8







