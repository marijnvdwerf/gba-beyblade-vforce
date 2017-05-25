	.include "asm/common.inc"

	thumb_func_start DMA3Copy
DMA3Copy:
	push	{r4, r5, r6, lr}
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	ldr	r4, .L3
	ldrh	r3, [r4]
	add	r6, r3, #0
	mov	r3, #0x0
	strh	r3, [r4]
	ldr	r5, .L3 + 4
	ldrh	r4, [r5]
	ldr	r3, .L3 + 8
	and	r4, r4, r3
	ldr	r3, .L3 + 12
	ldr	r3, [r3]
	ldrh	r3, [r3, #0x6]
	orr	r4, r4, r3
	strh	r4, [r5]
	ldr	r3, .L3 + 16
	str	r0, [r3]
	ldr	r0, .L3 + 20
	str	r1, [r0]
	ldr	r1, .L3 + 24
	mov	r0, #0x80
	lsl	r0, r0, #0x18
	orr	r2, r2, r0
	str	r2, [r1]
	add	r1, r1, #0x2
	mov	r2, #0x80
	lsl	r2, r2, #0x8
	add	r0, r2, #0
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldr	r2, .L3 + 28
	mov	r0, #0x80
	lsl	r0, r0, #0x8
	add	r1, r0, #0
.L2:
	ldrh	r0, [r2]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L2	@cond_branch
.L1:
	ldr	r0, .L3
	strh	r6, [r0]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L4:
	.align	2, 0
.L3:
	.4byte	0x4000208
	.4byte	0x4000204
	.4byte	0xf8ff
	.4byte	0x3005e9c
	.4byte	0x40000d4
	.4byte	0x40000d8
	.4byte	0x40000dc
	.4byte	0x40000de
	thumb_func_end DMA3Copy

.align 2, 0 @ Don't pad with nop.
