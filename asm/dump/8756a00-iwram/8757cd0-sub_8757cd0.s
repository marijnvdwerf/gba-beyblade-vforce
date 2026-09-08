.include "asm/common.inc"

    arm_func_start sub_8757CD0
sub_8757CD0:
		MOV	R12, SP
		STMFD	SP!, {R11,R12,LR,PC}
		LDR	R3, off_8757D20
		LDR	R0, [R3]
		SUB	R11, R12, #4
		LDR	R12, [R0,#0x3C]
		MOV	R1, #0x128
		LDRH	R2, [R12],#2
		add	R3, R1,	#(SIOMLT_SEND-0x128)
		STRH	R2, [R3]
		add	R1, R1,	#(SIOCNT-0x128)
		LDRH	R3, [R1]
		ORR	R3, R3,	#0x80
		STRH	R3, [R1]
		LDRB	R2, [R0]
		STR	R12, [R0,#0x3C]
		add	R2, R2,	#1
		STRB	R2, [R0]
		LDMDB	R11, {R11,SP,LR}
		BX	LR

off_8757D20:
    .4byte _unk3005DC4
    arm_func_end sub_8757CD0




