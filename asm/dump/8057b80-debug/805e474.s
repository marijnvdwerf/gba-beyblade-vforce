	.include "asm/common.inc"

	thumb_func_start sub_805E474
sub_805E474:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	mov	ip, r0
	add	r6, r1, #0
	add	r5, r2, #0
	add	r4, r3, #0
	sub	r2, r0, r5
	sub	r3, r6, r4
	ldr	r1, [sp, #0x1c]
	sub	r0, r1, r4
	add	r1, r2, #0
	mul	r1, r1, r0
	ldr	r7, [sp, #0x18]
	sub	r0, r7, r5
	mul	r0, r0, r3
	sub	r1, r1, r0
	mov	r8, r1
	ldr	r1, [sp, #0x24]
	sub	r0, r1, r4
	add	r1, r2, #0
	mul	r1, r1, r0
	ldr	r2, [sp, #0x20]
	sub	r0, r2, r5
	mul	r0, r0, r3
	sub	r0, r1, r0
	mov	r7, r8
	cmp	r7, #0
	bgt	.L1	@cond_branch
	cmp	r0, #0
	blt	.L6	@cond_branch
	cmp	r7, #0
	blt	.L3	@cond_branch
.L1:
	cmp	r0, #0
	bgt	.L6	@cond_branch
.L3:
	ldr	r0, [sp, #0x18]
	ldr	r1, [sp, #0x20]
	sub	r2, r0, r1
	ldr	r7, [sp, #0x1c]
	ldr	r0, [sp, #0x24]
	sub	r3, r7, r0
	sub	r0, r6, r0
	add	r1, r2, #0
	mul	r1, r1, r0
	mov	r6, ip
	ldr	r7, [sp, #0x20]
	sub	r0, r6, r7
	mul	r0, r0, r3
	sub	r6, r1, r0
	ldr	r1, [sp, #0x24]
	sub	r0, r4, r1
	add	r1, r2, #0
	mul	r1, r1, r0
	sub	r0, r5, r7
	mul	r0, r0, r3
	sub	r0, r1, r0
	cmp	r6, #0
	bgt	.L5	@cond_branch
	cmp	r0, #0
	blt	.L6	@cond_branch
	cmp	r6, #0
	blt	.L8	@cond_branch
.L5:
	cmp	r0, #0
	ble	.L8	@cond_branch
.L6:
	mov	r0, #0x0
	b	.L10
.L8:
	mov	r0, #0x2
	mov	r2, r8
	cmp	r2, #0
	blt	.L10	@cond_branch
	mov	r0, #0x1
.L10:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805E474

.align 2, 0 @ Don't pad with nop.
