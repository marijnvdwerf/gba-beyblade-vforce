	.include "asm/common.inc"

	thumb_func_start RiderHasSomeFlags
RiderHasSomeFlags:
	add	r0, r0, #0x9c
	ldr	r0, [r0]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L804E43A	@cond_branch
	mov	r0, #0x0
	b	.L804E43C
.L804E43A:
	mov	r0, #0x1
.L804E43C:
	bx	lr
	thumb_func_end RiderHasSomeFlags

.align 2, 0 @ Don't pad with nop.
