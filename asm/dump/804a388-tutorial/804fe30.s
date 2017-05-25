	.include "asm/common.inc"

	thumb_func_start sub_804FE30
sub_804FE30:
	ldr	r0, .L1
	ldr	r1, [r0]
	ldr	r0, .L1 + 4
	add	r1, r1, r0
	ldr	r0, .L1 + 8
	ldrh	r2, [r1]
	and	r0, r0, r2
	strh	r0, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0x105e
	.4byte	0xfffe
	thumb_func_end sub_804FE30

.align 2, 0 @ Don't pad with nop.
