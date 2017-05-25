	.include "asm/common.inc"

	thumb_func_start sub_804F794
sub_804F794:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r5, r0, #0
	mov	r0, #0xf4
	add	r0, r0, r5
	mov	r8, r0
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L1	@cond_branch
	bl	sub_8060A94
.L1:
	add	r7, r5, #0
	add	r7, r7, #0xf8
	ldr	r0, [r7]
	cmp	r0, #0
	beq	.L2	@cond_branch
	bl	sub_8060A94
.L2:
	add	r6, r5, #0
	add	r6, r6, #0xfc
	ldr	r0, [r6]
	cmp	r0, #0
	beq	.L3	@cond_branch
	bl	sub_8060A94
.L3:
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	add	r4, r5, r1
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L4	@cond_branch
	bl	sub_8060A94
.L4:
	mov	r0, #0x0
	str	r0, [r4]
	str	r0, [r6]
	str	r0, [r7]
	mov	r2, r8
	str	r0, [r2]
	mov	r0, #0x87
	lsl	r0, r0, #0x1
	add	r1, r5, r0
	ldr	r0, .L5
	ldrh	r2, [r1]
	and	r0, r0, r2
	strh	r0, [r1]
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L6:
	.align	2, 0
.L5:
	.4byte	0xfff7
	thumb_func_end sub_804F794

.align 2, 0 @ Don't pad with nop.
