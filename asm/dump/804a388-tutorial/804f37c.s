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
	bne	.L804F398	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r4]
.L804F398:
	mov	r5, r8
	add	r5, r5, #0xf8
	ldr	r0, [r5]
	cmp	r0, #0
	bne	.L804F3AA	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r5]
.L804F3AA:
	mov	r6, r8
	add	r6, r6, #0xfc
	ldr	r0, [r6]
	cmp	r0, #0
	bne	.L804F3BC	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r6]
.L804F3BC:
	mov	r7, #0x80
	lsl	r7, r7, #0x1
	ADD r7, r8
	ldr	r0, [r7]
	cmp	r0, #0
	bne	.L804F3D0	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r7]
.L804F3D0:
	ldr	r4, [r4]
	cmp	r4, #0
	beq	.L804F3EE	@cond_branch
	ldr	r1, .L804F464
	mov	r2, #0x94
	lsl	r2, r2, #0x7
	ldr	r3, .L804F464 + 4
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L804F3EE:
	ldr	r4, [r5]
	cmp	r4, #0
	beq	.L804F40C	@cond_branch
	ldr	r1, .L804F464 + 8
	mov	r2, #0x8a
	lsl	r2, r2, #0x8
	ldr	r3, .L804F464 + 4
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L804F40C:
	ldr	r4, [r6]
	cmp	r4, #0
	beq	.L804F42A	@cond_branch
	ldr	r1, .L804F464 + 12
	mov	r2, #0xa0
	lsl	r2, r2, #0x4
	ldr	r3, .L804F464 + 4
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L804F42A:
	ldr	r4, [r7]
	cmp	r4, #0
	beq	.L804F448	@cond_branch
	ldr	r1, .L804F464 + 16
	mov	r2, #0x84
	lsl	r2, r2, #0x7
	ldr	r3, .L804F464 + 4
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L804F448:
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
.L804F462:
	.align	2, 0
.L804F464:
	.4byte	0x8225414
	.4byte	0xffffe000
	.4byte	0x82266b4
	.4byte	0x8227954
	.4byte	0x8227c24
	thumb_func_end sub_804F37C

.align 2, 0 @ Don't pad with nop.
