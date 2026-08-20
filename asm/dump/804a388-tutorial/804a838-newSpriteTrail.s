	.include "asm/common.inc"

	thumb_func_start newSpriteTrail
newSpriteTrail:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff0
	add	r4, r0, #0
	mov	r8, r1
	mov	r9, r2
	add	r7, r3, #0
	ldr	r0, [sp, #0x34]
	ldr	r1, [sp, #0x38]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	sl, r0
	lsl	r1, r1, #0x18
	lsl	r0, r7, #0x3
	sub	r0, r0, r7
	lsl	r5, r0, #0x2
	cmp	r1, #0
	beq	.L804A86A	@cond_branch
	add	r0, r5, #0
	bl	fastAllocate
	b	.L804A870
.L804A86A:
	add	r0, r5, #0
	bl	slowAllocate
.L804A870:
	add	r6, r0, #0
	cmp	r6, #0
	bne	.L804A888	@cond_branch
	ldr	r0, .L804A884
	add	r1, r5, #0
	bl	printf
	str	r6, [r4, #0xc]
	b	.L804A8F4
.L804A882:
	.align	2, 0
.L804A884:
	.4byte	Str_8726F84
.L804A888:
	ldr	r5, [r6]
	mov	r0, #0x0
	strh	r0, [r4, #0x2]
	strh	r0, [r4, #0x4]
	ldr	r1, [sp, #0x30]
	strh	r1, [r4, #0x6]
	mov	r1, r8
	str	r1, [r4, #0x20]
	mov	r1, r9
	str	r1, [r4, #0x28]
	strh	r0, [r4, #0x24]
	mov	r1, #0x1
	strh	r1, [r4, #0x26]
	str	r0, [r4, #0x10]
	str	r0, [r4, #0x14]
	str	r0, [r4, #0x18]
	str	r0, [r4, #0x1c]
	mov	r0, sl
	strh	r0, [r4, #0x2c]
	str	r5, [r4, #0x8]
	strh	r7, [r4]
	str	r6, [r4, #0xc]
	cmp	r7, #0
	ble	.L804A8F4	@cond_branch
	mov	r4, #0x0
	add	r6, r7, #0
.L804A8BC:
	mov	r0, #0x1
	bl	allocSprite
	add	r1, r0, #0
	str	r1, [r5, #0x18]
	strh	r4, [r5, #0xc]
	cmp	r1, #0
	beq	.L804A8E6	@cond_branch
	mov	r0, #0x1
	str	r0, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	add	r0, r1, #0
	mov	r1, r8
	mov	r2, #0x0
	mov	r3, #0xa0
	lsl	r3, r3, #0x8
	bl	LoadSpriteSheet
	b	.L804A8EC
.L804A8E6:
	ldr	r0, .L804A904
	bl	printf
.L804A8EC:
	add	r5, r5, #0x1c
	sub	r6, r6, #0x1
	cmp	r6, #0
	bne	.L804A8BC	@cond_branch
.L804A8F4:
	add	sp, sp, #0x10
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L804A904:
	.align	2, 0

	.4byte	Str_8726FB4
	thumb_func_end newSpriteTrail

.align 2, 0 @ Don't pad with nop.
