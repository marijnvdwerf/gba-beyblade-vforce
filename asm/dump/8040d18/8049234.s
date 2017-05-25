	.include "asm/common.inc"

	thumb_func_start sub_8049234
sub_8049234:
	ldr	r1, .L1
	str	r0, [r1, #0xc]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000650
	thumb_func_end sub_8049234

.align 2, 0 @ Don't pad with nop.
