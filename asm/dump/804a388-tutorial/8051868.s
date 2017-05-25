	.include "asm/common.inc"

	thumb_func_start sub_8051868
sub_8051868:
	push	{lr}
	bl	sub_8051820
	bl	sub_805749C
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	pop	{r1}
	bx	r1
	thumb_func_end sub_8051868

.align 2, 0 @ Don't pad with nop.
