	.include "asm/common.inc"

	thumb_func_start sub_8055288
sub_8055288:
	ldr	r0, .L8055294
	ldr	r0, [r0]
	ldr	r1, .L8055294 + 4
	add	r0, r0, r1
	ldr	r0, [r0, #0x30]
	bx	lr
.L8055294:
	.align	2, 0

	.4byte	0x3000fb0
	.4byte	0x1084
	thumb_func_end sub_8055288

.align 2, 0 @ Don't pad with nop.
