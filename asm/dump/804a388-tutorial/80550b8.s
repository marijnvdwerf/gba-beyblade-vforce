	.include "asm/common.inc"

	thumb_func_start sub_80550B8
sub_80550B8:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	add	r5, r2, #0
	ldr	r6, [sp, #0x10]
	add	r0, r0, #0xb4
	ldr	r0, [r0]
	bl	GetStruct4
	add	r2, r0, #0
	cmp	r6, #0
	beq	.L1	@cond_branch
	ldr	r0, [r5]
	sub	r0, r0, #0x1
	cmp	r6, r0
	bne	.L2	@cond_branch
.L1:
	ldr	r0, [r4, #0x40]
	str	r0, [r2, #0x2c]
	ldr	r0, [r4, #0x44]
	str	r0, [r2, #0x30]
	ldr	r0, [r4, #0x48]
	str	r0, [r2, #0x34]
	ldrh	r1, [r2, #0x3a]
	mov	r0, #0x0
	strh	r1, [r2, #0x38]
	str	r0, [r4, #0x40]
	str	r0, [r4, #0x44]
	str	r0, [r4, #0x48]
.L2:
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
	thumb_func_end sub_80550B8

.align 2, 0 @ Don't pad with nop.
