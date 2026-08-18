	.include "asm/common.inc"

	thumb_func_start sub_8064F84
sub_8064F84:
	add	r2, r0, #0
	ldrb	r0, [r2]
	mov	r1, #0x1
	cmp	r0, #0
	beq	.L8064F98	@cond_branch
.L8064F8E:
	add	r0, r2, r1
	ldrb	r0, [r0]
	add	r1, r1, #0x1
	cmp	r0, #0
	bne	.L8064F8E	@cond_branch
.L8064F98:
	add	r0, r1, #0
	bx	lr
	thumb_func_end sub_8064F84

.align 2, 0 @ Don't pad with nop.
