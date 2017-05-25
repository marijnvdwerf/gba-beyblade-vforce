	.include "asm/common.inc"

	thumb_func_start sub_80608CC
sub_80608CC:
	push	{r4, lr}
	ldr	r0, .L5
	ldr	r4, [r0]
	ldr	r0, .L5 + 4
	bl	printf
	cmp	r4, #0
	beq	.L1	@cond_branch
.L2:
	ldrh	r1, [r4]
	ldrh	r0, [r4, #0x2]
	add	r2, r0, r1
	ldr	r0, .L5 + 8
	bl	printf
	ldr	r4, [r4, #0x4]
	cmp	r4, #0
	bne	.L2	@cond_branch
.L1:
	ldr	r0, .L5 + 12
	ldr	r4, [r0]
	mov	r1, #0x0
	ldr	r0, .L5 + 16
	cmp	r4, #0
	beq	.L3	@cond_branch
.L4:
	add	r1, r1, #0x1
	ldr	r4, [r4, #0x4]
	cmp	r4, #0
	bne	.L4	@cond_branch
.L3:
	bl	printf
	ldr	r0, .L5 + 20
	ldr	r1, .L5 + 24
	ldr	r1, [r1]
	bl	printf
	pop	{r4}
	pop	{r0}
	bx	r0
.L6:
	.align	2, 0
.L5:
	.4byte	0x3005dc8
	.4byte	0x8755a64
	.4byte	0x8755a78
	.4byte	0x3005dd8
	.4byte	0x8755a88
	.4byte	0x8755aa0
	.4byte	0x3005df4
	thumb_func_end sub_80608CC

.align 2, 0 @ Don't pad with nop.
