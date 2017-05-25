	.include "asm/common.inc"

	thumb_func_start processMetadata_A
processMetadata_A:
	push	{r4, lr}
	add	r0, r2, #0
	ldr	r4, [sp, #0x8]
	bl	GetStruct4
	ldr	r1, [r0]
	cmp	r1, #0
	beq	.L1	@cond_branch
	ldr	r0, [r4, #0x8]
	str	r0, [r1, #0x68]
	ldr	r0, [r4, #0xc]
	str	r0, [r1, #0x70]
.L1:
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end processMetadata_A

.align 2, 0 @ Don't pad with nop.
