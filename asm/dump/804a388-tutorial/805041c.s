	.include "asm/common.inc"

	thumb_func_start sub_805041C
sub_805041C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	r5, r0, #0
	ldr	r4, [r5, #0x8]
	ldr	r0, [r5, #0x4]
	ldr	r6, [r0]
	ldrh	r1, [r5, #0xe]
	mov	r7, #0x0
	mov	r2, #0xc
	ldsh	r0, [r5, r2]
	cmp	r7, r0
	bge	.L1	@cond_branch
	mov	r0, #0x3
	mov	r8, r0
	mov	r2, r8
	and	r2, r2, r1
	mov	r8, r2
	mov	r0, #0x1
	mov	ip, r0
	mov	r2, ip
	and	r2, r2, r1
	mov	ip, r2
	mov	r0, #0x4
	and	r1, r1, r0
	lsl	r0, r1, #0x10
	lsr	r0, r0, #0x10
	mov	r9, r0
.L13:
	ldr	r3, [r4]
	ldr	r2, [r4, #0x8]
	add	r3, r3, r2
	str	r3, [r4]
	ldr	r0, [r4, #0x4]
	ldr	r1, [r4, #0xc]
	add	r0, r0, r1
	str	r0, [r4, #0x4]
	ldr	r0, [r4, #0x10]
	add	r2, r2, r0
	str	r2, [r4, #0x8]
	ldr	r0, [r4, #0x14]
	add	r1, r1, r0
	str	r1, [r4, #0xc]
	str	r3, [r6, #0x8]
	ldr	r0, [r4, #0x4]
	str	r0, [r6, #0xc]
	mov	r0, r8
	cmp	r0, #0
	beq	.L12	@cond_branch
	mov	r1, ip
	cmp	r1, #0
	beq	.L3	@cond_branch
	ldr	r0, [r4]
	ldr	r2, [r4, #0x8]
	b	.L4
.L3:
	ldr	r0, [r4, #0x4]
	ldr	r2, [r4, #0xc]
.L4:
	ldr	r1, [r5, #0x10]
	sub	r3, r0, r1
	add	r0, r0, r2
	sub	r0, r0, r1
	cmp	r3, #0
	bgt	.L5	@cond_branch
	cmp	r0, #0
	bgt	.L6	@cond_branch
	cmp	r3, #0
	blt	.L12	@cond_branch
.L5:
	cmp	r0, #0
	bge	.L12	@cond_branch
.L6:
	mov	r0, r9
	cmp	r0, #0
	beq	.L9	@cond_branch
	ldr	r0, [r5, #0x14]
	mul	r0, r0, r2
	NEG	r0, r0
	asr	r2, r0, #0x8
	b	.L10
.L9:
	mov	r2, #0x0
.L10:
	add	r0, r1, #0
	mov	r1, ip
	cmp	r1, #0
	beq	.L11	@cond_branch
	str	r0, [r4]
	str	r2, [r4, #0x8]
	b	.L12
.L11:
	str	r0, [r4, #0x4]
	str	r2, [r4, #0xc]
.L12:
	ldr	r6, [r6, #0x4]
	add	r4, r4, #0x18
	add	r7, r7, #0x1
	mov	r2, #0xc
	ldsh	r0, [r5, r2]
	cmp	r7, r0
	blt	.L13	@cond_branch
.L1:
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805041C

.align 2, 0 @ Don't pad with nop.
