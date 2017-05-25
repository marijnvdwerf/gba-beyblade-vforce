	.include "asm/common.inc"

	thumb_func_start sub_8057930
sub_8057930:
	ldr	r0, .L1
	ldr	r1, [r0]
	str	r1, [r0, #0x4]
	ldr	r2, [r0, #0x8]
	add	r1, r1, r2
	str	r1, [r0]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000e30
	thumb_func_end sub_8057930

.align 2, 0 @ Don't pad with nop.
