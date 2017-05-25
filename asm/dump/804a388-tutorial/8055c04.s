	.include "asm/common.inc"

	thumb_func_start sub_8055C04
sub_8055C04:
	lsl	r1, r1, #0x18
	cmp	r1, #0
	beq	.L1	@cond_branch
	str	r2, [r0, #0x34]
	str	r3, [r0, #0x38]
	b	.L2
.L1:
	str	r2, [r0, #0x2c]
	str	r3, [r0, #0x30]
.L2:
	bx	lr
	thumb_func_end sub_8055C04

.align 2, 0 @ Don't pad with nop.
