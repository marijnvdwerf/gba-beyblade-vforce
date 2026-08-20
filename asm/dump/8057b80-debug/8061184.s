	.include "asm/common.inc"

	thumb_func_start sub_8061184
sub_8061184:
	ldr	r0, .L806118C
	ldr	r0, [r0]
	bx	lr
.L806118A:
	.align	2, 0
.L806118C:
	.4byte	0x3005df4
	thumb_func_end sub_8061184

.align 2, 0 @ Don't pad with nop.
