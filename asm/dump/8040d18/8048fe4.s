	.include "asm/common.inc"

	thumb_func_start sub_8048FE4
sub_8048FE4:
	push	{lr}
	bl	sub_804AF5C
	bl	sub_804AE8C
	mov	r0, #0x1
	NEG	r0, r0
	bl	sub_80490F8
	pop	{r0}
	bx	r0
	thumb_func_end sub_8048FE4

.align 2, 0 @ Don't pad with nop.
