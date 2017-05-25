	.include "asm/common.inc"

	thumb_func_start sub_8057B54
sub_8057B54:
	ldr	r1, .L1
	mov	r0, #0x0
	str	r0, [r1, #0x4]
	str	r0, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000ee0
	thumb_func_end sub_8057B54

.align 2, 0 @ Don't pad with nop.
