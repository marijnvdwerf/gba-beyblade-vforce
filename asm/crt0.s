    .include "asm/common.inc"


        .text

        .arm

        .global     Start
@---------------------------------------------------------------------------------
Start:
@---------------------------------------------------------------------------------
        b       main

	    .byte 0x24,0xff,0xae,0x51,0x69,0x9a,0xa2,0x21
	    .byte 0x3d,0x84,0x82,0x0a,0x84,0xe4,0x09,0xad
	    .byte 0x11,0x24,0x8b,0x98,0xc0,0x81,0x7f,0x21
	    .byte 0xa3,0x52,0xbe,0x19,0x93,0x09,0xce,0x20
	    .byte 0x10,0x46,0x4a,0x4a,0xf8,0x27,0x31,0xec
	    .byte 0x58,0xc7,0xe8,0x33,0x82,0xe3,0xce,0xbf
	    .byte 0x85,0xf4,0xdf,0x94,0xce,0x4b,0x09,0xc1
	    .byte 0x94,0x56,0x8a,0xc0,0x13,0x72,0xa7,0xfc
	    .byte 0x9f,0x84,0x4d,0x73,0xa3,0xca,0x9a,0x61
	    .byte 0x58,0x97,0xa3,0x27,0xfc,0x03,0x98,0x76
	    .byte 0x23,0x1d,0xc7,0x61,0x03,0x04,0xae,0x56
	    .byte 0xbf,0x38,0x84,0x00,0x40,0xa7,0x0e,0xfd
	    .byte 0xff,0x52,0xfe,0x03,0x6f,0x95,0x30,0xf1
	    .byte 0x97,0xfb,0xc0,0x85,0x60,0xd6,0x80,0x25
	    .byte 0xa9,0x63,0xbe,0x03,0x01,0x4e,0x38,0xe2
	    .byte 0xf9,0xa2,0x34,0xff,0xbb,0x3e,0x03,0x44
	    .byte 0x78,0x00,0x90,0xcb,0x88,0x11,0x3a,0x94
	    .byte 0x65,0xc0,0x7c,0x63,0x87,0xf0,0x3c,0xaf
	    .byte 0xd6,0x25,0xe4,0x8b,0x38,0x0a,0xac,0x72
	    .byte 0x21,0xd4,0xf8,0x07       @ Nintendo Logo Character Data (8000004h)
        .ascii  "BEYBLADE: UL"          @ Game Title
        .ascii  "BEYE"                  @ Game Code
        .byte   0x37,0x30               @ Maker Code (80000B0h)
        .byte   0x96                    @ Fixed Value (80000B2h)
        .byte   0x00                    @ Main Unit Code (80000B3h)
        .byte   0x00                    @ Device Type (80000B4h)
        .fill   7,1,0                   @ unused
        .byte   0x00                    @ Software Version No (80000BCh)
        .byte   0x92                    @ Complement Check (80000BDh)
        .byte   0x00,0x00               @ Checksum (80000BEh)



        .global     main
        .align
@---------------------------------------------------------------------------------
main:
@---------------------------------------------------------------------------------
        MOV     R0, #0xD2
        MSR     CPSR_cf, R0
        LDR     SP, off_8000134
        MOV     R0, #0x1F
        MSR     CPSR_cf, R0
        LDR     SP, off_8000130
        LDR     R1, off_800026C
        ADR     R0, sub_8000168
        STR     R0, [R1]
        MOV     R1, #0x3000000
        MOV     R2, #0
        MOV     R3, #8000
loc_80000F0:                             ;
        STMIA   R1!, {R2}
        SUBS    R3, R3, #4
        BNE     loc_80000F0
        LDR     R1, off_8000270
        LDR     R2, off_8000274
        SUBS    R3, R1, R2
        BEQ     loc_8000120
        LDR     R1, off_8000278

loc_8000110 :
        LDMIA   R1!, {R0}
        STMIA   R2!, {R0}
        SUBS    R3, R3, #4
        BNE     loc_8000110

loc_8000120:
        LDR     R1, off_800027C
        MOV     LR, PC
        BX      R1

        B       main
off_8000130:
        .4byte 0x3007EC0
off_8000134:
        .4byte 0x3007FA0

     .byte    1,    0, 0x2D, 0xE9,    0,    0,  0xF, 0xE1
     .byte 0x80,    0, 0xC0, 0xE3,    0, 0xF0, 0x29, 0xE1
     .byte    1,    0, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
     .byte    1,    0, 0x2D, 0xE9,    0,    0,  0xF, 0xE1
     .byte 0x80,    0, 0x80, 0xE3,    0, 0xF0, 0x29, 0xE1
     .byte    1,    0, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1


  global sub_8000168

                STMFD   SP!, {LR}
                MRS     R0, SPSR
                STMFD   SP!, {R0}
                MRS     R0, CPSR
                BIC     R1, R0, #0x1F
                ORR     R1, R0, #0x1F
                MSR     CPSR_cf, R1
                STMFD   SP!, {R0,LR}
                MOV     R3, #0x4000000
                ADD     R3, R3, #0x200
                LDR     R2, [R3]
                AND     R1, R2, R2,LSR#16
                MOV     R2, #0
                ANDS    R0, R1, #1
                BNE     loc_800023C
                ADD     R2, R2, #4
                ANDS    R0, R1, #2
                BNE     loc_800023C
                ADD     R2, R2, #4
                ANDS    R0, R1, #4
                BNE     loc_800023C
                ADD     R2, R2, #4
                ANDS    R0, R1, #8
                BNE     loc_800023C
                ADD     R2, R2, #4
                ANDS    R0, R1, #0x10
                BNE     loc_800023C
                ADD     R2, R2, #4
                ANDS    R0, R1, #0x20
                BNE     loc_800023C
                ADD     R2, R2, #4
                ANDS    R0, R1, #0x40
                BNE     loc_800023C
                ADD     R2, R2, #4
                ANDS    R0, R1, #0x80
                BNE     loc_800023C
                ADD     R2, R2, #4
                ANDS    R0, R1, #0x100
                BNE     loc_800023C
                ADD     R2, R2, #4
                ANDS    R0, R1, #0x200
                BNE     loc_800023C
                ADD     R2, R2, #4
                ANDS    R0, R1, #0x400
                BNE     loc_800023C
                ADD     R2, R2, #4
                ANDS    R0, R1, #0x800
                BNE     loc_800023C
                ADD     R2, R2, #4
                ANDS    R0, R1, #0x1000
                BNE     loc_800023C
                ADD     R2, R2, #4
                ANDS    R0, R1, #0x2000

loc_800023C:

                STRH    R0, [R3,#2]
                LDR     R1, off_8000280
                ADD     R1, R1, R2
                LDR     R0, [R1]
                MOV     LR, PC
                BX      R0
                LDMFD   SP!, {R0,LR}
                MSR     CPSR_cf, R0
                LDMFD   SP!, {R0}
                MSR     SPSR_cf, R0
                LDMFD   SP!, {LR}
                BX      LR
off_800026C:
        .4byte 0x3007FFC
off_8000270:
        .4byte fn_end
off_8000274:
        .4byte _ARM_sub_87569F4
off_8000278:
        .4byte ARM_sub_87569F4
off_800027C:
        .4byte mainLoop+1
off_8000280:
        .4byte _unk3000DF0

	.pool

	.align 2, 0 @ Don't pad with nop.
