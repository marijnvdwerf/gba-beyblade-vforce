	.include "asm/common.inc"

	thumb_func_start sub_80498D8
sub_80498D8:
	ldr	r1, .L1
	ldr	r2, .L1 + 4
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x2
	ldr	r2, .L1 + 8
	add	r0, r2, #0
	strh	r0, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x4000050
	.4byte	0xf42
	.4byte	0xc06
	thumb_func_end sub_80498D8

.align 2, 0 @ Don't pad with nop.
