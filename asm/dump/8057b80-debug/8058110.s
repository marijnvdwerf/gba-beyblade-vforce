	.include "asm/common.inc"

	thumb_func_start sub_8058110
sub_8058110:
	push	{r4, lr}
	add	r3, r0, #0
	add	r4, r1, #0
	ldr	r1, [r3]
	ldr	r0, [r1, #0x18]
	add	r1, r1, r0
	mov	r2, #0x0
	b	.L1
.L4:
	ldrh	r0, [r1]
	cmp	r0, r4
	bne	.L2	@cond_branch
	ldrh	r1, [r1, #0x8]
	add	r0, r3, #0
	bl	GetSpriteSheetStructA
	b	.L3
.L2:
	ldrh	r0, [r1, #0x2]
	add	r1, r0, r1
	add	r2, r2, #0x1
.L1:
	ldrh	r0, [r3, #0x28]
	cmp	r2, r0
	bcc	.L4	@cond_branch
	mov	r0, #0x0
.L3:
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8058110

.align 2, 0 @ Don't pad with nop.
