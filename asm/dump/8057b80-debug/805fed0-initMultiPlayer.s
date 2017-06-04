	.include "asm/common.inc"

	thumb_func_start initMultiPlayer
initMultiPlayer:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	add	r6, r0, #0
	mov	r8, r1
	lsl	r2, r2, #0x10
	lsr	r5, r2, #0x10
	mov	r0, r8
	mul	r0, r0, r6
	mov	sl, r0
	lsl	r0, r0, #0x1
	lsl	r1, r1, #0x1
	mov	r9, r1
	ADD r0, r9
	str	r0, [sp]
	add	r4, r0, #0
	add	r4, r4, #0x44
	mov	r0, #0x3
	mov	r2, r8
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldr	r0, .L3
	bl	printf
.L1:
	add	r0, r4, #0
	bl	slowAllocate
	add	r7, r0, #0
	cmp	r7, #0
	bne	.L2	@cond_branch
	ldr	r0, .L3 + 4
	add	r1, r4, #0
	bl	printf
.L2:
	ldr	r4, .L3 + 8
	ldr	r0, [r7]
	str	r0, [r4]
	str	r7, [r0, #0xc]
	strb	r5, [r0, #0x6]
	ldr	r0, [r4]
	mov	r1, #0x0
	strb	r1, [r0]
	ldr	r0, [r4]
	strb	r1, [r0, #0x1]
	ldr	r0, [r4]
	strb	r1, [r0, #0x2]
	ldr	r0, [r4]
	strb	r6, [r0, #0x4]
	ldr	r0, [r4]
	strb	r1, [r0, #0x3]
	ldr	r0, [r4]
	mov	r2, r8
	str	r2, [r0, #0x18]
	mov	r1, #0x0
	str	r1, [r0, #0x1c]
	mov	r1, #0x10
	str	r1, [r0, #0x20]
	mov	r2, #0x0
	strb	r2, [r0, #0x5]
	ldr	r0, [r4]
	ldr	r1, [r7]
	add	r1, r1, #0x44
	str	r1, [r0, #0x24]
	mov	r2, r8
	add	r6, r1, r2
	str	r6, [r0, #0x28]
	mov	r3, r9
	add	r3, r3, #0x44
	ldr	r2, [r7]
	add	r2, r2, r3
	str	r2, [r0, #0x2c]
	mov	r7, sl
	add	r3, r2, r7
	str	r3, [r0, #0x30]
	str	r1, [r0, #0x3c]
	str	r6, [r0, #0x40]
	str	r2, [r0, #0x34]
	str	r3, [r0, #0x38]
	ldr	r0, .L3 + 12
	ldr	r3, [r0]
	mov	r0, #0x0
	ldr	r2, [sp]
	bl	_call_via_r3
	ldr	r0, .L3 + 16
	mov	r1, #0x0
	strh	r1, [r0]
	ldr	r1, .L3 + 20
	mov	r2, #0x80
	lsl	r2, r2, #0x6
	add	r0, r2, #0
	strh	r0, [r1]
	mov	r7, #0x80
	lsl	r7, r7, #0x7
	add	r0, r7, #0
	orr	r5, r5, r0
	ldrh	r0, [r1]
	orr	r5, r5, r0
	strh	r5, [r1]
	ldr	r4, [r4]
	mov	r0, r8
	asr	r1, r0, #0x1
	ldr	r0, .L3 + 24
	bl	__divsi3
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	sub	r1, r1, r0
	str	r1, [r4, #0x10]
	mov	r1, #0x0
	str	r1, [r4, #0x14]
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L4:
	.align	2, 0
.L3:
	.4byte	0x8755834
	.4byte	0x8755884
	.4byte	0x3005dc4
	.4byte	0x807d970
	.4byte	0x4000134
	.4byte	0x4000128
	.4byte	0x359e4
	thumb_func_end initMultiPlayer

.align 2, 0 @ Don't pad with nop.
