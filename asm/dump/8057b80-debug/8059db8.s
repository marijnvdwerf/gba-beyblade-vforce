	.include "asm/common.inc"

	thumb_func_start sub_8059DB8
sub_8059DB8:
	push	{r4, r5, lr}
	add	r4, r0, #0
	add	r4, r4, #0x5c
	ldrb	r4, [r4]
	lsl	r5, r4, #0xb
	mov	r4, #0xc0
	lsl	r4, r4, #0x13
	add	r5, r5, r4
	add	r0, r0, #0x5f
	ldrb	r0, [r0]
	LSL	r2, r0
	add	r2, r2, r1
	lsl	r2, r2, #0x1
	add	r5, r5, r2
	strh	r3, [r5]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8059DB8

.align 2, 0 @ Don't pad with nop.
