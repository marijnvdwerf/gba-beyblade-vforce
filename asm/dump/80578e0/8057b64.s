	.include "asm/common.inc"

	thumb_func_start sub_8057B64
sub_8057B64:
	ldr	r1, .L1
	ldr	r0, [r1]
	add	r0, r0, #0x1
	str	r0, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000ee0
	thumb_func_end sub_8057B64

.align 2, 0 @ Don't pad with nop.
