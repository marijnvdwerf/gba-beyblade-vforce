	.include "asm/common.inc"

	thumb_func_start sub_805791C
sub_805791C:
	ldr	r0, .L1
	mov	r1, #0x0
	str	r1, [r0]
	str	r1, [r0, #0x4]
	mov	r1, #0x10
	str	r1, [r0, #0x8]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000e30
	thumb_func_end sub_805791C

.align 2, 0 @ Don't pad with nop.
