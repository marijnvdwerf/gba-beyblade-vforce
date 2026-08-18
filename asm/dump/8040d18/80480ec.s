	.include "asm/common.inc"

	thumb_func_start sub_80480EC
sub_80480EC:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff0
	add	r6, r0, #0
	cmp	r1, #0x1
	beq	.L80481D8	@cond_branch
	cmp	r1, #0x1
	bcc	.L8048106	@cond_branch
	cmp	r1, #0x2
	bne	.L8048100	@cond_branch
	b	.L8048284
.L8048100:
	cmp	r1, #0x7
	beq	.L80481A8	@cond_branch
	b	.L80482F6
.L8048106:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L804818C
	str	r4, [r0]
	cmp	r4, #0
	beq	.L804812E	@cond_branch
	ldr	r1, .L804818C + 4
	ldr	r2, .L804818C + 8
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L804812E:
	mov	r0, #0x0
	bl	allocSprite
	add	r5, r0, #0
	ldr	r0, .L804818C + 12
	str	r5, [r0]
	cmp	r5, #0
	beq	.L804815A	@cond_branch
	ldr	r1, .L804818C + 4
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
.L804815A:
	ldr	r1, .L804818C + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L804818C + 20
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r6, r0
	ldr	r1, .L804818C + 24
	add	r0, r4, #0
	mov	r2, #0x0
	bl	newIconMenu
	mov	r1, #0x96
	lsl	r1, r1, #0x8
	add	r0, r4, #0
	bl	sub_8050FEC
	bl	sub_8049168
	b	.L80482F6
.L804818A:
	.align	2, 0
.L804818C:
	.4byte	0x30005b0
	.4byte	0x823bf04
	.4byte	0xffff0000
	.4byte	0x30005b4
	.4byte	0x30005b8
	.4byte	0x30005bc
	.4byte	0x8069d04
.L80481A8:
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8051028
	ldr	r0, .L80481D0
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L80481BE	@cond_branch
	bl	sub_8060A94
.L80481BE:
	ldr	r0, .L80481D0 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L80481C8	@cond_branch
	b	.L80482F6
.L80481C8:
	bl	sub_8060A94
	b	.L80482F6
.L80481CE:
	.align	2, 0
.L80481D0:
	.4byte	0x30005b0
	.4byte	0x30005b4
.L80481D8:
	ldr	r5, .L8048264
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8048204	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L8048264 + 4
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L8048264 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L8048204:
	ldr	r5, .L8048264 + 12
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8048230	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L8048264 + 16
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L8048264 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L8048230:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	bl	sub_80439A0
	mov	r2, #0x96
	lsl	r2, r2, #0x3
	add	r4, r6, r2
	add	r0, r4, #0
	bl	sub_8050C18
	ldr	r0, .L8048264 + 20
	ldrh	r1, [r0]
	mov	r0, #0x30
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L80482F6	@cond_branch
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L804827C	@cond_branch
	add	r0, r4, #0
	bl	sub_8050F0C
	b	.L80482F6
.L8048262:
	.align	2, 0
.L8048264:
	.4byte	0x30005b0
	.4byte	0x30005b8
	.4byte	0x874cc3c
	.4byte	0x30005b4
	.4byte	0x30005bc
	.4byte	0x3005da0
.L804827C:
	add	r0, r4, #0
	bl	sub_8050E80
	b	.L80482F6
.L8048284:
	ldr	r1, .L80482B8
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L80482F6	@cond_branch
	ldr	r1, .L80482B8 + 4
	ldr	r0, .L80482B8 + 8
	str	r0, [r1]
	ldr	r1, .L80482B8 + 12
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	mov	r3, #0x96
	lsl	r3, r3, #0x3
	add	r0, r6, r3
	bl	sub_8050F98
	ldr	r4, .L80482B8 + 16
	add	r0, r6, r4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L80482CC	@cond_branch
	cmp	r0, #0x1
	beq	.L80482D4	@cond_branch
	b	.L80482F6
.L80482B8:
	.align	2, 0

	.4byte	0x3005da0
	.4byte	0x30005b8
	.4byte	0xffff0000
	.4byte	0x30005bc
	.4byte	0x4b4
.L80482CC:
	mov	r0, #0x1f
	bl	sub_80490F8
	b	.L80482F6
.L80482D4:
	ldr	r0, .L8048300
	ldr	r1, [r0]
	ldr	r2, .L8048300 + 4
	add	r0, r1, r2
	mov	r2, #0x0
	strb	r2, [r0]
	ldr	r3, .L8048300 + 8
	add	r0, r1, r3
	strb	r2, [r0]
	ldr	r4, .L8048300 + 12
	add	r1, r1, r4
	strb	r2, [r1]
	bl	sub_80600B4
	mov	r0, #0xa
	bl	sub_80490F8
.L80482F6:
	add	sp, sp, #0x10
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L80482FE:
	.align	2, 0
.L8048300:
	.4byte	0x3000fb0
	.4byte	0x1618
	.4byte	0x1619
	.4byte	0x161a
	thumb_func_end sub_80480EC

.align 2, 0 @ Don't pad with nop.
