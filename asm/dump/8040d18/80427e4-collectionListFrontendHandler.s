	.include "asm/common.inc"

	thumb_func_start collectionListFrontendHandler
collectionListFrontendHandler:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xffffffec
	mov	r8, r0
	cmp	r1, #0x1
	bne	.L80427F6	@cond_branch
	b	.L8042AB4
.L80427F6:
	cmp	r1, #0x1
	bcc	.L804280E	@cond_branch
	cmp	r1, #0x2
	bne	.L8042802	@cond_branch
	bl	.L8043118
.L8042802:
	cmp	r1, #0x7
	bne	.L804280A	@cond_branch
	bl	.L8043144
.L804280A:
	bl	.L80431B6
.L804280E:
	mov	r4, #0x9a
	lsl	r4, r4, #0x1
	ldr	r0, .L80428D4
	ldr	r1, .L80428D4 + 4
	str	r1, [r0]
	ldr	r0, .L80428D4 + 8
	mov	r5, #0x0
	str	r5, [r0]
	mov	r0, #0x94
	lsl	r0, r0, #0x2
	ADD r0, r8
	mov	r2, #0x0
	bl	sub_80596AC
	add	r0, r4, #0
	bl	slowAllocate
	ldr	r6, .L80428D4 + 12
	str	r0, [r6]
	cmp	r0, #0
	bne	.L804283E	@cond_branch
	ldr	r0, .L80428D4 + 16
	bl	printf
.L804283E:
	ldr	r3, .L80428D4 + 20
	ldr	r0, [r6]
	ldr	r1, [r0]
	str	r1, [r3]
	ldr	r2, .L80428D4 + 24
	add	r0, r1, #0
	add	r0, r0, #0xf0
	str	r0, [r2]
	ldr	r0, .L80428D4 + 28
	mov	r2, #0x82
	lsl	r2, r2, #0x1
	add	r1, r1, r2
	str	r1, [r0]
	ldr	r0, .L80428D4 + 32
	str	r5, [r0]
	ldr	r0, .L80428D4 + 36
	str	r5, [r0]
	ldr	r0, .L80428D4 + 40
	str	r5, [r0]
	ldr	r0, .L80428D4 + 44
	str	r5, [r0]
	ldr	r0, .L80428D4 + 48
	str	r5, [r0]
	ldr	r0, .L80428D4 + 52
	str	r5, [r0]
	ldr	r0, .L80428D4 + 56
	str	r5, [r0]
	ldr	r0, .L80428D4 + 60
	str	r5, [r0]
	mov	r6, #0x0
	add	r7, r3, #0
