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
	bge	.L80504D8	@cond_branch
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
.L8050456:
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
	beq	.L80504CA	@cond_branch
	mov	r1, ip
	cmp	r1, #0
	beq	.L805048A	@cond_branch
	ldr	r0, [r4]
	ldr	r2, [r4, #0x8]
	b	.L805048E
.L805048A:
	ldr	r0, [r4, #0x4]
	ldr	r2, [r4, #0xc]
.L805048E:
	ldr	r1, [r5, #0x10]
	sub	r3, r0, r1
	add	r0, r0, r2
	sub	r0, r0, r1
	cmp	r3, #0
	bgt	.L80504A2	@cond_branch
	cmp	r0, #0
	bgt	.L80504A6	@cond_branch
	cmp	r3, #0
	blt	.L80504CA	@cond_branch
.L80504A2:
	cmp	r0, #0
	bge	.L80504CA	@cond_branch
.L80504A6:
	mov	r0, r9
	cmp	r0, #0
	beq	.L80504B6	@cond_branch
	ldr	r0, [r5, #0x14]
	mul	r0, r0, r2
	neg	r0, r0
	asr	r2, r0, #0x8
	b	.L80504B8
.L80504B6:
	mov	r2, #0x0
.L80504B8:
	add	r0, r1, #0
	mov	r1, ip
	cmp	r1, #0
	beq	.L80504C6	@cond_branch
	str	r0, [r4]
	str	r2, [r4, #0x8]
	b	.L80504CA
.L80504C6:
	str	r0, [r4, #0x4]
	str	r2, [r4, #0xc]
.L80504CA:
	ldr	r6, [r6, #0x4]
	add	r4, r4, #0x18
	add	r7, r7, #0x1
	mov	r2, #0xc
	ldsh	r0, [r5, r2]
	cmp	r7, r0
	blt	.L8050456	@cond_branch
.L80504D8:
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805041C

.align 2, 0 @ Don't pad with nop.
