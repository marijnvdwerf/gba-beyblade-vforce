	.include "asm/common.inc"

	thumb_func_start sub_8049018
sub_8049018:
	ldr	r3, .L1
	add	r2, r3, #0
	add	r2, r2, #0x84
	add	r0, r3, #0
	add	r0, r0, #0x88
	ldr	r1, .L1 + 4
	str	r1, [r0]
	str	r1, [r2]
	add	r2, r2, #0x8
	add	r0, r0, #0x8
	str	r1, [r0]
	str	r1, [r2]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000650
	.4byte	0xffff0000
	thumb_func_end sub_8049018

.align 2, 0 @ Don't pad with nop.
