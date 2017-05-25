	.include "asm/common.inc"

	thumb_func_start sub_80604D4
sub_80604D4:
	push	{r4, r5, lr}
	add	r4, r0, #0
	cmp	r4, #0
	beq	.L1	@cond_branch
	ldr	r5, [r4]
	cmp	r5, #0
	beq	.L6	@cond_branch
	ldr	r0, .L7
	bl	printf
.L6:
	cmp	r5, #0
	beq	.L4	@cond_branch
	ldr	r0, [r5, #0x4]
	cmp	r0, r4
	beq	.L4	@cond_branch
	ldr	r0, .L7 + 4
	bl	printf
.L4:
	ldr	r0, [r4]
	cmp	r0, r5
	beq	.L5	@cond_branch
	ldr	r0, .L7 + 8
	bl	printf
.L5:
	add	r5, r4, #0
	ldr	r4, [r4, #0x4]
	cmp	r4, #0
	bne	.L6	@cond_branch
.L1:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L8:
	.align	2, 0
.L7:
	.4byte	0x87558f8
	.4byte	0x8755914
	.4byte	0x8755930
	thumb_func_end sub_80604D4

.align 2, 0 @ Don't pad with nop.
