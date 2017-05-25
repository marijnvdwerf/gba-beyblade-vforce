	.include "asm/common.inc"

	thumb_func_start sub_80434EC
sub_80434EC:
	push	{r4, r5, r6, r7, lr}
	add	r6, r0, #0
	mov	r1, #0x92
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L2	@cond_branch
	add	r1, r1, #0x90
	add	r0, r6, r1
	ldr	r5, [r0]
	sub	r4, r4, #0x1
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r4, r0
	beq	.L2	@cond_branch
	add	r7, r0, #0
.L3:
	add	r0, r5, #0
	bl	sub_805041C
	add	r5, r5, #0x18
	sub	r4, r4, #0x1
	cmp	r4, r7
	bne	.L3	@cond_branch
.L2:
	mov	r0, #0xa5
	lsl	r0, r0, #0x3
	add	r4, r6, r0
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L5	@cond_branch
	ldr	r1, .L6
	add	r5, r6, r1
	add	r0, r5, #0
	bl	sub_805041C
	ldr	r0, [r4]
	sub	r0, r0, #0x1
	str	r0, [r4]
	cmp	r0, #0
	bne	.L5	@cond_branch
	add	r0, r5, #0
	bl	sub_8050584
	ldr	r1, .L6 + 4
	add	r0, r6, r1
	bl	sub_8061204
.L5:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L7:
	.align	2, 0
.L6:
	.4byte	0x55c
	.4byte	0x52c
	thumb_func_end sub_80434EC

.align 2, 0 @ Don't pad with nop.
