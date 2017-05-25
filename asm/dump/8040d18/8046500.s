	.include "asm/common.inc"

	thumb_func_start sub_8046500
sub_8046500:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff0
	add	r7, r0, #0
	cmp	r1, #0x8
	bls	.L1	@cond_branch
	b	.L41
.L1:
	lsl	r0, r1, #0x2
	ldr	r1, .L4
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L5:
	.align	2, 0
.L4:
	.4byte	.L3
.L3:
	.4byte	.L6
	.4byte	.L7
	.4byte	.L8
	.4byte	.L41
	.4byte	.L41
	.4byte	.L41
	.4byte	.L41
	.4byte	.L13
	.4byte	.L14
.L6:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L18
	str	r4, [r0]
	cmp	r4, #0
	beq	.L15	@cond_branch
	ldr	r1, .L18 + 4
	ldr	r2, .L18 + 8
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L15:
	mov	r0, #0x0
	bl	allocSprite
	add	r5, r0, #0
	ldr	r0, .L18 + 12
	str	r5, [r0]
	cmp	r5, #0
	beq	.L16	@cond_branch
	ldr	r1, .L18 + 4
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
.L16:
	ldr	r1, .L18 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L18 + 20
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	ldr	r0, .L18 + 24
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	str	r1, [r0]
	ldr	r0, .L18 + 28
	mov	r5, #0x0
	str	r5, [r0]
	mov	r2, #0x94
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	NEG	r1, r1
	mov	r2, #0x90
	lsl	r2, r2, #0x6
	bl	sub_80596AC
	ldr	r4, .L18 + 32
	mov	r6, #0x0
	strh	r5, [r4, #0xc]
	mov	r0, #0x0
	bl	sub_804A0E0
	str	r0, [r4, #0x4]
	mov	r0, #0x1
	bl	sub_804A0E0
	str	r0, [r4, #0x8]
	ldr	r0, .L18 + 36
	strb	r6, [r0]
	ldr	r1, .L18 + 40
	mov	r0, #0x1
	strb	r0, [r1]
	add	r1, r7, #0
	add	r1, r1, #0x80
	mov	r0, #0x30
	ldrb	r3, [r1]
	orr	r0, r0, r3
	strb	r0, [r1]
	b	.L41
.L19:
	.align	2, 0
.L18:
	.4byte	0x3000494
	.4byte	0x823bf04
	.4byte	0xffff0000
	.4byte	0x3000498
	.4byte	0x300049c
	.4byte	0x30004a0
	.4byte	0x3000478
	.4byte	0x3000474
	.4byte	0x3000480
	.4byte	0x3000491
	.4byte	0x3000490
.L13:
	ldr	r0, .L25
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L20	@cond_branch
	bl	sub_8060A94
.L20:
	ldr	r0, .L25 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L21	@cond_branch
	bl	sub_8060A94
.L21:
	ldr	r0, .L25 + 8
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L22	@cond_branch
	b	.L41
.L22:
	bl	sub_8060A94
	b	.L41
.L26:
	.align	2, 0
.L25:
	.4byte	0x3000494
	.4byte	0x3000498
	.4byte	0x3000480
.L14:
	cmp	r2, #0x1
	beq	.L27	@cond_branch
	b	.L41
.L27:
	ldr	r0, .L30
	strb	r2, [r0]
	mov	r0, #0x0
	bl	allocSprite
	ldr	r4, .L30 + 4
	str	r0, [r4]
	mov	r1, #0xc
	ldsh	r0, [r4, r1]
	bl	sub_80570C0
	add	r1, r0, #0
	add	r0, r4, #0
	mov	r2, #0x1
	bl	sub_8046468
	b	.L41
.L31:
	.align	2, 0
.L30:
	.4byte	0x3000491
	.4byte	0x3000480
.L7:
	mov	r2, #0xa0
	lsl	r2, r2, #0x1
	add	r0, r7, r2
	bl	sub_80439A0
	ldr	r5, .L38
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L32	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L38 + 4
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L38 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	ldr	r0, .L38 + 12
	ldr	r0, [r0]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L32:
	ldr	r5, .L38 + 16
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L33	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L38 + 20
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L38 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	ldr	r0, .L38 + 12
	ldr	r0, [r0]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L33:
	ldr	r0, .L38 + 24
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L36	@cond_branch
	ldr	r0, .L38 + 28
	ldr	r0, [r0]
	asr	r0, r0, #0x8
	cmp	r0, #0xfe
	ble	.L36	@cond_branch
	ldr	r5, .L38 + 12
	ldr	r1, [r5]
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	cmp	r1, r0
	bne	.L36	@cond_branch
	ldr	r4, .L38 + 32
	mov	r1, #0xc
	ldsh	r0, [r4, r1]
	bl	sub_80570C0
	add	r1, r0, #0
	add	r0, r4, #0
	mov	r2, #0x1
	bl	sub_8046468
	mov	r0, #0x0
	str	r0, [r5]
.L36:
	ldr	r0, .L38 + 12
	ldr	r5, .L38 + 28
	ldr	r4, [r0]
	ldr	r0, [r5]
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	mov	r2, #0x94
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	NEG	r1, r4
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r1, [r5]
	add	r1, r1, r4
	str	r1, [r5]
	ldr	r0, .L38 + 32
	bl	sub_80464C0
	b	.L41
.L39:
	.align	2, 0
.L38:
	.4byte	0x3000494
	.4byte	0x300049c
	.4byte	0x874cc3c
	.4byte	0x3000474
	.4byte	0x3000498
	.4byte	0x30004a0
	.4byte	0x3000491
	.4byte	0x3000478
	.4byte	0x3000480
.L8:
	ldr	r4, .L45
	mov	r0, #0x3
	ldrh	r3, [r4]
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L40	@cond_branch
	ldr	r1, .L45 + 4
	ldr	r0, .L45 + 8
	str	r0, [r1]
	ldr	r1, .L45 + 12
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	ldr	r1, .L45 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	str	r0, [r1]
	ldr	r1, .L45 + 20
	mov	r0, #0x0
	strb	r0, [r1]
	bl	sub_8049178
.L40:
	ldrh	r1, [r4]
	mov	r0, #0x30
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L41	@cond_branch
	mov	r0, #0x20
	and	r0, r0, r1
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	cmp	r3, #0
	beq	.L42	@cond_branch
	ldr	r1, .L45 + 24
	ldrh	r2, [r1, #0xc]
	mov	r4, #0xc
	ldsh	r0, [r1, r4]
	cmp	r0, #0
	ble	.L43	@cond_branch
	sub	r0, r2, #1
	strh	r0, [r1, #0xc]
	b	.L49
.L46:
	.align	2, 0
.L45:
	.4byte	0x3005da0
	.4byte	0x300049c
	.4byte	0xffff0000
	.4byte	0x30004a0
	.4byte	0x3000474
	.4byte	0x3000491
	.4byte	0x3000480
.L43:
	mov	r0, #0x6c
	strh	r0, [r1, #0xc]
	b	.L49
.L42:
	ldr	r1, .L50
	ldrh	r2, [r1, #0xc]
	mov	r4, #0xc
	ldsh	r0, [r1, r4]
	cmp	r0, #0x6b
	bgt	.L48	@cond_branch
	add	r0, r2, #1
	strh	r0, [r1, #0xc]
	b	.L49
.L51:
	.align	2, 0
.L50:
	.4byte	0x3000480
.L48:
	strh	r3, [r1, #0xc]
.L49:
	ldr	r1, .L52
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	str	r0, [r1]
.L41:
	add	sp, sp, #0x10
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L53:
	.align	2, 0
.L52:
	.4byte	0x3000474
	thumb_func_end sub_8046500

.align 2, 0 @ Don't pad with nop.
