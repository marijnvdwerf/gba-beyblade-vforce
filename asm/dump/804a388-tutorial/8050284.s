	.include "asm/common.inc"

	thumb_func_start sub_8050284
sub_8050284:
	push	{r4, r5, lr}
	mov	r5, #0x0
	str	r5, [r0, #0x18]
	mov	r4, #0x80
	str	r4, [r0, #0x1c]
	str	r5, [r0, #0xc]
	str	r5, [r0, #0x8]
	str	r5, [r0, #0x14]
	str	r5, [r0, #0x10]
	str	r1, [r0]
	str	r2, [r0, #0x4]
	strh	r3, [r0, #0x20]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8050284

.align 2, 0 @ Don't pad with nop.
