	.include "asm/common.inc"

	thumb_func_start sub_8061228
sub_8061228:
	push	{r4, lr}
	add	r4, r0, #0
	add	r0, r0, #0x14
	bl	sub_8060CDC
	mov	r0, #0x0
	strh	r0, [r4, #0xa]
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8061228

.align 2, 0 @ Don't pad with nop.
