	.include "asm/common.inc"

	thumb_func_start sub_8065334
sub_8065334:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r4, r0, #0
	mov	r7, #0x0
	mov	r3, #0x0
	mov	r5, #0x0
	ldrb	r0, [r4, #0x4]
	cmp	r3, r0
	bcs	.L806539A	@cond_branch
	ldr	r1, [r4, #0x10]
	mov	r8, r1
	mov	ip, r0
.L806534E:
	mov	r0, #0xc4
	add	r1, r5, #0
	mul	r1, r1, r0
	ldr	r0, [r4]
	add	r2, r0, r1
	mov	r6, r8
	cmp	r6, #0
	beq	.L8065370	@cond_branch
	add	r0, r5, r7
	ADD r0, r8
	ldrb	r0, [r0]
	cmp	r0, #0x20
	bne	.L8065370	@cond_branch
	add	r3, r3, #0x5
	add	r0, r7, #1
	lsl	r0, r0, #0x10
	lsr	r7, r0, #0x10
.L8065370:
	ldr	r0, [r2, #0x70]
	cmp	r0, #0
	beq	.L8065390	@cond_branch
	ldr	r1, [r4, #0x28]
	cmp	r1, #0
	beq	.L806538C	@cond_branch
	mov	r6, #0x22
	ldsh	r0, [r2, r6]
	add	r0, r1, r0
	ldrb	r2, [r2, #0x10]
	ldrb	r0, [r0]
	sub	r0, r2, r0
	add	r3, r3, r0
	b	.L8065390
.L806538C:
	ldrb	r2, [r2, #0x10]
	add	r3, r2, r3
.L8065390:
	add	r0, r5, #1
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	cmp	r5, ip
	bcc	.L806534E	@cond_branch
.L806539A:
	mov	r1, #0x24
	ldsh	r0, [r4, r1]
	mul	r0, r0, r3
	asr	r3, r0, #0x8
	add	r0, r3, #0
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8065334

.align 2, 0 @ Don't pad with nop.
