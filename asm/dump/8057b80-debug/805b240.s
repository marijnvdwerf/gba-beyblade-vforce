	.include "asm/common.inc"

	thumb_func_start sub_805B240
sub_805B240:
	ldr	r0, [r0, #0x24]
	bx	lr
	thumb_func_end sub_805B240

.align 2, 0 @ Don't pad with nop.
