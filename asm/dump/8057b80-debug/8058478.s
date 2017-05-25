	.include "asm/common.inc"

	thumb_func_start sub_8058478
sub_8058478:
	push	{r4, r5, r6, lr}
	add	r5, r0, #0
	add	r6, r1, #0
	ldrh	r1, [r5, #0x20]
	bl	GetSpriteSheetStructA
	add	r4, r0, #0
	add	r0, r5, #0
	add	r1, r6, #0
	bl	GetSpriteSheetStructA
	mov	r2, #0x22
	ldsh	r1, [r5, r2]
	ldrh	r4, [r4]
	sub	r1, r1, r4
	ldrh	r0, [r0, #0x2]
	cmp	r1, r0
	bge	.L1	@cond_branch
	lsl	r2, r1, #0x10
	lsr	r2, r2, #0x10
	add	r0, r5, #0
	add	r1, r6, #0
	bl	ActorSetFrame
	b	.L2
.L1:
	add	r0, r5, #0
	add	r1, r6, #0
	bl	ActorSetFrameSequence
.L2:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8058478

.align 2, 0 @ Don't pad with nop.
