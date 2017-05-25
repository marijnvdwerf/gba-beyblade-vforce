	.include "asm/common.inc"

	thumb_func_start sub_80650E0
sub_80650E0:
	add	r2, r0, #0
	ldr	r0, [r2, #0x2c]
	cmp	r0, #0
	bne	.L2	@cond_branch
	cmp	r1, #0
	beq	.L2	@cond_branch
	ldr	r0, [r2, #0x8]
	sub	r0, r0, #0x1
	str	r0, [r2, #0xc]
.L2:
	str	r1, [r2, #0x2c]
	bx	lr
	thumb_func_end sub_80650E0

.align 2, 0 @ Don't pad with nop.
