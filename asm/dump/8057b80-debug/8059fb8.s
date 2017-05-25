	.include "asm/common.inc"

	thumb_func_start sub_8059FB8
sub_8059FB8:
	push	{lr}
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x8
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	bl	sub_8066084
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	pop	{r1}
	bx	r1
	thumb_func_end sub_8059FB8

.align 2, 0 @ Don't pad with nop.
