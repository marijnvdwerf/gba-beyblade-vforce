	.include "asm/common.inc"

	thumb_func_start sub_8062E54
sub_8062E54:
	push	{lr}
	bl	sub_8062A50
	cmp	r0, #0
	beq	_2	@cond_branch
	ldrb	r0, [r0, #0x16]
	cmp	r0, #0
	beq	_2	@cond_branch
	mov	r0, #0x1
	b	_3
_2:
	mov	r0, #0x0
_3:
	pop	{r1}
	bx	r1
	thumb_func_end sub_8062E54

.align 2, 0 @ Don't pad with nop.
