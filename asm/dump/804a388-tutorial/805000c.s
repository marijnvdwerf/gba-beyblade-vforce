	.include "asm/common.inc"

	thumb_func_start sub_805000C
sub_805000C:
	push	{r4, lr}
	ldr	r4, [r1]
	ldr	r2, [r4, #0x4]
	asr	r2, r2, #0x8
	strh	r2, [r0]
	ldr	r2, [r4, #0x8]
	asr	r2, r2, #0x8
	strh	r2, [r0, #0x2]
	ldr	r2, [r4, #0xc]
	asr	r2, r2, #0x8
	strh	r2, [r0, #0x4]
	ldr	r3, .L1
	ldrh	r4, [r4, #0x22]
	and	r3, r3, r4
	ldr	r2, .L1 + 4
	ldrh	r4, [r0, #0x6]
	and	r2, r2, r4
	orr	r2, r2, r3
	strh	r2, [r0, #0x6]
	ldr	r1, [r1, #0x4]
	mov	r2, #0xf3
	lsl	r2, r2, #0x2
	add	r1, r1, r2
	ldrh	r1, [r1]
	strb	r1, [r0, #0xc]
	bl	sub_805024C
	pop	{r4}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3ff
	.4byte	0xfffffc00
	thumb_func_end sub_805000C

.align 2, 0 @ Don't pad with nop.
