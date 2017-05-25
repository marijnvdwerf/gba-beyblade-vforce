	.include "asm/common.inc"

	thumb_func_start sub_805F98C
sub_805F98C:
	add	r2, r0, #0
	ldr	r0, [r2, #0x10]
	cmp	r0, #0
	beq	.L2	@cond_branch
	mov	r1, #0x0
	ldr	r0, [r2]
	ldrh	r0, [r0, #0x4]
	cmp	r1, r0
	bcs	.L2	@cond_branch
	add	r2, r0, #0
.L3:
	add	r0, r1, #1
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	cmp	r1, r2
	bcc	.L3	@cond_branch
.L2:
	bx	lr
	thumb_func_end sub_805F98C

.align 2, 0 @ Don't pad with nop.
