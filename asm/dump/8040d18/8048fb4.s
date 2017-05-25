	.include "asm/common.inc"

	thumb_func_start sub_8048FB4
sub_8048FB4:
	b	.L1
.L2:
	add	r0, r0, #0x1
.L1:
	ldrb	r1, [r0]
	cmp	r1, #0x7d
	bne	.L2	@cond_branch
	add	r0, r0, #0x1
	bx	lr
	thumb_func_end sub_8048FB4

.align 2, 0 @ Don't pad with nop.
