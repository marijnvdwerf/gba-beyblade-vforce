	.include "asm/common.inc"

	thumb_func_start sub_805F8F8
sub_805F8F8:
	mov	r1, #0x0
	ldr	r0, [r0]
	ldrh	r0, [r0, #0x6]
	cmp	r1, r0
	bcs	.L1	@cond_branch
	add	r2, r0, #0
.L2:
	add	r0, r1, #1
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	cmp	r1, r2
	bcc	.L2	@cond_branch
.L1:
	bx	lr
	thumb_func_end sub_805F8F8

.align 2, 0 @ Don't pad with nop.
