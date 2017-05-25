	.include "asm/common.inc"

	thumb_func_start sub_804E3B0
sub_804E3B0:
	push	{r4, r5, lr}
	sub	r3, r1, r0
	add	r5, r3, #0
	cmp	r3, #0
	bge	.L1	@cond_branch
	NEG	r3, r3
.L1:
	add	r0, r2, #1
	lsr	r1, r0, #0x1
	add	r4, r0, #0
	cmp	r3, r1
	bls	.L2	@cond_branch
	sub	r0, r3, #1
	sub	r2, r2, r0
	b	.L3
.L2:
	add	r2, r3, #0
.L3:
	cmp	r5, #0
	blt	.L4	@cond_branch
	lsr	r0, r4, #0x1
	cmp	r3, r0
	bls	.L5	@cond_branch
.L4:
	NEG	r2, r2
.L5:
	add	r0, r2, #0
	pop	{r4, r5}
	pop	{r1}
	bx	r1
	thumb_func_end sub_804E3B0

.align 2, 0 @ Don't pad with nop.
