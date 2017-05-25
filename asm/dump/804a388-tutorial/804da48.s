	.include "asm/common.inc"

	thumb_func_start sub_804DA48
sub_804DA48:
	push	{r4, r5, r6, r7, lr}
	add	r7, r2, #0
	ldr	r5, [r0]
	ldr	r6, [r1]
	add	r0, r1, #0
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L1	@cond_branch
	ldr	r3, [r5, #0x4]
	ldr	r4, [r5, #0x8]
	ldr	r5, [r5, #0xc]
	ldr	r0, [r6, #0x4]
	ldr	r1, [r6, #0x8]
	ldr	r2, [r6, #0xc]
	sub	r0, r0, r3
	asr	r0, r0, #0x8
	sub	r1, r1, r4
	asr	r1, r1, #0x8
	sub	r2, r2, r5
	asr	r2, r2, #0x8
	add	r3, r0, #0
	mul	r3, r3, r0
	add	r0, r3, #0
	add	r3, r1, #0
	mul	r3, r3, r1
	add	r1, r3, #0
	add	r0, r0, r1
	add	r1, r2, #0
	mul	r1, r1, r2
	add	r0, r0, r1
	add	r1, r7, #0
	mul	r1, r1, r7
	cmp	r0, r1
	blt	.L2	@cond_branch
.L1:
	mov	r0, #0x0
	b	.L3
.L2:
	mov	r0, #0x1
.L3:
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_804DA48

.align 2, 0 @ Don't pad with nop.
