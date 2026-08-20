	.include "asm/common.inc"

	thumb_func_start displayFrontendLevel
displayFrontendLevel:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff0
	add	r6, r0, #0
	add	r4, r1, #0
	add	r5, r2, #0
	bl	getLanguage
	ldr	r0, [r6]
	cmp	r0, #0
	bne	.L80410D2	@cond_branch
	mov	r0, #0x1
	bl	allocSprite
	str	r0, [r6]
	b	.L80410D6
.L80410D2:
	bl	sub_8060A60
.L80410D6:
	mov	r0, #0x2
	ldrh	r5, [r5]
	and	r0, r0, r5
	cmp	r0, #0
	bne	.L80410EA	@cond_branch
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L804112E	@cond_branch
.L80410EA:
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L8041128	@cond_branch
	ldr	r0, .L8041108
	ldr	r0, [r0]
	ldr	r1, .L8041108 + 4
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0x2
	bne	.L8041118	@cond_branch
	ldr	r5, .L8041108 + 8
	ldr	r4, .L8041108 + 12
	b	.L8041138
.L8041108:
	.align	2, 0

	.4byte	_currentGameState
	.4byte	0x6a4
	.4byte	SpriteSheet_823AA74
	.4byte	Pal_823B2BC
.L8041118:
	ldr	r5, .L8041120
	ldr	r4, .L8041120 + 4
	b	.L8041138
.L804111E:
	.align	2, 0
.L8041120:
	.4byte	SpriteSheet_823B4BC
	.4byte	Pal_823BD04
.L8041128:
	add	r0, r4, #0
	add	r0, r0, #0xc0
	b	.L8041132
.L804112E:
	add	r0, r4, #0
	add	r0, r0, #0xc8
.L8041132:
	ldr	r5, [r0]
	add	r0, r0, #0x4
	ldr	r4, [r0]
.L8041138:
	cmp	r5, #0
	beq	.L804115A	@cond_branch
	ldr	r0, [r6]
	mov	r2, #0x80
	lsl	r2, r2, #0x5
	mov	r3, #0xf0
	lsl	r3, r3, #0x6
	mov	r1, #0x1
	str	r1, [sp]
	mov	r1, #0x0
	str	r1, [sp, #0x4]
	str	r1, [sp, #0x8]
	str	r1, [sp, #0xc]
	add	r1, r5, #0
	bl	LoadSpriteSheet
	b	.L8041160
.L804115A:
	ldr	r0, .L804117C
	bl	printf
.L8041160:
	cmp	r4, #0
	beq	.L8041172	@cond_branch
	ldr	r0, .L804117C + 4
	ldr	r1, .L804117C + 8
	ldr	r3, [r0]
	add	r0, r4, #0
	mov	r2, #0x20
	bl	_call_via_r3
.L8041172:
	add	sp, sp, #0x10
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L804117A:
	.align	2, 0
.L804117C:
	.4byte	Str_86FCF24
	.4byte	__fastMemoryCopyARM
	.4byte	0x5000200
	thumb_func_end displayFrontendLevel

.align 2, 0 @ Don't pad with nop.
