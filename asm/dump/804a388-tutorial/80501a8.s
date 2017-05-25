	.include "asm/common.inc"

	thumb_func_start sub_80501A8
sub_80501A8:
	push	{lr}
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	ldrb	r3, [r0, #0xd]
	lsl	r2, r3, #0x1c
	lsr	r2, r2, #0x1c
	BIC	r2, r1
	mov	r1, #0x10
	NEG	r1, r1
	and	r1, r1, r3
	orr	r1, r1, r2
	strb	r1, [r0, #0xd]
	bl	sub_805024C
	pop	{r0}
	bx	r0
	thumb_func_end sub_80501A8

.align 2, 0 @ Don't pad with nop.
