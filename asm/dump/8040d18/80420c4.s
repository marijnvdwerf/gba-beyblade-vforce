	.include "asm/common.inc"

	thumb_func_start sub_80420C4
sub_80420C4:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff0
	add	r2, r0, #0
	add	r7, r2, #0
	add	r7, r7, #0xb8
	cmp	r1, #0x8
	bls	.L1	@cond_branch
	b	.L55
.L1:
	lsl	r0, r1, #0x2
	ldr	r1, .L4
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L5:
	.align	2, 0
.L4:
	.4byte	.L3
.L3:
	.4byte	.L6
	.4byte	.L7
	.4byte	.L8
	.4byte	.L55
	.4byte	.L55
	.4byte	.L55
	.4byte	.L55
	.4byte	.L13
	.4byte	.L14
.L6:
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
	ldr	r0, .L16
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
	ldr	r0, .L16 + 4
	str	r0, [r2, #0x14]
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r5, r5, r0
	ldr	r0, [r5]
	ldr	r1, .L16 + 8
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
	ldr	r1, .L16 + 12
	str	r0, [r1]
	ldr	r1, .L16 + 16
	bl	sub_8063F5C
	ldr	r0, .L16 + 20
	ldr	r6, .L16 + 24
	str	r6, [r0]
	ldr	r0, .L16 + 28
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
	ldr	r0, .L16 + 32
	strb	r4, [r0]
	ldr	r0, .L16 + 36
	strb	r4, [r0]
	ldr	r0, .L16 + 40
	strb	r4, [r0]
	ldr	r0, .L16 + 44
	str	r4, [r0]
	ldr	r1, .L16 + 48
	mov	r0, #0xb0
	lsl	r0, r0, #0x7
	str	r0, [r1]
	ldr	r0, .L16 + 52
	mov	r1, #0x80
	lsl	r1, r1, #0x7
	str	r1, [r0]
	ldr	r0, .L16 + 56
	str	r1, [r0]
	ldr	r1, .L16 + 60
	ldr	r2, .L16 + 64
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r0, .L16 + 68
	strh	r4, [r0]
	sub	r0, r0, #0xa
	mov	r1, #0xf0
	strh	r1, [r0]
	add	r0, r0, #0x4
	strh	r4, [r0]
	sub	r0, r0, #0x2
	strh	r1, [r0]
	ldr	r1, .L16 + 72
	ldr	r3, .L16 + 76
	add	r0, r3, #0
	strh	r0, [r1]
	mov	r0, #0x0
	bl	allocSprite
	ldr	r5, .L16 + 80
	str	r0, [r5]
	ldr	r1, .L16 + 84
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
	ldr	r1, .L16 + 88
	mov	r0, #0x10
	str	r0, [r1]
	ldr	r0, .L16 + 92
	str	r4, [r0]
	b	.L55
.L17:
	.align	2, 0
.L16:
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
.L7:
	ldr	r4, .L27
	ldrb	r0, [r4]
	cmp	r0, #0
	bne	.L18	@cond_branch
	mov	r1, #0xb2
	lsl	r1, r1, #0x3
	add	r0, r2, r1
	bl	sub_8050894
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	ldrh	r1, [r2]
	ldr	r0, .L27 + 4
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
.L18:
	ldr	r2, .L27 + 8
	ldr	r6, .L27 + 12
	ldr	r0, [r6]
	ldr	r1, [r2]
	sub	r0, r0, r1
	asr	r0, r0, #0x3
	add	r5, r1, r0
	str	r5, [r2]
	ldr	r2, .L27 + 16
	ldr	r0, .L27 + 20
	ldr	r0, [r0]
	ldr	r1, [r2]
	sub	r0, r0, r1
	asr	r0, r0, #0x3
	add	r1, r1, r0
	str	r1, [r2]
	ldr	r3, .L27 + 24
	asr	r2, r5, #0x9
	mov	r0, #0x34
	sub	r0, r0, r2
	lsl	r0, r0, #0x8
	add	r2, r2, #0x34
	orr	r0, r0, r2
	strh	r0, [r3]
	ldr	r2, .L27 + 28
	asr	r1, r1, #0x8
	add	r1, r1, #0x60
	mov	r3, #0xc0
	lsl	r3, r3, #0x7
	add	r0, r3, #0
	orr	r1, r1, r0
	strh	r1, [r2]
	ldr	r1, .L27 + 32
	ldr	r4, [r1]
	mov	r0, #0x1
	and	r0, r0, r4
	add	r7, r1, #0
	cmp	r0, #0
	beq	.L20	@cond_branch
	mov	r0, #0x0
	str	r0, [r6]
	ldr	r3, .L27 + 36
	mov	r0, #0x10
	str	r0, [r3]
	asr	r2, r5, #0x8
	cmp	r2, #0
	bne	.L20	@cond_branch
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
	ldr	r0, .L27 + 40
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
.L20:
	add	r4, r7, #0
	ldr	r0, [r4]
	mov	r1, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L22	@cond_branch
	bl	sub_8057C40
	asr	r2, r0, #0x4
	mov	r0, #0x3
	and	r2, r2, r0
	cmp	r2, #0
	bne	.L22	@cond_branch
	ldr	r4, [r4]
	mov	r0, #0xf0
	lsl	r0, r0, #0x6
	and	r0, r0, r4
	lsr	r3, r0, #0xa
	ldr	r1, .L27 + 44
	mov	r0, #0x10
	str	r0, [r1]
	ldr	r0, .L27 + 36
	str	r2, [r0]
	cmp	r3, #0
	beq	.L23	@cond_branch
	sub	r3, r3, #0x1
	cmp	r3, #0
	bne	.L24	@cond_branch
.L23:
	mov	r0, #0x3
	NEG	r0, r0
	and	r4, r4, r0
	str	r4, [r7]
.L24:
	ldr	r2, .L27 + 32
	ldr	r0, [r2]
	ldr	r1, .L27 + 48
	and	r0, r0, r1
	lsl	r1, r3, #0xa
	orr	r0, r0, r1
	str	r0, [r2]
.L22:
	bl	sub_8057C40
	ldr	r4, .L27 + 52
	ldr	r2, [r4]
	asr	r0, r0, #0x8
	mov	r1, #0x1
	and	r0, r0, r1
	strh	r0, [r2, #0x18]
	ldr	r0, .L27 + 56
	ldr	r0, [r0]
	bl	sub_806417C
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L25	@cond_branch
	ldr	r1, [r4]
	mov	r0, #0x8c
	lsl	r0, r0, #0x8
	b	.L26
.L28:
	.align	2, 0
.L27:
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
.L25:
	ldr	r1, [r4]
	mov	r0, #0xa0
	lsl	r0, r0, #0x8
.L26:
	str	r0, [r1, #0xc]
	ldr	r0, .L30
	bl	sub_805599C
	b	.L55
.L31:
	.align	2, 0
.L30:
	.4byte	0x3000080
.L13:
	ldr	r0, .L33
	ldr	r0, [r0]
	bl	sub_8063F64
	ldr	r0, .L33 + 4
	ldr	r0, [r0]
	bl	sub_8060A94
	ldr	r0, .L33 + 8
	bl	sub_8055C30
	b	.L55
.L34:
	.align	2, 0
.L33:
	.4byte	0x300007c
	.4byte	0x30000d8
	.4byte	0x3000080
.L14:
	ldr	r1, .L39
	mov	r0, #0x9f
	strh	r0, [r1]
	ldr	r0, .L39 + 4
	ldr	r3, .L39 + 8
	ldr	r1, [r3]
	strh	r1, [r0]
	ldr	r0, .L39 + 12
	ldr	r0, [r0]
	cmp	r1, r0
	bne	.L35	@cond_branch
	b	.L55
.L35:
	sub	r2, r1, #1
	cmp	r1, r0
	bge	.L37	@cond_branch
	add	r2, r1, #1
.L37:
	str	r2, [r3]
	b	.L55
.L40:
	.align	2, 0
.L39:
	.4byte	0x4000050
	.4byte	0x4000054
	.4byte	0x30000cc
	.4byte	0x30000d0
.L8:
	ldr	r5, .L53
	ldr	r0, [r5]
	bl	sub_8063F84
	ldr	r1, .L53 + 4
	ldrb	r0, [r1]
	cmp	r0, #0
	beq	.L42	@cond_branch
	ldr	r4, .L53 + 8
	ldr	r0, [r4]
	asr	r0, r0, #0x8
	cmp	r0, #0
	bne	.L42	@cond_branch
	strb	r0, [r1]
	ldr	r0, [r5]
	bl	sub_806415C
	ldr	r1, .L53 + 12
	mov	r0, #0x80
	lsl	r0, r0, #0x7
	str	r0, [r1]
	str	r0, [r4]
.L42:
	ldr	r0, .L53
	ldr	r0, [r0]
	bl	sub_806417C
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L44	@cond_branch
	ldr	r1, .L53 + 16
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L44	@cond_branch
	ldr	r1, .L53 + 4
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, .L53 + 12
	mov	r0, #0x0
	str	r0, [r1]
.L44:
	ldr	r0, .L53
	ldr	r0, [r0]
	bl	sub_8064188
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L45	@cond_branch
	ldr	r1, .L53 + 16
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L46	@cond_branch
.L45:
	ldr	r1, .L53 + 16
	mov	r0, #0x8
	ldrh	r1, [r1]
	and	r0, r0, r1
	ldr	r1, .L53 + 20
	cmp	r0, #0
	beq	.L47	@cond_branch
.L46:
	ldr	r0, .L53 + 24
	mov	r1, #0x0
	str	r1, [r0]
	ldr	r0, .L53 + 12
	str	r1, [r0]
	ldr	r1, .L53 + 28
	mov	r0, #0x10
	str	r0, [r1]
	ldr	r1, .L53 + 20
	mov	r0, #0x1
	strb	r0, [r1]
.L47:
	ldrb	r0, [r1]
	cmp	r0, #0
	beq	.L55	@cond_branch
	ldr	r0, .L53 + 32
	ldr	r0, [r0]
	asr	r4, r0, #0x8
	cmp	r4, #0
	bne	.L55	@cond_branch
	bl	sub_8051734
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	strh	r4, [r1]
	mov	r1, #0x1
	ldrh	r0, [r0]
	and	r1, r1, r0
	cmp	r1, #0
	beq	.L50	@cond_branch
	bl	sub_8051744
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L51	@cond_branch
	mov	r0, #0x27
	bl	sub_80490F8
	b	.L55
.L54:
	.align	2, 0
.L53:
	.4byte	0x300007c
	.4byte	0x30000d4
	.4byte	0x30000c4
	.4byte	0x30000c8
	.4byte	0x3005da0
	.4byte	0x30000d5
	.4byte	0x30000c0
	.4byte	0x30000d0
	.4byte	0x30000bc
.L51:
	mov	r0, #0x8
	bl	sub_80490F8
	mov	r0, #0x11
	bl	sub_804924C
	b	.L55
.L50:
	bl	sub_8048FE4
.L55:
	add	sp, sp, #0x10
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80420C4

.align 2, 0 @ Don't pad with nop.
