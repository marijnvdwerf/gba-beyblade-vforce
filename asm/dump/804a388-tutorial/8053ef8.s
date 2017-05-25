	.include "asm/common.inc"

	thumb_func_start sub_8053EF8
sub_8053EF8:
	ldr	r1, .L1
	ldr	r1, [r1]
	mov	r2, #0xcb
	lsl	r2, r2, #0x3
	add	r1, r1, r2
	str	r0, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	thumb_func_end sub_8053EF8

.align 2, 0 @ Don't pad with nop.
