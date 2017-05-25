	.include "asm/common.inc"

	thumb_func_start sub_8055F04
sub_8055F04:
	push	{r4, lr}
	add	r4, r1, #0
	ldr	r0, [sp, #0x8]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r1, [r4, #0x10]
	asr	r1, r1, #0x4
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	bl	sub_804E358
	lsl	r0, r0, #0x10
	add	r0, r4, #0
	mov	r1, #0x0
	mov	r2, #0x0
	bl	sub_804E154
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8055F04

.align 2, 0 @ Don't pad with nop.
