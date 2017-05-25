	.include "asm/common.inc"

	thumb_func_start sub_80516E0
sub_80516E0:
	ldr	r1, .L1
	lsl	r0, r0, #0x3
	ldr	r2, .L1 + 4
	add	r0, r0, r2
	ldr	r1, [r1]
	add	r1, r1, r0
	add	r0, r1, #0
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000f48
	.4byte	0x544
	thumb_func_end sub_80516E0

.align 2, 0 @ Don't pad with nop.
