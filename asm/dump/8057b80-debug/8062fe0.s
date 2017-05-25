	.include "asm/common.inc"

	thumb_func_start sub_8062FE0
sub_8062FE0:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffffc
	add	r6, r0, #0
	ldr	r5, [r6, #0x8]
	ldr	r4, [r6, #0x4]
	ldr	r1, [r6, #0xc]
	ldr	r7, [r6, #0x10]
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	beq	.L1	@cond_branch
.L2:
	add	r0, r5, #0
	str	r1, [sp]
	bl	sub_80588A8
	add	r5, r5, #0xc4
	add	r0, r4, #0
	sub	r4, r4, #0x1
	ldr	r1, [sp]
	cmp	r0, #0
	bne	.L2	@cond_branch
.L1:
	ldr	r2, .L7
	ldr	r0, [r2]
	cmp	r0, r6
	bne	.L3	@cond_branch
	ldr	r0, [r6, #0xc]
	str	r0, [r2]
.L3:
	cmp	r1, #0
	bne	.L4	@cond_branch
	cmp	r7, #0
	bne	.L5	@cond_branch
	bl	allocateActorHeaps
	b	.L13
.L8:
	.align	2, 0
.L7:
	.4byte	0x3005e58
.L5:
	ldr	r0, .L10
	str	r7, [r0]
	str	r1, [r7, #0xc]
	b	.L13
.L11:
	.align	2, 0
.L10:
	.4byte	0x3005e60
.L4:
	str	r7, [r1, #0x10]
	cmp	r7, #0
	beq	.L12	@cond_branch
	str	r1, [r7, #0xc]
	b	.L13
.L12:
	ldr	r0, .L14
	ldr	r1, [r0]
	ldr	r2, [r6, #0x4]
	sub	r1, r1, r2
	str	r1, [r0]
.L13:
	mov	r0, #0x0
	str	r0, [r6, #0x8]
	add	sp, sp, #0x4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L15:
	.align	2, 0
.L14:
	.4byte	0x3005e64
	thumb_func_end sub_8062FE0

.align 2, 0 @ Don't pad with nop.
