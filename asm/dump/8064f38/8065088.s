	.include "asm/common.inc"

	thumb_func_start sub_8065088
sub_8065088:
	push	{r4, r5, r6, lr}
	add	r2, r0, #0
	ldr	r5, [r2, #0x14]
	mov	r4, #0x0
	ldrb	r0, [r2, #0x4]
	cmp	r4, r0
	bcs	.L1	@cond_branch
	mov	r3, #0x0
	mov	r6, #0x80
	lsl	r6, r6, #0x1
.L2:
	mov	r0, #0xc4
	mul	r0, r0, r4
	ldr	r1, [r2]
	add	r1, r1, r0
	lsl	r0, r5, #0x8
	str	r0, [r1, #0x4]
	ldr	r0, [r2, #0x18]
	lsl	r0, r0, #0x8
	str	r0, [r1, #0x8]
	strh	r3, [r1, #0x16]
	strh	r6, [r1, #0x12]
	strh	r6, [r1, #0x14]
	str	r3, [r1, #0x40]
	str	r3, [r1, #0x44]
	str	r3, [r1, #0x48]
	str	r3, [r1, #0x4c]
	str	r3, [r1, #0x50]
	str	r3, [r1, #0x54]
	ldrb	r1, [r1, #0x10]
	add	r5, r1, r5
	add	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	ldrb	r0, [r2, #0x4]
	cmp	r4, r0
	bcc	.L2	@cond_branch
.L1:
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	strh	r0, [r2, #0x24]
	strh	r0, [r2, #0x26]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8065088

.align 2, 0 @ Don't pad with nop.
