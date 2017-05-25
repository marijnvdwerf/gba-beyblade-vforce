	.include "asm/common.inc"

	thumb_func_start sub_8061078
sub_8061078:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	lsl	r1, r1, #0x10
	lsr	r2, r1, #0x10
	ldrh	r0, [r4, #0x22]
	cmp	r0, r2
	beq	.L9	@cond_branch
	ldr	r1, [r4]
	cmp	r1, #0
	beq	.L2	@cond_branch
	ldr	r0, [r4, #0x4]
	str	r0, [r1, #0x4]
	ldr	r6, .L4
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x3005de4
.L2:
	ldr	r1, .L10
	ldr	r0, [r4, #0x4]
	str	r0, [r1]
	add	r6, r1, #0
.L3:
	ldr	r1, [r4, #0x4]
	cmp	r1, #0
	beq	.L6	@cond_branch
	ldr	r0, [r4]
	str	r0, [r1]
.L6:
	strh	r2, [r4, #0x22]
	add	r5, r6, #0
	ldr	r0, [r5]
	add	r1, r2, #0
	bl	sub_80609C4
	add	r1, r0, #0
	cmp	r1, #0
	bne	.L7	@cond_branch
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8	@cond_branch
	str	r4, [r0]
.L8:
	ldr	r0, [r6]
	str	r0, [r4, #0x4]
	str	r1, [r4]
	str	r4, [r6]
	b	.L9
.L11:
	.align	2, 0
.L10:
	.4byte	0x3005de4
.L7:
	ldr	r0, [r1, #0x4]
	cmp	r0, #0
	beq	.L12	@cond_branch
	str	r4, [r0]
.L12:
	ldr	r0, [r1, #0x4]
	str	r0, [r4, #0x4]
	str	r1, [r4]
	str	r4, [r1, #0x4]
.L9:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8061078

.align 2, 0 @ Don't pad with nop.
