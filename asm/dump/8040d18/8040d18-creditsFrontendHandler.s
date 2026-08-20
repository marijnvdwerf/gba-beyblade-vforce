	.include "asm/common.inc"

	thumb_func_start creditsFrontendHandler
creditsFrontendHandler:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff4
	mov	sl, r0
	cmp	r1, #0x1
	beq	.L8040DAC	@cond_branch
	cmp	r1, #0x1
	bcc	.L8040D30	@cond_branch
	b	.L8041030
.L8040D30:
	ldr	r0, .L8040D74
	ldr	r1, .L8040D74 + 4
	str	r1, [r0]
	ldr	r0, .L8040D74 + 8
	mov	r4, #0x0
	str	r4, [r0]
	mov	r0, #0x94
	lsl	r0, r0, #0x2
	ADD r0, sl
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, .L8040D74 + 12
	str	r4, [r0]
	ldr	r0, .L8040D74 + 16
	strb	r4, [r0]
	ldr	r0, .L8040D74 + 20
	strb	r4, [r0]
	ldr	r0, .L8040D74 + 24
	str	r4, [r0]
	ldr	r1, .L8040D74 + 28
	ldr	r0, .L8040D74 + 32
	str	r0, [r1]
	ldr	r0, .L8040D74 + 36
	str	r4, [r0]
	ldr	r0, .L8040D74 + 40
	str	r4, [r0]
	ldr	r0, .L8040D74 + 44
	str	r4, [r0]
	ldr	r0, .L8040D74 + 48
	str	r4, [r0]
	ldr	r0, .L8040D74 + 52
	str	r4, [r0]
	b	.L8041030
.L8040D74:
	.align	2, 0

	.4byte	_3000004
	.4byte	0xffff0000
	.4byte	_3000000
	.4byte	_3000008
	.4byte	_3000020
	.4byte	0x3000021
	.4byte	_currentCreditsPtr
	.4byte	_creditsPtr
	.4byte	Credits
	.4byte	_300000C
	.4byte	_3000010
	.4byte	_3000014
	.4byte	_3000024
	.4byte	_fontPtr
.L8040DAC:
	ldr	r0, .L8040DE4
	ADD r0, sl
	ldrh	r0, [r0]
	ldr	r3, .L8040DE4 + 4
	cmp	r0, #0
	bne	.L8040E22	@cond_branch
	ldr	r1, .L8040DE4 + 8
	mov	r2, #0xf4
	lsl	r2, r2, #0x4
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r3, .L8040DE4 + 12
	ldr	r2, .L8040DE4 + 16
	ldr	r1, [r2]
	mov	r0, #0x10
	sub	r0, r0, r1
	lsl	r0, r0, #0x8
	orr	r1, r1, r0
	strh	r1, [r3]
	ldr	r3, .L8040DE4 + 20
	ldr	r1, [r3]
	cmp	r1, #0
	beq	.L8040E00	@cond_branch
	sub	r0, r1, #1
	str	r0, [r3]
	ldr	r0, .L8040DE4 + 24
	b	.L8040E04
.L8040DE2:
	.align	2, 0
.L8040DE4:
	.4byte	0x584
	.4byte	_3000020
	.4byte	0x4000050
	.4byte	0x4000052
	.4byte	_300000C
	.4byte	_3000014
	.4byte	_3000010
.L8040E00:
	ldr	r0, .L8040E7C
	str	r1, [r0]
.L8040E04:
	ldr	r1, [r2]
	ldr	r0, [r0]
	cmp	r1, r0
	beq	.L8040E16	@cond_branch
	sub	r3, r1, #1
	cmp	r0, r1
	ble	.L8040E14	@cond_branch
	add	r3, r1, #1
.L8040E14:
	str	r3, [r2]
.L8040E16:
	ldr	r0, [r2]
	ldr	r3, .L8040E7C + 4
	cmp	r0, #0
	bne	.L8040E22	@cond_branch
	mov	r0, #0x1
	strb	r0, [r3]
