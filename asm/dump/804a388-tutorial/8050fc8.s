	.include "asm/common.inc"

	thumb_func_start sub_8050FC8
sub_8050FC8:
	push	{r4, lr}
	add	r4, r0, #0
	mov	r1, #0x8c
	lsl	r1, r1, #0x9
	bl	sub_8050FE8
	mov	r0, #0x9
	bl	sub_804ABFC
	add	r4, r4, #0x40
	add	r0, r4, #0
	bl	sub_8061228
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8050FC8

.align 2, 0 @ Don't pad with nop.
