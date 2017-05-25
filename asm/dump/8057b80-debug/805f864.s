	.include "asm/common.inc"

	thumb_func_start sub_805F864
sub_805F864:
	push	{r4, lr}
	add	r4, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	bl	sub_805F784
	mov	r0, #0x8
	ldrh	r1, [r4, #0x32]
	orr	r0, r0, r1
	strh	r0, [r4, #0x32]
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805F864

.align 2, 0 @ Don't pad with nop.
