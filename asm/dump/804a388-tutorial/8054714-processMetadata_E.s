	.include "asm/common.inc"

	thumb_func_start processMetadata_E
processMetadata_E:
	push	{r4, lr}
	add	r0, r2, #0
	ldr	r4, [sp, #0x8]
	bl	GetStruct4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r2, #0x8
	ldsh	r1, [r4, r2]
	mov	r3, #0xc
	ldsh	r2, [r4, r3]
	bl	ActorSetSpriteOffset
.L1:
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end processMetadata_E

.align 2, 0 @ Don't pad with nop.
