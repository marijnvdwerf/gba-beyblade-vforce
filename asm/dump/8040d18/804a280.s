	.include "asm/common.inc"

	thumb_func_start sub_804A280
sub_804A280:
	push	{r4, r5, r6, lr}
	add	r3, r0, #0
	ldr	r0, [r3]
	ldr	r5, [r3, #0x4]
	cmp	r0, r5
	beq	.L6	@cond_branch
	lsl	r0, r5, #0x1
	add	r0, r0, r5
	lsl	r0, r0, #0x3
	ldr	r1, .L7
	add	r6, r0, r1
	ldr	r2, [r6, #0x4]
	ldr	r0, .L7 + 4
	ldr	r0, [r0]
	ldr	r1, .L7 + 8
	add	r4, r0, r1
	mov	r0, #0x0
	ldsh	r1, [r4, r0]
	ldr	r0, [r2]
	cmp	r0, r1
	beq	.L6	@cond_branch
	ldr	r2, .L7 + 12
	add	r1, r3, r2
	sub	r2, r2, #0x2
	add	r0, r3, r2
	ldrb	r1, [r1]
	ldrb	r0, [r0]
	cmp	r1, r0
	bne	.L6	@cond_branch
	mov	r1, #0x0
	ldsh	r0, [r4, r1]
	mov	r4, #0x1
	NEG	r4, r4
	cmp	r0, r4
	beq	.L4	@cond_branch
	bl	sub_804AF5C
.L4:
	cmp	r5, r4
	beq	.L6	@cond_branch
	ldr	r0, [r6, #0x4]
	ldr	r0, [r0]
	cmp	r0, r4
	beq	.L6	@cond_branch
	bl	sub_804AF04
.L6:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L8:
	.align	2, 0
.L7:
	.4byte	0x8069fc8
	.4byte	0x3000fb0
	.4byte	0xc26
	.4byte	0x586
	thumb_func_end sub_804A280

.align 2, 0 @ Don't pad with nop.
