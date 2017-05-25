	.include "asm/common.inc"

	thumb_func_start sub_8056158
sub_8056158:
	add	r2, r0, #0
	ldr	r0, [r2, #0xc]
	ldr	r1, [r2, #0x48]
	add	r0, r0, r1
	cmp	r0, #0
	bgt	.L1	@cond_branch
	mov	r0, #0x0
	str	r0, [r2, #0xc]
	str	r0, [r2, #0x48]
.L1:
	bx	lr
	thumb_func_end sub_8056158

.align 2, 0 @ Don't pad with nop.
