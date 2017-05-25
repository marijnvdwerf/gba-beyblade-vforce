	.include "asm/common.inc"

	thumb_func_start sub_8062318
sub_8062318:
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	cmp	r0, #0
	beq	.L1	@cond_branch
	add	r0, r0, #0x2b
	strb	r1, [r0]
.L1:
	bx	lr
	thumb_func_end sub_8062318

.align 2, 0 @ Don't pad with nop.
