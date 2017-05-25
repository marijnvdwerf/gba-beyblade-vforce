	.include "asm/common.inc"

	thumb_func_start sub_8067A14
sub_8067A14:
	push	{r4, lr}
	NEG	r2, r0
	add	r3, r2, #0
	NEG	r1, r1
	cmp	r2, #0
	beq	.L1	@cond_branch
	sub	r1, r1, #0x1
.L1:
	add	r4, r1, #0
	add	r1, r4, #0
	add	r0, r3, #0
	pop	{r4, pc}
	thumb_func_end sub_8067A14

.align 2, 0 @ Don't pad with nop.
