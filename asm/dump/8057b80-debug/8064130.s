	.include "asm/common.inc"

	thumb_func_start sub_8064130
sub_8064130:
	add	r1, r0, #0
	ldrb	r0, [r1, #0x13]
	cmp	r0, #0
	beq	.L1	@cond_branch
	sub	r0, r0, #0x1
	strb	r0, [r1, #0x13]
.L1:
	bx	lr
	thumb_func_end sub_8064130

.align 2, 0 @ Don't pad with nop.
