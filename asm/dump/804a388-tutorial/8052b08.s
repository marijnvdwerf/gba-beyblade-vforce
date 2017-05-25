	.include "asm/common.inc"

	thumb_func_start sub_8052B08
sub_8052B08:
	push	{lr}
	add	r0, r2, #0
	mov	r1, #0x8
	ldrh	r2, [r0, #0x8]
	orr	r1, r1, r2
	strh	r1, [r0, #0x8]
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	mov	r2, #0x90
	lsl	r2, r2, #0x1
	bl	sub_8061684
	pop	{r0}
	bx	r0
	thumb_func_end sub_8052B08

.align 2, 0 @ Don't pad with nop.
