	.include "asm/common.inc"

	thumb_func_start sub_805F400
sub_805F400:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	add	r1, r4, #0
	add	r1, r1, #0x52
	mov	r0, #0x2
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L1	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x4d
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L2	@cond_branch
.L1:
	add	r0, r4, #0
	bl	sub_805F47C
.L2:
	add	r1, r4, #0
	add	r1, r1, #0x52
	ldrh	r2, [r1]
	mov	r0, #0x1
	and	r0, r0, r2
	add	r6, r1, #0
	cmp	r0, #0
	beq	.L6	@cond_branch
	add	r3, r4, #0
	add	r3, r3, #0x50
	ldrh	r5, [r3]
	mov	r0, #0x2
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L4	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x4d
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L5	@cond_branch
.L4:
	add	r0, r4, #0
	add	r0, r0, #0x4c
	mov	r1, #0x1
	ldrb	r2, [r0]
	EOR	r1, r2
	strb	r1, [r0]
	add	r1, r4, #0
	add	r1, r1, #0x4e
	ldrh	r0, [r1]
	strh	r0, [r3]
	strh	r5, [r1]
.L5:
	mov	r0, #0x2
	ldrh	r6, [r6]
	and	r0, r0, r6
	cmp	r0, #0
	beq	.L6	@cond_branch
	add	r1, r4, #0
	add	r1, r1, #0x4d
	mov	r0, #0x1
	ldrb	r2, [r1]
	EOR	r0, r2
	strb	r0, [r1]
.L6:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805F400

.align 2, 0 @ Don't pad with nop.
