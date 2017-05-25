	.include "asm/common.inc"

	thumb_func_start sub_8064F9C
sub_8064F9C:
	push	{r4, r5, r6, r7, lr}
	ldr	r4, [sp, #0x14]
	ldr	r5, [sp, #0x18]
	ldr	r6, [sp, #0x1c]
	ldr	r7, [sp, #0x20]
	str	r4, [r0]
	mov	r4, #0x0
	strb	r5, [r0, #0x4]
	str	r6, [r0, #0x14]
	str	r7, [r0, #0x18]
	str	r1, [r0, #0x10]
	str	r2, [r0, #0x8]
	sub	r2, r2, #0x1
	str	r2, [r0, #0xc]
	mov	r1, #0x10
	NEG	r1, r1
	ldrb	r2, [r0, #0x5]
	and	r1, r1, r2
	mov	r2, #0x11
	NEG	r2, r2
	and	r1, r1, r2
	strb	r1, [r0, #0x5]
	str	r3, [r0, #0x28]
	mov	r1, #0x1
	NEG	r1, r1
	str	r1, [r0, #0x2c]
	strh	r4, [r0, #0x6]
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	strh	r1, [r0, #0x24]
	strh	r1, [r0, #0x26]
	str	r4, [r0, #0x20]
	bl	sub_8065088
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8064F9C

.align 2, 0 @ Don't pad with nop.
