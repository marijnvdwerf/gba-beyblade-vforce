    .include "asm/common.inc"

    arm_func_start render_00
render_00:
    AND	R4, R1, #0xFF00
    SUB	R3, R3, R2
    MOV	R3, R3,LSL#8
    MOV	R2, R2,LSL#8
    ADD	R2, R2, R4,LSL#4
    AND	R1, R1, #0xFF
    MOV	R4, R2,LSR#12
    CMP	R1, #2
    STRB	R4, [R0],#1
    BLT	locret_80641EC
    MOVEQ	R4, #0x8000
    MOVGT	R4, #0x5500
    ADDGT	R4, R4, #0x55
    MUL	R3, R4, R3
    MOV	R3, R3,ASR#16
    ADD	R2, R2, R3
    MOV	R4, R2,LSR#12
    STRB	R4, [R0],#1
    BEQ	locret_80641EC
    ADD	R2, R2, R3
    MOV	R4, R2,LSR#12
    STRB	R4, [R0],#1
locret_80641EC:
    MOV	PC, LR
off_80641F0:
    .4byte 0x874D1C0
    arm_func_end render_00


    arm_func_start render_01
render_01:
    STMFD	SP!, {R5,R6}
    AND	R4, R1, #0xFF00
    AND	R1, R1, #0xFF
    ADR	R6, off_80641F0
    LDR	R6, [R6]
    SUB	R3, R3, R2
    MOV	R3, R3,LSL#8
    MOV	R2, R2,LSL#8
    ADD	R2, R2, R4,LSL#4
    MOV	R4, R1,LSL#4
    MOVS	R5, R4
    RSBLT	R3, R3, #0
    RSBLT	R5, R5, #0
    CMP	R4, #0x10
    MOV	R5, R5,LSL#1
    LDRSH	R5, [R6,R5]
    MUL	R3, R5, R3
    MOVLT	R3, R3,ASR#12
    MOVGE	R3, R3,ASR#16
    MOV	R4, R2,LSR#12
    ADD	R2, R2, R3
    MOV	R6, R2,LSR#12
    ORR	R4, R4, R6,LSL#8
    ADD	R2, R2, R3
    MOV	R6, R2,LSR#12
    ORR	R4, R4, R6,LSL#16
    ADD	R2, R2, R3
    MOV	R6, R2,LSR#12
    ORR	R4, R4, R6,LSL#24
    ANDS	R5, R0, #3
    BEQ	loc_80642E4
    RSB	R5, R5, #4
    SUB	R1, R1, R5
    MOVS	R5, R5,LSR#1
    STRCSB	R4, [R0],#1
    MOVCS	R4, R4,LSR#8
    STRNEH	R4, [R0],#2
    MOVNE	R4, R4,LSR#16
    BHI	loc_80642A4
    BNE	loc_80642CC
    ADD	R2, R2, R3
    MOV	R6, R2,LSR#12
    ORR	R4, R4, R6,LSL#24
    B	loc_80642E4
loc_80642A4:
    ADD	R2, R2, R3
    MOV	R6, R2,LSR#12
    ORR	R4, R4, R6,LSL#8
    ADD	R2, R2, R3
    MOV	R6, R2,LSR#12
    ORR	R4, R4, R6,LSL#16
    ADD	R2, R2, R3
    MOV	R6, R2,LSR#12
    ORR	R4, R4, R6,LSL#24
    B	loc_80642E4
loc_80642CC:
    ADD	R2, R2, R3
    MOV	R6, R2,LSR#12
    ORR	R4, R4, R6,LSL#16
    ADD	R2, R2, R3
    MOV	R6, R2,LSR#12
    ORR	R4, R4, R6,LSL#24
loc_80642E4:
    AND	R5, R1, #3
    MOVS	R1, R1,LSR#2
    BEQ	loc_8064328
loc_80642F0:
    STR	R4, [R0],#4
    ADD	R2, R2, R3
    MOV	R4, R2,LSR#12
    ADD	R2, R2, R3
    MOV	R6, R2,LSR#12
    ORR	R4, R4, R6,LSL#8
    ADD	R2, R2, R3
    MOV	R6, R2,LSR#12
    ORR	R4, R4, R6,LSL#16
    ADD	R2, R2, R3
    MOV	R6, R2,LSR#12
    ORR	R4, R4, R6,LSL#24
    SUBS	R1, R1, #1
    BGT	loc_80642F0
