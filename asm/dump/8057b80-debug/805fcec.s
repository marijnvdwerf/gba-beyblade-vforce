	.include "asm/common.inc"

	thumb_func_start sub_805FCEC
sub_805FCEC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	r3, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	mov	ip, r1
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	mov	r8, r2
	ldrh	r0, [r3, #0x2]
	add	r1, r0, #1
	strh	r1, [r3, #0x2]
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	asr	r0, r0, #0xd
	ldr	r2, [r3, #0x8]
	add	r6, r2, r0
	mov	r0, ip
	lsl	r0, r0, #0x10
	mov	r9, r0
	asr	r4, r0, #0x10
	lsl	r1, r4, #0x2
	ldr	r0, [r3, #0xc]
	add	r1, r0, r1
	mov	r7, #0x0
	ldsh	r0, [r1, r7]
	cmp	r0, #0
	bge	.L1	@cond_branch
	strh	r5, [r1]
	strh	r5, [r1, #0x2]
	MVN	r0, r4
	strh	r0, [r6, #0x4]
	mov	r0, r9
	asr	r2, r0, #0x15
	ldr	r0, [r3, #0x10]
	lsl	r2, r2, #0x2
	add	r2, r2, r0
	mov	r0, #0x1f
	and	r0, r0, r4
	mov	r1, #0x1
	LSL	r1, r0
	ldr	r0, [r2]
	orr	r0, r0, r1
	str	r0, [r2]
	b	.L2
.L1:
	mov	r4, #0x2
	ldsh	r0, [r1, r4]
	lsl	r0, r0, #0x3
	add	r0, r2, r0
	strh	r5, [r0, #0x2]
	ldrh	r0, [r1, #0x2]
	strh	r0, [r6, #0x4]
	strh	r5, [r1, #0x2]
.L2:
	mov	r7, ip
	lsl	r0, r7, #0x10
	asr	r0, r0, #0x10
	MVN	r0, r0
	strh	r0, [r6, #0x2]
	mov	r0, r8
	strh	r0, [r6]
	ldrh	r0, [r3]
	add	r0, r0, #0x1
	strh	r0, [r3]
	lsl	r0, r5, #0x10
	asr	r0, r0, #0x10
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805FCEC

.align 2, 0 @ Don't pad with nop.
