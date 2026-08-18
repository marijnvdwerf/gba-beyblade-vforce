	.include "asm/common.inc"

	thumb_func_start sub_80420C4
sub_80420C4:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff0
	add	r2, r0, #0
	add	r7, r2, #0
	add	r7, r7, #0xb8
	cmp	r1, #0x8
	bls	.L80420D4	@cond_branch
	b	.L8042572
.L80420D4:
	lsl	r0, r1, #0x2
	ldr	r1, .L80420E0
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L80420DE:
	.align	2, 0
.L80420E0:
	.4byte	.L80420E4
.L80420E4:
	.4byte	.L8042108
	.4byte	.L804229C
	.4byte	.L8042474
	.4byte	.L8042572
	.4byte	.L8042572
	.4byte	.L8042572
	.4byte	.L8042572
	.4byte	.L804241C
	.4byte	.L8042440
.L8042108:
	bl	sub_804A364
	add	r5, r0, #0
	mov	r4, #0x0
	str	r4, [r7, #0x24]
	add	r1, r7, #0
	add	r1, r1, #0x7c
	mov	r3, #0x3
	ldrb	r0, [r1]
	orr	r0, r0, r3
	strb	r0, [r1]
	mov	r0, #0xa0
	lsl	r0, r0, #0x4
	str	r0, [r7, #0x14]
	add	r2, r7, #0
	add	r2, r2, #0x88
	str	r4, [r2, #0x24]
	mov	r0, #0x82
	lsl	r0, r0, #0x1
	add	r1, r7, r0
	ldrb	r0, [r1]
	orr	r0, r0, r3
	strb	r0, [r1]
	mov	r6, #0x80
	lsl	r6, r6, #0x4
	str	r6, [r2, #0x14]
	mov	r1, #0x88
	lsl	r1, r1, #0x1
	add	r2, r7, r1
	str	r4, [r2, #0x24]
	mov	r0, #0xc6
	lsl	r0, r0, #0x1
	add	r1, r7, r0
	ldrb	r0, [r1]
	orr	r0, r0, r3
	strb	r0, [r1]
	ldr	r0, .L804223C
	str	r0, [r2, #0x14]
	mov	r1, #0xcc
	lsl	r1, r1, #0x1
	add	r2, r7, r1
	str	r4, [r2, #0x24]
	mov	r0, #0x85
	lsl	r0, r0, #0x2
	add	r1, r7, r0
	ldrb	r0, [r1]
	orr	r0, r0, r3
	strb	r0, [r1]
	ldr	r0, .L804223C + 4
	str	r0, [r2, #0x14]
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r5, r5, r0
	ldr	r0, [r5]
	ldr	r1, .L804223C + 8
	mov	r2, #0xc8
	lsl	r2, r2, #0x7
	str	r2, [sp]
	mov	r2, #0xe0
	lsl	r2, r2, #0x8
	str	r2, [sp, #0x4]
	str	r4, [sp, #0x8]
	mov	r2, #0x78
	add	r3, r6, #0
	bl	sub_8063E18
	ldr	r1, .L804223C + 12
	str	r0, [r1]
	ldr	r1, .L804223C + 16
	bl	sub_8063F5C
	ldr	r0, .L804223C + 20
	ldr	r6, .L804223C + 24
	str	r6, [r0]
	ldr	r0, .L804223C + 28
	str	r4, [r0]
	mov	r0, #0x0
	bl	GetTalkingHead
	add	r5, r0, #0
	mov	r0, #0x0
	bl	GetTalkingHead
	ldr	r1, [r5, #0x18]
	ldr	r2, [r0, #0x20]
	mov	r3, #0xb8
	lsl	r3, r3, #0x5
	str	r3, [sp]
	add	r0, r6, #0
	bl	sub_8055914
	ldr	r0, .L804223C + 32
	strb	r4, [r0]
	ldr	r0, .L804223C + 36
	strb	r4, [r0]
	ldr	r0, .L804223C + 40
	strb	r4, [r0]
	ldr	r0, .L804223C + 44
	str	r4, [r0]
	ldr	r1, .L804223C + 48
	mov	r0, #0xb0
	lsl	r0, r0, #0x7
	str	r0, [r1]
	ldr	r0, .L804223C + 52
	mov	r1, #0x80
	lsl	r1, r1, #0x7
	str	r1, [r0]
	ldr	r0, .L804223C + 56
	str	r1, [r0]
	ldr	r1, .L804223C + 60
	ldr	r2, .L804223C + 64
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r0, .L804223C + 68
	strh	r4, [r0]
	sub	r0, r0, #0xa
	mov	r1, #0xf0
	strh	r1, [r0]
	add	r0, r0, #0x4
	strh	r4, [r0]
	sub	r0, r0, #0x2
	strh	r1, [r0]
	ldr	r1, .L804223C + 72
	ldr	r3, .L804223C + 76
	add	r0, r3, #0
	strh	r0, [r1]
	mov	r0, #0x0
	bl	allocSprite
	ldr	r5, .L804223C + 80
	str	r0, [r5]
	ldr	r1, .L804223C + 84
	mov	r2, #0xdc
	lsl	r2, r2, #0x8
	mov	r3, #0x8c
	lsl	r3, r3, #0x8
	str	r4, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	bl	LoadSpriteSheet
	ldr	r0, [r5]
	mov	r1, #0xb
	bl	sub_8061168
	ldr	r1, .L804223C + 88
	mov	r0, #0x10
	str	r0, [r1]
	ldr	r0, .L804223C + 92
	str	r4, [r0]
	b	.L8042572
.L804223A:
	.align	2, 0
.L804223C:
	.4byte	0xfffffa00
	.4byte	0xfffff400
	.4byte	0x80688b8
	.4byte	0x300007c
	.4byte	teletypeDefaultUserCodeHandler + 1
	.4byte	0x3000ee8
	.4byte	0x3000080
	.4byte	0x3000eec
	.4byte	0x30000d4
	.4byte	0x30000d5
	.4byte	0x30000d6
	.4byte	0x30000bc
	.4byte	0x30000c0
	.4byte	0x30000c4
	.4byte	0x30000c8
	.4byte	0x4000048
	.4byte	0x1f3f
	.4byte	0x400004a
	.4byte	0x4000046
	.4byte	0x60a0
	.4byte	0x30000d8
	.4byte	0x821cb80
	.4byte	0x30000cc
	.4byte	0x30000d0
.L804229C:
	ldr	r4, .L80423CC
	ldrb	r0, [r4]
	cmp	r0, #0
	bne	.L80422CA	@cond_branch
	mov	r1, #0xb2
	lsl	r1, r1, #0x3
	add	r0, r2, r1
	bl	sub_8050894
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	ldrh	r1, [r2]
	ldr	r0, .L80423CC + 4
	and	r0, r0, r1
	strh	r0, [r2]
	ldrh	r0, [r2]
	mov	r3, #0xc0
	lsl	r3, r3, #0x7
	add	r1, r3, #0
	orr	r0, r0, r1
	strh	r0, [r2]
	mov	r0, #0x1
	strb	r0, [r4]
.L80422CA:
	ldr	r2, .L80423CC + 8
	ldr	r6, .L80423CC + 12
	ldr	r0, [r6]
	ldr	r1, [r2]
	sub	r0, r0, r1
	asr	r0, r0, #0x3
	add	r5, r1, r0
	str	r5, [r2]
	ldr	r2, .L80423CC + 16
	ldr	r0, .L80423CC + 20
	ldr	r0, [r0]
	ldr	r1, [r2]
	sub	r0, r0, r1
	asr	r0, r0, #0x3
	add	r1, r1, r0
	str	r1, [r2]
	ldr	r3, .L80423CC + 24
	asr	r2, r5, #0x9
	mov	r0, #0x34
	sub	r0, r0, r2
	lsl	r0, r0, #0x8
	add	r2, r2, #0x34
	orr	r0, r0, r2
	strh	r0, [r3]
	ldr	r2, .L80423CC + 28
	asr	r1, r1, #0x8
	add	r1, r1, #0x60
	mov	r3, #0xc0
	lsl	r3, r3, #0x7
	add	r0, r3, #0
	orr	r1, r1, r0
	strh	r1, [r2]
	ldr	r1, .L80423CC + 32
	ldr	r4, [r1]
	mov	r0, #0x1
	and	r0, r0, r4
	add	r7, r1, #0
	cmp	r0, #0
	beq	.L8042358	@cond_branch
	mov	r0, #0x0
	str	r0, [r6]
	ldr	r3, .L80423CC + 36
	mov	r0, #0x10
	str	r0, [r3]
	asr	r2, r5, #0x8
	cmp	r2, #0
	bne	.L8042358	@cond_branch
	mov	r1, #0xc0
	lsl	r1, r1, #0x2
	and	r1, r1, r4
	lsr	r1, r1, #0x8
	mov	r0, #0xb0
	lsl	r0, r0, #0x7
	str	r0, [r6]
	str	r2, [r3]
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	ldrh	r3, [r2]
	ldr	r0, .L80423CC + 40
	and	r0, r0, r3
	strh	r0, [r2]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	LSL	r0, r1
	ldrh	r1, [r2]
	orr	r0, r0, r1
	strh	r0, [r2]
	mov	r0, #0x2
	NEG	r0, r0
	and	r4, r4, r0
	str	r4, [r7]
.L8042358:
	add	r4, r7, #0
	ldr	r0, [r4]
	mov	r1, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L80423A6	@cond_branch
	bl	sub_8057C40
	asr	r2, r0, #0x4
	mov	r0, #0x3
	and	r2, r2, r0
	cmp	r2, #0
	bne	.L80423A6	@cond_branch
	ldr	r4, [r4]
	mov	r0, #0xf0
	lsl	r0, r0, #0x6
	and	r0, r0, r4
	lsr	r3, r0, #0xa
	ldr	r1, .L80423CC + 44
	mov	r0, #0x10
	str	r0, [r1]
	ldr	r0, .L80423CC + 36
	str	r2, [r0]
	cmp	r3, #0
	beq	.L8042390	@cond_branch
	sub	r3, r3, #0x1
	cmp	r3, #0
	bne	.L8042398	@cond_branch
.L8042390:
	mov	r0, #0x3
	NEG	r0, r0
	and	r4, r4, r0
	str	r4, [r7]
.L8042398:
	ldr	r2, .L80423CC + 32
	ldr	r0, [r2]
	ldr	r1, .L80423CC + 48
	and	r0, r0, r1
	lsl	r1, r3, #0xa
	orr	r0, r0, r1
	str	r0, [r2]
.L80423A6:
	bl	sub_8057C40
	ldr	r4, .L80423CC + 52
	ldr	r2, [r4]
	asr	r0, r0, #0x8
	mov	r1, #0x1
	and	r0, r0, r1
	strh	r0, [r2, #0x18]
	ldr	r0, .L80423CC + 56
	ldr	r0, [r0]
	bl	sub_806417C
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8042408	@cond_branch
	ldr	r1, [r4]
	mov	r0, #0x8c
	lsl	r0, r0, #0x8
	b	.L804240E
.L80423CC:
	.align	2, 0

	.4byte	0x30000d6
	.4byte	0xf1ff
	.4byte	0x30000bc
	.4byte	0x30000c0
	.4byte	0x30000c4
	.4byte	0x30000c8
	.4byte	0x4000044
	.4byte	0x4000046
	.4byte	0x3000eec
	.4byte	0x30000d0
	.4byte	0xf0ff
	.4byte	0x30000cc
	.4byte	0xffffc3ff
	.4byte	0x30000d8
	.4byte	0x300007c
.L8042408:
	ldr	r1, [r4]
	mov	r0, #0xa0
	lsl	r0, r0, #0x8
.L804240E:
	str	r0, [r1, #0xc]
	ldr	r0, .L8042418
	bl	sub_805599C
	b	.L8042572
.L8042418:
	.align	2, 0

	.4byte	0x3000080
.L804241C:
	ldr	r0, .L8042434
	ldr	r0, [r0]
	bl	sub_8063F64
	ldr	r0, .L8042434 + 4
	ldr	r0, [r0]
	bl	sub_8060A94
	ldr	r0, .L8042434 + 8
	bl	sub_8055C30
	b	.L8042572
.L8042434:
	.align	2, 0

	.4byte	0x300007c
	.4byte	0x30000d8
	.4byte	0x3000080
.L8042440:
	ldr	r1, .L8042464
	mov	r0, #0x9f
	strh	r0, [r1]
	ldr	r0, .L8042464 + 4
	ldr	r3, .L8042464 + 8
	ldr	r1, [r3]
	strh	r1, [r0]
	ldr	r0, .L8042464 + 12
	ldr	r0, [r0]
	cmp	r1, r0
	bne	.L8042458	@cond_branch
	b	.L8042572
.L8042458:
	sub	r2, r1, #1
	cmp	r1, r0
	bge	.L8042460	@cond_branch
	add	r2, r1, #1
.L8042460:
	str	r2, [r3]
	b	.L8042572
.L8042464:
	.align	2, 0

	.4byte	0x4000050
	.4byte	0x4000054
	.4byte	0x30000cc
	.4byte	0x30000d0
.L8042474:
	ldr	r5, .L804253C
	ldr	r0, [r5]
	bl	sub_8063F84
	ldr	r1, .L804253C + 4
	ldrb	r0, [r1]
	cmp	r0, #0
	beq	.L80424A0	@cond_branch
	ldr	r4, .L804253C + 8
	ldr	r0, [r4]
	asr	r0, r0, #0x8
	cmp	r0, #0
	bne	.L80424A0	@cond_branch
	strb	r0, [r1]
	ldr	r0, [r5]
	bl	sub_806415C
	ldr	r1, .L804253C + 12
	mov	r0, #0x80
	lsl	r0, r0, #0x7
	str	r0, [r1]
	str	r0, [r4]
.L80424A0:
	ldr	r0, .L804253C
	ldr	r0, [r0]
	bl	sub_806417C
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L80424C6	@cond_branch
	ldr	r1, .L804253C + 16
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L80424C6	@cond_branch
	ldr	r1, .L804253C + 4
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, .L804253C + 12
	mov	r0, #0x0
	str	r0, [r1]
.L80424C6:
	ldr	r0, .L804253C
	ldr	r0, [r0]
	bl	sub_8064188
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L80424E0	@cond_branch
	ldr	r1, .L804253C + 16
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L80424EE	@cond_branch
.L80424E0:
	ldr	r1, .L804253C + 16
	mov	r0, #0x8
	ldrh	r1, [r1]
	and	r0, r0, r1
	ldr	r1, .L804253C + 20
	cmp	r0, #0
	beq	.L8042504	@cond_branch
.L80424EE:
	ldr	r0, .L804253C + 24
	mov	r1, #0x0
	str	r1, [r0]
	ldr	r0, .L804253C + 12
	str	r1, [r0]
	ldr	r1, .L804253C + 28
	mov	r0, #0x10
	str	r0, [r1]
	ldr	r1, .L804253C + 20
	mov	r0, #0x1
	strb	r0, [r1]
.L8042504:
	ldrb	r0, [r1]
	cmp	r0, #0
	beq	.L8042572	@cond_branch
	ldr	r0, .L804253C + 32
	ldr	r0, [r0]
	asr	r4, r0, #0x8
	cmp	r4, #0
	bne	.L8042572	@cond_branch
	bl	sub_8051734
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	strh	r4, [r1]
	mov	r1, #0x1
	ldrh	r0, [r0]
	and	r1, r1, r0
	cmp	r1, #0
	beq	.L804256E	@cond_branch
	bl	sub_8051744
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8042560	@cond_branch
	mov	r0, #0x27
	bl	sub_80490F8
	b	.L8042572
.L804253A:
	.align	2, 0
.L804253C:
	.4byte	0x300007c
	.4byte	0x30000d4
	.4byte	0x30000c4
	.4byte	0x30000c8
	.4byte	0x3005da0
	.4byte	0x30000d5
	.4byte	0x30000c0
	.4byte	0x30000d0
	.4byte	0x30000bc
.L8042560:
	mov	r0, #0x8
	bl	sub_80490F8
	mov	r0, #0x11
	bl	sub_804924C
	b	.L8042572
.L804256E:
	bl	sub_8048FE4
.L8042572:
	add	sp, sp, #0x10
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80420C4

.align 2, 0 @ Don't pad with nop.
