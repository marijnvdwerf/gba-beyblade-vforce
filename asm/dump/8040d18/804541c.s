	.include "asm/common.inc"

	thumb_func_start sub_804541C
sub_804541C:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff0
	add	r6, r0, #0
	cmp	r1, #0x1
	beq	.L8045510	@cond_branch
	cmp	r1, #0x1
	bcc	.L8045436	@cond_branch
	cmp	r1, #0x2
	bne	.L8045430	@cond_branch
	b	.L80455BC
.L8045430:
	cmp	r1, #0x7
	beq	.L80454E0	@cond_branch
	b	.L8045630
.L8045436:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L80454C4
	str	r4, [r0]
	cmp	r4, #0
	beq	.L804545E	@cond_branch
	ldr	r1, .L80454C4 + 4
	ldr	r2, .L80454C4 + 8
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L804545E:
	mov	r0, #0x0
	bl	allocSprite
	add	r5, r0, #0
	ldr	r0, .L80454C4 + 12
	str	r5, [r0]
	cmp	r5, #0
	beq	.L804548A	@cond_branch
	ldr	r1, .L80454C4 + 4
	mov	r2, #0xc0
	lsl	r2, r2, #0x9
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r4, #0x0
	str	r4, [sp]
	str	r4, [sp, #0x4]
	mov	r0, #0x1
	str	r0, [sp, #0x8]
	str	r4, [sp, #0xc]
	add	r0, r5, #0
	bl	LoadSpriteSheet
.L804548A:
	ldr	r1, .L80454C4 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L80454C4 + 20
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r6, r0
	ldr	r5, .L80454C4 + 24
	bl	sub_805162C
	lsl	r0, r0, #0x18
	mov	r2, #0x0
	cmp	r0, #0
	bne	.L80454B0	@cond_branch
	mov	r2, #0x3
.L80454B0:
	add	r0, r4, #0
	add	r1, r5, #0
	bl	newIconMenu
	mov	r1, #0x96
	lsl	r1, r1, #0x8
	add	r0, r4, #0
	bl	sub_8050FEC
	b	.L8045630
.L80454C4:
	.align	2, 0

	.4byte	0x300036c
	.4byte	0x823bf04
	.4byte	0xffff0000
	.4byte	0x3000370
	.4byte	0x3000374
	.4byte	0x3000378
	.4byte	0x80692a4
.L80454E0:
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8051028
	ldr	r0, .L8045508
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L80454F6	@cond_branch
	bl	sub_8060A94
.L80454F6:
	ldr	r0, .L8045508 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L8045500	@cond_branch
	b	.L8045630
.L8045500:
	bl	sub_8060A94
	b	.L8045630
.L8045506:
	.align	2, 0
.L8045508:
	.4byte	0x300036c
	.4byte	0x3000370
.L8045510:
	ldr	r5, .L804559C
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L804553C	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L804559C + 4
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L804559C + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L804553C:
	ldr	r5, .L804559C + 12
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8045568	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L804559C + 16
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L804559C + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L8045568:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	bl	sub_80439A0
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r6, r0
	add	r0, r4, #0
	bl	sub_8050C18
	ldr	r0, .L804559C + 20
	ldrh	r1, [r0]
	mov	r0, #0x30
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8045630	@cond_branch
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L80455B4	@cond_branch
	add	r0, r4, #0
	bl	sub_8050F0C
	b	.L8045630
.L804559A:
	.align	2, 0
.L804559C:
	.4byte	0x300036c
	.4byte	0x3000374
	.4byte	0x874cc3c
	.4byte	0x3000370
	.4byte	0x3000378
	.4byte	0x3005da0
.L80455B4:
	add	r0, r4, #0
	bl	sub_8050E80
	b	.L8045630
.L80455BC:
	ldr	r1, .L80455F4
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8045630	@cond_branch
	ldr	r1, .L80455F4 + 4
	ldr	r0, .L80455F4 + 8
	str	r0, [r1]
	ldr	r1, .L80455F4 + 12
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8050F98
	ldr	r4, .L80455F4 + 16
	add	r0, r6, r4
	ldr	r0, [r0]
	cmp	r0, #0x1
	beq	.L804561A	@cond_branch
	cmp	r0, #0x1
	bgt	.L8045608	@cond_branch
	cmp	r0, #0
	beq	.L8045612	@cond_branch
	b	.L8045630
.L80455F4:
	.align	2, 0

	.4byte	0x3005da0
	.4byte	0x3000374
	.4byte	0xffff0000
	.4byte	0x3000378
	.4byte	0x4b4
.L8045608:
	cmp	r0, #0x2
	beq	.L8045622	@cond_branch
	cmp	r0, #0x3
	beq	.L804562A	@cond_branch
	b	.L8045630
.L8045612:
	mov	r0, #0x1b
	bl	sub_80490F8
	b	.L8045630
.L804561A:
	mov	r0, #0xa
	bl	sub_80490F8
	b	.L8045630
.L8045622:
	mov	r0, #0x28
	bl	sub_80490F8
	b	.L8045630
.L804562A:
	mov	r0, #0x29
	bl	sub_80490F8
.L8045630:
	add	sp, sp, #0x10
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804541C

.align 2, 0 @ Don't pad with nop.
