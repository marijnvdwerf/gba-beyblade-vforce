	.include "asm/common.inc"

	thumb_func_start GetPointAtIndex
GetPointAtIndex:
	ldr	r2, [r0, #0x4]
	ldr	r0, [r0]
	ldr	r0, [r0]
	cmp	r1, r0
	blt	.L1	@cond_branch
	mov	r0, #0x0
	b	.L2
.L1:
	lsl	r0, r1, #0x4
	add	r0, r2, r0
.L2:
	bx	lr
	thumb_func_end GetPointAtIndex

.align 2, 0 @ Don't pad with nop.
