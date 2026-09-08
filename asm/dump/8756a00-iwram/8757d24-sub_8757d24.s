.include "asm/common.inc"

    arm_func_start sub_8757D24

sub_8757D24:
		MOV	R12, SP
		STMFD	SP!, {R4-R7,R11,R12,LR,PC}
		MOV	R3, #0x128
		LDR	R1, off_8757E38
		add	R3, R3,	#(SIOCNT-0x128)
		LDRH	R2, [R3]
		SUB	R11, R12, #4
		LDR	R0, [R1]
		TST	R2, #0x40
		LDRB	R2, [R0,#3]
		MOV	R7, R1
		LDRNE	R3, [R0,#0x14]
		ORRNE	R3, R3,	#0x80
		STRNE	R3, [R0,#0x14]
		LDR	R3, [R7]
		MOV	R0, #0
		LDRB	R1, [R3,#1]
		MOV	R5, R2
		LDR	R2, [R3,#0x34]
		CMP	R0, R5
		add	R12, R2, R1,LSL#1
		BCS	loc_8757DFC
		MOV	R4, #0x120
		add	R4, R4,	#0x4000000
		MOV	LR, #0xFD00
		add	LR, LR,	#0xD9
		MOV	R6, R7

loc_8757D90:
		MOV	R3, R0,LSL#16
		MOV	R1, R3,LSR#16
		MOV	R2, R1,LSL#1
		LDRH	R3, [R2,R4]
		MOV	R3, R3,LSL#16
		MOV	R3, R3,ASR#16
		MOV	R0, R3
		MOV	R2, R0,LSL#16
		CMP	LR, R2,LSR#16
		MOVNE	R3, #0
		MOVEQ	R3, #1
		CMP	R3, #0
		CMPNE	R1, #0
		LDRNE	R2, [R6]
		LDRNE	R3, [R2,#0x14]
		ORRNE	R3, R3,	#0x40
		STRNE	R3, [R2,#0x14]
		add	R3, R1,	#1
		STRH	R0, [R12]
		MOV	R3, R3,LSL#16
		LDR	R1, [R6]
		CMP	R5, R3,LSR#16
		LDR	R2, [R1,#0x18]
		MOV	R0, R3,ASR#16
		bic	R2, R2,	#1
		add	R12, R12, R2
		BHI	loc_8757D90

loc_8757DFC:
		LDR	R2, [R7]
		LDRB	R3, [R2,#1]
		add	R3, R3,	#1
		STRB	R3, [R2,#1]
		BL	sub_8757CD0
		LDR	R2, [R7]
		LDRB	R1, [R2]
		LDR	R3, [R2,#0x18]
		CMP	R1, R3,LSR#1
		BNE	loc_8757E44
		LDR	R3, off_8757E3C
		LDR	R1, off_8757E40
		LDR	R2, [R3]
		STR	R2, [R1,#0x18]
		B	loc_8757E44

off_8757E38:
    .4byte _unk3005DC4
off_8757E3C:
    .4byte __sub_8757E4C
off_8757E40:
    .4byte _unk3000DF0


loc_8757E44:

		LDMDB	R11, {R4-R7,R11,SP,LR}
		BX	LR

    arm_func_end sub_8757D24