.L8040E22:
	ldrb	r0, [r3]
	ldr	r2, .L8040E7C + 8
	cmp	r0, #0
	beq	.L8040E3C	@cond_branch
	ldr	r0, .L8040E7C + 12
	ldr	r1, [r0]
	mov	r0, #0x1
	ldrh	r1, [r1, #0x4]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8040E3C	@cond_branch
	mov	r0, #0x1
	strb	r0, [r2]
.L8040E3C:
	ldr	r1, .L8040E7C + 16
	mov	r0, #0xb
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8040E5A	@cond_branch
	ldr	r0, .L8040E7C + 20
	ADD r0, sl
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8040E5A	@cond_branch
	mov	r0, #0x1
	strb	r0, [r2]
.L8040E5A:
	ldrb	r0, [r2]
	cmp	r0, #0
	beq	.L8040EE6	@cond_branch
	ldr	r0, .L8040E7C + 24
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8040EE6	@cond_branch
	mov	r0, #0x1
	strb	r0, [r2]
	bl	sub_804915C
	cmp	r0, #0x8
	bne	.L8040E98	@cond_branch
	mov	r0, #0xa
	bl	sub_80490F8
	b	.L8040E9C
.L8040E7C:
	.align	2, 0

	.4byte	_3000010
	.4byte	_3000020
	.4byte	0x3000021
	.4byte	_creditsPtr
	.4byte	_unk3005DA0
	.4byte	0x584
	.4byte	_3000008
.L8040E98:
	bl	sub_8049178
.L8040E9C:
	ldr	r1, .L8041040
	ldr	r0, .L8041040 + 4
	str	r0, [r1]
	ldr	r2, .L8041040 + 8
	ldr	r0, [r2]
	add	r1, r0, #0
	sub	r0, r0, #0x1
	str	r0, [r2]
	cmp	r1, #0
	beq	.L8040ECC	@cond_branch
	ldr	r4, .L8041040 + 12
	add	r5, r2, #0
.L8040EB4:
	ldr	r0, [r4]
	bl	sub_8061204
	ldr	r0, [r4]
	add	r0, r0, #0x30
	str	r0, [r4]
	ldr	r0, [r5]
	add	r1, r0, #0
	sub	r0, r0, #0x1
	str	r0, [r5]
	cmp	r1, #0
	bne	.L8040EB4	@cond_branch
.L8040ECC:
	ldr	r0, .L8041040 + 8
	mov	r4, #0x0
	str	r4, [r0]
	ldr	r5, .L8041040 + 16
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8040EDE	@cond_branch
	bl	deallocateBlock
.L8040EDE:
	str	r4, [r5]
	ldr	r0, .L8041040 + 20
	strb	r4, [r0]
	add	r3, r0, #0
.L8040EE6:
	ldrb	r0, [r3]
	cmp	r0, #0
	bne	.L8040EEE	@cond_branch
	b	.L8041002
.L8040EEE:
	ldr	r2, .L8041040 + 8
	ldr	r0, [r2]
	add	r1, r0, #0
	sub	r0, r0, #0x1
	str	r0, [r2]
	cmp	r1, #0
	beq	.L8040F18	@cond_branch
	ldr	r4, .L8041040 + 12
	add	r5, r2, #0
.L8040F00:
	ldr	r0, [r4]
	bl	sub_8061204
	ldr	r0, [r4]
	add	r0, r0, #0x30
	str	r0, [r4]
	ldr	r0, [r5]
	add	r1, r0, #0
	sub	r0, r0, #0x1
	str	r0, [r5]
	cmp	r1, #0
	bne	.L8040F00	@cond_branch
.L8040F18:
	ldr	r0, .L8041040 + 16
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8040F24	@cond_branch
	bl	deallocateBlock
.L8040F24:
	ldr	r3, .L8041040 + 8
	mov	r0, #0x0
	str	r0, [r3]
	mov	r5, #0x0
	ldr	r1, .L8041040 + 24
	ldr	r2, .L8041040 + 28
	ldr	r0, [r2]
	str	r0, [r1]
	ldr	r0, [r0]
	mov	r8, r3
	cmp	r0, #0
	beq	.L8040F56	@cond_branch
	add	r4, r2, #0
.L8040F3E:
	ldr	r1, [r4]
	ldrh	r0, [r1, #0x6]
	add	r5, r0, r5
	add	r0, r1, #0
	add	r0, r0, #0xc
	str	r0, [r4]
	ldr	r0, [r3]
	add	r0, r0, #0x1
	str	r0, [r3]
	ldr	r0, [r1, #0xc]
	cmp	r0, #0
	bne	.L8040F3E	@cond_branch
.L8040F56:
	ldr	r0, [r2]
	add	r0, r0, #0xc
	str	r0, [r2]
	mov	r2, r8
	ldr	r1, [r2]
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x4
	bl	slowAllocate
	ldr	r4, .L8041040 + 16
	str	r0, [r4]
	cmp	r0, #0
	bne	.L8040F78	@cond_branch
	ldr	r0, .L8041040 + 32
	bl	printf
.L8040F78:
	ldr	r2, .L8041040 + 12
	ldr	r0, [r4]
	ldr	r0, [r0]
	str	r0, [r2]
	asr	r1, r5, #0x1
	mov	r0, #0x50
	sub	r6, r0, r1
	mov	r7, #0x0
	mov	r1, r8
	ldr	r0, [r1]
	cmp	r7, r0
	bge	.L8040FF0	@cond_branch
	mov	r8, r2
	ldr	r2, .L8041040 + 24
	mov	r9, r2
	mov	r5, #0x0
	mov	r4, #0x0
.L8040F9A:
	mov	r1, r8
	ldr	r0, [r1]
	add	r0, r0, r4
	lsl	r1, r6, #0x10
	asr	r1, r1, #0x10
	str	r1, [sp]
	mov	r1, #0xf0
	str	r1, [sp, #0x4]
	mov	r1, #0x2
	str	r1, [sp, #0x8]
	ldr	r1, .L8041040 + 36
	ldr	r2, .L8041040 + 40
	mov	r3, #0x0
	bl	allocFont
	mov	r2, r8
	ldr	r0, [r2]
	add	r0, r0, r4
	mov	r1, r9
	ldr	r2, [r1]
	add	r2, r5, r2
	ldr	r1, [r2]
	ldrb	r2, [r2, #0x8]
	bl	sub_8061660
	mov	r2, r8
	ldr	r0, [r2]
	add	r0, r0, r4
	mov	r1, #0x1
	bl	sub_8061E58
	mov	r1, r9
	ldr	r0, [r1]
	add	r0, r5, r0
	ldrh	r0, [r0, #0x6]
	add	r6, r0, r6
	add	r5, r5, #0xc
	add	r4, r4, #0x30
	add	r7, r7, #0x1
	ldr	r0, .L8041040 + 8
	ldr	r0, [r0]
	cmp	r7, r0
	blt	.L8040F9A	@cond_branch
.L8040FF0:
	ldr	r1, .L8041040 + 44
	mov	r0, #0x10
	str	r0, [r1]
	ldr	r1, .L8041040 + 48
	mov	r0, #0x78
	str	r0, [r1]
	ldr	r1, .L8041040 + 20
	mov	r0, #0x0
	strb	r0, [r1]
.L8041002:
	mov	r0, #0xa0
	lsl	r0, r0, #0x1
	ADD r0, sl
	bl	sub_80439A0
	ldr	r0, .L8041040
	ldr	r5, .L8041040 + 52
	ldr	r4, [r0]
	ldr	r0, [r5]
	cmp	r4, r0
	beq	.L8041030	@cond_branch
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	mov	r0, #0x94
	lsl	r0, r0, #0x2
	ADD r0, sl
	add	r1, r4, #0
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, [r5]
	add	r0, r0, r4
	str	r0, [r5]
.L8041030:
	add	sp, sp, #0xc
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8041040:
	.align	2, 0

	.4byte	_3000000
	.4byte	0xffff0000
	.4byte	_3000008
	.4byte	_fontPtr
	.4byte	_3000024
	.4byte	_3000020
	.4byte	_currentCreditsPtr
	.4byte	_creditsPtr
	.4byte	Str_86FCED8
	.4byte	SpriteSheet_82B05EC
	.4byte	ShadowFontMeta
	.4byte	_3000010
	.4byte	_3000014
	.4byte	_3000004
	thumb_func_end creditsFrontendHandler

.align 2, 0 @ Don't pad with nop.
