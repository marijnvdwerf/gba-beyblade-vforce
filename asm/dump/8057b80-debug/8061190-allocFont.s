	.include "asm/common.inc"

	thumb_func_start allocFont
allocFont:
	push	{r4, r5, r6, lr}
	mov	ip, r0
	ldr	r0, [sp, #0x10]
	ldr	r4, [sp, #0x14]
	ldr	r5, [sp, #0x18]
	lsl	r3, r3, #0x10
	asr	r3, r3, #0x8
	mov	r6, ip
	str	r3, [r6]
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x8
	str	r0, [r6, #0x4]
	mov	r3, #0x0
	mov	r0, #0x0
	strh	r4, [r6, #0xc]
	strh	r0, [r6, #0xa]
	str	r0, [r6, #0x1c]
	str	r0, [r6, #0x18]
	str	r0, [r6, #0x14]
	str	r2, [r6, #0x20]
	str	r1, [r6, #0x24]
	strh	r5, [r6, #0x8]
	str	r0, [r6, #0x2c]
	strb	r3, [r6, #0xe]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	strh	r0, [r6, #0x10]
	strh	r0, [r6, #0x12]
	strb	r3, [r6, #0xf]
	mov	r0, ip
	add	r0, r0, #0x2b
	strb	r3, [r0]
	mov	r2, ip
	add	r2, r2, #0x28
	mov	r0, #0x5
	strb	r0, [r2]
	mov	r0, ip
	add	r0, r0, #0x29
	strb	r3, [r0]
	ldrb	r1, [r1, #0x5]
	add	r1, r1, #0x4
	add	r0, r0, #0x1
	strb	r1, [r0]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end allocFont

.align 2, 0 @ Don't pad with nop.
