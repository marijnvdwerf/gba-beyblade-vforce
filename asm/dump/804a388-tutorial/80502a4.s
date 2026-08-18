	.include "asm/common.inc"

	thumb_func_start sub_80502A4
sub_80502A4:
	push	{r4, r5, r6, r7, lr}
	add	r2, r0, #0
	ldr	r0, [r2]
	ldr	r1, [r2, #0x8]
	add	r7, r0, r1
	str	r7, [r2]
	ldr	r0, [r2, #0x10]
	add	r6, r1, r0
	str	r6, [r2, #0x8]
	ldr	r0, [r2, #0x4]
	ldr	r1, [r2, #0xc]
	add	r5, r0, r1
	str	r5, [r2, #0x4]
	ldr	r0, [r2, #0x14]
	add	r4, r1, r0
	str	r4, [r2, #0xc]
	ldrh	r3, [r2, #0x20]
	mov	r0, #0x3
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L8050326	@cond_branch
	mov	r0, #0x1
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L80502DC	@cond_branch
	add	r1, r7, #0
	add	r3, r6, #0
	b	.L80502E0
.L80502DC:
	add	r1, r5, #0
	add	r3, r4, #0
.L80502E0:
	ldr	r0, [r2, #0x18]
	sub	r4, r1, r0
	add	r1, r1, r3
	sub	r1, r1, r0
	add	r5, r0, #0
	cmp	r4, #0
	bgt	.L80502F6	@cond_branch
	cmp	r1, #0
	bgt	.L80502FA	@cond_branch
	cmp	r4, #0
	blt	.L8050326	@cond_branch
.L80502F6:
	cmp	r1, #0
	bge	.L8050326	@cond_branch
.L80502FA:
	ldrh	r1, [r2, #0x20]
	mov	r0, #0x4
	and	r0, r0, r1
	add	r4, r1, #0
	cmp	r0, #0
	beq	.L8050310	@cond_branch
	ldr	r0, [r2, #0x1c]
	mul	r0, r0, r3
	NEG	r0, r0
	asr	r3, r0, #0x8
	b	.L8050312
.L8050310:
	mov	r3, #0x0
.L8050312:
	add	r1, r5, #0
	mov	r0, #0x1
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L8050322	@cond_branch
	str	r1, [r2]
	str	r3, [r2, #0x8]
	b	.L8050326
.L8050322:
	str	r1, [r2, #0x4]
	str	r3, [r2, #0xc]
.L8050326:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80502A4

.align 2, 0 @ Don't pad with nop.
