	.include "asm/common.inc"

	thumb_func_start sub_8055C4C
sub_8055C4C:
	mov	r1, #0x0
	str	r1, [r0]
	str	r1, [r0, #0x4]
	str	r1, [r0, #0x8]
	str	r1, [r0, #0xc]
	bx	lr
	thumb_func_end sub_8055C4C

.align 2, 0 @ Don't pad with nop.
