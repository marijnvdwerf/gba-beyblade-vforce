	.include "asm/common.inc"

	thumb_func_start sub_804566C
sub_804566C:
	push	{lr}
	cmp	r1, #0
	beq	.L1	@cond_branch
	cmp	r1, #0x1
	beq	.L2	@cond_branch
	b	.L4
.L1:
	bl	sub_8048FE4
	b	.L4
.L2:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r0, r1
	bl	sub_80439A0
.L4:
	pop	{r0}
	bx	r0
	thumb_func_end sub_804566C

.align 2, 0 @ Don't pad with nop.
