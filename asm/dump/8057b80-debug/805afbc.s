	.include "asm/common.inc"

	thumb_func_start sub_805AFBC
sub_805AFBC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	r6, r0, #0
	lsl	r1, r1, #0x18
	ldr	r4, [r6, #0x24]
	ldr	r2, [r6, #0x14]
	mov	r5, #0x1
	NEG	r5, r5
	cmp	r1, #0
	beq	.L5	@cond_branch
	mov	r5, #0x1
	b	.L5
.L9:
	add	r4, r4, r5
	ldr	r0, [r6, #0x14]
	cmp	r4, #0
	bge	.L3	@cond_branch
	add	r4, r4, r0
.L3:
	cmp	r4, r0
	blt	.L4	@cond_branch
	mov	r4, #0x0
.L4:
	mov	r3, #0x4c
	add	r0, r4, #0
	mul	r0, r0, r3
	ldr	r1, [r6, #0xc]
	add	r0, r0, r1
	mov	r8, r0
	add	r0, r0, #0x44
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L5	@cond_branch
	ldr	r7, [r6, #0x24]
	cmp	r7, r4
	beq	.L8	@cond_branch
	add	r0, r7, #0
	mul	r0, r0, r3
	add	r1, r1, r0
	mov	r9, r1
	str	r4, [r6, #0x24]
	add	r0, r6, #0
	add	r0, r0, #0x2c
	ldrb	r1, [r0]
	mov	r0, r9
	bl	sub_806185C
	add	r0, r6, #0
	add	r0, r0, #0x2e
	ldrb	r1, [r0]
	mov	r0, r8
	bl	sub_806185C
	ldr	r5, [r6, #0x30]
	cmp	r5, #0
	beq	.L8	@cond_branch
	mov	r0, r9
	add	r1, r7, #0
	mov	r2, r8
	add	r3, r4, #0
	bl	call_via_r5
	b	.L8
.L5:
	add	r0, r2, #0
	sub	r2, r2, #0x1
	cmp	r0, #0
	bne	.L9	@cond_branch
.L8:
	ldr	r0, [r6, #0x24]
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805AFBC

.align 2, 0 @ Don't pad with nop.
