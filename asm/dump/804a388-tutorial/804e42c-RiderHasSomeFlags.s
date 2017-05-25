	.include "asm/common.inc"

	thumb_func_start RiderHasSomeFlags
RiderHasSomeFlags:
	add	r0, r0, #0x9c
	ldr	r0, [r0]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L1	@cond_branch
	mov	r0, #0x0
	b	.L2
.L1:
	mov	r0, #0x1
.L2:
	bx	lr
	thumb_func_end RiderHasSomeFlags

.align 2, 0 @ Don't pad with nop.
