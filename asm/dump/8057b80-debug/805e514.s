	.include "asm/common.inc"

	thumb_func_start sub_805E514
sub_805E514:
	push	{r4, lr}
	ldr	r4, [sp, #0x8]
	str	r1, [r0]
	str	r2, [r0, #0x4]
	str	r4, [r0, #0xc]
	str	r3, [r0, #0x8]
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805E514

.align 2, 0 @ Don't pad with nop.
