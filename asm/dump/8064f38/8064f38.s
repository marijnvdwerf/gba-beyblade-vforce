	.include "asm/common.inc"

	thumb_func_start sub_8064F38
sub_8064F38:
	mov	r2, #0x0
	b	.L8064F44
.L8064F3C:
	add	r0, r0, #0x1
	cmp	r1, #0x20
	beq	.L8064F44	@cond_branch
	add	r2, r2, #0x1
.L8064F44:
	ldrb	r1, [r0]
	cmp	r1, #0
	bne	.L8064F3C	@cond_branch
	add	r0, r2, #0
	bx	lr
	thumb_func_end sub_8064F38

.align 2, 0 @ Don't pad with nop.
