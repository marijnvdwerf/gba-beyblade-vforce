	.include "asm/common.inc"

	thumb_func_start sub_8060A94
sub_8060A94:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	ldr	r6, [r4]
	ldr	r5, [r4, #0x4]
	ldr	r2, [r4, #0x24]
	cmp	r2, #0
	blt	.L8060ABA	@cond_branch
	mov	r1, #0x1
	add	r0, r1, #0
	ldrh	r3, [r4, #0x20]
	and	r0, r0, r3
	cmp	r0, #0
	bne	.L8060ABA	@cond_branch
	ldrh	r0, [r4, #0x16]
	sub	r0, r0, #0x5
	lsl	r1, r0
	add	r0, r2, #0
	bl	freeSpriteVramLocation
.L8060ABA:
	mov	r0, #0x1
	neg	r0, r0
	str	r0, [r4, #0x24]
	cmp	r6, #0
	beq	.L8060AC8	@cond_branch
	str	r5, [r6, #0x4]
	b	.L8060ACC
.L8060AC8:
	ldr	r0, .L8060B00
	str	r5, [r0]
.L8060ACC:
	cmp	r5, #0
	beq	.L8060AD2	@cond_branch
	str	r6, [r5]
.L8060AD2:
	ldr	r1, .L8060B00 + 4
	ldr	r0, [r1]
	str	r0, [r4, #0x4]
	str	r4, [r1]
	ldr	r0, [r4, #0x30]
	cmp	r0, #0
	beq	.L8060AE8	@cond_branch
	bl	sub_8060B38
	mov	r0, #0x0
	str	r0, [r4, #0x30]
.L8060AE8:
	ldr	r1, .L8060B00 + 8
	ldr	r0, [r1]
	add	r0, r0, #0x1
	str	r0, [r1]
	ldr	r0, .L8060B00
	ldr	r0, [r0]
	bl	sub_80604D4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L8060AFE:
	.align	2, 0
.L8060B00:
	.4byte	_unk3005DE4
	.4byte	_spritesLeft
	.4byte	_spritesFree
	thumb_func_end sub_8060A94

.align 2, 0 @ Don't pad with nop.
