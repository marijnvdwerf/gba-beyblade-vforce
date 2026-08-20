	.include "asm/common.inc"

	thumb_func_start newCollisionDataRam
newCollisionDataRam:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	r5, r0, #0
	lsl	r2, r2, #0x10
	lsr	r6, r2, #0x10
	ldr	r0, [r1]
	lsl	r0, r0, #0x4
	mov	r8, r0
	ldr	r0, [r1, #0x8]
	lsl	r0, r0, #0x5
	mov	r9, r0
	mov	r7, #0x0
	mov	r4, #0x0
	str	r1, [r5]
	ldr	r0, [r1, #0x10]
	add	r0, r1, r0
	str	r0, [r5, #0x4]
	ldr	r0, [r1, #0x14]
	add	r0, r1, r0
	str	r0, [r5, #0x8]
	ldr	r0, [r1, #0x18]
	add	r1, r1, r0
	str	r1, [r5, #0xc]
	mov	r1, #0x8c
	lsl	r1, r1, #0x1
	add	r0, r5, r1
	strh	r6, [r0]
	mov	r0, #0x1
	and	r0, r0, r6
	cmp	r0, #0
	beq	.L805B97C	@cond_branch
	mov	r7, r8
.L805B97C:
	mov	r0, #0x2
	and	r0, r0, r6
	cmp	r0, #0
	beq	.L805B986	@cond_branch
	ADD r7, r9
.L805B986:
	cmp	r7, #0
	beq	.L805B994	@cond_branch
	add	r0, r7, #0
	bl	slowAllocate
	str	r0, [r5, #0x10]
	b	.L805B996
.L805B994:
	str	r4, [r5, #0x10]
.L805B996:
	ldr	r1, [r5, #0x10]
	cmp	r1, #0
	bne	.L805B9AC	@cond_branch
	ldr	r0, .L805B9A8
	add	r1, r7, #0
	bl	printf
	b	.L805B9E0
.L805B9A6:
	.align	2, 0
.L805B9A8:
	.4byte	Str_875540C
.L805B9AC:
	ldr	r4, [r1]
	mov	r0, #0x1
	and	r0, r0, r6
	cmp	r0, #0
	beq	.L805B9C8	@cond_branch
	ldr	r1, .L805BA34
	ldr	r0, [r5, #0x4]
	ldr	r3, [r1]
	add	r1, r4, #0
	mov	r2, r8
	bl	_call_via_r3
	str	r4, [r5, #0x4]
	ADD r4, r8
.L805B9C8:
	mov	r0, #0x2
	and	r0, r0, r6
	cmp	r0, #0
	beq	.L805B9E0	@cond_branch
	ldr	r1, .L805BA34
	ldr	r0, [r5, #0xc]
	ldr	r3, [r1]
	add	r1, r4, #0
	mov	r2, r9
	bl	_call_via_r3
	str	r4, [r5, #0xc]
.L805B9E0:
	ldr	r0, [r5]
	ldrh	r4, [r0, #0x4]
	mov	r1, #0x4
	ldsh	r0, [r0, r1]
	cmp	r0, #0x40
	ble	.L805B9F4	@cond_branch
	mov	r4, #0x40
	ldr	r0, .L805BA34 + 4
	bl	nullsub_8
.L805B9F4:
	lsl	r0, r4, #0x10
	mov	r1, #0x0
	add	r6, r0, #0
	cmp	r6, #0
	ble	.L805BA1E	@cond_branch
.L805B9FE:
	lsl	r4, r1, #0x10
	asr	r4, r4, #0x10
	add	r0, r5, #0
	add	r1, r4, #0
	bl	GetSplineAtIndex
	lsl	r2, r4, #0x2
	add	r1, r5, #0
	add	r1, r1, #0x14
	add	r1, r1, r2
	str	r0, [r1]
	add	r4, r4, #0x1
	lsl	r4, r4, #0x10
	lsr	r1, r4, #0x10
	cmp	r4, r6
	blt	.L805B9FE	@cond_branch
.L805BA1E:
	mov	r0, #0x8a
	lsl	r0, r0, #0x1
	add	r1, r5, r0
	mov	r0, #0x0
	str	r0, [r1]
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L805BA34:
	.align	2, 0

	.4byte	__fastMemoryCopyARM
	.4byte	Str_87553D0
	thumb_func_end newCollisionDataRam

.align 2, 0 @ Don't pad with nop.
