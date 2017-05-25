	.include "asm/common.inc"

	thumb_func_start sub_805E8A0
sub_805E8A0:
	push	{lr}
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	bl	sub_805E8D8
	pop	{r0}
	bx	r0
	thumb_func_end sub_805E8A0

.align 2, 0 @ Don't pad with nop.
