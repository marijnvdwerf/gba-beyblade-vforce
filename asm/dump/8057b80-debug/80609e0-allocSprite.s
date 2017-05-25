	.include "asm/common.inc"

	thumb_func_start allocSprite
allocSprite:
	push	{r4, r5, r6, r7, lr}
	lsl	r0, r0, #0x10
	lsr	r6, r0, #0x10
	ldr	r7, .L5
	ldr	r4, [r7]
	cmp	r4, #0
	beq	.L1	@cond_branch
	ldr	r5, .L5 + 4
	ldr	r0, [r5]
	add	r1, r6, #0
	bl	sub_80609C4
	add	r1, r0, #0
	strh	r6, [r4, #0x22]
	ldr	r0, [r4, #0x4]
	str	r0, [r7]
	cmp	r1, #0
	bne	.L2	@cond_branch
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L3	@cond_branch
	str	r4, [r0]
.L3:
	ldr	r0, [r5]
	str	r0, [r4, #0x4]
	str	r1, [r4]
	str	r4, [r5]
	b	.L4
.L6:
	.align	2, 0
.L5:
	.4byte	0x3005dec
	.4byte	0x3005de4
.L2:
	ldr	r0, [r1, #0x4]
	cmp	r0, #0
	beq	.L7	@cond_branch
	str	r4, [r0]
.L7:
	ldr	r0, [r1, #0x4]
	str	r0, [r4, #0x4]
	str	r1, [r4]
	str	r4, [r1, #0x4]
.L4:
	ldr	r1, .L9
	ldr	r0, [r1]
	sub	r0, r0, #0x1
	str	r0, [r1]
	b	.L8
.L10:
	.align	2, 0
.L9:
	.4byte	0x3005df4
.L1:
	ldr	r0, .L11
	bl	nullsub_8
.L8:
	ldr	r0, .L11 + 4
	ldr	r0, [r0]
	bl	sub_80604D4
	add	r0, r4, #0
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L12:
	.align	2, 0
.L11:
	.4byte	0x8755ab4
	.4byte	0x3005de4
	thumb_func_end allocSprite

.align 2, 0 @ Don't pad with nop.
