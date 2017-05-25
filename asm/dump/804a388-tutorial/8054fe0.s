	.include "asm/common.inc"

	thumb_func_start sub_8054FE0
sub_8054FE0:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	ldr	r0, .L6
	ldr	r1, [r0]
	ldr	r2, .L6 + 4
	add	r0, r1, r2
	ldr	r6, [r0]
	mov	r3, #0xc8
	lsl	r3, r3, #0x4
	add	r0, r1, r3
	ldr	r0, [r0]
	mov	r8, r0
	sub	r2, r2, #0x8
	add	r0, r1, r2
	ldr	r2, [r0]
	sub	r3, r3, #0x8
	add	r1, r1, r3
	ldr	r1, [r1]
	mov	r9, r1
	add	r0, r6, #0
	sub	r6, r6, #0x1
	cmp	r0, #0
	beq	.L5	@cond_branch
	add	r4, r2, #0
	add	r4, r4, #0xb4
.L4:
	ldr	r0, [r4]
	bl	GetStruct4
	add	r5, r0, #0
	ldr	r0, [r4, #0x4]
	cmp	r0, #0
	beq	.L2	@cond_branch
	bl	sub_8060A94
.L2:
	mov	r7, #0x0
	str	r7, [r4, #0x4]
	ldr	r0, [r5, #0x4]
	cmp	r0, #0
	beq	.L3	@cond_branch
	bl	sub_8060A94
.L3:
	str	r7, [r5, #0x4]
	add	r4, r4, #0xc4
	add	r0, r6, #0
	sub	r6, r6, #0x1
	cmp	r0, #0
	bne	.L4	@cond_branch
	b	.L5
.L7:
	.align	2, 0
.L6:
	.4byte	0x3000fb0
	.4byte	0xc84
.L9:
	mov	r2, r9
	ldr	r0, [r2]
	cmp	r0, #0
	beq	.L8	@cond_branch
	bl	sub_8060A94
.L8:
	mov	r3, #0x1c
	ADD r9, r3
.L5:
	mov	r0, r8
	mov	r1, #0x1
	NEG	r1, r1
	ADD r8, r1
	cmp	r0, #0
	bne	.L9	@cond_branch
	ldr	r5, .L11
	ldr	r0, [r5]
	ldr	r4, .L11 + 4
	add	r0, r0, r4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L10	@cond_branch
	bl	deallocateBlock
.L10:
	ldr	r0, [r5]
	add	r1, r0, r4
	mov	r2, #0x0
	str	r2, [r1]
	ldr	r3, .L11 + 8
	add	r1, r0, r3
	str	r2, [r1]
	sub	r3, r3, #0x8
	add	r1, r0, r3
	str	r2, [r1]
	add	r3, r3, #0xc
	add	r1, r0, r3
	str	r2, [r1]
	ldr	r1, .L11 + 12
	add	r0, r0, r1
	str	r2, [r0]
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L12:
	.align	2, 0
.L11:
	.4byte	0x3000fb0
	.4byte	0xc74
	.4byte	0xc84
	.4byte	0xc8c
	thumb_func_end sub_8054FE0

.align 2, 0 @ Don't pad with nop.
