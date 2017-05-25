	.include "asm/common.inc"

	thumb_func_start processMetadata_8
processMetadata_8:
	push	{r4, lr}
	add	r0, r2, #0
	ldr	r4, [sp, #0x8]
	bl	GetStruct4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldrh	r1, [r4, #0x8]
	ldrh	r2, [r4, #0xa]
	bl	actor_80580C0
.L1:
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end processMetadata_8

.align 2, 0 @ Don't pad with nop.
