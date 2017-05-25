	.include "asm/common.inc"

	thumb_func_start sub_8057C40
sub_8057C40:
	ldr	r0, .L1
	ldr	r0, [r0]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000e30
	thumb_func_end sub_8057C40

.align 2, 0 @ Don't pad with nop.
