	.include "asm/common.inc"

	thumb_func_start sub_8058EF4
sub_8058EF4:
	push	{r4, r5, lr}
	add	r4, r0, #0
	ldr	r1, [r4, #0x14]
	ldr	r0, [r4, #0x1c]
	add	r1, r1, r0
	str	r1, [r4, #0x14]
	ldr	r2, [r4, #0x18]
	ldr	r0, [r4, #0x20]
	add	r2, r2, r0
	str	r2, [r4, #0x18]
	str	r1, [r4, #0x54]
	str	r2, [r4, #0x58]
	add	r0, r4, #0
	bl	sub_80596AC
	add	r1, r4, #0
	add	r1, r1, #0x64
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L1	@cond_branch
	add	r0, r4, #0
	bl	sub_8058F60
.L1:
	ldr	r3, [r4, #0x24]
	cmp	r3, #0
	beq	.L6	@cond_branch
	ldr	r2, [r4, #0x14]
	add	r0, r2, #0
	mul	r0, r0, r3
	asr	r5, r0, #0x8
	ldr	r1, [r4, #0x18]
	add	r0, r1, #0
	mul	r0, r0, r3
	asr	r3, r0, #0x8
	sub	r2, r2, r5
	str	r2, [r4, #0x14]
	sub	r1, r1, r3
	str	r1, [r4, #0x18]
	cmp	r5, #0
	bne	.L4	@cond_branch
	cmp	r2, #0
	beq	.L4	@cond_branch
	str	r5, [r4, #0x14]
.L4:
	cmp	r3, #0
	bne	.L6	@cond_branch
	ldr	r0, [r4, #0x18]
	cmp	r0, #0
	beq	.L6	@cond_branch
	str	r3, [r4, #0x18]
.L6:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8058EF4

.align 2, 0 @ Don't pad with nop.
