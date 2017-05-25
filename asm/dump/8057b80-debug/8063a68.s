	.include "asm/common.inc"

	thumb_func_start sub_8063A68
sub_8063A68:
	add	r2, r0, #0
	cmp	r2, #0x14
	bhi	.L1	@cond_branch
	ldr	r0, .L2
	add	r0, r2, r0
	strb	r1, [r0]
.L1:
	bx	lr
.L3:
	.align	2, 0
.L2:
	.4byte	0x3005e80
	thumb_func_end sub_8063A68

.align 2, 0 @ Don't pad with nop.
