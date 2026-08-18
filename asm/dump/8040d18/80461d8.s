	.include "asm/common.inc"

	thumb_func_start sub_80461D8
sub_80461D8:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff0
	add	r6, r0, #0
	cmp	r1, #0x1
	beq	.L80462D8	@cond_branch
	cmp	r1, #0x1
	bcc	.L80461F2	@cond_branch
	cmp	r1, #0x2
	bne	.L80461EC	@cond_branch
	b	.L8046384
.L80461EC:
	cmp	r1, #0x7
	beq	.L80462A8	@cond_branch
	b	.L8046410
.L80461F2:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L8046284
	str	r4, [r0]
	cmp	r4, #0
	beq	.L804621A	@cond_branch
	ldr	r1, .L8046284 + 4
	ldr	r2, .L8046284 + 8
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L804621A:
	mov	r0, #0x0
	bl	allocSprite
	add	r5, r0, #0
	ldr	r0, .L8046284 + 12
	str	r5, [r0]
	cmp	r5, #0
	beq	.L8046246	@cond_branch
	ldr	r1, .L8046284 + 4
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
.L8046246:
	ldr	r1, .L8046284 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L8046284 + 20
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r6, r0
	ldr	r1, .L8046284 + 24
	mov	r2, #0x0
	ldr	r0, .L8046284 + 28
	ldr	r0, [r0]
	ldr	r3, .L8046284 + 32
	add	r0, r0, r3
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L8046270	@cond_branch
	mov	r2, #0x1
.L8046270:
	add	r0, r4, #0
	bl	newIconMenu
	mov	r1, #0x96
	lsl	r1, r1, #0x8
	add	r0, r4, #0
	bl	sub_8050FEC
	b	.L8046410
.L8046282:
	.align	2, 0
.L8046284:
	.4byte	0x3000464
	.4byte	0x823bf04
	.4byte	0xffff0000
	.4byte	0x3000468
	.4byte	0x300046c
	.4byte	0x3000470
	.4byte	0x8069514
	.4byte	0x3000f48
	.4byte	0xc68
.L80462A8:
	mov	r4, #0x96
	lsl	r4, r4, #0x3
	add	r0, r6, r4
	bl	sub_8051028
	ldr	r0, .L80462D0
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L80462BE	@cond_branch
	bl	sub_8060A94
.L80462BE:
	ldr	r0, .L80462D0 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L80462C8	@cond_branch
	b	.L8046410
.L80462C8:
	bl	sub_8060A94
	b	.L8046410
.L80462CE:
	.align	2, 0
.L80462D0:
	.4byte	0x3000464
	.4byte	0x3000468
.L80462D8:
	ldr	r5, .L8046364
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8046304	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L8046364 + 4
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L8046364 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L8046304:
	ldr	r5, .L8046364 + 12
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8046330	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L8046364 + 16
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L8046364 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L8046330:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	bl	sub_80439A0
	mov	r3, #0x96
	lsl	r3, r3, #0x3
	add	r4, r6, r3
	add	r0, r4, #0
	bl	sub_8050C18
	ldr	r0, .L8046364 + 20
	ldrh	r1, [r0]
	mov	r0, #0x30
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8046410	@cond_branch
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L804637C	@cond_branch
	add	r0, r4, #0
	bl	sub_8050F0C
	b	.L8046410
.L8046362:
	.align	2, 0
.L8046364:
	.4byte	0x3000464
	.4byte	0x300046c
	.4byte	0x874cc3c
	.4byte	0x3000468
	.4byte	0x3000470
	.4byte	0x3005da0
.L804637C:
	add	r0, r4, #0
	bl	sub_8050E80
	b	.L8046410
.L8046384:
	ldr	r1, .L80463BC
	mov	r4, #0x1
	add	r0, r4, #0
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L80463F6	@cond_branch
	ldr	r1, .L80463BC + 4
	ldr	r0, .L80463BC + 8
	str	r0, [r1]
	ldr	r1, .L80463BC + 12
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8050F98
	ldr	r3, .L80463BC + 16
	add	r0, r6, r3
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L80463D0	@cond_branch
	cmp	r0, #0x1
	beq	.L80463E4	@cond_branch
	b	.L80463F0
.L80463BA:
	.align	2, 0
.L80463BC:
	.4byte	0x3005da0
	.4byte	0x300046c
	.4byte	0xffff0000
	.4byte	0x3000470
	.4byte	0x4b4
.L80463D0:
	ldr	r0, .L80463DC
	ldr	r0, [r0]
	ldr	r1, .L80463DC + 4
	add	r0, r0, r1
	str	r4, [r0]
	b	.L80463F0
.L80463DC:
	.align	2, 0

	.4byte	0x3000f48
	.4byte	0xc68
.L80463E4:
	ldr	r0, .L8046418
	ldr	r0, [r0]
	ldr	r3, .L8046418 + 4
	add	r0, r0, r3
	mov	r1, #0x0
	str	r1, [r0]
.L80463F0:
	mov	r0, #0xc
	bl	sub_80490F8
.L80463F6:
	ldr	r1, .L8046418 + 8
	mov	r0, #0x2
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8046410	@cond_branch
	mov	r4, #0x96
	lsl	r4, r4, #0x3
	add	r0, r6, r4
	bl	sub_8050FC8
	bl	sub_8049178
.L8046410:
	add	sp, sp, #0x10
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L8046418:
	.align	2, 0

	.4byte	0x3000f48
	.4byte	0xc68
	.4byte	0x3005da0
	thumb_func_end sub_80461D8

.align 2, 0 @ Don't pad with nop.
