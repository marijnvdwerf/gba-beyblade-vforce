	.include "asm/common.inc"

	thumb_func_start sub_8043960
sub_8043960:
	push	{r4, lr}
	add	r4, r0, #0
	bl	sub_804393C
	strb	r0, [r4, #0x3]
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8043960

.align 2, 0 @ Don't pad with nop.
