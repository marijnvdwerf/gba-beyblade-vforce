	.include "asm/common.inc"

	thumb_func_start sub_804F37C
sub_804F37C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffff0
	mov	r8, r0
	mov	r4, r8
	add	r4, r4, #0xf4
	ldr	r0, [r4]
	cmp	r0, #0
	bne	.L1	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r4]
.L1:
	mov	r5, r8
	add	r5, r5, #0xf8
	ldr	r0, [r5]
	cmp	r0, #0
	bne	.L2	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r5]
.L2:
	mov	r6, r8
	add	r6, r6, #0xfc
	ldr	r0, [r6]
	cmp	r0, #0
	bne	.L3	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r6]
.L3:
	mov	r7, #0x80
	lsl	r7, r7, #0x1
	ADD r7, r8
	ldr	r0, [r7]
	cmp	r0, #0
	bne	.L4	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r7]
.L4:
	ldr	r4, [r4]
	cmp	r4, #0
	beq	.L5	@cond_branch
	ldr	r1, .L9
	mov	r2, #0x94
	lsl	r2, r2, #0x7
	ldr	r3, .L9 + 4
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L5:
	ldr	r4, [r5]
	cmp	r4, #0
	beq	.L6	@cond_branch
	ldr	r1, .L9 + 8
	mov	r2, #0x8a
	lsl	r2, r2, #0x8
	ldr	r3, .L9 + 4
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L6:
	ldr	r4, [r6]
	cmp	r4, #0
	beq	.L7	@cond_branch
	ldr	r1, .L9 + 12
	mov	r2, #0xa0
	lsl	r2, r2, #0x4
	ldr	r3, .L9 + 4
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L7:
	ldr	r4, [r7]
	cmp	r4, #0
	beq	.L8	@cond_branch
	ldr	r1, .L9 + 16
	mov	r2, #0x84
	lsl	r2, r2, #0x7
	ldr	r3, .L9 + 4
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L8:
	mov	r1, #0x87
	lsl	r1, r1, #0x1
	ADD r1, r8
	mov	r0, #0x8
	ldrh	r2, [r1]
	orr	r0, r0, r2
	strh	r0, [r1]
	add	sp, sp, #0x10
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L10:
	.align	2, 0
.L9:
	.4byte	0x8225414
	.4byte	0xffffe000
	.4byte	0x82266b4
	.4byte	0x8227954
	.4byte	0x8227c24
	thumb_func_end sub_804F37C

.align 2, 0 @ Don't pad with nop.
