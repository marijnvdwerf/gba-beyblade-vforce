	.include "asm/common.inc"

	thumb_func_start sub_804A320
sub_804A320:
	push	{lr}
	mov	r0, #0x0
	mov	r1, #0x3c
	bl	sub_804AE34
	pop	{r0}
	bx	r0
	thumb_func_end sub_804A320

.align 2, 0 @ Don't pad with nop.
