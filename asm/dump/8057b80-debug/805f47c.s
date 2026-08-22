	.include "asm/common.inc"

	thumb_func_start sub_805F47C
sub_805F47C:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	mov	r1, #0x28
	ldsh	r0, [r4, r1]
	lsl	r0, r0, #0x3
	ldr	r1, [r4, #0x24]
	add	r6, r1, r0
	mov	r2, #0x3a
	ldsh	r1, [r4, r2]
	add	r0, r4, #0
	add	r0, r0, #0x44
	mov	r3, #0x0
	ldsh	r0, [r0, r3]
	add	r1, r1, r0
	ldr	r2, [r4]
	ldrh	r0, [r2, #0x1a]
	cmp	r0, #0
	bne	.L805F4A2	@cond_branch
	b	.L805F720
.L805F4A2:
	ldrh	r0, [r2, #0x18]
	cmp	r0, #0
	bne	.L805F4AA	@cond_branch
	b	.L805F720
.L805F4AA:
	ldrh	r0, [r4, #0x3c]
	strh	r0, [r4, #0x3e]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bne	.L805F4D6	@cond_branch
	mov	r0, #0x8
	ldrh	r2, [r4, #0x32]
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L805F4D6	@cond_branch
	mov	r3, #0x28
	ldsh	r0, [r4, r3]
	cmp	r0, #0
	blt	.L805F4D6	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x42
	ldrh	r2, [r0]
	add	r0, r4, #0
	add	r1, r2, #0
	bl	sub_805F784
	b	.L805F720
.L805F4D6:
	add	r2, r4, #0
	add	r2, r2, #0x40
	cmp	r1, #0
	ble	.L805F4E6	@cond_branch
	asr	r0, r1, #0x1
	ldrh	r1, [r2]
	add	r0, r1, r0
	strh	r0, [r2]
.L805F4E6:
	ldrh	r1, [r4, #0x32]
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805F550	@cond_branch
	mov	r0, #0x21
	neg	r0, r0
	and	r0, r0, r1
	strh	r0, [r4, #0x32]
	ldrh	r1, [r4, #0x38]
	mov	r3, #0x38
	ldsh	r0, [r4, r3]
	cmp	r0, #0
	bge	.L805F510	@cond_branch
	neg	r0, r1
	ldr	r3, .L805F50C
	add	r1, r3, #0
	b	.L805F512
.L805F50A:
	.align	2, 0
.L805F50C:
	.4byte	0x3ff
.L805F510:
	ldr	r0, .L805F530
.L805F512:
	and	r0, r0, r1
	strh	r0, [r2]
	add	r0, r4, #0
	add	r0, r0, #0x58
	mov	r3, #0x0
	ldsh	r1, [r0, r3]
	add	r3, r0, #0
	cmp	r1, #0
	blt	.L805F534	@cond_branch
	mov	r1, #0x38
	ldsh	r0, [r4, r1]
	ldrh	r1, [r4, #0x38]
	cmp	r0, #0
	blt	.L805F546	@cond_branch
	b	.L805F54E
.L805F530:
	.align	2, 0

	.4byte	0x3ff
.L805F534:
	mov	r1, #0x38
	ldsh	r0, [r4, r1]
	ldrh	r1, [r4, #0x38]
	cmp	r0, #0
	blt	.L805F54E	@cond_branch
	ldrh	r0, [r4, #0x2a]
	strh	r0, [r4, #0x2e]
	add	r0, r0, #0x1
	b	.L805F54C
.L805F546:
	ldrh	r0, [r4, #0x2a]
	strh	r0, [r4, #0x2e]
	add	r0, r0, #0x2
.L805F54C:
	strh	r0, [r4, #0x2c]
.L805F54E:
	strh	r1, [r3]
.L805F550:
	ldrh	r3, [r2]
	mov	r0, #0x0
	ldsh	r1, [r2, r0]
	ldr	r0, .L805F59C
	cmp	r1, r0
	bgt	.L805F55E	@cond_branch
	b	.L805F720
.L805F55E:
	ldr	r1, .L805F59C + 4
	add	r0, r3, r1
	mov	r1, #0x0
	strh	r0, [r2]
	ldrh	r0, [r4, #0x2c]
	strh	r0, [r4, #0x2e]
	mov	r0, #0x4
	ldrh	r3, [r4, #0x32]
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L805F588	@cond_branch
	strh	r1, [r4, #0x3a]
	strh	r1, [r4, #0x38]
	add	r0, r4, #0
	add	r0, r0, #0x58
	strh	r1, [r0]
	strh	r1, [r2]
	mov	r0, #0x10
	ldrh	r1, [r4, #0x32]
	orr	r0, r0, r1
	strh	r0, [r4, #0x32]
.L805F588:
	ldrh	r1, [r4, #0x32]
	mov	r0, #0x2
	and	r0, r0, r1
	add	r2, r1, #0
	cmp	r0, #0
	beq	.L805F5A4	@cond_branch
	ldrh	r0, [r4, #0x2c]
	sub	r0, r0, #0x1
	b	.L805F5A8
.L805F59A:
	.align	2, 0
.L805F59C:
	.4byte	0x3ff
	.4byte	0xfffffc00
.L805F5A4:
	ldrh	r0, [r4, #0x2c]
	add	r0, r0, #0x1
.L805F5A8:
	strh	r0, [r4, #0x2c]
	mov	r3, #0x2c
	ldsh	r0, [r4, r3]
	mov	r3, #0x2a
	ldsh	r1, [r4, r3]
	sub	r0, r0, r1
	ldrh	r1, [r6, #0x2]
	cmp	r0, r1
	blt	.L805F672	@cond_branch
	mov	r0, #0x8
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L805F5DC	@cond_branch
	mov	r0, #0x0
	strh	r0, [r4, #0x3a]
	ldrh	r2, [r4, #0x2a]
	ldrh	r3, [r6, #0x2]
	add	r0, r2, r3
	sub	r0, r0, #0x1
	strh	r0, [r4, #0x2c]
	mov	r0, #0x2c
	ldsh	r1, [r4, r0]
	add	r0, r4, #0
	bl	sub_805F3A8
	b	.L805F5F8
.L805F5DC:
	mov	r0, #0x1
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L805F5F4	@cond_branch
	mov	r0, #0x2
	eor	r0, r2
	strh	r0, [r4, #0x32]
	ldrh	r1, [r4, #0x2a]
	ldrh	r2, [r6, #0x2]
	add	r0, r1, r2
	sub	r0, r0, #0x2
	b	.L805F5F6
.L805F5F4:
	ldrh	r0, [r4, #0x2a]
.L805F5F6:
	strh	r0, [r4, #0x2c]
.L805F5F8:
	ldrh	r1, [r4, #0x3c]
	mov	r3, #0x3c
	ldsh	r0, [r4, r3]
	cmp	r0, #0
	beq	.L805F63C	@cond_branch
	sub	r2, r1, #1
	strh	r2, [r4, #0x3c]
	lsl	r0, r2, #0x10
	asr	r0, r0, #0x10
	ldr	r1, .L805F6A0
	cmp	r0, r1
	bge	.L805F618	@cond_branch
	ldr	r1, .L805F6A0 + 4
	add	r0, r1, #0
	orr	r2, r2, r0
	strh	r2, [r4, #0x3c]
.L805F618:
	mov	r2, #0x3c
	ldsh	r0, [r4, r2]
	cmp	r0, #0
	beq	.L805F63C	@cond_branch
	ldr	r5, [r4, #0x6c]
	cmp	r5, #0
	beq	.L805F634	@cond_branch
	ldr	r1, [r4, #0x70]
	mov	r3, #0x28
	ldsh	r2, [r4, r3]
	add	r0, r4, #0
	mov	r3, #0x2
	bl	_call_via_r5
.L805F634:
	mov	r1, #0x3c
	ldsh	r0, [r4, r1]
	cmp	r0, #0
	bne	.L805F672	@cond_branch
.L805F63C:
	mov	r0, #0x8
	ldrh	r2, [r4, #0x32]
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L805F672	@cond_branch
	mov	r0, #0x1
	ldr	r5, [r4, #0x6c]
	cmp	r5, #0
	beq	.L805F660	@cond_branch
	ldr	r1, [r4, #0x70]
	mov	r3, #0x28
	ldsh	r2, [r4, r3]
	add	r0, r4, #0
	mov	r3, #0x1
	bl	_call_via_r5
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
.L805F660:
	cmp	r0, #0
	beq	.L805F672	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x42
	ldrh	r2, [r0]
	add	r0, r4, #0
	add	r1, r2, #0
	bl	sub_805F784
.L805F672:
	mov	r0, #0x2c
	ldsh	r1, [r4, r0]
	ldrh	r2, [r4, #0x2a]
	mov	r3, #0x2a
	ldsh	r0, [r4, r3]
	cmp	r1, r0
	bge	.L805F720	@cond_branch
	ldrh	r1, [r4, #0x32]
	mov	r0, #0x8
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805F6A8	@cond_branch
	mov	r0, #0x0
	strh	r0, [r4, #0x3a]
	mov	r0, #0x2c
	ldsh	r1, [r4, r0]
	add	r0, r4, #0
	bl	sub_805F3A8
	ldrh	r1, [r4, #0x2a]
	ldrh	r6, [r6, #0x2]
	add	r0, r1, r6
	b	.L805F6BE
.L805F6A0:
	.align	2, 0

	.4byte	0xfffff448
	.4byte	0xffff
.L805F6A8:
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805F6BA	@cond_branch
	mov	r0, #0x2
	eor	r0, r1
	strh	r0, [r4, #0x32]
	add	r0, r2, #1
	b	.L805F6C0
.L805F6BA:
	ldrh	r6, [r6, #0x2]
	add	r0, r6, r2
.L805F6BE:
	sub	r0, r0, #0x1
.L805F6C0:
	strh	r0, [r4, #0x2c]
	ldrh	r1, [r4, #0x3c]
	mov	r2, #0x3c
	ldsh	r0, [r4, r2]
	cmp	r0, #0
	beq	.L805F6EA	@cond_branch
	sub	r2, r1, #1
	strh	r2, [r4, #0x3c]
	lsl	r0, r2, #0x10
	asr	r0, r0, #0x10
	ldr	r1, .L805F728
	cmp	r0, r1
	bge	.L805F6E2	@cond_branch
	ldr	r3, .L805F728 + 4
	add	r0, r3, #0
	orr	r2, r2, r0
	strh	r2, [r4, #0x3c]
.L805F6E2:
	mov	r1, #0x3c
	ldsh	r0, [r4, r1]
	cmp	r0, #0
	bne	.L805F720	@cond_branch
.L805F6EA:
	mov	r0, #0x8
	ldrh	r2, [r4, #0x32]
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L805F720	@cond_branch
	mov	r0, #0x1
	ldr	r5, [r4, #0x6c]
	cmp	r5, #0
	beq	.L805F70E	@cond_branch
	ldr	r1, [r4, #0x70]
	mov	r3, #0x28
	ldsh	r2, [r4, r3]
	add	r0, r4, #0
	mov	r3, #0x1
	bl	_call_via_r5
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
.L805F70E:
	cmp	r0, #0
	beq	.L805F720	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x42
	ldrh	r2, [r0]
	add	r0, r4, #0
	add	r1, r2, #0
	bl	sub_805F784
.L805F720:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L805F726:
	.align	2, 0
.L805F728:
	.4byte	0xfffff448
	.4byte	0xffff
	thumb_func_end sub_805F47C

.align 2, 0 @ Don't pad with nop.
