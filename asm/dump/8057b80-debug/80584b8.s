	.include "asm/common.inc"

	thumb_func_start sub_80584B8
sub_80584B8:
	push	{r4, r5, r6, r7, lr}
	add	r4, r0, #0
	bl	sub_8058838
	add	r5, r4, #0
	add	r5, r5, #0x80
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L80584E6	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x84
	ldr	r0, [r0]
	cmp	r0, #0
	blt	.L80584DA	@cond_branch
	add	r0, r4, #0
	bl	sub_805D650
.L80584DA:
	ldr	r0, [r5]
	ldr	r2, [r4, #0x40]
	ldr	r3, [r4, #0x44]
	ldr	r7, [r4, #0x48]
	cmp	r0, #0
	bne	.L805850C	@cond_branch
.L80584E6:
	add	r0, r4, #0
	add	r0, r0, #0x84
	ldr	r1, [r0]
	mov	r0, #0x1
	neg	r0, r0
	ldr	r2, [r4, #0x40]
	ldr	r3, [r4, #0x44]
	ldr	r7, [r4, #0x48]
	cmp	r1, r0
	bne	.L805850C	@cond_branch
	ldr	r0, [r4, #0x4]
	add	r0, r0, r2
	str	r0, [r4, #0x4]
	ldr	r0, [r4, #0x8]
	add	r0, r0, r3
	str	r0, [r4, #0x8]
	ldr	r0, [r4, #0xc]
	add	r0, r0, r7
	str	r0, [r4, #0xc]
.L805850C:
	ldr	r0, [r4, #0x4c]
	add	r6, r2, r0
	str	r6, [r4, #0x40]
	ldr	r0, [r4, #0x50]
	add	r5, r3, r0
	str	r5, [r4, #0x44]
	ldr	r0, [r4, #0x54]
	add	r3, r7, r0
	str	r3, [r4, #0x48]
	ldr	r2, [r4, #0x68]
	cmp	r2, #0
	beq	.L8058588	@cond_branch
	add	r1, r6, #0
	mul	r1, r1, r2
	asr	r1, r1, #0x8
	add	r0, r5, #0
	mul	r0, r0, r2
	asr	r7, r0, #0x8
	add	r0, r3, #0
	mul	r0, r0, r2
	asr	r0, r0, #0x8
	mov	ip, r0
	sub	r2, r6, r1
	str	r2, [r4, #0x40]
	sub	r0, r5, r7
	str	r0, [r4, #0x44]
	mov	r5, ip
	sub	r0, r3, r5
	str	r0, [r4, #0x48]
	cmp	r1, #0
	bne	.L805855A	@cond_branch
	cmp	r2, #0
	beq	.L805855A	@cond_branch
	cmp	r2, #0
	ble	.L8058556	@cond_branch
	sub	r0, r2, #1
	b	.L8058558
.L8058556:
	add	r0, r2, #1
.L8058558:
	str	r0, [r4, #0x40]
.L805855A:
	cmp	r7, #0
	bne	.L8058570	@cond_branch
	ldr	r0, [r4, #0x44]
	cmp	r0, #0
	beq	.L8058570	@cond_branch
	cmp	r0, #0
	ble	.L805856C	@cond_branch
	sub	r0, r0, #0x1
	b	.L805856E
.L805856C:
	add	r0, r0, #0x1
.L805856E:
	str	r0, [r4, #0x44]
.L8058570:
	mov	r0, ip
	cmp	r0, #0
	bne	.L8058588	@cond_branch
	ldr	r0, [r4, #0x48]
	cmp	r0, #0
	beq	.L8058588	@cond_branch
	cmp	r0, #0
	ble	.L8058584	@cond_branch
	sub	r0, r0, #0x1
	b	.L8058586
.L8058584:
	add	r0, r0, #0x1
.L8058586:
	str	r0, [r4, #0x48]
.L8058588:
	ldr	r2, [r4, #0x70]
	cmp	r2, #0
	ble	.L80585A2	@cond_branch
	ldr	r0, .L80585C4
	ldr	r1, [r0]
	ldr	r0, [r0, #0x4]
	sub	r1, r1, r0
	sub	r1, r2, r1
	str	r1, [r4, #0x70]
	cmp	r1, #0
	bge	.L80585A2	@cond_branch
	mov	r0, #0x0
	str	r0, [r4, #0x70]
.L80585A2:
	ldr	r0, [r4, #0x6c]
	cmp	r0, #0
	bne	.L80585BC	@cond_branch
	add	r1, r4, #0
	add	r1, r1, #0x98
	mov	r0, #0x1
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L80585BC	@cond_branch
	add	r0, r4, #0
	bl	actor_8058638
.L80585BC:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L80585C2:
	.align	2, 0
.L80585C4:
	.4byte	_unk3000E30
	thumb_func_end sub_80584B8

.align 2, 0 @ Don't pad with nop.
