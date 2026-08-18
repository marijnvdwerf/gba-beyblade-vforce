	.include "asm/common.inc"

	thumb_func_start sub_8045638
sub_8045638:
	push	{lr}
	cmp	r1, #0x1
	beq	.L804564E	@cond_branch
	cmp	r1, #0x1
	bcc	.L8045648	@cond_branch
	cmp	r1, #0x8
	beq	.L804565A	@cond_branch
	b	.L8045666
.L8045648:
	bl	sub_8049168
	b	.L8045666
.L804564E:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r0, r1
	bl	sub_80439A0
	b	.L8045666
.L804565A:
	cmp	r2, #0x24
	bne	.L8045666	@cond_branch
	bl	sub_8049258
	bl	sub_80490F8
.L8045666:
	pop	{r0}
	bx	r0
	thumb_func_end sub_8045638

.align 2, 0 @ Don't pad with nop.
