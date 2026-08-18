	.include "asm/common.inc"

	thumb_func_start sub_804D8D8
sub_804D8D8:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	r7, r0, #0
	add	r0, r0, #0x50
	mov	r2, #0x0
	ldsh	r1, [r0, r2]
	add	r0, r0, #0x2
	mov	r3, #0x0
	ldsh	r2, [r0, r3]
	add	r0, r0, #0x2
	mov	r5, #0x0
	ldsh	r4, [r0, r5]
	add	r0, r0, #0x4
	mov	r5, #0x0
	ldsh	r3, [r0, r5]
	mov	sl, r3
	ldr	r5, [r7, #0x40]
	ldr	r6, [r7, #0x44]
	add	r0, r5, #0
	mul	r0, r0, r1
	asr	r0, r0, #0x8
	mov	r9, r0
	add	r0, r6, #0
	mul	r0, r0, r2
	asr	r0, r0, #0x8
	mov	r8, r0
	mov	r1, #0x80
	lsl	r1, r1, #0xd
	add	r0, r7, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804D924	@cond_branch
	mov	r4, sl
.L804D924:
	mov	r1, #0x80
	lsl	r1, r1, #0xf
	add	r0, r7, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804D940	@cond_branch
	add	r0, r7, #0
	add	r0, r0, #0x5a
	mov	r2, #0x0
	ldsh	r1, [r0, r2]
	mov	sl, r1
	b	.L804D94A
.L804D940:
	add	r0, r7, #0
	add	r0, r0, #0x56
	mov	r1, #0x0
	ldsh	r3, [r0, r1]
	mov	sl, r3
.L804D94A:
	add	r0, r5, #0
	cmp	r5, #0
	bge	.L804D952	@cond_branch
	NEG	r0, r5
.L804D952:
	cmp	r4, r0
	ble	.L804D964	@cond_branch
	mov	r9, r5
	mov	r1, #0x80
	lsl	r1, r1, #0xd
	add	r0, r7, #0
	bl	UnsetRiderFlag
	b	.L804D96E
.L804D964:
	mov	r1, #0x80
	lsl	r1, r1, #0xd
	add	r0, r7, #0
	bl	SetRiderFlag
.L804D96E:
	add	r0, r6, #0
	cmp	r6, #0
	bge	.L804D976	@cond_branch
	NEG	r0, r6
.L804D976:
	cmp	sl, r0
	ble	.L804D988	@cond_branch
	mov	r8, r6
	mov	r1, #0x80
	lsl	r1, r1, #0xf
	add	r0, r7, #0
	bl	UnsetRiderFlag
	b	.L804D992
.L804D988:
	mov	r1, #0x80
	lsl	r1, r1, #0xf
	add	r0, r7, #0
	bl	SetRiderFlag
.L804D992:
	mov	r2, r9
	cmp	r2, #0
	bne	.L804D9AA	@cond_branch
	cmp	r5, #0
	beq	.L804D9AA	@cond_branch
	mov	r3, #0x1
	mov	r9, r3
	cmp	r5, #0
	bge	.L804D9AA	@cond_branch
	mov	r0, #0x1
	NEG	r0, r0
	mov	r9, r0
.L804D9AA:
	mov	r1, r8
	cmp	r1, #0
	bne	.L804D9C2	@cond_branch
	cmp	r6, #0
	beq	.L804D9C2	@cond_branch
	mov	r2, #0x1
	mov	r8, r2
	cmp	r6, #0
	bge	.L804D9C2	@cond_branch
	mov	r3, #0x1
	NEG	r3, r3
	mov	r8, r3
.L804D9C2:
	mov	r0, r9
	sub	r5, r5, r0
	mov	r1, r8
	sub	r6, r6, r1
	add	r0, r7, #0
	add	r0, r0, #0x8c
	str	r6, [r0]
	sub	r0, r0, #0x2c
	mov	r2, #0x0
	mov	r8, r2
	strh	r5, [r0]
	str	r5, [r7, #0x40]
	str	r6, [r7, #0x44]
	ldr	r0, [r7, #0x48]
	sub	r0, r0, r5
	str	r0, [r7, #0x48]
	ldr	r0, [r7, #0x4c]
	sub	r0, r0, r6
	str	r0, [r7, #0x4c]
	add	r0, r5, #0
	mul	r0, r0, r5
	add	r1, r6, #0
	mul	r1, r1, r6
	add	r0, r0, r1
	bl	Sqrt
	add	r4, r0, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	ldr	r0, [r7, #0x40]
	lsl	r0, r0, #0x8
	add	r1, r4, #0
	bl	__divsi3
	add	r5, r7, #0
	add	r5, r5, #0x5c
	strh	r0, [r5]
	ldr	r0, [r7, #0x44]
	lsl	r0, r0, #0x8
	add	r1, r4, #0
	bl	__divsi3
	add	r1, r7, #0
	add	r1, r1, #0x5e
	strh	r0, [r1]
	mov	r3, #0x0
	ldsh	r0, [r5, r3]
	mov	r5, #0x0
	ldsh	r1, [r1, r5]
	bl	sub_8057878
	add	r1, r7, #0
	add	r1, r1, #0x62
	strh	r0, [r1]
	str	r4, [r7, #0x64]
	mov	r0, r8
	str	r0, [r7, #0x68]
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804D8D8

.align 2, 0 @ Don't pad with nop.
