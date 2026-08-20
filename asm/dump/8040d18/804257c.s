	.include "asm/common.inc"

	thumb_func_start sub_804257C
sub_804257C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffffc
	add	r6, r0, #0
	cmp	r1, #0x8
	bls	.L804258C	@cond_branch
	b	.L80427B6
.L804258C:
	lsl	r0, r1, #0x2
	ldr	r1, .L8042598
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L8042596:
	.align	2, 0
.L8042598:
	.4byte	.L804259C
.L804259C:
	.4byte	.L80425C0
	.4byte	.L8042634
	.4byte	.L80426BC
	.4byte	.L80427B6
	.4byte	.L80427B6
	.4byte	.L80427B6
	.4byte	.L80427B6
	.4byte	.L80427B6
	.4byte	.L8042688
.L80425C0:
	mov	r0, #0xa0
	lsl	r0, r0, #0x13
	mov	r1, #0x0
	strh	r1, [r0]
	ldr	r0, .L8042604
	strb	r1, [r0]
	ldr	r0, .L8042604 + 4
	strb	r1, [r0]
	ldr	r0, .L8042604 + 8
	mov	r2, #0x0
	str	r2, [r0]
	ldr	r0, .L8042604 + 12
	str	r2, [r0]
	ldr	r0, .L8042604 + 16
	str	r2, [r0]
	ldr	r0, .L8042604 + 20
	mov	r1, #0x10
	str	r1, [r0]
	ldr	r0, .L8042604 + 24
	str	r1, [r0]
	ldr	r0, .L8042604 + 28
	str	r2, [r0]
	ldr	r1, .L8042604 + 32
	ldr	r3, .L8042604 + 36
	add	r0, r3, #0
	strh	r0, [r1]
	ldr	r0, .L8042604 + 40
	strh	r2, [r0]
	sub	r1, r1, #0x8
	mov	r0, #0xf0
	strh	r0, [r1]
	ldr	r0, .L8042604 + 44
	strh	r2, [r0]
	b	.L80427B6
.L8042604:
	.align	2, 0

	.4byte	_unk30000DC
	.4byte	0x30000dd
	.4byte	_unk30000E0
	.4byte	_unk30000E4
	.4byte	_unk30000E8
	.4byte	_unk30000EC
	.4byte	_unk30000F0
	.4byte	_unk30000F4
	.4byte	0x4000048
	.4byte	0x1f3f
	.4byte	0x400004a
	.4byte	0x4000044
.L8042634:
	ldr	r2, .L8042674
	ldr	r3, .L8042674 + 4
	ldr	r0, [r3]
	ldr	r1, [r2]
	sub	r0, r0, r1
	asr	r0, r0, #0x3
	add	r1, r1, r0
	str	r1, [r2]
	ldr	r2, .L8042674 + 8
	asr	r1, r1, #0x9
	mov	r0, #0x34
	sub	r0, r0, r1
	lsl	r0, r0, #0x8
	add	r1, r1, #0x34
	orr	r0, r0, r1
	strh	r0, [r2]
	ldr	r1, .L8042674 + 12
	ldr	r0, [r1]
	cmp	r0, #0
	bne	.L804265E	@cond_branch
	b	.L80427B6
.L804265E:
	sub	r0, r0, #0x1
	str	r0, [r1]
	cmp	r0, #0
	beq	.L8042668	@cond_branch
	b	.L80427B6
.L8042668:
	str	r0, [r3]
	ldr	r1, .L8042674 + 16
	mov	r0, #0x10
	str	r0, [r1]
	b	.L80427B6
.L8042672:
	.align	2, 0
.L8042674:
	.4byte	_unk30000E4
	.4byte	_unk30000E8
	.4byte	0x4000044
	.4byte	_unk30000F4
	.4byte	_unk30000F0
.L8042688:
	ldr	r1, .L80426AC
	mov	r0, #0x9f
	strh	r0, [r1]
	ldr	r0, .L80426AC + 4
	ldr	r3, .L80426AC + 8
	ldr	r1, [r3]
	strh	r1, [r0]
	ldr	r0, .L80426AC + 12
	ldr	r0, [r0]
	cmp	r1, r0
	bne	.L80426A0	@cond_branch
	b	.L80427B6
.L80426A0:
	sub	r2, r1, #1
	cmp	r1, r0
	bge	.L80426A8	@cond_branch
	add	r2, r1, #1
.L80426A8:
	str	r2, [r3]
	b	.L80427B6
