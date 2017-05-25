	.include "asm/common.inc"

	thumb_func_start sub_8057FDC
sub_8057FDC:
	push	{r4, r5, r6, r7, lr}
	add	r7, r0, #0
	add	r6, r1, #0
	ldr	r5, [r7]
	bl	GetSpriteSheetStructA
	add	r4, r0, #0
	add	r0, r5, #0
	bl	sub_8058924
	mov	ip, r0
	ldrh	r3, [r4, #0x2]
	ldrh	r0, [r4, #0x4]
	add	r2, r0, #0
	mul	r2, r2, r3
	ldrh	r4, [r4]
	ldr	r0, [r5, #0x8]
	cmp	r6, r0
	blt	.L1	@cond_branch
	mov	r0, #0x0
	b	.L2
.L1:
	mov	r0, ip
	cmp	r0, #0
	beq	.L5	@cond_branch
	add	r1, r7, #0
	add	r1, r1, #0x98
	mov	r0, #0x4
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L5	@cond_branch
	cmp	r3, #0
	beq	.L5	@cond_branch
	lsl	r0, r4, #0x1
	ADD r0, ip
	add	r1, r3, #0
.L6:
	ldrh	r3, [r0]
	add	r2, r3, r2
	add	r0, r0, #0x2
	sub	r1, r1, #0x1
	cmp	r1, #0
	bne	.L6	@cond_branch
.L5:
	add	r0, r2, #0
.L2:
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8057FDC

.align 2, 0 @ Don't pad with nop.
