	.include "asm/common.inc"

	thumb_func_start sub_805FE04
sub_805FE04:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffffc
	mov	r3, #0x0
	strh	r3, [r0, #0x2]
	strh	r3, [r0]
	strh	r3, [r0, #0x24]
	strh	r3, [r0, #0x26]
	strh	r3, [r0, #0x30]
	strh	r3, [r0, #0x2e]
	mov	r1, #0x1
	NEG	r1, r1
	str	r1, [sp]
	ldr	r5, .L1
	mov	r1, sp
	str	r1, [r5]
	ldr	r4, [r0, #0x1c]
	ldr	r1, [r4]
	str	r1, [r5, #0x4]
	ldrh	r6, [r0, #0x6]
	lsr	r2, r6, #0x5
	lsl	r2, r2, #0x2
	lsl	r1, r6, #0x1
	add	r2, r2, r1
	ldr	r1, [r4, #0x4]
	sub	r1, r1, r2
	lsr	r1, r1, #0x2
	mov	r2, #0x85
	lsl	r2, r2, #0x18
	orr	r1, r1, r2
	str	r1, [r5, #0x8]
	ldr	r1, [r5, #0x8]
	str	r3, [sp]
	mov	r1, sp
	str	r1, [r5]
	ldr	r1, [r0, #0x10]
	str	r1, [r5, #0x4]
	ldrh	r0, [r0, #0x6]
	lsr	r0, r0, #0x5
	lsl	r0, r0, #0x2
	asr	r0, r0, #0x2
	orr	r0, r0, r2
	str	r0, [r5, #0x8]
	ldr	r0, [r5, #0x8]
	add	sp, sp, #0x4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x40000d4
	thumb_func_end sub_805FE04

.align 2, 0 @ Don't pad with nop.
