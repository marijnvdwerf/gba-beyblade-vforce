	.include "asm/common.inc"

	thumb_func_start sub_805FFE4
sub_805FFE4:
	push	{r4, r5, r6, lr}
	ldr	r0, .L5
	ldr	r3, [r0]
	ldr	r5, [r3, #0x14]
	mov	r2, #0x1
	add	r0, r5, #0
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L1	@cond_branch
	ldr	r4, .L5 + 4
	ldrh	r1, [r4]
	mov	r6, #0x8
	add	r0, r6, #0
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L2	@cond_branch
	ldrh	r1, [r4]
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L3	@cond_branch
.L2:
	mov	r0, #0x0
	b	.L4
.L6:
	.align	2, 0
.L5:
	.4byte	0x3005dc4
	.4byte	0x4000128
.L3:
	orr	r2, r2, r5
	str	r2, [r3, #0x14]
	ldrh	r1, [r4]
	mov	r0, #0x4
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L7	@cond_branch
	orr	r2, r2, r6
	b	.L8
.L7:
	mov	r0, #0x10
	orr	r2, r2, r0
.L8:
	str	r2, [r3, #0x14]
.L1:
	mov	r0, #0x1
.L4:
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805FFE4

.align 2, 0 @ Don't pad with nop.
