	.include "asm/common.inc"

	thumb_func_start sub_80571D0
sub_80571D0:
	mov	r2, #0x0
	mov	r3, #0x0
	ldsh	r1, [r0, r3]
	ldr	r0, [r0, #0x4]
	ldr	r0, [r0]
	cmp	r1, r0
	bne	.L1	@cond_branch
	mov	r2, #0x1
.L1:
	add	r0, r2, #0
	bx	lr
	thumb_func_end sub_80571D0

.align 2, 0 @ Don't pad with nop.
