	.include "asm/common.inc"

	thumb_func_start sub_80600B4
sub_80600B4:
	push	{r4, r5, r6, lr}
	ldr	r4, .L1
	ldr	r0, [r4]
	ldr	r6, [r0, #0x18]
	ldrb	r0, [r0, #0x4]
	mul	r0, r0, r6
	add	r6, r6, r0
	lsl	r6, r6, #0x1
	mov	r0, #0xc0
	bl	DisableInterrupt
	ldr	r0, [r4]
	mov	r5, #0x0
	strb	r5, [r0]
	ldr	r0, [r4]
	strb	r5, [r0, #0x1]
	ldr	r0, [r4]
	strb	r5, [r0, #0x2]
	ldr	r0, [r4]
	strb	r5, [r0, #0x3]
	ldr	r0, [r4]
	str	r5, [r0, #0x1c]
	str	r5, [r0, #0x14]
	strb	r5, [r0, #0x5]
	ldr	r2, .L1 + 4
	ldr	r0, [r4]
	ldr	r1, [r0, #0x24]
	ldr	r3, [r2]
	mov	r0, #0x0
	add	r2, r6, #0
	bl	_call_via_r3
	ldr	r1, [r4]
	ldr	r0, [r1, #0x24]
	str	r0, [r1, #0x3c]
	ldr	r0, [r1, #0x28]
	str	r0, [r1, #0x40]
	ldr	r0, [r1, #0x2c]
	str	r0, [r1, #0x34]
	ldr	r0, [r1, #0x30]
	str	r0, [r1, #0x38]
	ldr	r3, .L1 + 8
	mov	r2, #0x80
	lsl	r2, r2, #0x6
	add	r0, r2, #0
	strh	r0, [r3]
	ldrh	r0, [r3]
	mov	r4, #0x80
	lsl	r4, r4, #0x7
	add	r2, r4, #0
	orr	r0, r0, r2
	ldrb	r1, [r1, #0x6]
	orr	r0, r0, r1
	strh	r0, [r3]
	ldr	r0, .L1 + 12
	strh	r5, [r0]
	sub	r0, r0, #0xa
	strh	r5, [r0]
	add	r0, r0, #0x2
	strh	r5, [r0]
	add	r0, r0, #0x2
	strh	r5, [r0]
	add	r0, r0, #0x2
	strh	r5, [r0]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3005dc4
	.4byte	0x807d970
	.4byte	0x4000128
	.4byte	0x400012a
	thumb_func_end sub_80600B4

.align 2, 0 @ Don't pad with nop.
