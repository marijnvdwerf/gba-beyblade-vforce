	.include "asm/common.inc"

	thumb_func_start sub_8062A90
sub_8062A90:
	push	{lr}
	bl	sub_8062A50
	add	r1, r0, #0
	cmp	r1, #0
	beq	_1	@cond_branch
	mov	r0, #0x0
	strb	r0, [r1, #0x16]
_1:
	pop	{r0}
	bx	r0
	thumb_func_end sub_8062A90

.align 2, 0 @ Don't pad with nop.
