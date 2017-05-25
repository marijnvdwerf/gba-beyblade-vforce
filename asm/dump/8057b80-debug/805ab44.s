	.include "asm/common.inc"

	thumb_func_start sub_805AB44
sub_805AB44:
	ldr	r0, .L1
	ldr	r1, .L1 + 4
	ldr	r0, [r0]
	ldr	r1, [r1]
	sub	r0, r0, r1
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000e30
	.4byte	0x3005da8
	thumb_func_end sub_805AB44

.align 2, 0 @ Don't pad with nop.
