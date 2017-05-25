	.include "asm/common.inc"

	thumb_func_start sub_8045638
sub_8045638:
	push	{lr}
	cmp	r1, #0x1
	beq	.L1	@cond_branch
	cmp	r1, #0x1
	bcc	.L2	@cond_branch
	cmp	r1, #0x8
	beq	.L3	@cond_branch
	b	.L7
.L2:
	bl	sub_8049168
	b	.L7
.L1:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r0, r1
	bl	sub_80439A0
	b	.L7
.L3:
	cmp	r2, #0x24
	bne	.L7	@cond_branch
	bl	sub_8049258
	bl	sub_80490F8
.L7:
	pop	{r0}
	bx	r0
	thumb_func_end sub_8045638

.align 2, 0 @ Don't pad with nop.
