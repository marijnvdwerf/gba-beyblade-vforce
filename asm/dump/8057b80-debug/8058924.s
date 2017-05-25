	.include "asm/common.inc"

	thumb_func_start sub_8058924
sub_8058924:
	ldr	r1, [r0, #0x8]
	lsl	r1, r1, #0x3
	add	r1, r1, #0x20
	add	r2, r0, r1
	ldr	r1, [r0, #0x18]
	add	r0, r0, r1
	cmp	r2, r0
	beq	.L1	@cond_branch
	add	r0, r2, #0
	b	.L2
.L1:
	mov	r0, #0x0
.L2:
	bx	lr
	thumb_func_end sub_8058924

.align 2, 0 @ Don't pad with nop.
