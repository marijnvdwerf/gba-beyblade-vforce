.include "asm/common.inc"

    arm_func_start sub_8757E4C

sub_8757E4C:
		MOV	R12, SP
		STMFD	SP!, {R4-R8,R11,R12,LR,PC}
		MOV	R3, #0x10C
		SUB	R11, R12, #4
		LDR	R12, off_8757FBC
		add	R3, R3,	#0x4000002
		LDR	R1, [R12]
		MOV	R2, #0x200
		LDRB	R8, [R1,#3]
		MOV	R0, #0
		STRH	R0, [R3]
		add	R2, R2,	#DISPCNT
		LDRH	R3, [R2]
		bic	R3, R3,	#0x40
		MOV	R3, R3,LSL#16
		MOV	R3, R3,LSR#16
		STRH	R3, [R2]
		MOV	R7, R12
		LDRB	R2, [R1,#1]
		MOV	R5, R8
		LDR	R3, [R1,#0x34]
		CMP	R0, R5
		add	LR, R3,	R2,LSL#1
		BCS	loc_8757F2C
		MOV	R4, #0x120
		add	R4, R4,	#0x4000000
		MOV	R12, #0xFD00
		add	R12, R12, #0xD9
		MOV	R6, R7

loc_8757EC0:
		MOV	R3, R0,LSL#16
		MOV	R0, R3,LSR#16
		MOV	R2, R0,LSL#1
		LDRH	R3, [R2,R4]
		MOV	R3, R3,LSL#16
		MOV	R3, R3,ASR#16
		MOV	R1, R3
		MOV	R2, R1,LSL#16
		CMP	R12, R2,LSR#16
		MOVNE	R3, #0
		MOVEQ	R3, #1
		CMP	R3, #0
		CMPNE	R0, #0
		LDRNE	R2, [R6]
		LDRNE	R3, [R2,#0x14]
		ORRNE	R3, R3,	#0x40
		STRNE	R3, [R2,#0x14]
		add	R3, R0,	#1
		STRH	R1, [LR]
		MOV	R3, R3,LSL#16
		LDR	R1, [R6]
		MOV	R0, R3,ASR#16
		LDR	R2, [R1,#0x18]
		CMP	R5, R3,LSR#16
		bic	R2, R2,	#1
		add	LR, LR,	R2
		BHI	loc_8757EC0

loc_8757F2C:
		MOV	R4, R7
		LDR	R1, [R4]
		LDR	R3, [R1,#0x14]
		TST	R3, #0x40
		BNE	loc_8757F60
		LDR	R3, [R1,#0x18]
		MUL	R2, R8,	R3
		LDR	R0, [R1,#0x34]
		LDR	R12, off_8757FC0
		LDR	R1, [R1,#0x38]
		LDR	R12, [R12]
		MOV	LR, PC
		BX	R12

loc_8757F60:
		mvn	R3, #0x224
		SUB	R3, R3,	#2
		MOV	R2, #0x128
		add	R1, R2,	#(SIOMLT_SEND-0x128)
		STRH	R3, [R1]
		add	R2, R2,	#(SIOCNT-0x128)
		LDRH	R3, [R2]
		ORR	R3, R3,	#0x80
		STRH	R3, [R2]
		LDRH	R1, [R2]
		TST	R1, #0x40
		LDRNE	R2, [R4]
		LDRNE	R3, [R2,#0x14]
		ORRNE	R3, R3,	#0x80
		STRNE	R3, [R2,#0x14]
		LDR	R2, [R7]
		MOV	R3, #0
		STRB	R3, [R2,#1]
		LDR	R1, [R7]
		LDR	R3, [R1,#0x14]
		ORR	R3, R3,	#0x200
		STR	R3, [R1,#0x14]
		B	loc_8757FC4

off_8757FBC:
    .4byte _unk3005DC4
off_8757FC0:
    .4byte __fastMemoryCopyARM


loc_8757FC4:
		LDMDB	R11, {R4-R8,R11,SP,LR}
		BX	LR


    arm_func_end sub_8757E4C







