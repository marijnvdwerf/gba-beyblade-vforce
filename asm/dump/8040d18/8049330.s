	.include "asm/common.inc"

	thumb_func_start sub_8049330
sub_8049330:
	ldr	r1, .L1
	ldr	r2, .L1 + 4
	add	r1, r1, r2
	str	r0, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000650
	.4byte	0x58c
	thumb_func_end sub_8049330

.align 2, 0 @ Don't pad with nop.
