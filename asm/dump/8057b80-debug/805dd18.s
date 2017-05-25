	.include "asm/common.inc"

	thumb_func_start sub_805DD18
sub_805DD18:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff4
	add	r7, r0, #0
	mov	r8, r2
	add	r5, r3, #0
	bl	GetSplineAtIndex
	add	r6, r0, #0
	add	r2, r6, #0
	add	r2, r2, #0x20
	ldr	r1, [r6]
	lsl	r0, r1, #0x2
	add	r0, r0, #0x20
	add	r0, r0, r6
	mov	r9, r0
	cmp	r5, #0
	bge	.L1	@cond_branch
	mov	r5, #0x0
.L1:
	asr	r0, r5, #0xa
	cmp	r0, r1
	blt	.L2	@cond_branch
	sub	r0, r1, #1
	lsl	r0, r0, #0xa
	ldr	r1, .L5
	and	r5, r5, r1
	orr	r5, r5, r0
.L2:
	asr	r0, r5, #0xa
	mov	sl, r0
	lsl	r4, r0, #0x2
	add	r4, r4, r2
	ldr	r1, [r4]
	add	r0, r7, #0
	bl	GetPointAtIndex
	str	r0, [sp]
	ldr	r1, [r4, #0x4]
	add	r0, r7, #0
	bl	GetPointAtIndex
	str	r0, [sp, #0x4]
	ldr	r1, .L5
	mov	ip, r1
	mov	r2, ip
	and	r2, r2, r5
	mov	ip, r2
	mov	r3, sl
	lsl	r0, r3, #0x4
	mov	r4, r9
	add	r1, r0, r4
	ldrh	r5, [r1, #0xa]
	ldr	r0, [r6]
	sub	r0, r0, #0x2
	cmp	sl, r0
	bge	.L3	@cond_branch
	add	r0, r1, #0
	add	r0, r0, #0x10
	ldrh	r2, [r0, #0x8]
	ldrh	r4, [r0, #0xa]
	b	.L4
.L6:
	.align	2, 0
.L5:
	.4byte	0x3ff
.L3:
	ldrh	r2, [r1, #0x8]
	add	r4, r2, #0
.L4:
	lsl	r0, r2, #0x10
	ldr	r1, .L12
	add	r0, r0, r1
	lsr	r2, r0, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0
	bge	.L7	@cond_branch
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	add	r0, r0, r2
	lsl	r0, r0, #0x10
	lsr	r2, r0, #0x10
.L7:
	mov	r3, sl
	lsl	r0, r3, #0x4
	mov	r1, r9
	add	r3, r0, r1
	lsl	r0, r5, #0x10
	asr	r0, r0, #0x10
	mov	r5, #0x8
	ldsh	r1, [r3, r5]
	cmp	r0, r1
	beq	.L9	@cond_branch
	lsl	r0, r4, #0x10
	asr	r0, r0, #0x10
	cmp	r0, r1
	beq	.L9	@cond_branch
	mov	r0, sl
	cmp	r0, #0
	ble	.L10	@cond_branch
	add	r0, r3, #0
	sub	r0, r0, #0x10
	ldrh	r0, [r0, #0x8]
	b	.L11
.L13:
	.align	2, 0
.L12:
	.4byte	0xff800000
.L10:
	mov	r1, r9
	ldrh	r0, [r1, #0x8]
.L11:
	ldr	r3, .L15
	lsl	r1, r0, #0x18
	lsr	r1, r1, #0x18
	add	r0, r1, #0
	add	r0, r0, #0x40
	lsl	r0, r0, #0x1
	add	r0, r0, r3
	mov	r4, #0x0
	ldsh	r0, [r0, r4]
	mov	r5, #0xc0
	lsl	r5, r5, #0x1
	mul	r0, r0, r5
	asr	r7, r0, #0x8
	lsl	r1, r1, #0x1
	add	r1, r1, r3
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	mul	r0, r0, r5
	asr	r6, r0, #0x8
	ldr	r5, [sp]
	ldr	r4, [r5]
	add	r7, r7, r4
	ldr	r0, [r5, #0x4]
	str	r0, [sp, #0x8]
	add	r6, r6, r0
	lsl	r1, r2, #0x18
	lsr	r1, r1, #0x18
	add	r0, r1, #0
	add	r0, r0, #0x40
	lsl	r0, r0, #0x1
	add	r0, r0, r3
	mov	r2, #0x0
	ldsh	r0, [r0, r2]
	mov	r5, #0xc0
	lsl	r5, r5, #0x1
	mul	r0, r0, r5
	asr	r2, r0, #0x8
	lsl	r1, r1, #0x1
	add	r1, r1, r3
	mov	r3, #0x0
	ldsh	r0, [r1, r3]
	mul	r0, r0, r5
	asr	r0, r0, #0x8
	ldr	r5, [sp, #0x4]
	ldr	r1, [r5]
	add	r2, r2, r1
	ldr	r3, [r5, #0x4]
	mov	r9, r3
	ADD r0, r9
	add	r2, r7, r2
	asr	r7, r2, #0x1
	add	r0, r6, r0
	asr	r6, r0, #0x1
	sub	r0, r7, r4
	mov	r5, ip
	mul	r5, r5, r0
	add	r0, r5, #0
	asr	r0, r0, #0xa
	add	r4, r4, r0
	ldr	r2, [sp, #0x8]
	sub	r0, r6, r2
	mov	r3, ip
	mul	r3, r3, r0
	add	r0, r3, #0
	asr	r0, r0, #0xa
	add	r5, r2, r0
	sub	r1, r1, r7
	mov	r0, ip
	mul	r0, r0, r1
	asr	r0, r0, #0xa
	add	r0, r7, r0
	mov	r1, r9
	sub	r3, r1, r6
	mov	r1, ip
	mul	r1, r1, r3
	asr	r1, r1, #0xa
	add	r1, r6, r1
	sub	r0, r0, r4
	mov	r2, ip
	mul	r2, r2, r0
	add	r0, r2, #0
	asr	r0, r0, #0xa
	add	r7, r4, r0
	sub	r1, r1, r5
	mov	r0, ip
	mul	r0, r0, r1
	asr	r0, r0, #0xa
	add	r6, r5, r0
	mov	r3, r8
	str	r7, [r3]
	str	r6, [r3, #0x4]
	b	.L14
.L16:
	.align	2, 0
.L15:
	.4byte	0x874cc3c
.L9:
	ldr	r4, [sp, #0x4]
	ldr	r0, [r4]
	ldr	r5, [sp]
	ldr	r1, [r5]
	sub	r0, r0, r1
	mov	r2, ip
	mul	r2, r2, r0
	add	r0, r2, #0
	asr	r0, r0, #0xa
	add	r1, r1, r0
	mov	r3, r8
	str	r1, [r3]
	ldr	r0, [r4, #0x4]
	ldr	r1, [r5, #0x4]
	sub	r0, r0, r1
	mov	r4, ip
	mul	r4, r4, r0
	add	r0, r4, #0
	asr	r0, r0, #0xa
	add	r1, r1, r0
	str	r1, [r3, #0x4]
.L14:
	ldr	r5, [sp, #0x4]
	ldr	r0, [r5, #0x8]
	ldr	r2, [sp]
	ldr	r1, [r2, #0x8]
	sub	r0, r0, r1
	mov	r3, ip
	mul	r3, r3, r0
	add	r0, r3, #0
	asr	r0, r0, #0xa
	add	r1, r1, r0
	mov	r4, r8
	str	r1, [r4, #0x8]
	mov	r5, ip
	str	r5, [r4, #0xc]
	mov	r0, sl
	str	r0, [r4, #0x10]
	mov	r0, r8
	add	sp, sp, #0xc
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805DD18

.align 2, 0 @ Don't pad with nop.
