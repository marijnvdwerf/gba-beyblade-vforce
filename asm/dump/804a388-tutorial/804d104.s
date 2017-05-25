	.include "asm/common.inc"

	thumb_func_start sub_804D104
sub_804D104:
	ldr	r1, [r0, #0x40]
	str	r1, [r0, #0x48]
	ldr	r1, [r0, #0x44]
	str	r1, [r0, #0x4c]
	bx	lr
	thumb_func_end sub_804D104

.align 2, 0 @ Don't pad with nop.