.L804287C:
	lsl	r0, r6, #0x1
	add	r0, r0, r6
	lsl	r5, r0, #0x4
	ldr	r0, [r7]
	add	r0, r0, r5
	lsl	r1, r6, #0x4
	sub	r1, r1, r6
	add	r1, r1, #0x56
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	str	r1, [sp]
	mov	r1, #0xc8
	str	r1, [sp, #0x4]
	mov	r1, #0x0
	str	r1, [sp, #0x8]
	ldr	r1, .L80428D4 + 64
	ldr	r2, .L80428D4 + 68
	mov	r3, #0x42
	bl	allocFont
	ldr	r0, [r7]
	add	r0, r0, r5
	mov	r1, #0x3
	bl	sub_80611FC
	add	r0, r6, #0
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804291C	@cond_branch
	ldr	r4, [r7]
	add	r4, r4, r5
	add	r0, r6, #0
	bl	sub_8057048
	add	r1, r0, #0
	add	r0, r4, #0
	mov	r2, #0xf
	bl	sub_8061660
	add	r4, r6, #1
	b	.L8042936
.L80428D2:
	.align	2, 0
.L80428D4:
	.4byte	0x30000fc
	.4byte	0xffff0000
	.4byte	0x30000f8
	.4byte	0x3000120
	.4byte	0x86fd214
	.4byte	0x3000124
	.4byte	0x300012c
	.4byte	0x3000128
	.4byte	0x3000100
	.4byte	0x3000104
	.4byte	0x3000108
	.4byte	0x300010c
	.4byte	0x3000110
	.4byte	0x3000114
	.4byte	0x3000118
	.4byte	0x300011c
	.4byte	0x82b05ec
	.4byte	0x8067ae0
.L804291C:
	ldr	r0, [r7]
	add	r0, r0, r5
	ldr	r1, .L8042964
	mov	r2, #0xc
	bl	sub_8061660
	ldr	r0, [r7]
	add	r0, r0, r5
	add	r4, r6, #1
	add	r1, r4, #0
	mov	r2, #0xc
	bl	showNumber
.L8042936:
	mov	r0, #0x0
	bl	allocSprite
	ldr	r1, .L8042964 + 4
	ldr	r1, [r1]
	lsl	r2, r6, #0x2
	add	r1, r2, r1
	str	r0, [r1]
	add	r5, r2, #0
	cmp	r0, #0
	beq	.L80429A8	@cond_branch
	add	r0, r6, #0
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804296C	@cond_branch
	add	r0, r6, #0
	bl	sub_805703C
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x17
	b	.L804297A
.L8042964:
	.align	2, 0

	.4byte	0x86fd25c
	.4byte	0x300012c
.L804296C:
	add	r0, r6, #0
	bl	sub_805703C
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x17
	add	r0, r0, #0x1
	add	r2, r0, #0
.L804297A:
	ldr	r0, .L80429A0
	ldr	r0, [r0]
	add	r0, r5, r0
	ldr	r0, [r0]
	lsl	r3, r6, #0xa
	mov	r1, #0xac
	lsl	r1, r1, #0x7
	add	r3, r3, r1
	mov	r1, #0x0
	str	r1, [sp]
	str	r1, [sp, #0x4]
	str	r1, [sp, #0x8]
	str	r2, [sp, #0xc]
	ldr	r1, .L80429A0 + 4
	mov	r2, #0x0
	bl	LoadSpriteSheet
	b	.L80429AE
.L804299E:
	.align	2, 0
.L80429A0:
	.4byte	0x300012c
	.4byte	0x823c150
.L80429A8:
	ldr	r0, .L8042A74
	bl	printf
.L80429AE:
	add	r6, r4, #0
	cmp	r6, #0x4
	bgt	.L80429B6	@cond_branch
	b	.L804287C
.L80429B6:
	ldr	r4, .L8042A74 + 4
	ldr	r0, [r4]
	ldr	r1, .L8042A74 + 8
	ldr	r2, .L8042A74 + 12
	mov	r3, #0x28
	str	r3, [sp]
	mov	r3, #0x70
	str	r3, [sp, #0x4]
	mov	r3, #0x10
	str	r3, [sp, #0x8]
	mov	r3, #0x70
	bl	allocFont
	ldr	r0, [r4]
	mov	r1, #0x1
	bl	sub_8061E58
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L8042A74 + 16
	str	r4, [r0]
	cmp	r4, #0
	beq	.L8042A02	@cond_branch
	ldr	r1, .L8042A74 + 20
	mov	r2, #0xc6
	lsl	r2, r2, #0x8
	mov	r3, #0xbe
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L8042A02:
	mov	r0, #0x0
	bl	allocSprite
	add	r2, r0, #0
	ldr	r0, .L8042A74 + 24
	str	r2, [r0]
	cmp	r2, #0
	beq	.L8042A2C	@cond_branch
	ldr	r1, .L8042A74 + 28
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	mov	r0, #0x1
	str	r0, [sp, #0x8]
	mov	r0, #0x62
	str	r0, [sp, #0xc]
	add	r0, r2, #0
	mov	r2, #0x0
	mov	r3, #0x0
	bl	LoadSpriteSheet
.L8042A2C:
	ldr	r0, .L8042A74 + 32
	mov	r1, #0x0
	str	r1, [r0]
	ldr	r0, .L8042A74 + 36
	str	r1, [r0]
	ldr	r1, .L8042A74 + 40
	ldr	r2, .L8042A74 + 44
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x2
	mov	r0, #0x2f
	strh	r0, [r1]
	ldr	r0, .L8042A74 + 48
	mov	r2, #0xf0
	strh	r2, [r0]
	sub	r1, r1, #0x6
	ldr	r3, .L8042A74 + 52
	add	r0, r3, #0
	strh	r0, [r1]
	ldr	r0, .L8042A74 + 56
	strh	r2, [r0]
	add	r1, r1, #0x2
	mov	r0, #0x47
	strh	r0, [r1]
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	ldrh	r0, [r2]
	mov	r3, #0xc0
	lsl	r3, r3, #0x7
	add	r1, r3, #0
	orr	r0, r0, r1
	strh	r0, [r2]
	ldr	r0, .L8042A74 + 60
	bl	sub_8055C4C
	b	.L80431B6
.L8042A74:
	.align	2, 0

	.4byte	0x86fd264
	.4byte	0x3000128
	.4byte	0x82b05ec
	.4byte	0x8067ae0
	.4byte	0x3000130
	.4byte	0x823c260
	.4byte	0x3000134
	.4byte	0x82b1a84
	.4byte	0x3000138
	.4byte	0x300013c
	.4byte	0x4000048
	.4byte	0x3f3f
	.4byte	0x4000040
	.4byte	0x5692
	.4byte	0x4000042
	.4byte	0x3000140
.L8042AB4:
	ldr	r0, .L8042B18
	ADD r0, r8
	ldrh	r0, [r0]
	cmp	r0, #0
	beq	.L8042AC0	@cond_branch
	b	.L8042C6C
.L8042AC0:
	ldr	r1, .L8042B18 + 4
	mov	r2, #0xf4
	lsl	r2, r2, #0x4
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r2, .L8042B18 + 8
	ldr	r1, .L8042B18 + 12
	ldr	r3, [r1]
	mov	r0, #0x10
	sub	r0, r0, r3
	lsl	r0, r0, #0x8
	orr	r0, r0, r3
	strh	r0, [r2]
	ldr	r0, .L8042B18 + 16
	ldr	r0, [r0]
	cmp	r3, r0
	beq	.L8042AEC	@cond_branch
	sub	r2, r3, #1
	cmp	r0, r3
	ble	.L8042AEA	@cond_branch
	add	r2, r3, #1
.L8042AEA:
	str	r2, [r1]
.L8042AEC:
	ldr	r0, [r1]
	cmp	r0, #0
	beq	.L8042AF4	@cond_branch
	b	.L8042C6C
.L8042AF4:
	bl	sub_8057C40
	asr	r0, r0, #0x4
	mov	r1, #0x3
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8042B04	@cond_branch
	b	.L8042C6C
.L8042B04:
	ldr	r4, .L8042B18 + 20
	ldr	r0, [r4]
	cmp	r0, #0
	bne	.L8042B30	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r4]
	b	.L8042B34
.L8042B16:
	.align	2, 0
.L8042B18:
	.4byte	0x584
	.4byte	0x4000050
	.4byte	0x4000052
	.4byte	0x3000118
	.4byte	0x300011c
	.4byte	0x3000138
.L8042B30:
	bl	sub_8060A60
.L8042B34:
	ldr	r5, .L8042BC8
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8042BF0	@cond_branch
	ldr	r4, .L8042BC8 + 4
	ldr	r7, .L8042BC8 + 8
	ldr	r0, [r7]
	bl	sub_8057094
	add	r1, r0, #0
	add	r0, r4, #0
	bl	getDecompressorData
	add	r1, r0, #0
	ldr	r0, [r5]
	mov	r2, #0xa4
	lsl	r2, r2, #0x6
	mov	r3, #0x80
	lsl	r3, r3, #0x4
	mov	r4, #0x1
	str	r4, [sp]
	mov	r4, #0x0
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	bl	LoadSpriteSheet
	ldr	r2, [r5]
	ldr	r0, .L8042BC8 + 12
	ldrh	r3, [r2, #0x14]
	and	r0, r0, r3
	mov	r3, #0xc0
	lsl	r3, r3, #0x6
	add	r1, r3, #0
	orr	r0, r0, r1
	strh	r0, [r2, #0x14]
	ldr	r4, .L8042BC8 + 16
	ldr	r0, [r7]
	bl	sub_8057068
	ldr	r1, .L8042BC8 + 20
	ldr	r3, [r4]
	mov	r2, #0x20
	bl	_call_via_r3
	ldr	r0, [r7]
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8042BE8	@cond_branch
	ldr	r6, .L8042BC8 + 24
	ldr	r5, [r6]
	ldr	r4, .L8042BC8 + 28
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r0, r0, r4
	ldr	r1, [r0]
	add	r0, r5, #0
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r4, [r6]
	ldr	r0, [r7]
	bl	sub_8057048
	add	r1, r0, #0
	add	r0, r4, #0
	mov	r2, #0xf
	bl	showString
	b	.L8042BF0
.L8042BC6:
	.align	2, 0
.L8042BC8:
	.4byte	0x3000138
	.4byte	0x3000140
	.4byte	0x3000114
	.4byte	0xfff
	.4byte	0x807d974
	.4byte	0x5000260
	.4byte	0x3000128
	.4byte	0x806e8b0
.L8042BE8:
	ldr	r0, .L8042C1C
	ldr	r0, [r0]
	bl	sub_8061228
.L8042BF0:
	ldr	r4, .L8042C1C + 4
	ldr	r0, [r4]
	bl	sub_805703C
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8042C2E	@cond_branch
	ldr	r0, [r4]
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8042C2E	@cond_branch
	ldr	r4, .L8042C1C + 8
	ldr	r0, [r4]
	cmp	r0, #0
	bne	.L8042C28	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	b	.L8042C3C
.L8042C1A:
	.align	2, 0
.L8042C1C:
	.4byte	0x3000128
	.4byte	0x3000114
	.4byte	0x300013c
.L8042C28:
	bl	sub_8060A60
	b	.L8042C3E
.L8042C2E:
	ldr	r4, .L8042DAC
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L8042C66	@cond_branch
	bl	sub_8060A94
	mov	r0, #0x0
.L8042C3C:
	str	r0, [r4]
.L8042C3E:
	ldr	r0, .L8042DAC
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L8042C66	@cond_branch
	ldr	r1, .L8042DAC + 4
	mov	r2, #0xb0
	lsl	r2, r2, #0x7
	mov	r3, #0xdc
	lsl	r3, r3, #0x6
	mov	r0, #0x1
	str	r0, [sp]
	mov	r0, #0x0
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	ldr	r0, .L8042DAC + 8
	ldrh	r0, [r0]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L8042C66:
	ldr	r1, .L8042DAC + 12
	mov	r0, #0x10
	str	r0, [r1]
.L8042C6C:
	mov	r0, #0xa0
	lsl	r0, r0, #0x1
	ADD r0, r8
	bl	sub_80439A0
	ldr	r0, .L8042DAC + 16
	ldr	r5, .L8042DAC + 20
	ldr	r4, [r0]
	ldr	r0, [r5]
	cmp	r4, r0
	beq	.L8042C9A	@cond_branch
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	mov	r0, #0x94
	lsl	r0, r0, #0x2
	ADD r0, r8
	add	r1, r4, #0
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, [r5]
	add	r0, r0, r4
	str	r0, [r5]
.L8042C9A:
	ldr	r1, .L8042DAC + 24
	mov	r0, #0x40
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8042CBE	@cond_branch
	ldr	r1, .L8042DAC + 8
	ldr	r0, [r1]
	cmp	r0, #0
	beq	.L8042CBE	@cond_branch
	sub	r0, r0, #0x1
	str	r0, [r1]
	ldr	r1, .L8042DAC + 12
	mov	r0, #0x0
	str	r0, [r1]
	mov	r0, #0x7
	bl	sub_804ABFC
.L8042CBE:
	ldr	r1, .L8042DAC + 24
	mov	r0, #0x80
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8042CE2	@cond_branch
	ldr	r1, .L8042DAC + 8
	ldr	r0, [r1]
	cmp	r0, #0x6b
	bgt	.L8042CE2	@cond_branch
	add	r0, r0, #0x1
	str	r0, [r1]
	ldr	r1, .L8042DAC + 12
	mov	r0, #0x0
	str	r0, [r1]
	mov	r0, #0x7
	bl	sub_804ABFC
.L8042CE2:
	ldr	r1, .L8042DAC + 28
	mov	r0, #0x40
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8042D20	@cond_branch
	ldr	r4, .L8042DAC + 8
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L8042D20	@cond_branch
	mov	r0, #0x6
	bl	sub_805A914
	ldr	r0, [r0, #0x8]
	cmp	r0, #0xf0
	bls	.L8042D20	@cond_branch
	bl	sub_8057C40
	asr	r1, r0, #0x4
	mov	r0, #0x3
	and	r1, r1, r0
	cmp	r1, #0
	bne	.L8042D20	@cond_branch
	ldr	r0, [r4]
	sub	r0, r0, #0x1
	str	r0, [r4]
	ldr	r0, .L8042DAC + 12
	str	r1, [r0]
	mov	r0, #0x7
	bl	sub_804ABFC
.L8042D20:
	ldr	r1, .L8042DAC + 28
	mov	r0, #0x80
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8042D5E	@cond_branch
	ldr	r4, .L8042DAC + 8
	ldr	r0, [r4]
	cmp	r0, #0x6b
	bgt	.L8042D5E	@cond_branch
	mov	r0, #0x7
	bl	sub_805A914
	ldr	r0, [r0, #0x8]
	cmp	r0, #0xf0
	bls	.L8042D5E	@cond_branch
	bl	sub_8057C40
	asr	r1, r0, #0x4
	mov	r0, #0x3
	and	r1, r1, r0
	cmp	r1, #0
	bne	.L8042D5E	@cond_branch
	ldr	r0, [r4]
	add	r0, r0, #0x1
	str	r0, [r4]
	ldr	r0, .L8042DAC + 12
	str	r1, [r0]
	mov	r0, #0x7
	bl	sub_804ABFC
.L8042D5E:
	ldr	r0, .L8042DAC + 8
	ldr	r0, [r0]
	sub	r0, r0, #0x2
	lsl	r1, r0, #0x4
	sub	r1, r1, r0
	lsl	r1, r1, #0x8
	ldr	r0, .L8042DAC + 32
	sub	r0, r0, r1
	ldr	r1, .L8042DAC + 36
	ldr	r4, .L8042DAC + 40
	ldr	r2, [r4]
	sub	r0, r0, r2
	asr	r0, r0, #0x2
	str	r0, [r1]
	ldr	r3, .L8042DAC + 44
	ldr	r1, [r3]
	add	r1, r1, r0
	str	r1, [r3]
	add	r2, r2, r0
	str	r2, [r4]
	cmp	r1, #0
	bgt	.L8042D8C	@cond_branch
	b	.L8042EA8
.L8042D8C:
	ldr	r2, .L8042DAC + 48
	ldr	r0, [r2]
	cmp	r0, #0
	bne	.L8042D96	@cond_branch
	b	.L8042EA4
.L8042D96:
	sub	r0, r0, #0x1
	str	r0, [r2]
	ldr	r2, .L8042DAC + 52
	add	r0, r1, r2
	str	r0, [r3]
	ldr	r1, .L8042DAC + 56
	ldr	r0, [r1]
	cmp	r0, #0
	ble	.L8042DE8	@cond_branch
	sub	r0, r0, #0x1
	b	.L8042DEA
.L8042DAC:
	.align	2, 0

	.4byte	0x300013c
	.4byte	0x823c2c8
	.4byte	0x3000114
	.4byte	0x300011c
	.4byte	0x30000f8
	.4byte	0x30000fc
	.4byte	0x3005da0
	.4byte	0x3005ca0
	.4byte	0xfffffc00
	.4byte	0x3000108
	.4byte	0x3000104
	.4byte	0x3000100
	.4byte	0x3000110
	.4byte	0xfffff100
	.4byte	0x300010c
.L8042DE8:
	mov	r0, #0x4
.L8042DEA:
	str	r0, [r1]
	ldr	r6, .L8042E1C
	ldr	r0, [r6]
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8042E28	@cond_branch
	ldr	r2, .L8042E1C + 4
	ldr	r0, .L8042E1C + 8
	ldr	r1, [r0]
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x4
	ldr	r4, [r2]
	add	r4, r4, r0
	ldr	r0, [r6]
	bl	sub_8057048
	add	r1, r0, #0
	add	r0, r4, #0
	mov	r2, #0xf
	bl	sub_8061660
	b	.L8042E56
.L8042E1C:
	.align	2, 0

	.4byte	0x3000110
	.4byte	0x3000124
	.4byte	0x300010c
.L8042E28:
	ldr	r5, .L8042E80
	ldr	r4, .L8042E80 + 4
	ldr	r0, [r4]
	lsl	r1, r0, #0x1
	add	r1, r1, r0
	lsl	r1, r1, #0x4
	ldr	r0, [r5]
	add	r0, r0, r1
	ldr	r1, .L8042E80 + 8
	mov	r2, #0xc
	bl	sub_8061660
	ldr	r0, [r4]
	lsl	r1, r0, #0x1
	add	r1, r1, r0
	lsl	r1, r1, #0x4
	ldr	r0, [r5]
	add	r0, r0, r1
	ldr	r1, [r6]
	add	r1, r1, #0x1
	mov	r2, #0xc
	bl	showNumber
.L8042E56:
	ldr	r0, .L8042E80 + 4
	ldr	r0, [r0]
	ldr	r1, .L8042E80 + 12
	ldr	r1, [r1]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r5, [r0]
	ldr	r4, .L8042E80 + 16
	ldr	r0, [r4]
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8042E94	@cond_branch
	ldr	r0, [r4]
	bl	sub_805703C
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x17
	b	.L8042EA0
.L8042E7E:
	.align	2, 0
.L8042E80:
	.4byte	0x3000124
	.4byte	0x300010c
	.4byte	0x86fd25c
	.4byte	0x300012c
	.4byte	0x3000110
.L8042E94:
	ldr	r0, [r4]
	bl	sub_805703C
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x17
	add	r0, r0, #0x1
.L8042EA0:
	strh	r0, [r5, #0x18]
	b	.L8042EA8
.L8042EA4:
	str	r0, [r3]
	str	r0, [r4]
.L8042EA8:
	ldr	r2, .L8042EEC
	ldr	r1, [r2]
	ldr	r0, .L8042EEC + 4
	cmp	r1, r0
	ble	.L8042EB4	@cond_branch
	b	.L8042FBA
.L8042EB4:
	ldr	r6, .L8042EEC + 8
	ldr	r0, [r6]
	add	r0, r0, #0x5
	cmp	r0, #0x6c
	bgt	.L8042FB0	@cond_branch
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8042F00	@cond_branch
	ldr	r2, .L8042EEC + 12
	ldr	r0, .L8042EEC + 16
	ldr	r1, [r0]
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x4
	ldr	r4, [r2]
	add	r4, r4, r0
	ldr	r0, [r6]
	add	r0, r0, #0x5
	bl	sub_8057048
	add	r1, r0, #0
	add	r0, r4, #0
	mov	r2, #0xf
	bl	sub_8061660
	b	.L8042F2E
.L8042EEC:
	.align	2, 0

	.4byte	0x3000100
	.4byte	0xfffff100
	.4byte	0x3000110
	.4byte	0x3000124
	.4byte	0x300010c
.L8042F00:
	ldr	r5, .L8042F5C
	ldr	r4, .L8042F5C + 4
	ldr	r0, [r4]
	lsl	r1, r0, #0x1
	add	r1, r1, r0
	lsl	r1, r1, #0x4
	ldr	r0, [r5]
	add	r0, r0, r1
	ldr	r1, .L8042F5C + 8
	mov	r2, #0xc
	bl	sub_8061660
	ldr	r0, [r4]
	lsl	r1, r0, #0x1
	add	r1, r1, r0
	lsl	r1, r1, #0x4
	ldr	r0, [r5]
	add	r0, r0, r1
	ldr	r1, [r6]
	add	r1, r1, #0x6
	mov	r2, #0xc
	bl	showNumber
.L8042F2E:
	ldr	r0, .L8042F5C + 4
	ldr	r0, [r0]
	ldr	r1, .L8042F5C + 12
	ldr	r1, [r1]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r5, [r0]
	ldr	r4, .L8042F5C + 16
	ldr	r0, [r4]
	add	r0, r0, #0x5
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8042F70	@cond_branch
	ldr	r0, [r4]
	add	r0, r0, #0x5
	bl	sub_805703C
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x17
	b	.L8042F7E
.L8042F5A:
	.align	2, 0
.L8042F5C:
	.4byte	0x3000124
	.4byte	0x300010c
	.4byte	0x86fd25c
	.4byte	0x300012c
	.4byte	0x3000110
.L8042F70:
	ldr	r0, [r4]
	add	r0, r0, #0x5
	bl	sub_805703C
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x17
	add	r0, r0, #0x1
.L8042F7E:
	strh	r0, [r5, #0x18]
	ldr	r1, .L8042FA0
	ldr	r0, [r1]
	mov	r3, #0xf0
	lsl	r3, r3, #0x4
	add	r0, r0, r3
	str	r0, [r1]
	ldr	r1, .L8042FA0 + 4
	ldr	r0, [r1]
	add	r0, r0, #0x1
	str	r0, [r1]
	ldr	r1, .L8042FA0 + 8
	ldr	r0, [r1]
	cmp	r0, #0x3
	bgt	.L8042FAC	@cond_branch
	add	r0, r0, #0x1
	b	.L8042FB8
.L8042FA0:
	.align	2, 0

	.4byte	0x3000100
	.4byte	0x3000110
	.4byte	0x300010c
.L8042FAC:
	mov	r0, #0x0
	b	.L8042FB8
.L8042FB0:
	ldr	r0, .L80430D8
	str	r0, [r2]
	ldr	r1, .L80430D8 + 4
	ldr	r0, .L80430D8 + 8
.L8042FB8:
	str	r0, [r1]
.L8042FBA:
	mov	r6, #0x0
	mov	r3, #0xac
	lsl	r3, r3, #0x7
	mov	r7, #0x56
	ldr	r0, .L80430D8 + 12
	mov	r9, r0
.L8042FC6:
	ldr	r0, .L80430D8 + 16
	ldr	r0, [r0]
	add	r4, r6, r0
	cmp	r4, #0x4
	ble	.L8042FD2	@cond_branch
	sub	r4, r4, #0x5
.L8042FD2:
	lsl	r1, r4, #0x1
	add	r1, r1, r4
	lsl	r1, r1, #0x4
	mov	r2, r9
	ldr	r0, [r2]
	add	r0, r0, r1
	ldr	r1, .L80430D8 + 20
	mov	r8, r1
	ldr	r1, [r1]
	asr	r1, r1, #0x8
	NEG	r1, r1
	add	r1, r1, #0x42
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	ldr	r5, .L80430D8 + 24
	ldr	r2, [r5]
	asr	r2, r2, #0x8
	add	r2, r2, r7
	lsl	r2, r2, #0x10
	asr	r2, r2, #0x10
	str	r3, [sp, #0x10]
	bl	sub_8061844
	ldr	r0, .L80430D8 + 28
	ldr	r1, [r0]
	lsl	r0, r4, #0x2
	add	r0, r0, r1
	ldr	r1, [r0]
	ldr	r3, [sp, #0x10]
	cmp	r1, #0
	beq	.L8043024	@cond_branch
	mov	r2, r8
	ldr	r0, [r2]
	NEG	r0, r0
	mov	r2, #0xd8
	lsl	r2, r2, #0x6
	add	r0, r0, r2
	str	r0, [r1, #0x8]
	ldr	r0, [r5]
	add	r0, r0, r3
	str	r0, [r1, #0xc]
.L8043024:
	mov	r0, #0xf0
	lsl	r0, r0, #0x4
	add	r3, r3, r0
	add	r7, r7, #0xf
	add	r6, r6, #0x1
	cmp	r6, #0x4
	ble	.L8042FC6	@cond_branch
	ldr	r0, .L80430D8 + 32
	ldr	r0, [r0]
	mov	r5, r8
	ldr	r1, [r5]
	asr	r1, r1, #0x8
	NEG	r1, r1
	add	r1, r1, #0x70
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	mov	r2, #0x28
	bl	sub_8061844
	ldr	r0, .L80430D8 + 36
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L804306E	@cond_branch
	ldr	r1, [r5]
	mov	r0, #0xc6
	lsl	r0, r0, #0x8
	sub	r0, r0, r1
	str	r0, [r2, #0x8]
	ldr	r0, .L80430D8 + 40
	ldr	r1, [r0]
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x5
	mov	r1, #0xbe
	lsl	r1, r1, #0x7
	add	r0, r0, r1
	str	r0, [r2, #0xc]
.L804306E:
	ldr	r4, .L80430D8 + 44
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L80430B0	@cond_branch
	bl	sub_8057C40
	ldr	r3, [r4]
	ldr	r2, [r5]
	ldr	r1, .L80430D8 + 48
	asr	r0, r0, #0x7
	lsl	r0, r0, #0x1d
	lsr	r0, r0, #0x17
	add	r0, r0, #0x80
	add	r0, r0, r1
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	mov	r1, #0x98
	lsl	r1, r1, #0x6
	add	r0, r0, r1
	sub	r0, r0, r2
	str	r0, [r3, #0x8]
	ldr	r0, .L80430D8 + 52
	ldr	r0, [r0]
	lsl	r1, r0, #0x4
	sub	r1, r1, r0
	lsl	r1, r1, #0x8
	ldr	r0, .L80430D8 + 4
	ldr	r0, [r0]
	add	r0, r0, r1
	mov	r2, #0xa4
	lsl	r2, r2, #0x7
	add	r0, r0, r2
	str	r0, [r3, #0xc]
.L80430B0:
	ldr	r0, .L80430D8 + 56
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L80430C2	@cond_branch
	ldr	r1, [r5]
	mov	r0, #0xa4
	lsl	r0, r0, #0x6
	sub	r0, r0, r1
	str	r0, [r2, #0x8]
.L80430C2:
	ldr	r0, .L80430D8 + 60
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L80431B6	@cond_branch
	mov	r3, r8
	ldr	r1, [r3]
	mov	r0, #0xb0
	lsl	r0, r0, #0x7
	sub	r0, r0, r1
	str	r0, [r2, #0x8]
	b	.L80431B6
.L80430D8:
	.align	2, 0

	.4byte	0xfffff101
	.4byte	0x3000104
	.4byte	0xfff9d901
	.4byte	0x3000124
	.4byte	0x300010c
	.4byte	0x30000fc
	.4byte	0x3000100
	.4byte	0x300012c
	.4byte	0x3000128
	.4byte	0x3000130
	.4byte	0x3000110
	.4byte	0x3000134
	.4byte	0x874cc3c
	.4byte	0x3000114
	.4byte	0x3000138
	.4byte	0x300013c
.L8043118:
	ldr	r1, .L8043138
	mov	r0, #0xb
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L80431B6	@cond_branch
	bl	sub_8049178
	ldr	r1, .L8043138 + 4
	ldr	r0, .L8043138 + 8
	str	r0, [r1]
	mov	r0, #0x9
	bl	sub_804ABFC
	b	.L80431B6
.L8043136:
	.align	2, 0
.L8043138:
	.4byte	0x3005da0
	.4byte	0x30000f8
	.4byte	0xffff0000
.L8043144:
	mov	r6, #0x0
	ldr	r5, .L80431C4
	mov	r4, #0x0
.L804314A:
	ldr	r0, [r5]
	add	r0, r0, r4
	bl	sub_8061204
	ldr	r0, .L80431C4 + 4
	ldr	r1, [r0]
	lsl	r0, r6, #0x2
	add	r0, r0, r1
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8043164	@cond_branch
	bl	sub_8060A94
.L8043164:
	add	r4, r4, #0x30
	add	r6, r6, #0x1
	cmp	r6, #0x4
	ble	.L804314A	@cond_branch
	ldr	r0, .L80431C4 + 8
	ldr	r0, [r0]
	bl	sub_8061204
	ldr	r0, .L80431C4 + 12
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8043180	@cond_branch
	bl	sub_8060A94
.L8043180:
	ldr	r0, .L80431C4 + 16
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L804318C	@cond_branch
	bl	sub_8060A94
.L804318C:
	ldr	r0, .L80431C4 + 20
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8043198	@cond_branch
	bl	sub_8060A94
.L8043198:
	ldr	r0, .L80431C4 + 24
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L80431A4	@cond_branch
	bl	sub_8060A94
.L80431A4:
	ldr	r0, .L80431C4 + 28
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L80431B0	@cond_branch
	bl	deallocateBlock
.L80431B0:
	ldr	r0, .L80431C4 + 32
	bl	sub_8055CA0
.L80431B6:
	add	sp, sp, #0x14
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L80431C4:
	.align	2, 0

	.4byte	0x3000124
	.4byte	0x300012c
	.4byte	0x3000128
	.4byte	0x3000130
	.4byte	0x3000134
	.4byte	0x3000138
	.4byte	0x300013c
	.4byte	0x3000120
	.4byte	0x3000140
	thumb_func_end collectionListFrontendHandler

.align 2, 0 @ Don't pad with nop.
