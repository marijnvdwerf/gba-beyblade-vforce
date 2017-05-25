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
	bne	.L1	@cond_branch
	mov	r0, #0x1
	bl	allocSprite
	str	r0, [r6]
	b	.L2
.L1:
	bl	sub_8060A60
.L2:
	mov	r0, #0x2
	ldrh	r5, [r5]
	and	r0, r0, r5
	cmp	r0, #0
	bne	.L3	@cond_branch
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L4	@cond_branch
.L3:
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L5	@cond_branch
	ldr	r0, .L8
	ldr	r0, [r0]
	ldr	r1, .L8 + 4
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0x2
	bne	.L6	@cond_branch
	ldr	r5, .L8 + 8
	ldr	r4, .L8 + 12
	b	.L10
.L9:
	.align	2, 0
.L8:
	.4byte	0x3000f48
	.4byte	0x6a4
	.4byte	0x823aa74
	.4byte	0x823b2bc
.L6:
	ldr	r5, .L11
	ldr	r4, .L11 + 4
	b	.L10
.L12:
	.align	2, 0
.L11:
	.4byte	0x823b4bc
	.4byte	0x823bd04
.L5:
	add	r0, r4, #0
	add	r0, r0, #0xc0
	b	.L13
.L4:
	add	r0, r4, #0
	add	r0, r0, #0xc8
.L13:
	ldr	r5, [r0]
	add	r0, r0, #0x4
	ldr	r4, [r0]
.L10:
	cmp	r5, #0
	beq	.L14	@cond_branch
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
	b	.L15
.L14:
	ldr	r0, .L17
	bl	printf
.L15:
	cmp	r4, #0
	beq	.L16	@cond_branch
	ldr	r0, .L17 + 4
	ldr	r1, .L17 + 8
	ldr	r3, [r0]
	add	r0, r4, #0
	mov	r2, #0x20
	bl	call_via_r3
.L16:
	add	sp, sp, #0x10
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L18:
	.align	2, 0
.L17:
	.4byte	0x86fcf24
	.4byte	0x807d974
	.4byte	0x5000200
	thumb_func_end displayFrontendLevel

.align 2, 0 @ Don't pad with nop.
