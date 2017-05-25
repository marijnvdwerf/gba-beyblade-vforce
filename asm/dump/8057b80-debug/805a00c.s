	.include "asm/common.inc"

	thumb_func_start sub_805A00C
sub_805A00C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	ldr	r5, .L1
	asr	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	add	r4, r0, #0
	add	r4, r4, #0x40
	lsl	r4, r4, #0x1
	add	r4, r4, r5
	mov	r7, #0x0
	ldsh	r6, [r4, r7]
	mov	sl, r6
	asr	r1, r1, #0x1
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r4, r1, #0
	add	r4, r4, #0x40
	lsl	r4, r4, #0x1
	add	r4, r4, r5
	mov	r7, #0x0
	ldsh	r6, [r4, r7]
	mov	ip, r6
	asr	r2, r2, #0x1
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	add	r4, r2, #0
	add	r4, r4, #0x40
	lsl	r4, r4, #0x1
	add	r4, r4, r5
	mov	r7, #0x0
	ldsh	r6, [r4, r7]
	mov	r9, r6
	lsl	r0, r0, #0x1
	add	r0, r0, r5
	mov	r4, #0x0
	ldsh	r6, [r0, r4]
	lsl	r1, r1, #0x1
	add	r1, r1, r5
	mov	r0, #0x0
	ldsh	r7, [r1, r0]
	mov	r8, r7
	lsl	r2, r2, #0x1
	add	r2, r2, r5
	mov	r1, #0x0
	ldsh	r5, [r2, r1]
	mov	r2, r9
	mov	r4, ip
	mul	r4, r4, r2
	asr	r4, r4, #0x8
	mov	r2, r8
	mul	r2, r2, r5
	asr	r2, r2, #0x8
	mov	r0, sl
	mul	r0, r0, r4
	add	r1, r6, #0
	mul	r1, r1, r2
	add	r0, r0, r1
	asr	r0, r0, #0x8
	str	r0, [r3, #0xc]
	add	r0, r6, #0
	mul	r0, r0, r4
	mov	r1, sl
	mul	r1, r1, r2
	sub	r0, r0, r1
	asr	r0, r0, #0x8
	str	r0, [r3]
	mov	r0, sl
	mul	r0, r0, r7
	mov	r4, r9
	mul	r4, r4, r0
	add	r0, r4, #0
	mov	r1, ip
	mul	r1, r1, r6
	mul	r1, r1, r5
	add	r0, r0, r1
	asr	r0, r0, #0x10
	str	r0, [r3, #0x4]
	mov	r7, ip
	mov	r0, sl
	mul	r0, r0, r7
	mul	r0, r0, r5
	mov	r1, r8
	mul	r1, r1, r6
	mov	r2, r9
	mul	r2, r2, r1
	add	r1, r2, #0
	sub	r0, r0, r1
	asr	r0, r0, #0x10
	str	r0, [r3, #0x8]
	add	r0, r3, #0
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L2:
	.align	2, 0
.L1:
	.4byte	0x874cc3c
	thumb_func_end sub_805A00C

.align 2, 0 @ Don't pad with nop.
