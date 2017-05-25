	.include "asm/common.inc"

	thumb_func_start sub_8059FF8
sub_8059FF8:
	push	{r4, lr}
	ldr	r4, [sp, #0x8]
	str	r1, [r0]
	str	r2, [r0, #0x4]
	str	r3, [r0, #0x8]
	str	r4, [r0, #0xc]
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8059FF8

.align 2, 0 @ Don't pad with nop.
