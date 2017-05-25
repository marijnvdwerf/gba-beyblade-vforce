	.include "asm/common.inc"

	thumb_func_start sub_805A53C
sub_805A53C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	r5, r0, #0
	add	r7, r1, #0
	mov	r8, r2
	ldr	r4, [sp, #0x1c]
	ldr	r0, [r3]
	mov	r1, #0x0
	cmp	r0, #0
	beq	.L1	@cond_branch
	sub	r1, r0, r7
.L1:
	cmp	r1, r5
	bcc	.L2	@cond_branch
	str	r7, [r4]
	mov	r0, #0x0
	str	r0, [r4, #0x8]
	str	r3, [r4, #0xc]
	str	r5, [r4, #0x4]
	str	r4, [r3, #0x8]
	ldr	r0, [sp, #0x20]
	str	r4, [r0]
.L15:
	add	r0, r4, #0
	b	.L3
.L2:
	cmp	r3, #0
	beq	.L4	@cond_branch
	add	r0, r7, #0
	ADD r0, r8
	mov	r9, r0
.L10:
	ldr	r2, [r3, #0xc]
	cmp	r2, #0
	beq	.L5	@cond_branch
	ldr	r1, [r3]
	ldr	r0, [r3, #0x4]
	add	r1, r1, r0
	ldr	r0, [r2]
	sub	r0, r0, r1
	cmp	r0, r5
	bcs	.L6	@cond_branch
	add	r3, r2, #0
	b	.L9
.L5:
	ldr	r1, [r3]
	cmp	r1, #0
	beq	.L8	@cond_branch
	ldr	r0, [r3, #0x4]
	add	r6, r1, r0
	mov	r0, r9
	sub	r0, r0, r6
	mov	ip, r0
	b	.L9
.L8:
	add	r6, r7, #0
	mov	ip, r8
.L9:
	cmp	r2, #0
	bne	.L10	@cond_branch
.L4:
	cmp	ip, r5
	bcc	.L11	@cond_branch
	str	r6, [r4]
	str	r5, [r4, #0x4]
	mov	r0, #0x0
	str	r0, [r4, #0xc]
	cmp	r4, r3
	bne	.L12	@cond_branch
	str	r0, [r4, #0x8]
	b	.L15
.L12:
	str	r3, [r4, #0x8]
	str	r4, [r3, #0xc]
	b	.L15
.L6:
	str	r1, [r4]
	str	r3, [r4, #0x8]
	ldr	r0, [r3, #0xc]
	str	r0, [r4, #0xc]
	str	r5, [r4, #0x4]
	ldr	r0, [r3, #0xc]
	str	r4, [r0, #0x8]
	str	r4, [r3, #0xc]
	b	.L15
.L11:
	mov	r0, #0x0
.L3:
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805A53C

.align 2, 0 @ Don't pad with nop.
