	.include "asm/common.inc"

	thumb_func_start deallocateBlock
deallocateBlock:
	push	{r4, r5, r6, lr}
	add	r6, r0, #0
	ldr	r4, [r6, #0xc]
	ldr	r5, [r6, #0x8]
	ldr	r0, [r6]
	cmp	r0, #0
	bne	.L1	@cond_branch
	ldr	r0, .L6
	bl	printf
.L1:
	cmp	r5, #0
	bne	.L2	@cond_branch
	cmp	r4, #0
	bne	.L3	@cond_branch
	ldr	r0, .L6 + 4
	ldr	r1, [r6]
	cmp	r1, r0
	bhi	.L4	@cond_branch
	ldr	r0, .L6 + 8
	str	r4, [r0]
	b	.L19
.L7:
	.align	2, 0
.L6:
	.4byte	0x8755230
	.4byte	0x203ffff
	.4byte	0x3001150
.L4:
	ldr	r0, .L9
	str	r4, [r0]
	b	.L19
.L10:
	.align	2, 0
.L9:
	.4byte	0x3005c84
.L3:
	ldr	r0, .L13
	ldr	r1, [r6]
	cmp	r1, r0
	bhi	.L11	@cond_branch
	ldr	r0, .L13 + 4
	b	.L12
.L14:
	.align	2, 0
.L13:
	.4byte	0x203ffff
	.4byte	0x3001150
.L11:
	ldr	r0, .L17
.L12:
	str	r4, [r0]
	cmp	r4, #0
	beq	.L19	@cond_branch
	mov	r0, #0x0
	str	r0, [r4, #0x8]
	b	.L19
.L18:
	.align	2, 0
.L17:
	.4byte	0x3005c84
.L2:
	str	r4, [r5, #0xc]
	ldr	r1, [r6]
	cmp	r4, #0
	beq	.L19	@cond_branch
	str	r5, [r4, #0x8]
.L19:
	ldr	r0, .L22
	cmp	r1, r0
	bhi	.L20	@cond_branch
	ldr	r1, .L22 + 4
	b	.L21
.L23:
	.align	2, 0
.L22:
	.4byte	0x203ffff
	.4byte	0x300115c
.L20:
	ldr	r1, .L24
.L21:
	ldr	r0, [r1]
	sub	r0, r0, #0x1
	str	r0, [r1]
	mov	r0, #0x0
	str	r0, [r6, #0x4]
	str	r0, [r6]
	str	r0, [r6, #0xc]
	str	r0, [r6, #0x8]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L25:
	.align	2, 0
.L24:
	.4byte	0x3005c88
	thumb_func_end deallocateBlock

.align 2, 0 @ Don't pad with nop.
