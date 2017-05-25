	.include "asm/common.inc"

	thumb_func_start sub_805B244
sub_805B244:
	push	{r4, lr}
	ldr	r4, [sp, #0x8]
	str	r2, [r0, #0x8]
	str	r1, [r0]
	strb	r4, [r0, #0xc]
	str	r3, [r0, #0x4]
	mov	r1, #0x1
	strh	r1, [r0, #0xe]
	ldrb	r1, [r2, #0x5]
	strb	r1, [r0, #0xd]
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805B244

.align 2, 0 @ Don't pad with nop.
