	.include "asm/common.inc"

	thumb_func_start sub_8048310
sub_8048310:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffff0
	add	r6, r0, #0
	add	r4, r1, #0
	bl	isMultiplayer
	ldr	r1, .L8048350
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r2, #0x1
	mov	r8, r2
	sub	r0, r2, r0
	lsl	r0, r0, #0x4
	ldr	r3, .L8048350 + 4
	add	r0, r0, r3
	ldr	r1, [r1]
	add	r5, r1, r0
	ldr	r0, .L8048350 + 8
	add	r7, r1, r0
	cmp	r4, #0x1
	bne	.L8048340	@cond_branch
	b	.L8048448
.L8048340:
	cmp	r4, #0x1
	bcc	.L804835C	@cond_branch
	cmp	r4, #0x2
	bne	.L804834A	@cond_branch
	b	.L8048540
.L804834A:
	cmp	r4, #0x7
	beq	.L8048418	@cond_branch
	b	.L804867A
.L8048350:
	.align	2, 0

	.4byte	0x3000fb0
	.4byte	0x15d4
	.4byte	0x15c4
.L804835C:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L80483FC
	str	r4, [r0]
	cmp	r4, #0
	beq	.L8048384	@cond_branch
	ldr	r1, .L80483FC + 4
	ldr	r2, .L80483FC + 8
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L8048384:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L80483FC + 12
	str	r4, [r0]
	cmp	r4, #0
	beq	.L80483B0	@cond_branch
	ldr	r1, .L80483FC + 4
	mov	r2, #0xc0
	lsl	r2, r2, #0x9
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	mov	r5, r8
	str	r5, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L80483B0:
	ldr	r1, .L80483FC + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L80483FC + 20
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r6, r0
	ldr	r1, .L80483FC + 24
	add	r0, r4, #0
	mov	r2, #0x0
	bl	newIconMenu
	mov	r1, #0x96
	lsl	r1, r1, #0x8
	add	r0, r4, #0
	bl	sub_8050FEC
	bl	sub_8049168
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L80483EA	@cond_branch
	b	.L804867A
.L80483EA:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L80483F6	@cond_branch
	b	.L804867A
