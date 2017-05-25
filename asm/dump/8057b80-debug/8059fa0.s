	.include "asm/common.inc"

	thumb_func_start sub_8059FA0
sub_8059FA0:
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	mul	r0, r0, r1
	add	r1, r0, #0
	cmp	r0, #0
	bge	.L1	@cond_branch
	add	r1, r1, #0xff
.L1:
	lsl	r0, r1, #0x8
	asr	r0, r0, #0x10
	bx	lr
	thumb_func_end sub_8059FA0

.align 2, 0 @ Don't pad with nop.
