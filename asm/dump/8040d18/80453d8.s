	.include "asm/common.inc"

	thumb_func_start sub_80453D8
sub_80453D8:
	push	{lr}
	cmp	r1, #0x1
	beq	.L1	@cond_branch
	cmp	r1, #0x1
	bcc	.L2	@cond_branch
	cmp	r1, #0x5
	beq	.L3	@cond_branch
	b	.L10
.L2:
	bl	sub_8049168
	b	.L10
.L1:
	add	r0, r0, #0xb8
	bl	sub_80439A0
	b	.L10
.L3:
	mov	r1, #0x8f
	lsl	r1, r1, #0x3
	add	r0, r0, r1
	bl	sub_805B240
	cmp	r0, #0
	beq	.L7	@cond_branch
	cmp	r0, #0x1
	beq	.L8	@cond_branch
	b	.L10
.L7:
	mov	r0, #0x16
	bl	sub_80490F8
	b	.L10
.L8:
	mov	r0, #0xa
	bl	sub_80490F8
.L10:
	pop	{r0}
	bx	r0
	thumb_func_end sub_80453D8

.align 2, 0 @ Don't pad with nop.
