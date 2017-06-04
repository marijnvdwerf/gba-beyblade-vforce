	.include "asm/common.inc"

	thumb_func_start sub_8048D8C
sub_8048D8C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffff0
	add	r7, r0, #0
	cmp	r1, #0x1
	bne	.L1	@cond_branch
	b	.L2
.L1:
	cmp	r1, #0x1
	bcc	.L3	@cond_branch
	cmp	r1, #0x2
	bne	.L4	@cond_branch
	b	.L5
.L4:
	cmp	r1, #0x7
	bne	.L6	@cond_branch
	b	.L7
.L6:
	b	.L21
.L3:
	ldr	r1, .L12
	ldr	r0, .L12 + 4
	ldr	r0, [r0]
	ldr	r2, .L12 + 8
	add	r0, r0, r2
	mov	r2, #0x0
	ldsh	r0, [r0, r2]
	str	r0, [r1]
	bl	getLevelDescription
	mov	r8, r0
	add	r0, r0, #0xc4
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L9	@cond_branch
	ldr	r0, .L12 + 12
	ldr	r1, .L12 + 16
	ldr	r3, [r0]
	add	r0, r2, #0
	mov	r2, #0x20
	bl	_call_via_r3
.L9:
	mov	r0, #0x0
	bl	allocSprite
	ldr	r4, .L12 + 20
	str	r0, [r4]
	ldr	r1, .L12 + 24
	mov	r0, #0xb0
	lsl	r0, r0, #0x7
	str	r0, [r1]
	ldr	r1, .L12 + 28
	mov	r0, #0x80
	lsl	r0, r0, #0x5
	str	r0, [r1]
	ldr	r0, .L12 + 32
	mov	r5, #0x0
	str	r5, [r0]
	ldr	r0, .L12 + 36
	mov	r6, #0x80
	lsl	r6, r6, #0x9
	str	r6, [r0]
	mov	r1, #0x94
	lsl	r1, r1, #0x2
	add	r0, r7, r1
	NEG	r1, r6
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r4, [r4]
	cmp	r4, #0
	beq	.L10	@cond_branch
	mov	r0, r8
	add	r0, r0, #0xc0
	ldr	r1, [r0]
	mov	r3, #0x8c
	lsl	r3, r3, #0x6
	str	r5, [sp]
	str	r5, [sp, #0x4]
	str	r5, [sp, #0x8]
	str	r5, [sp, #0xc]
	add	r0, r4, #0
	add	r2, r6, #0
	bl	LoadSpriteSheet
.L10:
	ldr	r5, .L12 + 40
	ldr	r1, .L12 + 44
	ldr	r2, .L12 + 48
	mov	r3, #0x80
	lsl	r3, r3, #0x1
	mov	r0, #0x6e
	str	r0, [sp]
	mov	r0, #0xd0
	str	r0, [sp, #0x4]
	mov	r0, #0x2
	str	r0, [sp, #0x8]
	add	r0, r5, #0
	bl	allocFont
	ldr	r4, .L12 + 52
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r0, r0, r4
	ldr	r1, [r0]
	add	r0, r5, #0
	mov	r2, #0xf
	bl	sub_8061660
	bl	getLanguage
	lsl	r0, r0, #0x2
	mov	r1, r8
	add	r1, r1, #0x68
	add	r1, r1, r0
	ldr	r1, [r1]
	add	r0, r5, #0
	mov	r2, #0xf
	bl	showString
	b	.L21
.L13:
	.align	2, 0
.L12:
	.4byte	0x3000644
	.4byte	0x3000f48
	.4byte	0x6ea
	.4byte	0x807d974
	.4byte	0x5000200
	.4byte	0x3000600
	.4byte	0x3000604
	.4byte	0x3000640
	.4byte	0x3000608
	.4byte	0x300060c
	.4byte	0x3000610
	.4byte	0x82b05ec
	.4byte	0x8067ae0
	.4byte	0x806e650
.L7:
	ldr	r0, .L16
	bl	sub_8061204
	ldr	r0, .L16 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L21	@cond_branch
	bl	sub_8060A94
	b	.L21
.L17:
	.align	2, 0
.L16:
	.4byte	0x3000610
	.4byte	0x3000600
.L2:
	ldr	r5, .L19
	ldr	r4, [r5]
	mov	r2, #0xa0
	lsl	r2, r2, #0x1
	add	r0, r7, r2
	bl	sub_80439A0
	ldr	r0, .L19 + 4
	ldr	r2, [r0]
	ldr	r0, .L19 + 8
	ldr	r0, [r0]
	ldr	r1, [r2, #0x8]
	sub	r0, r0, r1
	asr	r0, r0, #0x2
	add	r1, r1, r0
	str	r1, [r2, #0x8]
	ldr	r0, .L19 + 12
	ldr	r0, [r0]
	sub	r0, r0, r4
	asr	r0, r0, #0x2
	add	r4, r4, r0
	lsl	r4, r4, #0x8
	asr	r4, r4, #0x10
	add	r0, r5, #0
	add	r1, r4, #0
	mov	r2, #0x6e
	bl	sub_8061844
	ldr	r0, .L19 + 16
	ldr	r5, .L19 + 20
	ldr	r4, [r0]
	ldr	r0, [r5]
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	mov	r1, #0x94
	lsl	r1, r1, #0x2
	add	r0, r7, r1
	NEG	r1, r4
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, [r5]
	add	r0, r0, r4
	str	r0, [r5]
	b	.L21
.L20:
	.align	2, 0
.L19:
	.4byte	0x3000610
	.4byte	0x3000600
	.4byte	0x3000604
	.4byte	0x3000640
	.4byte	0x3000608
	.4byte	0x300060c
.L5:
	ldr	r1, .L22
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L21	@cond_branch
	ldr	r0, .L22 + 4
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	str	r1, [r0]
	ldr	r0, .L22 + 8
	str	r1, [r0]
	ldr	r0, .L22 + 12
	str	r1, [r0]
	mov	r0, #0x15
	bl	sub_80490F8
.L21:
	add	sp, sp, #0x10
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L23:
	.align	2, 0
.L22:
	.4byte	0x3005da0
	.4byte	0x3000604
	.4byte	0x3000640
	.4byte	0x3000608
	thumb_func_end sub_8048D8C

.align 2, 0 @ Don't pad with nop.
