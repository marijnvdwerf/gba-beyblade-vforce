	.include "asm/common.inc"

	thumb_func_start sub_8064F50
sub_8064F50:
	push	{r4, r5, lr}
	add	r1, r0, #0
	mov	r5, #0x0
	mov	r4, #0x3
	cmp	r1, #0
	bne	.L4	@cond_branch
	mov	r0, #0x1
	b	.L2
.L4:
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	bne	.L3	@cond_branch
	mov	r4, #0x3
	add	r5, r5, #0x1
.L3:
	add	r5, r5, #0x1
	add	r0, r1, #0
	mov	r1, #0xa
	bl	Div
	add	r1, r0, #0
	cmp	r1, #0
	bne	.L4	@cond_branch
	add	r0, r5, #0
.L2:
	pop	{r4, r5}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8064F50

.align 2, 0 @ Don't pad with nop.
