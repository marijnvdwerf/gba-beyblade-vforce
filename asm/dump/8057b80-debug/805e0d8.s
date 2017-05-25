	.include "asm/common.inc"

	thumb_func_start sub_805E0D8
sub_805E0D8:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	r4, r0, #0
	mov	r8, r2
	cmp	r1, #0
	beq	.L2	@cond_branch
	add	r0, r1, #0
	add	r0, r0, #0x20
	lsl	r1, r3, #0x2
	add	r1, r1, r0
	ldr	r0, [r1]
	lsl	r0, r0, #0x4
	ldr	r2, [r4, #0x4]
	add	r4, r2, r0
	ldr	r0, [r1, #0x4]
	lsl	r0, r0, #0x4
	add	r6, r2, r0
	ldr	r0, [sp, #0x28]
	ldr	r1, [sp, #0x20]
	sub	r7, r0, r1
	ldr	r0, [sp, #0x2c]
	ldr	r3, [sp, #0x24]
	sub	r2, r0, r3
	ldr	r0, [r6]
	ldr	r1, [r4]
	mov	ip, r1
	mov	r3, ip
	sub	r3, r0, r3
	mov	r9, r3
	ldr	r0, [r6, #0x4]
	ldr	r3, [r4, #0x4]
	sub	r0, r0, r3
	mov	sl, r0
	mov	r1, r9
	mul	r1, r1, r2
	mov	r0, sl
	mul	r0, r0, r7
	sub	r5, r1, r0
	cmp	r5, #0
	beq	.L2	@cond_branch
	ldr	r1, [sp, #0x24]
	sub	r0, r3, r1
	mul	r0, r0, r7
	ldr	r3, [sp, #0x20]
	add	r1, r2, #0
	mul	r1, r1, r3
	add	r0, r0, r1
	mov	r1, ip
	mul	r1, r1, r2
	sub	r0, r0, r1
	lsl	r0, r0, #0xa
	add	r1, r5, #0
	bl	Div
	mov	r1, r9
	mul	r1, r1, r0
	asr	r1, r1, #0xa
	ldr	r3, [r4]
	add	r3, r3, r1
	mov	r1, sl
	mul	r1, r1, r0
	asr	r1, r1, #0xa
	ldr	r2, [r4, #0x4]
	add	r2, r2, r1
	mov	r1, r8
	str	r3, [r1]
	str	r2, [r1, #0x4]
	ldr	r1, [r6, #0x8]
	ldr	r2, [r4, #0x8]
	sub	r1, r1, r2
	mul	r1, r1, r0
	asr	r1, r1, #0xa
	add	r2, r2, r1
	mov	r3, r8
	str	r2, [r3, #0x8]
	str	r0, [r3, #0xc]
	mov	r0, #0x1
	b	.L3
.L2:
	mov	r0, #0x0
.L3:
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805E0D8

.align 2, 0 @ Don't pad with nop.
