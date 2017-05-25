	.include "asm/common.inc"

	thumb_func_start sub_8051618
sub_8051618:
	push	{lr}
	bl	sub_805137C
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r0, #0x0
	b	.L2
.L1:
	mov	r0, #0x1
.L2:
	pop	{r1}
	bx	r1
	thumb_func_end sub_8051618

.align 2, 0 @ Don't pad with nop.
