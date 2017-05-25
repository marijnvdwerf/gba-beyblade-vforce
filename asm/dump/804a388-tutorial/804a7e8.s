	.include "asm/common.inc"

	thumb_func_start sub_804A7E8
sub_804A7E8:
	push	{lr}
	add	r0, r0, #0x5e
	ldrb	r0, [r0]
	mov	r1, #0x0
	bl	ToggleLayerVisibility
	pop	{r0}
	bx	r0
	thumb_func_end sub_804A7E8

.align 2, 0 @ Don't pad with nop.
