	.include "asm/common.inc"

	thumb_func_start sub_8059EBC
sub_8059EBC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffff8
	mov	r9, r0
	add	r7, r1, #0
	add	r6, r2, #0
	add	r5, r3, #0
	add	r4, r6, #0
	ldrb	r1, [r7]
	mov	r0, #0x1
	mov	r8, r0
	cmp	r1, #0
	beq	.L1	@cond_branch
.L5:
	cmp	r1, #0xa
	bne	.L2	@cond_branch
	add	r5, r5, #0x2
	add	r4, r6, #0
	b	.L3
.L2:
	cmp	r1, #0x20
	beq	.L4	@cond_branch
	str	r5, [sp]
	ldr	r0, .L6
	add	r0, r1, r0
	ldrb	r0, [r0]
	str	r0, [sp, #0x4]
	mov	r0, r9
	mov	r1, #0x1
	mov	r2, #0x2
	add	r3, r4, #0
	bl	sub_8059E5C
.L4:
	add	r4, r4, #0x1
.L3:
	mov	r1, r8
	add	r0, r7, r1
	ldrb	r1, [r0]
	mov	r0, #0x1
	ADD r8, r0
	cmp	r1, #0
	bne	.L5	@cond_branch
.L1:
	add	sp, sp, #0x8
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L7:
	.align	2, 0
.L6:
	.4byte	0x807d7fc
	thumb_func_end sub_8059EBC

.align 2, 0 @ Don't pad with nop.