.L80426AC:
	.align	2, 0

	.4byte	0x4000050
	.4byte	0x4000054
	.4byte	_unk30000EC
	.4byte	_unk30000F0
.L80426BC:
	ldr	r3, .L8042704
	ldrb	r0, [r3]
	ldr	r4, .L8042704 + 4
	cmp	r0, #0
	beq	.L80426DA	@cond_branch
	ldrb	r2, [r4]
	cmp	r2, #0
	bne	.L80426DA	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	mov	r5, #0xc5
	lsl	r5, r5, #0x6
	add	r0, r5, #0
	strh	r0, [r1]
	strb	r2, [r3]
.L80426DA:
	ldr	r1, .L8042704 + 8
	ldr	r0, [r1]
	asr	r2, r0, #0x8
	add	r3, r1, #0
	cmp	r2, #0
	bne	.L8042720	@cond_branch
	ldr	r0, .L8042704 + 12
	ldr	r0, [r0]
	cmp	r0, #0x4
	bgt	.L804271C	@cond_branch
	ldr	r1, .L8042704
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, .L8042704 + 16
	mov	r0, #0xb0
	lsl	r0, r0, #0x7
	str	r0, [r1]
	ldr	r0, .L8042704 + 20
	str	r2, [r0]
	b	.L8042720
.L8042702:
	.align	2, 0
.L8042704:
	.4byte	_unk30000DC
	.4byte	0x30000dd
	.4byte	_unk30000E4
	.4byte	_unk30000E0
	.4byte	_unk30000E8
	.4byte	_unk30000F0
.L804271C:
	mov	r0, #0x1
	strb	r0, [r4]
.L8042720:
	ldr	r1, .L80427C4
	mov	r0, #0x8
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L804273C	@cond_branch
	ldr	r1, .L80427C4 + 4
	mov	r0, #0x10
	str	r0, [r1]
	ldr	r1, .L80427C4 + 8
	mov	r0, #0x0
	str	r0, [r1]
	mov	r0, #0x1
	strb	r0, [r4]
.L804273C:
	ldrb	r0, [r4]
	cmp	r0, #0
	beq	.L804275C	@cond_branch
	ldr	r0, [r3]
	asr	r1, r0, #0x8
	cmp	r1, #0
	bne	.L804275C	@cond_branch
	mov	r0, #0x80
	lsl	r0, r0, #0x13
	strh	r1, [r0]
	mov	r0, #0x8
	bl	sub_80490F8
	mov	r0, #0x1a
	bl	sub_804924C
.L804275C:
	ldr	r0, .L80427C4 + 12
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L80427B6	@cond_branch
	ldr	r0, .L80427C4 + 16
	ldrb	r7, [r0]
	cmp	r7, #0
	bne	.L80427B6	@cond_branch
	add	r6, r6, #0xb8
	ldr	r5, .L80427C4 + 20
	mov	r0, #0x80
	lsl	r0, r0, #0x13
	strh	r7, [r0]
	mov	r0, #0xa0
	lsl	r0, r0, #0x13
	mov	r8, r0
	strh	r7, [r0]
	bl	sub_8059934
	ldr	r4, .L80427C4 + 24
	ldr	r0, [r4]
	lsl	r0, r0, #0x3
	add	r0, r0, r5
	ldr	r2, [r0]
	str	r7, [sp]
	add	r0, r6, #0
	mov	r1, #0x0
	mov	r3, #0x0
	bl	sub_8058A28
	ldr	r0, [r4]
	lsl	r0, r0, #0x3
	add	r0, r0, r5
	ldr	r0, [r0, #0x4]
	bl	loadPalette
	mov	r3, r8
	strh	r7, [r3]
	ldr	r1, .L80427C4 + 28
	mov	r0, #0x96
	lsl	r0, r0, #0x1
	str	r0, [r1]
	ldr	r0, [r4]
	add	r0, r0, #0x1
	str	r0, [r4]
.L80427B6:
	add	sp, sp, #0x4
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L80427C2:
	.align	2, 0
.L80427C4:
	.4byte	_unk3005DA0
	.4byte	_unk30000F0
	.4byte	_unk30000E8
	.4byte	_unk30000DC
	.4byte	0x30000dd
	.4byte	_80687F0
	.4byte	_unk30000E0
	.4byte	_unk30000F4
	thumb_func_end sub_804257C

.align 2, 0 @ Don't pad with nop.
