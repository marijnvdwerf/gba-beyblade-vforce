	.include "asm/common.inc"

	thumb_func_start sub_8063D38
sub_8063D38:
	push	{r4, r5, r6, r7, lr}
	add	r6, r1, #0
	mov	r4, #0x0
	mov	r7, #0x0
	mov	r1, #0x0
	mov	r5, #0x0
	add	r3, r0, #1
	ldrb	r0, [r3]
	cmp	r0, #0x2f
	bne	.L8063D52	@cond_branch
	mov	r4, #0x80
	lsl	r4, r4, #0x18
	add	r3, r3, #0x1
.L8063D52:
	ldrb	r2, [r3]
	add	r0, r2, #0
	sub	r0, r0, #0x30
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x9
	bls	.L8063D98	@cond_branch
	cmp	r2, #0x7d
	beq	.L8063D98	@cond_branch
	cmp	r2, #0
	beq	.L8063D98	@cond_branch
	lsl	r7, r2, #0x18
	add	r3, r3, #0x1
	b	.L8063D98
.L8063D6E:
	ldrb	r2, [r3]
	add	r3, r3, #0x1
	cmp	r2, #0x7d
	beq	.L8063D9C	@cond_branch
	add	r0, r2, #0
	sub	r0, r0, #0x30
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x9
	bhi	.L8063D90	@cond_branch
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r1, r0, #0x1
	add	r0, r1, #0
	sub	r0, r0, #0x30
	add	r1, r0, r2
	b	.L8063D98
.L8063D90:
	cmp	r2, #0x2d
	bne	.L8063D98	@cond_branch
	mov	r4, #0x80
	lsl	r4, r4, #0x18
.L8063D98:
	cmp	r5, #0
	beq	.L8063D6E	@cond_branch
.L8063D9C:
	orr	r4, r4, r7
	orr	r4, r4, r1
	str	r4, [r6]
	add	r0, r3, #0
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8063D38

.align 2, 0 @ Don't pad with nop.
