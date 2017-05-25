	.include "asm/common.inc"

	thumb_func_start sub_804E560
sub_804E560:
	push	{r4, lr}
	ldr	r4, [r0, #0x10]
	str	r4, [r0, #0x24]
	ldr	r4, [r0, #0x14]
	str	r4, [r0, #0x28]
	ldr	r4, [r0, #0x18]
	str	r4, [r0, #0x2c]
	str	r1, [r0, #0x10]
	str	r2, [r0, #0x14]
	str	r3, [r0, #0x18]
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804E560

.align 2, 0 @ Don't pad with nop.