.L80483F6:
	mov	r0, #0x5
	strb	r0, [r7, #0x2]
	b	.L8048644
.L80483FC:
	.align	2, 0

	.4byte	0x30005c0
	.4byte	0x823bf04
	.4byte	0xffff0000
	.4byte	0x30005c4
	.4byte	0x30005c8
	.4byte	0x30005cc
	.4byte	0x8069d50
.L8048418:
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8051028
	ldr	r0, .L8048440
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L804842E	@cond_branch
	bl	sub_8060A94
.L804842E:
	ldr	r0, .L8048440 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L8048438	@cond_branch
	b	.L804867A
.L8048438:
	bl	sub_8060A94
	b	.L804867A
.L804843E:
	.align	2, 0
.L8048440:
	.4byte	0x30005c0
	.4byte	0x30005c4
.L8048448:
	ldr	r5, .L80484F0
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8048474	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L80484F0 + 4
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L80484F0 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L8048474:
	ldr	r5, .L80484F0 + 12
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L80484A0	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L80484F0 + 16
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L80484F0 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L80484A0:
	mov	r5, #0xa0
	lsl	r5, r5, #0x1
	add	r0, r6, r5
	bl	sub_80439A0
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r6, r0
	add	r0, r4, #0
	bl	sub_8050C18
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804850E	@cond_branch
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804850E	@cond_branch
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804850E	@cond_branch
	ldr	r0, .L80484F0 + 20
	ldrh	r1, [r0]
	mov	r0, #0x30
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L804850E	@cond_branch
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8048508	@cond_branch
	add	r0, r4, #0
	bl	sub_8050F0C
	b	.L804850E
.L80484F0:
	.align	2, 0

	.4byte	0x30005c0
	.4byte	0x30005c8
	.4byte	0x874cc3c
	.4byte	0x30005c4
	.4byte	0x30005cc
	.4byte	0x3005da0
.L8048508:
	add	r0, r4, #0
	bl	sub_8050E80
.L804850E:
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L804851A	@cond_branch
	b	.L804867A
.L804851A:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8048526	@cond_branch
	b	.L804867A
.L8048526:
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8048532	@cond_branch
	b	.L8048644
.L8048532:
	ldr	r1, .L804853C
	add	r0, r6, r1
	ldr	r0, [r0]
	strb	r0, [r7, #0x4]
	b	.L8048644
.L804853C:
	.align	2, 0

	.4byte	0x4b4
.L8048540:
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L804854C	@cond_branch
	b	.L804866C
.L804854C:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8048558	@cond_branch
	b	.L804866C
.L8048558:
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804857A	@cond_branch
	ldr	r1, .L80485E0
	mov	r0, r8
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L804857A	@cond_branch
	mov	r0, #0xf
	ldrb	r2, [r7, #0x2]
	and	r0, r0, r2
	mov	r1, #0x10
	orr	r0, r0, r1
	strb	r0, [r7, #0x2]
.L804857A:
	add	r0, r5, #0
	mov	r1, #0x5
	bl	sub_8043970
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804867A	@cond_branch
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L80485AA	@cond_branch
	mov	r1, #0x4
	ldsb	r1, [r5, r1]
	ldr	r3, .L80485E0 + 4
	add	r0, r6, r3
	ldr	r0, [r0]
	cmp	r1, r0
	beq	.L80485AA	@cond_branch
	mov	r4, #0x96
	lsl	r4, r4, #0x3
	add	r0, r6, r4
	bl	sub_8050DF8
.L80485AA:
	mov	r0, #0xf0
	ldrb	r5, [r5, #0x2]
	and	r0, r0, r5
	cmp	r0, #0x10
	bne	.L8048644	@cond_branch
	mov	r0, #0xf
	ldrb	r5, [r7, #0x2]
	and	r0, r0, r5
	mov	r1, #0x10
	orr	r0, r0, r1
	strb	r0, [r7, #0x2]
	ldr	r1, .L80485E0 + 4
	add	r0, r6, r1
	ldr	r3, [r0]
	cmp	r3, #0
	bne	.L80485F4	@cond_branch
	ldr	r2, .L80485E0 + 8
	ldr	r0, [r2]
	ldr	r4, .L80485E0 + 12
	add	r0, r0, r4
	mov	r1, #0x1
	strb	r1, [r0]
	ldr	r0, [r2]
	ldr	r5, .L80485E0 + 16
	add	r0, r0, r5
	strb	r3, [r0]
	b	.L804860A
.L80485E0:
	.align	2, 0

	.4byte	0x3005da0
	.4byte	0x4b4
	.4byte	0x3000f48
	.4byte	0x6a4
	.4byte	0x6a9
.L80485F4:
	ldr	r2, .L804864C
	ldr	r0, [r2]
	ldr	r1, .L804864C + 4
	add	r0, r0, r1
	mov	r1, #0x2
	strb	r1, [r0]
	ldr	r0, [r2]
	ldr	r3, .L804864C + 8
	add	r0, r0, r3
	mov	r1, #0x6
	strb	r1, [r0]
.L804860A:
	ldr	r0, [r2]
	ldr	r4, .L804864C + 12
	add	r0, r0, r4
	mov	r1, #0x0
	strb	r1, [r0]
	ldr	r0, [r2]
	ldr	r5, .L804864C + 16
	add	r0, r0, r5
	strb	r1, [r0]
	ldr	r0, [r2]
	mov	r2, #0xd5
	lsl	r2, r2, #0x3
	add	r0, r0, r2
	strb	r1, [r0]
	ldr	r1, .L804864C + 20
	ldr	r0, .L804864C + 24
	str	r0, [r1]
	ldr	r1, .L804864C + 28
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	mov	r3, #0x96
	lsl	r3, r3, #0x3
	add	r0, r6, r3
	bl	sub_8050F98
	mov	r0, #0x21
	bl	sub_80490F8
.L8048644:
	add	r0, r7, #0
	bl	sub_8043960
	b	.L804867A
.L804864C:
	.align	2, 0

	.4byte	0x3000f48
	.4byte	0x6a4
	.4byte	0x6a9
	.4byte	0x6a6
	.4byte	0x6a7
	.4byte	0x30005c8
	.4byte	0xffff0000
	.4byte	0x30005cc
.L804866C:
	ldr	r0, .L8048688
	ldrh	r0, [r0]
	cmp	r0, #0x1
	bne	.L804867A	@cond_branch
	mov	r0, #0x21
	bl	sub_80490F8
.L804867A:
	add	sp, sp, #0x10
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8048686:
	.align	2, 0
.L8048688:
	.4byte	0x3005da0
	thumb_func_end sub_8048310

.align 2, 0 @ Don't pad with nop.
