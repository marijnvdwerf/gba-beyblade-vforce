	.include "asm/common.inc"

	thumb_func_start sub_804E154
sub_804E154:
	push	{r4, r5, r6, lr}
	add	r5, r0, #0
	lsl	r2, r2, #0x10
	lsr	r6, r2, #0x10
	mov	r1, #0x80
	lsl	r1, r1, #0xb
	bl	UnsetRiderFlag
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	add	r0, r5, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0
	bne	.L3	@cond_branch
	mov	r0, #0xf7
	lsl	r0, r0, #0x1
	add	r1, r5, r0
	ldrh	r3, [r1]
	ldr	r4, .L4
	add	r0, r3, r4
	strh	r0, [r1]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bge	.L2	@cond_branch
	strh	r2, [r1]
.L2:
	mov	r0, #0xf9
	lsl	r0, r0, #0x1
	add	r1, r5, r0
	ldrh	r3, [r1]
	ldr	r4, .L4 + 4
	add	r0, r3, r4
	strh	r0, [r1]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bge	.L3	@cond_branch
	strh	r2, [r1]
.L3:
	mov	r1, #0xa2
	lsl	r1, r1, #0x1
	add	r0, r5, r1
	mov	r4, #0x0
	strh	r4, [r0]
	add	r1, r1, #0xbc
	add	r0, r5, #0
	bl	SetRiderFlag
	add	r1, r5, #0
	add	r1, r1, #0xcc
	mov	r0, #0xa0
	str	r0, [r1]
	str	r4, [r5, #0x6c]
	str	r4, [r5, #0x74]
	str	r4, [r5, #0x70]
	str	r4, [r5, #0x30]
	str	r4, [r5, #0x3c]
	mov	r3, #0xa8
	lsl	r3, r3, #0x1
	add	r0, r5, r3
	strh	r6, [r0]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L5:
	.align	2, 0
.L4:
	.4byte	0xfffffc00
	.4byte	0xfffffe00
	thumb_func_end sub_804E154

.align 2, 0 @ Don't pad with nop.
