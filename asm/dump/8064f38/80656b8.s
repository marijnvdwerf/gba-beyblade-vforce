	.include "asm/common.inc"

	thumb_func_start sub_80656B8
sub_80656B8:
	push	{r4, r5, r6, lr}
	ldrb	r4, [r0, #0x4]
	ldr	r6, [r0, #0x10]
	ldr	r5, [r0]
	b	.L2
.L4:
	cmp	r1, #0x20
	beq	.L2	@cond_branch
	ldr	r0, .L7
	add	r0, r1, r0
	ldrb	r2, [r0]
	add	r0, r5, #0
	mov	r1, #0x0
	bl	ActorSetFrame
	mov	r0, #0x1
	NEG	r0, r0
	str	r0, [r5, #0x70]
	add	r5, r5, #0xc4
	sub	r4, r4, #0x1
.L2:
	cmp	r4, #0
	beq	.L3	@cond_branch
	ldrb	r1, [r6]
	add	r6, r6, #0x1
	cmp	r1, #0
	bne	.L4	@cond_branch
.L3:
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	beq	.L5	@cond_branch
	mov	r1, #0x0
.L6:
	str	r1, [r5, #0x70]
	add	r5, r5, #0xc4
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	bne	.L6	@cond_branch
.L5:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L8:
	.align	2, 0
.L7:
	.4byte	0x807d980
	thumb_func_end sub_80656B8

.align 2, 0 @ Don't pad with nop.
