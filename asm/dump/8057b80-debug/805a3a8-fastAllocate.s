	.include "asm/common.inc"

	thumb_func_start fastAllocate
fastAllocate:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff8
	add	r6, r0, #0
	ldr	r5, .L4
	ldr	r1, [r5]
	ldr	r2, .L4 + 4
	cmp	r1, #0
	bne	.L1	@cond_branch
	ldr	r0, [r2]
	str	r0, [r5]
	ldr	r0, .L4 + 8
	str	r1, [r0]
	ldr	r0, .L4 + 12
	str	r1, [r0]
.L1:
	ldr	r0, [r2]
	mov	r1, #0x20
	bl	getValidAllocatedBlock
	add	r4, r0, #0
	cmp	r4, #0
	bne	.L2	@cond_branch
	ldr	r0, .L4 + 16
	add	r1, r6, #0
	bl	printf
.L2:
	ldr	r1, .L4 + 20
	ldr	r2, .L4 + 24
	ldr	r3, [r5]
	str	r4, [sp]
	str	r5, [sp, #0x4]
	add	r0, r6, #0
	bl	sub_805A53C
	add	r2, r0, #0
	cmp	r2, #0
	beq	.L3	@cond_branch
	ldr	r1, .L4 + 8
	ldr	r0, [r1]
	add	r0, r0, #0x1
	str	r0, [r1]
.L3:
	add	r0, r2, #0
	add	sp, sp, #0x8
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L5:
	.align	2, 0
.L4:
	.4byte	0x3005c84
	.4byte	0x3005c80
	.4byte	0x3005c88
	.4byte	0x3005c8c
	.4byte	0x87551c0
	.4byte	0x3001160
	.4byte	0x4b20
	thumb_func_end fastAllocate

.align 2, 0 @ Don't pad with nop.
