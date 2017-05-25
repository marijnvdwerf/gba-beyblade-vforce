	.include "asm/common.inc"

	thumb_func_start sub_8063A50
sub_8063A50:
	ldr	r1, .L2
	mov	r2, #0x0
	add	r0, r1, #0
	add	r0, r0, #0x14
.L1:
	strb	r2, [r0]
	sub	r0, r0, #0x1
	cmp	r0, r1
	bge	.L1	@cond_branch
	bx	lr
.L3:
	.align	2, 0
.L2:
	.4byte	0x3005e80
	thumb_func_end sub_8063A50

.align 2, 0 @ Don't pad with nop.
