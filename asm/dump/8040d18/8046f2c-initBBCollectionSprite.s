	.include "asm/common.inc"

	thumb_func_start initBBCollectionSprite
initBBCollectionSprite:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffff0
	add	r6, r0, #0
	add	r0, r0, #0x34
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	getBeybladeData0
	mov	r8, r0
	add	r0, r6, #0
	add	r0, r0, #0x35
	mov	r7, #0x0
	ldsb	r7, [r0, r7]
	ldr	r0, [r6]
	cmp	r0, #0
	bne	.L8046F5C	@cond_branch
	mov	r0, #0x1
	bl	allocSprite
	str	r0, [r6]
	b	.L8046F60
.L8046F5C:
	bl	sub_8060A60
.L8046F60:
	ldr	r5, [r6, #0x4]
	cmp	r5, #0
	bne	.L8046F86	@cond_branch
	mov	r0, #0x1
	bl	allocSprite
	str	r0, [r6, #0x4]
	ldr	r1, .L8046FD0
	mov	r2, #0xfc
	lsl	r2, r2, #0x6
	mov	r3, #0xd6
	lsl	r3, r3, #0x7
	mov	r4, #0x1
	str	r4, [sp]
	str	r5, [sp, #0x4]
	str	r5, [sp, #0x8]
	str	r5, [sp, #0xc]
	bl	LoadSpriteSheet
.L8046F86:
	ldr	r4, [r6]
	cmp	r4, #0
	beq	.L804700C	@cond_branch
	cmp	r7, #0
	bne	.L8046FDC	@cond_branch
	add	r0, r6, #0
	add	r0, r0, #0x38
	mov	r2, r8
	ldr	r1, [r2, #0x2c]
	bl	getDecompressorData
	add	r1, r0, #0
	ldr	r0, [r6]
	mov	r2, #0x80
	lsl	r2, r2, #0x5
	mov	r3, #0xf0
	lsl	r3, r3, #0x6
	mov	r4, #0x1
	str	r4, [sp]
	str	r7, [sp, #0x4]
	str	r7, [sp, #0x8]
	str	r7, [sp, #0xc]
	bl	LoadSpriteSheet
	mov	r0, r8
	ldr	r2, [r0, #0x28]
	cmp	r2, #0
	beq	.L804700C	@cond_branch
	ldr	r0, .L8046FD0 + 4
	ldr	r1, .L8046FD0 + 8
	ldr	r3, [r0]
	add	r0, r2, #0
	mov	r2, #0x20
	bl	_call_via_r3
	b	.L804700C
.L8046FCE:
	.align	2, 0
.L8046FD0:
	.4byte	0x823c2c8
	.4byte	0x807d974
	.4byte	0x5000200
.L8046FDC:
	ldr	r1, .L804702C
	mov	r2, #0x80
	lsl	r2, r2, #0x5
	mov	r3, #0xf0
	lsl	r3, r3, #0x6
	mov	r0, #0x1
	str	r0, [sp]
	mov	r0, #0x0
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	sub	r0, r7, #1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
	ldr	r2, .L804702C + 4
	ldr	r0, .L804702C + 8
	ldr	r1, .L804702C + 12
	ldr	r3, [r2]
	mov	r2, #0x20
	bl	_call_via_r3
.L804700C:
	ldr	r1, [r6, #0x4]
	cmp	r1, #0
	beq	.L804701E	@cond_branch
	add	r0, r6, #0
	add	r0, r0, #0x34
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	strh	r0, [r1, #0x18]
.L804701E:
	add	sp, sp, #0x10
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L804702A:
	.align	2, 0
.L804702C:
	.4byte	0x824f010
	.4byte	0x807d974
	.4byte	0x825105c
	.4byte	0x5000200
	thumb_func_end initBBCollectionSprite

.align 2, 0 @ Don't pad with nop.
