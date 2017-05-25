	.include "asm/common.inc"

	thumb_func_start sub_8051804
sub_8051804:
	push	{lr}
	bl	sub_8051720
	mov	r1, #0x4
	ldrh	r0, [r0]
	and	r1, r1, r0
	cmp	r1, #0
	bne	.L1	@cond_branch
	mov	r0, #0x0
	b	.L2
.L1:
	mov	r0, #0x1
.L2:
	pop	{r1}
	bx	r1
	thumb_func_end sub_8051804

.align 2, 0 @ Don't pad with nop.
