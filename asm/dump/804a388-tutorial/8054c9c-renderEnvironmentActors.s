	.include "asm/common.inc"

	thumb_func_start renderEnvironmentActors
renderEnvironmentActors:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffdc
	ldr	r0, .L5
	ldr	r0, [r0]
	ldr	r2, .L5 + 4
	add	r1, r0, r2
	ldr	r1, [r1]
	str	r1, [sp, #0x10]
	mov	r3, #0xc8
	lsl	r3, r3, #0x4
	add	r1, r0, r3
	ldr	r1, [r1]
	str	r1, [sp, #0x14]
	ldr	r6, .L5 + 8
	add	r1, r0, r6
	ldr	r1, [r1]
	mov	r9, r1
	sub	r2, r2, #0xc
	add	r1, r0, r2
	ldr	r1, [r1]
	mov	r8, r1
	ldr	r3, .L5 + 12
	add	r0, r0, r3
	bl	nullsub_12
	str	r0, [sp, #0x1c]
	ldr	r6, [sp, #0x10]
	cmp	r6, #0
	bne	.L1	@cond_branch
	b	.L14
.L1:
	sub	r6, r6, #0x1
	str	r6, [sp, #0x10]
	mov	r6, r9
	add	r6, r6, #0xa0
.L12:
	mov	r0, r9
	ldr	r1, [r0, #0x4]
	ldr	r2, [r0, #0x8]
	sub	r0, r1, r2
	asr	r0, r0, #0x8
	mov	r3, #0x0
	ldsh	r5, [r6, r3]
	sub	r3, r0, r5
	add	r1, r1, r2
	asr	r1, r1, #0x1
	mov	r2, r9
	ldr	r0, [r2, #0xc]
	sub	r1, r1, r0
	asr	r1, r1, #0x8
	mov	r0, #0x2
	ldsh	r4, [r6, r0]
	sub	r7, r1, r4
	str	r3, [sp, #0x20]
	bl	sub_8055274
	mov	sl, r0
	bl	sub_8055288
	str	r0, [sp, #0x18]
	ldrh	r0, [r6]
	ADD r0, sl
	strh	r0, [r6]
	ldrh	r1, [r6, #0x2]
	ldr	r2, [sp, #0x18]
	add	r0, r1, r2
	strh	r0, [r6, #0x2]
	mov	r0, r9
	bl	renderActor2
	strh	r5, [r6]
	strh	r4, [r6, #0x2]
	ldr	r0, [r6, #0x14]
	bl	GetStruct4
	add	r2, r0, #0
	ldr	r3, [sp, #0x20]
	cmp	r2, #0
	bne	.L3	@cond_branch
	add	r6, r6, #0xc4
	mov	r3, #0xc4
	ADD r9, r3
	b	.L8
.L6:
	.align	2, 0
.L5:
	.4byte	0x3000fb0
	.4byte	0xc84
	.4byte	0xc7c
	.4byte	0x434
.L3:
	ldr	r1, [r2, #0x4]
	cmp	r1, #0
	bne	.L7	@cond_branch
	add	r6, r6, #0xc4
	mov	r0, #0xc4
	ADD r9, r0
	b	.L8
.L7:
	ldr	r0, [r6, #0x18]
	cmp	r0, #0
	beq	.L9	@cond_branch
	ldrh	r0, [r0, #0x18]
	strh	r0, [r1, #0x18]
.L9:
	mov	r0, r9
	ldr	r1, [r0, #0x3c]
	cmp	r1, #0
	beq	.L10	@cond_branch
	ldr	r0, [r1, #0x40]
	asr	r0, r0, #0x8
	sub	r3, r3, r0
	ldr	r0, [r1, #0x44]
	asr	r0, r0, #0x8
	sub	r7, r7, r0
.L10:
	ldr	r0, [r2, #0x8]
	add	r0, r0, r3
	mov	r1, sl
	sub	r0, r0, r1
	lsl	r3, r0, #0x8
	ldr	r0, [r2, #0xc]
	add	r0, r0, r7
	ldr	r1, [sp, #0x18]
	sub	r0, r0, r1
	lsl	r7, r0, #0x8
	mov	r0, #0x80
	lsl	r0, r0, #0x7
	add	r1, r7, r0
	mov	r0, #0xe0
	lsl	r0, r0, #0x8
	cmp	r1, r0
	bls	.L11	@cond_branch
	mov	r7, #0xa0
	lsl	r7, r7, #0x8
.L11:
	ldr	r0, [r2, #0x4]
	str	r3, [r0, #0x8]
	str	r7, [r0, #0xc]
	add	r6, r6, #0xc4
	mov	r1, #0xc4
	ADD r9, r1
.L8:
	ldr	r0, [sp, #0x10]
	add	r2, r0, #0
	sub	r2, r2, #0x1
	str	r2, [sp, #0x10]
	cmp	r0, #0
	bne	.L12	@cond_branch
	ldr	r3, [sp, #0x14]
	cmp	r3, #0
	beq	.L14	@cond_branch
	mov	r6, r8
	cmp	r6, #0
	beq	.L14	@cond_branch
	sub	r3, r3, #0x1
	str	r3, [sp, #0x14]
.L29:
	mov	r0, r8
	ldr	r1, [r0, #0x4]
	ldr	r0, [r0, #0x8]
	sub	r3, r1, r0
	add	r1, r1, r0
	asr	r1, r1, #0x1
	mov	r2, r8
	ldr	r0, [r2, #0xc]
	sub	r7, r1, r0
	ldr	r6, [sp, #0x1c]
	ldr	r0, [r6, #0x40]
	sub	r3, r3, r0
	ldr	r0, [r6, #0x44]
	sub	r7, r7, r0
	ldr	r0, .L21
	add	r3, r3, r0
	ldr	r0, .L21 + 4
	cmp	r3, r0
	blt	.L17	@cond_branch
	cmp	r7, r0
	blt	.L17	@cond_branch
	ldr	r0, .L21 + 8
	cmp	r3, r0
	bgt	.L17	@cond_branch
	ldr	r0, .L21 + 12
	cmp	r7, r0
	ble	.L18	@cond_branch
.L17:
	mov	r1, r8
	ldr	r0, [r1]
	cmp	r0, #0
	beq	.L19	@cond_branch
	bl	sub_8060A94
.L19:
	mov	r0, #0x0
	mov	r2, r8
	str	r0, [r2]
	mov	r3, #0x1c
	ADD r8, r3
	b	.L25
.L22:
	.align	2, 0
.L21:
	.4byte	0xfffffc00
	.4byte	0xffffe000
	.4byte	0xefff
	.4byte	0x9fff
.L18:
	mov	r6, r8
	ldr	r5, [r6]
	cmp	r5, #0
	beq	.L23	@cond_branch
	ldr	r0, [r6, #0x18]
	ldr	r4, [r0, #0x70]
	cmp	r4, #0
	bne	.L24	@cond_branch
	add	r0, r5, #0
	bl	sub_8060A94
	str	r4, [r6]
	mov	r0, #0x1c
	ADD r8, r0
	b	.L25
.L23:
	mov	r1, r8
	ldr	r0, [r1, #0x18]
	ldr	r0, [r0, #0x70]
	cmp	r0, #0
	beq	.L28	@cond_branch
	mov	r0, #0x80
	str	r3, [sp, #0x20]
	bl	allocSprite
	add	r4, r0, #0
	ldr	r3, [sp, #0x20]
	cmp	r4, #0
	beq	.L27	@cond_branch
	mov	r2, r8
	ldr	r1, [r2, #0x14]
	mov	r0, #0x3
	ldrb	r6, [r2, #0x12]
	and	r0, r0, r6
	str	r0, [sp]
	str	r5, [sp, #0x4]
	str	r5, [sp, #0x8]
	ldrh	r0, [r2, #0x10]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	add	r2, r3, #0
	add	r3, r7, #0
	bl	LoadSpriteSheet
.L27:
	mov	r0, r8
	str	r4, [r0]
	b	.L28
.L24:
	add	r4, r5, #0
	str	r3, [r4, #0x8]
	str	r7, [r4, #0xc]
.L28:
	mov	r1, #0x1c
	ADD r8, r1
.L25:
	ldr	r0, [sp, #0x14]
	add	r2, r0, #0
	sub	r2, r2, #0x1
	str	r2, [sp, #0x14]
	cmp	r0, #0
	bne	.L29	@cond_branch
.L14:
	add	sp, sp, #0x24
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end renderEnvironmentActors

.align 2, 0 @ Don't pad with nop.
