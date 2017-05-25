	.include "asm/common.inc"

	thumb_func_start sub_8062AB8
sub_8062AB8:
	push	{lr}
	bl	sub_8062A50
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L2	@cond_branch
	ldrb	r0, [r1, #0x16]
	cmp	r0, #0x2
	bne	.L2	@cond_branch
	mov	r0, #0x1
	strb	r0, [r1, #0x16]
.L2:
	pop	{r0}
	bx	r0
	thumb_func_end sub_8062AB8

.align 2, 0 @ Don't pad with nop.
