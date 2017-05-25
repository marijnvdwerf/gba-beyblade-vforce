	.include "asm/common.inc"

	thumb_func_start sub_805A1DC
sub_805A1DC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff8
	ldr	r2, [r0]
	lsl	r3, r2, #0x1
	str	r3, [sp, #0x4]
	ldr	r3, [r0, #0x4]
	lsl	r6, r3, #0x1
	ldr	r4, [r0, #0x8]
	mov	sl, r4
	lsl	r4, r4, #0x1
	ldr	r7, [sp, #0x4]
	add	r5, r2, #0
	mul	r5, r5, r7
	asr	r5, r5, #0x8
	mov	ip, r5
	add	r5, r2, #0
	mul	r5, r5, r6
	asr	r5, r5, #0x8
	add	r7, r2, #0
	mul	r7, r7, r4
	add	r2, r7, #0
	asr	r2, r2, #0x8
	mov	r9, r2
	add	r2, r3, #0
	mul	r2, r2, r6
	asr	r2, r2, #0x8
	str	r2, [sp]
	add	r7, r3, #0
	mul	r7, r7, r4
	add	r2, r7, #0
	asr	r2, r2, #0x8
	mov	r8, r2
	mov	r2, sl
	mul	r2, r2, r4
	asr	r2, r2, #0x8
	ldr	r0, [r0, #0xc]
	ldr	r7, [sp, #0x4]
	add	r3, r0, #0
	mul	r3, r3, r7
	asr	r3, r3, #0x8
	mov	sl, r3
	mul	r6, r6, r0
	asr	r6, r6, #0x8
	add	r3, r0, #0
	mul	r3, r3, r4
	asr	r3, r3, #0x8
	ldr	r4, [sp]
	add	r0, r4, r2
	mov	r4, #0x80
	lsl	r4, r4, #0x1
	sub	r0, r4, r0
	str	r0, [r1]
	sub	r0, r5, r3
	str	r0, [r1, #0x4]
	mov	r7, r9
	add	r0, r7, r6
	str	r0, [r1, #0x8]
	add	r5, r5, r3
	str	r5, [r1, #0xc]
	ADD r2, ip
	sub	r2, r4, r2
	str	r2, [r1, #0x10]
	mov	r2, r8
	mov	r3, sl
	sub	r0, r2, r3
	str	r0, [r1, #0x14]
	add	r5, r7, #0
	sub	r5, r5, r6
	str	r5, [r1, #0x18]
	ADD r8, sl
	mov	r7, r8
	str	r7, [r1, #0x1c]
	ldr	r0, [sp]
	ADD ip, r0
	mov	r2, ip
	sub	r4, r4, r2
	str	r4, [r1, #0x20]
	add	sp, sp, #0x8
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805A1DC

.align 2, 0 @ Don't pad with nop.
