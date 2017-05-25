	.include "asm/common.inc"

	thumb_func_start sub_8061824
sub_8061824:
	push	{lr}
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x8
	ldr	r3, [r0]
	add	r3, r3, r1
	str	r3, [r0]
	lsl	r2, r2, #0x10
	asr	r2, r2, #0x8
	ldr	r1, [r0, #0x4]
	add	r1, r1, r2
	str	r1, [r0, #0x4]
	bl	sub_806123C
	pop	{r0}
	bx	r0
	thumb_func_end sub_8061824

.align 2, 0 @ Don't pad with nop.