loc_8064328:
    MOVS	R5, R5,LSR#1
    STRNEH	R4, [R0],#2
    MOVNE	R4, R4,LSR#16
    STRCSB	R4, [R0],#1
    LDMFD	SP!, {R5,R6}
    MOV	PC, LR
    arm_func_end render_01


    arm_func_start render_02
render_02:
    STMFD	SP!, {R5-R12,LR}
    LDRH	R3, [R2]
    LDRH	R4, [R2,#2]
    LDRH	R5, [R2,#4]
    CMP	R4, R5
    ADD	R3, R1, R3,LSL#4
    ADD	R4, R1, R4,LSL#4
    LDR	R6, [R3,#4]
    LDR	R7, [R4,#4]
    BEQ	loc_8064700
    ADD	R5, R1, R5,LSL#4
    LDR	R8, [R5,#4]
    CMP	R6, R7
    BLE	loc_8064390
    MOV	R1, R3
    MOV	R3, R4
    MOV	R4, R1
    MOV	R1, R6
    MOV	R6, R7
    MOV	R7, R1
loc_8064390:
    CMP	R6, R8
    BLE	loc_80643B0
    MOV	R1, R3
    MOV	R3, R5
    MOV	R5, R1
    MOV	R1, R6
    MOV	R6, R8
    MOV	R8, R1
loc_80643B0:
    CMP	R8, R7
    BLE	loc_80643D0
    MOV	R1, R5
    MOV	R5, R4
    MOV	R4, R1
    MOV	R1, R8
    MOV	R8, R7
    MOV	R7, R1
loc_80643D0:
    MOV	R9, R7,ASR#6
    SUBS	R9, R9, R6,ASR#6
    MOVLE	R0, #0
    BLE	loc_80645C0
    MOV	R10, R6,ASR#6
    STRB	R10, [R0,#0x17]
    MOV	R10, R7,ASR#6
    SUB	R10, R10, R8,ASR#6
    CMP	R9, R10
    ORR	R9, R9, R10,LSL#8
    STRH	R9, [R0,#0x14]
    SUB	R8, R7, R8
    SUB	R7, R7, R6
    SUB	R6, R7, R8
    LDR	R9, [R3]
    LDR	R10, [R4]
    LDR	R1, [R5]
    ADR	LR, off_80641F0
    LDR	LR, [LR]
    BEQ	loc_80645C8
    SUB	R11, R10, R1
    MOV	R11, R11,LSL#2
    MOVS	R12, R8
    RSBLT	R11, R11, #0
    RSBLT	R12, R12, #0
    CMP	R8, #0x10
    MOV	R12, R12,LSL#1
    LDRSH	R12, [LR,R12]
    MUL	R11, R12, R11
    MOVLT	R11, R11,ASR#12
    MOVGE	R11, R11,ASR#16
    MOV	R12, R1,LSL#16
    MOV	R12, R12,LSR#16
    ORR	R11, R12, R11,LSL#16
    STR	R11, [R0,#0x10]
    SUB	R10, R10, R9
    SUB	R11, R1, R9
    LDRH	R1, [R2,#6]
    BIC	R1, R1, #1
    MOV	R1, R1,LSL#1
    MUL	R2, R10, R6
    MUL	R12, R11, R7
    CMP	R2, R12
    ADDLE	R1, R1, #1
    AND	R2, R1, #1
    STRH	R1, [R0,#0x1E]
    MOV	R9, R9,LSL#16
    MOV	R9, R9,LSR#16
    MOV	R10, R10,LSL#2
    MOVS	R12, R7
    RSBLT	R10, R10, #0
    RSBLT	R12, R12, #0
    CMP	R7, #0x10
    MOV	R12, R12,LSL#1
    LDRSH	R12, [LR,R12]
    MUL	R10, R12, R10
    MOVLT	R10, R10,ASR#12
    MOVGE	R10, R10,ASR#16
    ORR	R1, R9, R10,LSL#16
    MOV	R11, R11,LSL#2
    MOVS	R12, R6
    RSBLT	R11, R11, #0
    RSBLT	R12, R12, #0
    CMP	R6, #0x10
    MOV	R12, R12,LSL#1
    LDRSH	R12, [LR,R12]
    MUL	R11, R12, R11
    MOVLT	R11, R11,ASR#12
    MOVGE	R11, R11,ASR#16
    ORR	R12, R9, R11,LSL#16
    MOVS	R2, R2
    STREQ	R12, [R0,#4]
    STREQ	R1, [R0,#0xC]
    STRNE	R1, [R0,#4]
    STRNE	R12, [R0,#0xC]
    LDRB	R1, [R3,#0xC]
    LDRB	R9, [R4,#0xC]
    LDRB	R10, [R5,#0xC]
    SUB	R3, R9, R10
    MOV	R11, R3,LSL#9
    MOVS	R12, R8
    RSBLT	R11, R11, #0
    RSBLT	R12, R12, #0
    CMP	R8, #0x10
    MOV	R12, R12,LSL#1
    LDRSH	R12, [LR,R12]
    MUL	R11, R12, R11
    MOVLT	R11, R11,ASR#12
    MOVGE	R11, R11,ASR#16
    SUB	R9, R9, R1
    SUB	R12, R9, R3
    MOV	R10, R10,LSL#7
    ORR	R11, R10, R11,LSL#16
    STR	R11, [R0,#0x18]
    MOV	R9, R9,LSL#9
    MOVS	R10, R7
    RSBLT	R9, R9, #0
    RSBLT	R10, R10, #0
    CMP	R7, #0x10
    MOV	R10, R10,LSL#1
    LDRSH	R10, [LR,R10]
    MUL	R9, R10, R9
    MOVLT	R9, R9,ASR#12
    MOVGE	R9, R9,ASR#16
    MOV	R10, R9,LSL#16
    ORR	R10, R10, R1,LSL#7
    MOV	R12, R12,LSL#9
    MOVS	R11, R6
    RSBLT	R12, R12, #0
    RSBLT	R11, R11, #0
    CMP	R6, #0x10
    MOV	R11, R11,LSL#1
    LDRSH	R11, [LR,R11]
    MUL	R12, R11, R12
    MOVLT	R12, R12,ASR#12
    MOVGE	R12, R12,ASR#16
    MOV	R12, R12,LSL#16
    ORR	R12, R12, R1,LSL#7
    MOVS	R2, R2
    STRNE	R10, [R0]
    STRNE	R12, [R0,#8]
    STREQ	R12, [R0]
    STREQ	R10, [R0,#8]
    MOV	R0, #1
loc_80645C0:
    LDMFD	SP!, {R5-R12,LR}
    MOV	PC, LR
loc_80645C8:
    SUB	R11, R10, R1
    MOV	R11, R11,LSL#2
    MOVS	R12, R8
    RSBLT	R11, R11, #0
    RSBLT	R12, R12, #0
    CMP	R8, #0x10
    MOV	R12, R12,LSL#1
    LDRSH	R12, [LR,R12]
    MUL	R11, R12, R11
    MOVLT	R11, R11,ASR#12
    MOVGE	R11, R11,ASR#16
    ORR	R12, R1, R11,LSL#16
    SUB	R11, R1, R9
    SUB	R10, R10, R9
    MUL	R1, R10, R6
    MUL	R11, R7, R11
    CMP	R1, R11
    MOVLE	R1, #1
    MOVGT	R1, #0
    LDRH	R11, [R2,#6]
    BIC	R11, R11, #1
    MOV	R11, R11,LSL#1
    ORR	R11, R11, R1
    STRH	R11, [R0,#0x1E]
    MOV	R10, R10,LSL#2
    MOVS	R2, R7
    RSBLT	R10, R10, #0
    RSBLT	R2, R2, #0
    CMP	R7, #0x10
    MOV	R2, R2,LSL#1
    LDRSH	R2, [LR,R2]
    MUL	R10, R2, R10
    MOVLT	R10, R10,ASR#12
    MOVGE	R10, R10,ASR#16
    ORR	R9, R9, R10,LSL#16
    MOVS	R1, R1
    STREQ	R12, [R0,#4]
    STREQ	R9, [R0,#0xC]
    STRNE	R9, [R0,#4]
    STRNE	R12, [R0,#0xC]
    LDRB	R2, [R3,#0xC]
    LDRB	R9, [R4,#0xC]
    LDRB	R10, [R5,#0xC]
    SUB	R3, R9, R10
    MOV	R11, R3,LSL#9
    MOVS	R12, R8
    RSBLT	R11, R11, #0
    RSBLT	R12, R12, #0
    CMP	R8, #0x10
    MOV	R12, R12,LSL#1
    LDRSH	R12, [LR,R12]
    MUL	R11, R12, R11
    MOVLT	R11, R11,ASR#12
    MOVGE	R11, R11,ASR#16
    SUB	R9, R9, R2
    SUB	R12, R9, R3
    MOV	R10, R10,LSL#7
    ORR	R11, R10, R11,LSL#16
    MOV	R9, R9,LSL#9
    MOVS	R10, R7
    RSBLT	R9, R9, #0
    RSBLT	R10, R10, #0
    CMP	R7, #0x10
    MOV	R10, R10,LSL#1
    LDRSH	R10, [LR,R10]
    MUL	R9, R10, R9
    MOVLT	R9, R9,ASR#12
    MOVGE	R9, R9,ASR#16
    MOV	R10, R9,LSL#16
    ORR	R10, R10, R2,LSL#7
    MOVS	R1, R1
    STRNE	R10, [R0]
    STRNE	R11, [R0,#8]
    STREQ	R11, [R0]
    STREQ	R10, [R0,#8]
    MOV	R0, #1
    LDMFD	SP!, {R5-R12,LR}
    MOV	PC, LR
loc_8064700:
    CMP	R6, R7
    BLE	loc_8064720
    MOV	R1, R6
    MOV	R6, R7
    MOV	R7, R1
    MOV	R1, R3
    MOV	R3, R4
    MOV	R4, R1
loc_8064720:
    MOV	R9, R7,ASR#6
    SUB	R9, R9, R6,ASR#6
    MOV	R1, R6,ASR#6
    STRB	R1, [R0,#0x17]
    CMP	R9, #1
    MOVLT	R9, #1
    STRH	R9, [R0,#0x14]
    BLE	loc_80647E4
    SUB	R7, R7, R6
    LDR	R9, [R3]
    LDR	R10, [R4]
    STRH	R10, [R0,#0x10]
    SUB	R10, R10, R9
    ADR	R1, dword_8064828
    LDR	R1, [R1]
    MOV	R10, R10,LSL#2
    MOVS	R5, R7
    RSBLT	R10, R10, #0
    RSBLT	R5, R5, #0
    CMP	R7, #0x10
    MOV	R5, R5,LSL#1
    LDRSH	R5, [R1,R5]
    MUL	R10, R5, R10
    MOVLT	R10, R10,ASR#12
    MOVGE	R10, R10,ASR#16
    MOVS	R10, R10
    ADD	R1, R9, R10
    STRH	R10, [R0,#6]
    MOVGE	R5, R10
    RSBLT	R5, R10, #0
    CMP	R5, #0x40
    MOVLT	R5, #0x40
    MOVS	R10, R10
    STRLTH	R1, [R0,#4]
    STRGEH	R1, [R0,#0xC]
    SUBGE	R9, R1, R5
    ADDLT	R9, R1, R5
    STRGEH	R9, [R0,#4]
    STRLTH	R9, [R0,#0xC]
    LDRH	R1, [R2,#6]
    ORR	R1, R1, #1
    MOV	R1, R1,LSL#1
    STRH	R1, [R0,#0x1E]
    MOV	R1, #0
    STR	R1, [R0]
    STR	R1, [R0,#8]
    MOV	R0, #1
    LDMFD	SP!, {R5-R12,LR}
    MOV	PC, LR
loc_80647E4:
    LDR	R9, [R3]
    LDR	R10, [R4]
    CMP	R9, R10
    STRLEH	R9, [R0,#4]
    STRLEH	R10, [R0,#0xC]
    STRGTH	R9, [R0,#0xC]
    STRGTH	R10, [R0,#4]
    LDRH	R1, [R2,#6]
    ORR	R1, R1, #1
    MOV	R1, R1,LSL#1
    STRH	R1, [R0,#0x1E]
    MOV	R1, #0
    STR	R1, [R0]
    STR	R1, [R0,#8]
    MOV	R0, #1
    LDMFD	SP!, {R5-R12,LR}
    MOV	PC, LR
dword_8064828:
    .4byte 0x874D1C0
    arm_func_end render_02


    arm_func_start render_03
render_03:
    STMFD	SP!, {R5-R12,LR}
    LDRB	R12, [R0,#0x17]
    MOV	R4, R12
    ADD	R12, R1, R12,LSL#6
    LDRH	R11, [R0,#0x1E]
    LDRH	R10, [R0,#0x14]
    AND	R9, R10, #0xFF
    MOV	R10, R10,LSR#8
    ADD	R4, R4, R9
    SUBS	R4, R4, #0x1F
    SUBGE	R9, R9, R4
    SUBGE	R10, R10, R4
    MOVS	R9, R9
    LDMLEFD	SP!, {R5-R12,LR}
    MOVLE	PC, LR
    TST	R11, #2
    BNE	loc_8064940
    LDRSH	R4, [R0,#4]
    LDRSH	R5, [R0,#0xC]
    LDRH	R6, [R0]
    LDRH	R7, [R0,#8]
loc_8064880:
    STMFD	SP!, {R0,R4}
    MOVS	R4, R4
    MOVLT	R0, R12
    ADDGE	R0, R12, R4,ASR#6
    MOV	R1, R5,ASR#6
    ADDLT	R1, R1, R4,ASR#6
    SUBS	R1, R1, R4,ASR#6
    BLE	loc_80648C0
    CMP	R1, #4
    BIC	R2, R11, #3
    ORR	R1, R1, R2,LSL#6
    MOV	R2, R6,ASR#7
    MOV	R3, R7,ASR#7
    ADRGE	LR, loc_80648C0
    BGE	render_01
    BL	render_00
loc_80648C0:
    LDMFD	SP!, {R0,R4}
    SUBS	R9, R9, #1
    BLE	loc_8064938
    MOV	R1, #0
    CMP	R10, R9
    BNE	loc_8064908
    ANDS	R1, R11, #1
    LDR	R2, [R0,#0x10]
    LDR	R3, [R0,#0x18]
    LDREQSH	R4, [R0,#0x10]
    LDRNESH	R5, [R0,#0x10]
    LDREQH	R6, [R0,#0x18]
    LDRNEH	R7, [R0,#0x18]
    STRNE	R2, [R0,#0xC]
    STRNE	R3, [R0,#8]
    STREQ	R2, [R0,#4]
    STREQ	R3, [R0]
    BEQ	loc_8064920
loc_8064908:
    LDRSH	R3, [R0,#6]
    ADD	R4, R4, R3
    LDRSH	R3, [R0,#2]
    ADD	R6, R6, R3
    MOVS	R1, R1
    BNE	loc_8064930
loc_8064920:
    LDRSH	R3, [R0,#0xE]
    ADD	R5, R5, R3
    LDRSH	R3, [R0,#0xA]
    ADD	R7, R7, R3
loc_8064930:
    ADD	R12, R12, #0x40
    B	loc_8064880
loc_8064938:
    LDMFD	SP!, {R5-R12,LR}
    MOV	PC, LR
loc_8064940:
    LDRSH	R7, [R0,#6]
    MOVS	R7, R7
    LDRLTSH	R5, [R0,#4]
    LDRGESH	R5, [R0,#0xC]
    LDRLTSH	R6, [R0,#0xC]
    LDRGESH	R6, [R0,#4]
loc_8064958:
    STMFD	SP!, {R0}
    MOVS	R7, R7
    ADDLT	R0, R12, R5,ASR#6
    ADDGE	R0, R12, R6,ASR#6
    MOVLT	R1, R6,ASR#6
    MOVGE	R1, R5,ASR#6
    SUBLT	R1, R1, R5,ASR#6
    SUBGE	R1, R1, R6,ASR#6
    MOVS	R1, R1
    BLE	loc_80649A0
    CMP	R1, #4
    BIC	R2, R11, #3
    ORR	R1, R1, R2,LSL#6
    MOV	R2, #0
    MOV	R3, #0
    ADRGE	LR, loc_80649A0
    BGE	render_01
    BL	render_00
loc_80649A0:
    LDMFD	SP!, {R0}
    SUBS	R9, R9, #1
    BLE	loc_80649E8
    MOV	R6, R5
    CMP	R9, #1
    ADDGT	R5, R5, R7
    LDREQSH	R5, [R0,#0x10]
    SUBEQ	R7, R5, R6
    MOVS	R7, R7
    MOVGE	R1, R7
    RSBLT	R1, R7, #0
    CMP	R1, #0x40
    MOVLT	R1, #0x40
    MOVS	R7, R7
    SUBGE	R6, R5, R1
    ADDLT	R6, R5, R1
    ADD	R12, R12, #0x40
    B	loc_8064958
loc_80649E8:
    LDMFD	SP!, {R5-R12,LR}
    MOV	PC, LR
    arm_func_end render_03


    arm_func_start render_04
render_04:
    STMFD	SP!, {R4-R12,LR}
    MOV	R12, R1
    MOV	LR, R2
    LDR	R2, [R0,#0x10]
    LDR	R3, [R0]
    LDRSH	R3, [R3,#4]
    LDRH	R4, [R1,#0xE]
    RSB	R4, R4, #0xFF
    MOV	R4, R4,LSL#1
    ADR	R7, off_8064AD4
    LDR	R7, [R7]
    ADD	R7, R7, R4
    LDRSH	R6, [R7],#0x80
    LDRSH	R7, [R7]
    LDRSB	R0, [R12,#0x24]
    LDRSB	R4, [R12,#0x25]
    LDRSB	R5, [R12,#0x26]
    MUL	R8, R0, R7
    MUL	R9, R5, R6
    SUB	R9, R8, R9
    MUL	R8, R5, R7
    MUL	R7, R0, R6
    ADD	R8, R8, R7
    MOV	R0, R9,ASR#8
    MOV	R5, R8,ASR#8
    MOV	R1, R5
    MOV	R7, R4
    LDRSH	R10, [R12,#0x2C]
    LDRSH	R11, [R12,#0x2E]
    MOV	R6, LR
    MVN	LR, #0xFF00
loc_8064A6C:
    LDMIA	R2, {R8,R9}
    SUB	R8, R8, R10
    SUB	R9, R9, R11
    CMP	R9, LR
    MOVGT	LR, R9
    STMIA	R2, {R8,R9}
    ADD	R2, R2, #0xC
    LDRSB	R4, [R2]
    LDRSB	R5, [R2,#1]
    MUL	R4, R0, R4
    MLA	R4, R7, R5, R4
    LDRSB	R5, [R2,#2]
    MLA	R4, R1, R5, R4
    MOV	R4, R4,ASR#7
    ADD	R4, R4, #0x80
    AND	R5, R6, #7
    ADD	R4, R4, R6,LSR#3
    MOV	R4, R4,LSR R5
    CMP	R4, #0xFF
    MOVGT	R4, #0xFF
    STRB	R4, [R2],#4
    SUBS	R3, R3, #1
    BNE	loc_8064A6C
    STRH	LR, [R12,#0x30]
    LDMFD	SP!, {R4-R12,LR}
    BX	LR
off_8064AD4:
    .4byte 0x874CC3C
    arm_func_end render_04


    arm_func_start render_05
render_05:
    STMFD	SP!, {R4-R12,LR}
    LDR	R1, [R0,#0x10]
    LDR	R12, [R0]
    LDR	R0, [R0,#4]
    LDRSH	R12, [R12,#4]
    ADD	R10, R3, #4
    MOV	LR, #0xFF0000
    MOV	R11, #0xFF0000
loc_8064AF8:
    LDRH	R6, [R0],#2
    LDRH	R5, [R0],#2
    ORR	R6, R6, R5,LSL#16
    LDRSH	R3, [R0],#2
    LDRSH	R4, [R0],#2
    LDRSH	R5, [R0],#2
    STR	R6, [R1,#0xC]
    LDRSH	R9, [R2,#0x1A]
    MOVS	R9, R9
    BEQ	loc_8064B50
    LDRSH	R6, [R10],#2
    LDRSH	R7, [R10],#2
    LDRSH	R8, [R10],#6
    SUB	R6, R6, R3
    SUB	R7, R7, R4
    SUB	R8, R8, R5
    MUL	R6, R9, R6
    MUL	R7, R9, R7
    MUL	R8, R9, R8
    ADD	R3, R3, R6,ASR#10
    ADD	R4, R4, R7,ASR#10
    ADD	R5, R5, R8,ASR#10
loc_8064B50:
    LDR	R9, [R2,#0x58]
    MUL	R6, R3, R9
    MUL	R7, R4, R9
    MUL	R8, R5, R9
    MOV	R3, R6,ASR#10
    MOV	R4, R7,ASR#10
    MOV	R5, R8,ASR#10
    LDR	R9, [R2,#0x34]
    MUL	R6, R3, R9
    LDR	R9, [R2,#0x40]
    MLA	R6, R4, R9, R6
    LDR	R9, [R2,#0x4C]
    MLA	R6, R5, R9, R6
    LDR	R9, [R2,#0x38]
    MUL	R7, R3, R9
    LDR	R9, [R2,#0x44]
    MLA	R7, R4, R9, R7
    LDR	R9, [R2,#0x50]
    MLA	R7, R5, R9, R7
    LDR	R9, [R2,#0x3C]
    MUL	R8, R3, R9
    LDR	R9, [R2,#0x48]
    MLA	R8, R4, R9, R8
    LDR	R9, [R2,#0x54]
    MLA	R8, R5, R9, R8
    MOV	R3, R6,ASR#10
    MOV	R4, R7,ASR#10
    MOV	R5, R8,ASR#10
    LDRH	R9, [R2,#0x32]
    MOVS	R9, R9
    BNE	loc_8064BE0
    SUB	R6, R3, R5
    MOV	R6, R6,ASR#1
    ADD	R6, R6, R4
    ADD	R3, R3, R5
    MOV	R4, R6
loc_8064BE0:
    CMP	R4, LR
    MOVLT	LR, R4
    CMP	R3, R11
    MOVLT	R11, R3
    STMIA	R1!, {R3-R5}
    ADD	R1, R1, #4
    SUBS	R12, R12, #1
    BNE	loc_8064AF8
    SUB	R11, R11, #0x40
    STRH	LR, [R2,#0x2E]
    STRH	R11, [R2,#0x2C]
    LDMFD	SP!, {R4-R12,LR}
    BX	LR
    arm_func_end render_05


    arm_func_start render_06
render_06:
    STMFD	SP!, {R0-R6}
    LDR	R3, [R0,#8]
    ADD	R3, R3, R1,LSL#2
    LDRSH	R4, [R0,#4]
    LDR	R6, [R0,#0xC]
    ADD	R5, R6, R4,LSL#2
    STRH	R2, [R5]
    MVN	R1, #0
    STRH	R1, [R5,#2]
    LDRSH	R1, [R3]
    MOVS	R1, R1
    ORRLT	R1, R4, R4,LSL#16
    STRLT	R1, [R3]
    LDRGEH	R1, [R3,#2]
    ADDGE	R5, R6, R1,LSL#2
    STRGEH	R4, [R5,#2]
    STRGEH	R4, [R3,#2]
    ADD	R4, R4, #1
    STRH	R4, [R0,#4]
    LDMFD	SP!, {R0-R6}
    BX	LR
    arm_func_end render_06


    arm_func_start render_07
render_07:
    STMFD	SP!, {R4-R11,LR}
    LDR	R10, [R0]
    LDRH	R12, [R10,#6]
    LDR	R3, [R0,#8]
    LDR	R11, [R0,#0x10]
    MOVS	R5, R2
    MOVEQ	R4, #0
    LDRNE	R4, [R0,#0x64]
    MOV	R0, R1
    MOVNES	R4, R4
    MOVEQ	R2, #0
    BEQ	loc_8064CB4
loc_8064C98:
    LDRSH	R2, [R5],#2
    MOVS	R2, R2
    LDMLTFD	SP!, {R4-R11,LR}
    BXLT	LR
    ADD	R2, R4, R2,LSL#2
    LDRSH	R12, [R2,#2]
    LDRSH	R2, [R2]
loc_8064CB4:
    STMFD	SP!, {R3-R5}
    ADD	R3, R3, R2,LSL#3
loc_8064CBC:
    LDMIA	R3!, {R4,R5}
    MOV	R6, R4,LSL#16
    MOV	R6, R6,LSR#16
    ADD	R6, R11, R6,LSL#4
    MOV	R7, R4,LSR#16
    ADD	R7, R11, R7,LSL#4
    MOV	R8, R5,LSL#16
    MOV	R8, R8,LSR#16
    ADD	R8, R11, R8,LSL#4
    CMP	R7, R8
    BEQ	loc_8064D70
    MOV	R4, R5,LSR#16
    TST	R4, #1
    BNE	loc_8064D70
    LDMIA	R6, {R4,R5}
    LDMIA	R7, {R9,R10}
    SUB	R4, R4, R9
    SUB	R5, R5, R10
    LDR	R1, [R8]
    SUB	R9, R1, R9
    MUL	R5, R9, R5
    LDR	R1, [R8,#4]
    SUB	R10, R1, R10
    MUL	R4, R10, R4
    SUBS	R4, R4, R5
    BGT	loc_8064D50
    LDR	R4, [R6,#8]
    LDR	R5, [R7,#8]
    LDR	R9, [R8,#8]
    ADD	R4, R4, R5
    MOV	R4, R4,ASR#1
    ADD	R4, R4, R9
    MOV	R4, R4,ASR#8
    ADD	R4, R4, #0x10
    AND	R4, R4, #0x1F
    RSB	R1, R4, #0x1F
    BL	render_06
loc_8064D50:
    ADD	R2, R2, #1
    SUBS	R12, R12, #1
    BNE	loc_8064CBC
    LDMFD	SP!, {R3-R5}
    MOVS	R4, R4
    BNE	loc_8064C98
    LDMFD	SP!, {R4-R11,LR}
    BX	LR
loc_8064D70:
    LDR	R4, [R6,#8]
    LDR	R5, [R7,#8]
    LDR	R9, [R8,#8]
    ADD	R4, R4, R5
    MOV	R4, R4,ASR#1
    ADD	R4, R4, R9
    MOV	R4, R4,ASR#8
    ADD	R4, R4, #0x11
    AND	R4, R4, #0x1F
    RSB	R1, R4, #0x1F
    BL	render_06
    ADD	R2, R2, #1
    SUBS	R12, R12, #1
    BNE	loc_8064CBC
    LDMFD	SP!, {R3-R5}
    MOVS	R4, R4
    BNE	loc_8064C98
    LDMFD	SP!, {R4-R11,LR}
    BX	LR
    arm_func_end render_07


    arm_func_start render_08
render_08:
    STMFD	SP!, {R4-R12,LR}
    LDRH	R12, [R0]
    LDR	R11, [R0,#8]
    LDR	R10, [R0,#0xC]
    LDR	R9, [R1,#8]
    LDR	R8, [R1,#0x10]
    MOV	R7, R2
    MOV	R6, R3
loc_8064DDC:
    LDRSH	R5, [R11],#4
    MOVS	R5, R5
    BLT	loc_8064E1C
loc_8064DE8:
    ADD	R5, R10, R5,LSL#2
    LDRH	R4, [R5]
    ADD	R2, R9, R4,LSL#3
    MOV	R0, R6
    MOV	R1, R8
    BL	render_02
    MOVS	R0, R0
    MOV	R0, R6
    MOV	R1, R7
    BLNE	render_03
    LDRSH	R5, [R5,#2]
    MOVS	R5, R5
    BGE	loc_8064DE8
loc_8064E1C:
    SUBS	R12, R12, #1
    BNE	loc_8064DDC
    LDMFD	SP!, {R4-R12,LR}
    BX	LR
    arm_func_end render_08

    .4byte 0

    arm_func_start render_09
render_09:
    STMFD	SP!, {R4,R5}
loc_8064E34:
    LDMIA	R2, {R4,R5}
    ADD	R2, R2, R1
    STMIA	R3!, {R4,R5}
    LDMIA	R2, {R4,R5}
    ADD	R2, R2, R1
    STMIA	R3!, {R4,R5}
    LDMIA	R2, {R4,R5}
    ADD	R2, R2, R1
    STMIA	R3!, {R4,R5}
    LDMIA	R2, {R4,R5}
    ADD	R2, R2, R1
    STMIA	R3!, {R4,R5}
    LDMIA	R2, {R4,R5}
    ADD	R2, R2, R1
    STMIA	R3!, {R4,R5}
    LDMIA	R2, {R4,R5}
    ADD	R2, R2, R1
    STMIA	R3!, {R4,R5}
    LDMIA	R2, {R4,R5}
    ADD	R2, R2, R1
    STMIA	R3!, {R4,R5}
    LDMIA	R2!, {R4,R5}
    ADD	R2, R2, R1
    STMIA	R3!, {R4,R5}
    SUB	R2, R2, R1,LSL#3
    SUB	R0, R0, #1
    TST	R0, #7
    ADDEQ	R2, R2, R1,LSL#3
    SUBEQ	R2, R2, #0x40
    MOVS	R0, R0
    BGT	loc_8064E34
    LDMFD	SP!, {R4,R5}
    BX	LR
    arm_func_end render_09


global _renderFunctionSizes
    .4byte 0x1AC
    .4byte 0x60
    .4byte 0
    .4byte 0xA80
    .4byte 0xAD4
    .4byte 0xC98
    .4byte 0x1AC
    .4byte 0x698
    .4byte 0xC9C
    .4byte 0x85C
    .4byte 0xC28
    .4byte 0xC9C
    .4byte 0x944
    .4byte 0xC28
    .4byte 0
    .4byte 0
    .4byte 0
    .4byte 0xC28
    .4byte 0xC98
    .4byte 0
    .4byte 0
    .4byte 0xC98
    .4byte 0xC98
    .4byte 0xC98
    .4byte 0xC98
    .4byte 0xC28
    .4byte 0
    .4byte 0xD24
    .4byte 0
    .4byte 0x85C
    .4byte 0x85C
    .4byte 0x85C
