	.include "asm/common.inc"

	thumb_func_start renderRider
renderRider:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff4
	add	r4, r0, #0
	mov	r0, #0x8e
	lsl	r0, r0, #0x2
	add	r6, r4, r0
	mov	r1, #0xbf
	lsl	r1, r1, #0x2
	add	r1, r1, r4
	mov	sl, r1
	mov	r2, #0xf3
	lsl	r2, r2, #0x2
	add	r1, r4, r2
	mov	r0, #0xc
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L804BC5E	@cond_branch
	mov	r3, #0xbc
	lsl	r3, r3, #0x2
	add	r5, r4, r3
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L804BC30	@cond_branch
	bl	sub_8060A94
	mov	r0, #0x0
	str	r0, [r5]
.L804BC30:
	mov	r0, #0xed
	lsl	r0, r0, #0x2
	add	r5, r4, r0
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L804BC44	@cond_branch
	bl	sub_8060A94
	mov	r0, #0x0
	str	r0, [r5]
.L804BC44:
	mov	r1, #0xfa
	lsl	r1, r1, #0x2
	add	r0, r4, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L804BC52	@cond_branch
	b	.L804BEC8
.L804BC52:
	mov	r2, #0xfb
	lsl	r2, r2, #0x2
	add	r0, r4, r2
	bl	sub_804EA88
	b	.L804BEC8
