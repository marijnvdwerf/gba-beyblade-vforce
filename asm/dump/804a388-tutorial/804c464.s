	.include "asm/common.inc"

	thumb_func_start sub_804C464
sub_804C464:
	mov	r2, #0x4
	ldsh	r1, [r0, r2]
	ldr	r2, [r0, #0x8]
	add	r0, r1, #0
	sub	r1, r1, #0x1
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r3, #0x0
.L2:
	strh	r3, [r2, #0x2a]
	add	r2, r2, #0x34
	add	r0, r1, #0
	sub	r1, r1, #0x1
	cmp	r0, #0
	bne	.L2	@cond_branch
.L1:
	bx	lr
	thumb_func_end sub_804C464

.align 2, 0 @ Don't pad with nop.
