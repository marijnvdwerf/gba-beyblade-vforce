.include "asm/common.inc"

    arm_func_start sub_87577B4
sub_87577B4:

var_38		= -0x38
var_34		= -0x34
var_30		= -0x30
var_2C		= -0x2C

		MOV	R12, SP
		STMFD	SP!, {R4-R12,LR,PC}
		SUB	SP, SP,	#0x10
		MOV	R7, R0
		LDRH	R3, [R7,#0x10]
		SUB	R11, R12, #4
		MUL	R12, R2, R3
		LDR	R2, [R7,#0xC]
		LDR	R3, off_87578D8
		STR	R2, [R11,#var_30]
		LDR	R3, [R3]
		LDR	R8, [R7,#4]
		STR	R3, [R11,#var_2C]
		LDR	LR, [R7]
		MOV	R6, R1
		LDR	R4, [R7,#8]
		MOV	R9, R12,LSR#12
		LDR	R3, [LR,#4]
		add	R0, R8,	R6,LSR#1
		LDRB	R2, [LR]
		add	R3, R3,	#0x10
		add	R3, LR,	R3
		RSB	R10, R3, R0
		CMP	R2, #0
		BNE	loc_8757828
		SUB	R3, R6,	R10,LSL#1
		CMP	R10, #0
		MOVLE	R6, R1
		MOVGT	R6, R3

loc_8757828:
		LDR	R2, off_87578DC
		LDRB	R3, [R2]
		add	R3, R3,	#1
		STRB	R3, [R2]
		AND	R3, R3,	#0xFF
		CMP	R3, #1
		BEQ	loc_8757890
		LDRB	R3, [LR]
		CMP	R3, #0
		BEQ	loc_8757A44
		CMP	R3, #1
		BNE	loc_8757A44
		CMP	R6, #0
		BEQ	loc_8757A44
		LDR	R3, [R11,#var_30]
		LDR	R2, [R11,#var_2C]

loc_8757868:
		LDRSB	R0, [R8]
		LDRSH	R1, [R2]
		ADDS	R3, R3,	R4,LSL#4
		ADC	R8, R8,	R4,LSR#28
		MLA	R1, R0,	R9, R1
		STRH	R1, [R2],#2
		SUBS	R6, R6,	#1
		BPL	loc_8757868
		STR	R3, [R11,#var_30]
		B	loc_8757A44


loc_8757890:
		LDRB	R3, [LR]
		CMP	R3, #0
		BEQ	loc_87578E0
		CMP	R3, #1
		BNE	loc_8757A44
		CMP	R6, #0
		BEQ	loc_8757A44
		LDR	R3, [R11,#var_30]
		LDR	R1, [R11,#var_2C]

loc_87578B4:
		LDRSB	R0, [R8]
		ADDS	R3, R3,	R4,LSL#4
		ADC	R8, R8,	R4,LSR#28
		MUL	R0, R9,	R0
		STRH	R0, [R1],#2
		SUBS	R6, R6,	#1
		BPL	loc_87578B4
		STR	R3, [R11,#var_30]
		B	loc_8757A44

off_87578D8:
    .4byte 0x3005E50
off_87578DC:
    .4byte _unk3005E78


loc_87578E0:
		MOV	R6, R6,LSR#1
		LDRSH	LR, [R7,#0x14]
		SUB	R6, R6,	#1
		LDRB	R5, [R7,#0x17]
		cmn	R6, #1
		BEQ	loc_8757A3C
		MOV	R2, #0x7F0
		add	R2, R2,	#0xF
		MOV	R3, #0x80000000
		STR	R2, [R11,#var_34]
		MOV	R3, R3,ASR#20
		STR	R3, [R11,#var_38]

loc_8757910:
		LDRB	R12, [R8],#1
		MOV	R3, R5,LSL#5
		LDR	R1, off_8757A54
		eor	R12, R12, #0xEC
		MOV	R0, R12,LSR#4
		ORR	R3, R3,	R0,LSL#1
		LDRSH	R2, [R1,R3]
		add	LR, LR,	R2
		LDR	R2, [R11,#var_34]
		mvn	R1, #0x800
		LDR	R3, [R11,#var_38]
		CMP	LR, R2
		MOVGE	LR, R2
		CMP	LR, R1
		MOVLE	LR, R3
		MOV	R4, LR,ASR#3
		MUL	R4, R9,	R4
		AND	R0, R0,	#7
		LDR	R2, off_8757A58
		ORR	R0, R0,	R5,LSL#3
		LDRB	R5, [R2,R0]
		AND	R1, R12, #0xF
		MOV	R3, R5,LSL#5
		ORR	R3, R3,	R1,LSL#1
		LDR	R1, off_8757A54
		LDRSH	R2, [R1,R3]
		add	LR, LR,	R2
		LDR	R2, [R11,#var_34]
		LDR	R3, [R11,#var_2C]
		CMP	LR, R2
		MOVGE	LR, R2
		STRH	R4, [R3],#2
		mvn	R2, #0x800
		LDR	R1, [R11,#var_38]
		CMP	LR, R2
		MOVLE	LR, R1
		MOV	R4, LR,ASR#3
		MUL	R4, R9,	R4
		STR	R3, [R11,#var_2C]
		LDR	R1, [R11,#var_2C]
		AND	R12, R12, #7
		LDR	R3, off_8757A58
		ORR	R12, R12, R5,LSL#3
		LDRB	R5, [R3,R12]
		STRH	R4, [R1],#2
		STR	R1, [R11,#var_2C]
		CMP	R10, #0
		CMPGE	R6, #0
		BNE	loc_8757A30
		LDR	R0, [R7,#0x1C]
		CMP	R0, #0
		BEQ	loc_8757A30
		LDRH	R2, [R7,#0x24]
		LDR	R1, [R7,#0x20]
		add	R3, R2,	#1
		MOV	R2, R2,LSL#16
		STRH	R3, [R7,#0x24]
		MOV	R2, R2,ASR#15
		LDRSH	R3, [R2,R1]
		cmn	R3, #1
		MOVEQ	R2, #1
		STREQH	R2, [R7,#0x24]
		LDREQSH	R3, [R1]
		cmn	R3, #1
		LDR	R3, [R0,R3,LSL#2]
		MOV	R6, #0
		MOVNE	R6, R10
		ADDNE	R8, R3,	#0x10
		STRNE	R3, [R7]
		mvn	R10, #0
		MOV	LR, #0
		MOV	R5, LR

loc_8757A30:

		SUB	R6, R6,	#1
		cmn	R6, #1
		BNE	loc_8757910

loc_8757A3C:
		STRB	R5, [R7,#0x17]
		STRH	LR, [R7,#0x14]

loc_8757A44:

		LDR	R3, [R11,#var_30]
		STR	R3, [R7,#0xC]
		STR	R8, [R7,#4]
		B	loc_8757A5C

off_8757A54:
    .4byte Unk_8755F00

off_8757A58:
    .4byte Unk_8756520



loc_8757A5C:
		LDMDB	R11, {R4-R11,SP,LR}
		BX	LR
    arm_func_end sub_87577B4






