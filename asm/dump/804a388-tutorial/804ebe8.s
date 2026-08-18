	.include "asm/common.inc"

	thumb_func_start sub_804EBE8
sub_804EBE8:
	push	{r4, r5, lr}
	mov	r1, #0x4
	ldsh	r4, [r0, r1]
	ldr	r5, [r0, #0x8]
	ldr	r0, [r0, #0x30]
	cmp	r0, #0
	beq	.L804EC04	@cond_branch
	bl	deallocateBlock
	b	.L804EC04
.L804EBFC:
	ldr	r0, [r5]
	bl	sub_8060A94
	add	r5, r5, #0x24
.L804EC04:
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	bne	.L804EBFC	@cond_branch
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804EBE8

.align 2, 0 @ Don't pad with nop.
