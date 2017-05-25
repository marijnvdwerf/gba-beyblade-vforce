	.include "asm/common.inc"

	thumb_func_start sub_80508CC
sub_80508CC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffdc
	str	r0, [sp, #0xc]
	str	r1, [sp, #0x10]
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	str	r2, [sp, #0x14]
	ldr	r0, [r0, #0xc]
	str	r0, [sp, #0x18]
	ldr	r1, [sp, #0xc]
	ldrh	r6, [r1, #0x6]
	mov	r2, #0x0
	str	r2, [sp, #0x1c]
	mov	r5, #0x0
	ldrh	r1, [r1, #0x2]
	mov	r0, #0x4
	sub	r0, r0, r1
	cmp	r2, r0
	blt	.L1	@cond_branch
	b	.L23
.L1:
	ldr	r3, [sp, #0x10]
	add	r3, r3, #0x74
	mov	r9, r3
.L24:
	lsl	r0, r5, #0x1
	add	r0, r0, r5
	lsl	r0, r0, #0x3
	add	r0, r0, #0x14
	ldr	r4, [sp, #0x10]
	add	r3, r4, r0
	add	r1, r1, r5
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x3
	ldr	r1, [sp, #0x18]
	add	r1, r1, r0
	mov	ip, r1
	ldr	r0, [r3]
	add	r2, r5, #1
	str	r2, [sp, #0x20]
	cmp	r0, #0
	beq	.L7	@cond_branch
	mov	r1, #0x1
	ldrb	r0, [r0, #0x18]
	and	r1, r1, r0
	NEG	r0, r1
	orr	r0, r0, r1
	asr	r2, r0, #0x1f
	mov	r0, #0x2
	and	r2, r2, r0
	add	r0, r6, #0
	ASR	r0, r2
	mov	r4, #0x1
	b	.L4
.L5:
	add	r0, r2, #1
	lsl	r0, r0, #0x10
	lsr	r2, r0, #0x10
	add	r0, r6, #0
	ASR	r0, r2
.L4:
	and	r0, r0, r4
	cmp	r0, #0
	bne	.L5	@cond_branch
	cmp	r2, #0x3
	bls	.L6	@cond_branch
	ldr	r0, .L8
	bl	printf
	b	.L7
.L9:
	.align	2, 0
.L8:
	.4byte	0x872934c
.L6:
	mov	r0, #0x1
	LSL	r0, r2
	orr	r6, r6, r0
	lsl	r0, r6, #0x10
	lsr	r6, r0, #0x10
	lsl	r0, r2, #0x18
	lsr	r4, r0, #0x18
	ldr	r2, [r3]
	mov	r7, #0x40
	mov	sl, r0
	cmp	r1, #0
	beq	.L10	@cond_branch
	ldr	r7, .L15
.L10:
	ldr	r0, [r3, #0xc]
	mov	r1, #0x1
	orr	r0, r0, r1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp]
	ldr	r0, [r3, #0x4]
	NEG	r0, r0
	asr	r0, r0, #0x8
	str	r0, [sp, #0x4]
	ldr	r0, [r3, #0x8]
	NEG	r0, r0
	asr	r0, r0, #0x8
	str	r0, [sp, #0x8]
	mov	r0, ip
	add	r1, r4, #0
	add	r3, r7, #0
	bl	sub_8058968
	cmp	r5, #0x1
	beq	.L11	@cond_branch
	cmp	r5, #0x1
	bgt	.L12	@cond_branch
	cmp	r5, #0
	beq	.L13	@cond_branch
	b	.L22
.L16:
	.align	2, 0
.L15:
	.4byte	0x4040
.L12:
	cmp	r5, #0x2
	beq	.L17	@cond_branch
	cmp	r5, #0x3
	beq	.L18	@cond_branch
	b	.L22
.L13:
	mov	r2, r9
	ldrb	r2, [r2]
	lsl	r0, r2, #0x1e
	b	.L21
.L11:
	mov	r3, r9
	ldrb	r3, [r3]
	lsl	r0, r3, #0x1c
	b	.L21
.L17:
	mov	r4, r9
	ldrb	r4, [r4]
	lsl	r0, r4, #0x1a
.L21:
	lsr	r0, r0, #0x1e
	mov	r8, r0
	b	.L22
.L18:
	mov	r0, r9
	ldrb	r1, [r0]
	lsr	r1, r1, #0x6
	mov	r8, r1
.L22:
	mov	r2, sl
	lsr	r0, r2, #0x18
	bl	GetBGLayerCntPtr
	mov	r1, #0x3
	mov	r2, r8
	and	r2, r2, r1
	mov	r3, #0x4
	NEG	r3, r3
	add	r1, r3, #0
	ldrb	r4, [r0]
	and	r1, r1, r4
	orr	r1, r1, r2
	strb	r1, [r0]
	ldr	r0, [sp, #0x1c]
	add	r0, r0, #0x1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x1c]
.L7:
	ldr	r5, [sp, #0x20]
	ldr	r0, [sp, #0xc]
	ldrh	r1, [r0, #0x2]
	mov	r0, #0x4
	sub	r0, r0, r1
	cmp	r5, r0
	bge	.L23	@cond_branch
	b	.L24
.L23:
	mov	r0, #0x80
	lsl	r0, r0, #0x13
	lsl	r1, r6, #0x8
	ldrh	r2, [r0]
	orr	r1, r1, r2
	strh	r1, [r0]
	mov	r1, sp
	ldrh	r2, [r1, #0x1c]
	ldr	r1, [sp, #0xc]
	strh	r2, [r1, #0x4]
	ldr	r3, [sp, #0x10]
	ldr	r0, [r3, #0x78]
	cmp	r0, #0
	beq	.L26	@cond_branch
	ldr	r4, [sp, #0x14]
	cmp	r4, #0
	beq	.L26	@cond_branch
	bl	loadPalette
.L26:
	add	sp, sp, #0x24
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80508CC

.align 2, 0 @ Don't pad with nop.
