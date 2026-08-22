	.include "asm/common.inc"

	thumb_func_start sub_804A550
sub_804A550:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffe8
	str	r0, [sp, #0x10]
	ldr	r0, .L804A664
	ldr	r5, [r0]
	ldr	r0, .L804A664 + 4
	add	r7, r5, r0
	mov	r1, #0x1e
	mov	r9, r1
	mov	r2, #0x0
	mov	sl, r2
	mov	r8, r2
	mov	r4, #0x0
	str	r4, [sp, #0x14]
	ldr	r0, .L804A664 + 8
	add	r6, r5, r0
	ldr	r1, [sp, #0x10]
	ldr	r4, [r1, #0x4]
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r4, r4, #0x14
	add	r4, r4, r0
	ldr	r1, [r4]
	add	r0, r6, #0
	mov	r2, #0xf
	bl	sub_8061660
	ldr	r2, .L804A664 + 12
	add	r5, r5, r2
	ldr	r0, [r5]
	cmp	r0, #0
	bne	.L804A5BE	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r5]
	cmp	r0, #0
	beq	.L804A5BE	@cond_branch
	ldr	r1, .L804A664 + 16
	mov	r2, #0x80
	lsl	r2, r2, #0x2
	mov	r3, #0xcc
	lsl	r3, r3, #0x7
	mov	r4, r8
	str	r4, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	bl	LoadSpriteSheet
.L804A5BE:
	mov	r0, r8
	cmp	r0, #0
	beq	.L804A5C6	@cond_branch
	b	.L804A6E0
.L804A5C6:
	mov	r1, sl
	lsl	r0, r1, #0x2
	add r0, sl
	lsl	r6, r0, #0x2
.L804A5CE:
	bl	VBlankIntrWait
	bl	sub_80627F0
	bl	updateKeyState
	mov	r2, #0x1
	neg	r2, r2
	add r9, r2
	mov	r4, r9
	cmp	r4, #0
	bgt	.L804A698	@cond_branch
	mov	r0, #0x9c
	lsl	r0, r0, #0x1
	add	r5, r7, r0
	ldr	r4, [r5]
	cmp	r4, #0
	bne	.L804A614	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r5]
	cmp	r0, #0
	beq	.L804A614	@cond_branch
	str	r4, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	ldr	r1, .L804A664 + 20
	mov	r2, #0xde
	lsl	r2, r2, #0x8
	mov	r3, #0xdc
	lsl	r3, r3, #0x7
	bl	LoadSpriteSheet
.L804A614:
	ldr	r1, .L804A664 + 24
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L804A628	@cond_branch
	mov	r0, #0xc8
	neg	r0, r0
	cmp	r9, r0
	bge	.L804A698	@cond_branch
.L804A628:
	add	r6, r6, #0x14
	mov	r1, #0x1
	add sl, r1
	mov	r2, #0xf
	mov	r9, r2
	ldr	r0, [sp, #0x10]
	ldr	r4, [r0, #0x4]
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r4, r4, r0
	ldr	r0, [r4]
	cmp	sl, r0
	bge	.L804A680	@cond_branch
	ldr	r1, [sp, #0x10]
	ldr	r4, [r1, #0x4]
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	add	r4, r4, #0x14
	add	r4, r4, r0
	ldr	r1, [r4]
	mov	r2, #0x84
	lsl	r2, r2, #0x1
	add	r0, r7, r2
	mov	r2, #0xf
	bl	sub_8061660
	b	.L804A684
.L804A664:
	.align	2, 0

	.4byte	_gameData
	.4byte	0x13fc
	.4byte	0x1504
	.4byte	0x1538
	.4byte	SpriteSheet_821CCC8
	.4byte	SpriteSheet_821CB80
	.4byte	_unk3005DA0
.L804A680:
	mov	r4, #0x1
	mov	r8, r4
.L804A684:
	mov	r0, #0x9c
	lsl	r0, r0, #0x1
	add	r4, r7, r0
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L804A6BA	@cond_branch
	bl	sub_8060A94
	mov	r0, #0x0
	str	r0, [r4]
.L804A698:
	mov	r1, #0x9c
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	ldr	r1, [r0]
	cmp	r1, #0
	beq	.L804A6BA	@cond_branch
	mov	r0, #0xf
	ldr	r2, [sp, #0x14]
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L804A6BA	@cond_branch
	mov	r2, #0x0
	ldrh	r0, [r1, #0x18]
	cmp	r0, #0
	bne	.L804A6B8	@cond_branch
	mov	r2, #0x1
.L804A6B8:
	strh	r2, [r1, #0x18]
.L804A6BA:
	ldr	r1, .L804A724
	mov	r0, #0x8
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L804A6CA	@cond_branch
	mov	r4, #0x1
	mov	r8, r4
.L804A6CA:
	ldr	r0, .L804A724 + 4
	ldr	r0, [r0]
	bl	_call_via_r0
	ldr	r0, [sp, #0x14]
	add	r0, r0, #0x1
	str	r0, [sp, #0x14]
	mov	r1, r8
	cmp	r1, #0
	bne	.L804A6E0	@cond_branch
	b	.L804A5CE
.L804A6E0:
	mov	r2, #0x9c
	lsl	r2, r2, #0x1
	add	r4, r7, r2
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L804A6F4	@cond_branch
	bl	sub_8060A94
	mov	r0, #0x0
	str	r0, [r4]
.L804A6F4:
	mov	r0, #0x9e
	lsl	r0, r0, #0x1
	add	r4, r7, r0
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L804A708	@cond_branch
	bl	sub_8060A94
	mov	r0, #0x0
	str	r0, [r4]
.L804A708:
	mov	r1, #0x84
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	bl	sub_8061228
	add	sp, sp, #0x18
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L804A722:
	.align	2, 0
.L804A724:
	.4byte	_unk3005DA0
	.4byte	__oam_8756CC0
	thumb_func_end sub_804A550

.align 2, 0 @ Don't pad with nop.
