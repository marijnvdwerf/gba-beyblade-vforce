	.include "asm/common.inc"

	thumb_func_start processMetadata_9
processMetadata_9:
	push	{r4, lr}
	add	r0, r2, #0
	ldr	r4, [sp, #0x8]
	bl	GetStruct4
	ldr	r1, [r0]
	cmp	r1, #0
	beq	.L1	@cond_branch
	ldr	r0, [r4, #0x8]
	str	r0, [r1, #0x40]
	ldr	r0, [r4, #0xc]
	str	r0, [r1, #0x44]
	ldr	r0, [r4, #0x10]
	str	r0, [r1, #0x48]
.L1:
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end processMetadata_9

.align 2, 0 @ Don't pad with nop.
