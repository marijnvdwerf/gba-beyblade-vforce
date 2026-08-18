	.include "asm/common.inc"

	thumb_func_start sub_804566C
sub_804566C:
	push	{lr}
	cmp	r1, #0
	beq	.L8045678	@cond_branch
	cmp	r1, #0x1
	beq	.L804567E	@cond_branch
	b	.L8045688
.L8045678:
	bl	sub_8048FE4
	b	.L8045688
.L804567E:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r0, r1
	bl	sub_80439A0
.L8045688:
	pop	{r0}
	bx	r0
	thumb_func_end sub_804566C

.align 2, 0 @ Don't pad with nop.