.L804BC5E:
	mov	r3, #0xba
	lsl	r3, r3, #0x2
	add	r0, r4, r3
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L804BC7A	@cond_branch
	add	r0, r6, #0
	mov	r1, sp
	bl	_call_via_r2
	ldr	r0, [sp]
	asr	r3, r0, #0x8
	ldr	r0, [sp, #0x4]
	b	.L804BC80
.L804BC7A:
	ldr	r0, [r6, #0x4]
	asr	r3, r0, #0x8
	ldr	r0, [r6, #0x8]
.L804BC80:
	asr	r1, r0, #0x8
	ldr	r2, [r6, #0x3c]
	cmp	r2, #0
	beq	.L804BC94	@cond_branch
	ldr	r0, [r2, #0x40]
	asr	r0, r0, #0x8
	sub	r3, r3, r0
	ldr	r0, [r2, #0x44]
	asr	r0, r0, #0x8
	sub	r1, r1, r0
.L804BC94:
	add	r7, r3, #0
	mov	r9, r1
	mov	r1, #0xf1
	lsl	r1, r1, #0x2
	add	r0, r4, r1
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L804BD32	@cond_branch
	mov	r2, #0x82
	lsl	r2, r2, #0x2
	add	r0, r4, r2
	ldr	r1, [r0]
	mov	r0, #0xaa
	mul	r0, r0, r1
	mov	r3, #0x80
	lsl	r3, r3, #0x8
	add	r0, r0, r3
	asr	r0, r0, #0x10
	mov	r1, #0x8
	sub	r1, r1, r0
	mov	r8, r1
	mov	r5, #0x0
	add	r0, r4, #0
	mov	r1, #0x8
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804BCE8	@cond_branch
	bl	sub_8057C40
	ldr	r1, .L804BD60
	asr	r0, r0, #0x4
	lsl	r0, r0, #0x1a
	lsr	r0, r0, #0x17
	add	r0, r0, r1
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	lsl	r5, r0, #0x4
	cmp	r5, #0
	ble	.L804BCE8	@cond_branch
	NEG	r5, r5
.L804BCE8:
	mov	r2, #0xf1
	lsl	r2, r2, #0x2
	add	r3, r4, r2
	ldr	r1, [r3]
	lsl	r0, r7, #0x8
	ldr	r2, .L804BD60 + 4
	add	r0, r0, r2
	str	r0, [r1, #0x8]
	ldr	r0, [r3]
	mov	ip, r0
	mov	r1, r9
	lsl	r0, r1, #0x8
	ldr	r2, .L804BD60 + 8
	add	r1, r5, r2
	add	r0, r0, r1
	mov	r1, ip
	str	r0, [r1, #0xc]
	ldr	r0, [r3]
	mov	r1, #0x8
	mov	r2, r8
	cmp	r2, #0
	blt	.L804BD16	@cond_branch
	mov	r1, r8
.L804BD16:
	strh	r1, [r0, #0x18]
	ldr	r3, [r3]
	ldr	r1, .L804BD60 + 12
	ldrh	r0, [r3, #0x14]
	and	r1, r1, r0
	mov	r0, #0xf4
	lsl	r0, r0, #0x2
	add	r2, r4, r0
	mov	r0, #0xf
	ldrb	r2, [r2]
	sub	r0, r0, r2
	lsl	r0, r0, #0xc
	orr	r1, r1, r0
	strh	r1, [r3, #0x14]
.L804BD32:
	mov	r1, r9
	add	r1, r1, #0x40
	mov	r0, #0x84
	lsl	r0, r0, #0x1
	cmp	r1, r0
	bhi	.L804BD4E	@cond_branch
	mov	r0, #0x40
	NEG	r0, r0
	cmp	r7, r0
	blt	.L804BD4E	@cond_branch
	mov	r0, #0x8c
	lsl	r0, r0, #0x1
	cmp	r7, r0
	ble	.L804BD74	@cond_branch
.L804BD4E:
	mov	r2, #0xf2
	lsl	r2, r2, #0x2
	add	r1, r4, r2
	ldr	r0, .L804BD60 + 16
	ldrh	r3, [r1]
	and	r0, r0, r3
	strh	r0, [r1]
	b	.L804BD82
.L804BD5E:
	.align	2, 0
.L804BD60:
	.4byte	0x874cc3c
	.4byte	0xfffff900
	.4byte	0xffffe400
	.4byte	0xfff
	.4byte	0xfffd
.L804BD74:
	mov	r1, #0xf2
	lsl	r1, r1, #0x2
	add	r0, r4, r1
	mov	r1, #0x2
	ldrh	r2, [r0]
	orr	r1, r1, r2
	strh	r1, [r0]
.L804BD82:
	mov	r3, #0xf2
	lsl	r3, r3, #0x2
	add	r1, r4, r3
	mov	r0, #0x2
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L804BDDA	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x11
	add	r0, r4, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804BDB6	@cond_branch
	mov	r1, #0xf0
	lsl	r1, r1, #0x2
	add	r0, r4, r1
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L804BDB6	@cond_branch
	add	r0, r4, #0
	bl	allocFXSprite
	b	.L804BDEC
.L804BDB6:
	mov	r1, #0x80
	lsl	r1, r1, #0x11
	add	r0, r4, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L804BDEC	@cond_branch
	mov	r2, #0xf0
	lsl	r2, r2, #0x2
	add	r0, r4, r2
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L804BDFE	@cond_branch
	add	r0, r4, #0
	bl	sub_804C098
	b	.L804BDEC
.L804BDDA:
	mov	r3, #0xf0
	lsl	r3, r3, #0x2
	add	r0, r4, r3
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L804BDFE	@cond_branch
	add	r0, r4, #0
	bl	sub_804C098
.L804BDEC:
	mov	r1, #0xf0
	lsl	r1, r1, #0x2
	add	r0, r4, r1
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L804BDFE	@cond_branch
	add	r0, r4, #0
	bl	sub_804BF3C
.L804BDFE:
	mov	r2, #0x8e
	lsl	r2, r2, #0x2
	add	r0, r4, r2
	bl	renderActor2
	add	r0, r6, #0
	add	r0, r0, #0xb8
	ldr	r2, [r0]
	add	r7, r0, #0
	cmp	r2, #0
	beq	.L804BE38	@cond_branch
	ldr	r0, .L804BE68
	ldrh	r3, [r2, #0x14]
	and	r0, r0, r3
	ldr	r3, .L804BE68 + 4
	add	r1, r4, r3
	ldrb	r1, [r1]
	lsl	r1, r1, #0xc
	orr	r0, r0, r1
	strh	r0, [r2, #0x14]
	ldr	r0, [r7]
	cmp	r0, #0
	beq	.L804BE38	@cond_branch
	ldrh	r1, [r0, #0x22]
	add	r1, r1, #0x2
	mov	r2, #0xee
	lsl	r2, r2, #0x2
	add	r0, r4, r2
	strh	r1, [r0]
.L804BE38:
	mov	r3, #0xbf
	lsl	r3, r3, #0x2
	add	r0, r4, r3
	bl	renderActor2
	add	r0, r4, #0
	mov	r1, #0x4
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L804BE56	@cond_branch
	ldr	r0, [r6, #0xc]
	cmp	r0, #0
	bge	.L804BEA4	@cond_branch
.L804BE56:
	ldr	r0, [r6, #0xc]
	cmp	r0, #0
	blt	.L804BE70	@cond_branch
	mov	r1, #0xe0
	lsl	r1, r1, #0x1
	add	r0, r4, r1
	ldrb	r5, [r0]
	b	.L804BE72
.L804BE66:
	.align	2, 0
.L804BE68:
	.4byte	0xfff
	.4byte	0x3cf
.L804BE70:
	mov	r5, #0x3
.L804BE72:
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L804BE8A	@cond_branch
	ldr	r0, .L804BED8
	ldrh	r2, [r3, #0x14]
	and	r0, r0, r2
	mov	r2, #0x3
	add	r1, r5, #0
	and	r1, r1, r2
	lsl	r1, r1, #0xa
	orr	r0, r0, r1
	strh	r0, [r3, #0x14]
.L804BE8A:
	mov	r0, sl
	add	r0, r0, #0xb8
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L804BEA4	@cond_branch
	ldr	r0, .L804BED8
	ldrh	r3, [r2, #0x14]
	and	r0, r0, r3
	mov	r1, #0x3
	and	r5, r5, r1
	lsl	r1, r5, #0xa
	orr	r0, r0, r1
	strh	r0, [r2, #0x14]
.L804BEA4:
	mov	r1, #0xfa
	lsl	r1, r1, #0x2
	add	r0, r4, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L804BEC8	@cond_branch
	mov	r2, #0xfb
	lsl	r2, r2, #0x2
	add	r4, r4, r2
	ldr	r1, [r6, #0x4]
	ldr	r2, [r6, #0x8]
	ldr	r3, [r6, #0xc]
	add	r0, r4, #0
	bl	sub_804E560
	add	r0, r4, #0
	bl	sub_804EA88
.L804BEC8:
	add	sp, sp, #0xc
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L804BED8:
	.align	2, 0

	.4byte	0xf3ff
	thumb_func_end renderRider

.align 2, 0 @ Don't pad with nop.
