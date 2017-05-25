	.include "asm/common.inc"

	thumb_func_start sub_804868C
sub_804868C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffff0
	add	r7, r0, #0
	add	r4, r1, #0
	bl	isMultiplayer
	ldr	r1, .L8
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r2, #0x1
	mov	r8, r2
	sub	r0, r2, r0
	lsl	r0, r0, #0x4
	ldr	r5, .L8 + 4
	add	r0, r0, r5
	ldr	r1, [r1]
	add	r5, r1, r0
	ldr	r0, .L8 + 8
	add	r6, r1, r0
	cmp	r4, #0x1
	bne	.L1	@cond_branch
	b	.L2
.L1:
	cmp	r4, #0x1
	bcc	.L3	@cond_branch
	cmp	r4, #0x2
	bne	.L4	@cond_branch
	b	.L5
.L4:
	cmp	r4, #0x7
	beq	.L6	@cond_branch
	b	.L81
.L9:
	.align	2, 0
.L8:
	.4byte	0x3000fb0
	.4byte	0x15d4
	.4byte	0x15c4
.L3:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L17
	str	r4, [r0]
	cmp	r4, #0
	beq	.L10	@cond_branch
	ldr	r1, .L17 + 4
	ldr	r2, .L17 + 8
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L10:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L17 + 12
	str	r4, [r0]
	cmp	r4, #0
	beq	.L11	@cond_branch
	ldr	r1, .L17 + 4
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
.L11:
	ldr	r1, .L17 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L17 + 20
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r7, r0
	ldr	r1, .L17 + 24
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
	bne	.L12	@cond_branch
	b	.L81
.L12:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L14	@cond_branch
	b	.L81
.L14:
	mov	r0, #0x6
	strb	r0, [r6, #0x2]
	b	.L77
.L18:
	.align	2, 0
.L17:
	.4byte	0x30005d0
	.4byte	0x823bf04
	.4byte	0xffff0000
	.4byte	0x30005d4
	.4byte	0x30005d8
	.4byte	0x30005dc
	.4byte	0x8069d9c
.L6:
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r7, r1
	bl	sub_8051028
	ldr	r0, .L23
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L19	@cond_branch
	bl	sub_8060A94
.L19:
	ldr	r0, .L23 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L20	@cond_branch
	b	.L81
.L20:
	bl	sub_8060A94
	b	.L81
.L24:
	.align	2, 0
.L23:
	.4byte	0x30005d0
	.4byte	0x30005d4
.L2:
	ldr	r5, .L33
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L25	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L33 + 4
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L33 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L25:
	ldr	r5, .L33 + 12
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L26	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L33 + 16
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L33 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L26:
	mov	r5, #0xa0
	lsl	r5, r5, #0x1
	add	r0, r7, r5
	bl	sub_80439A0
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r7, r0
	add	r0, r4, #0
	bl	sub_8050C18
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L32	@cond_branch
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L32	@cond_branch
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L32	@cond_branch
	ldr	r0, .L33 + 20
	ldrh	r1, [r0]
	mov	r0, #0x30
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L32	@cond_branch
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L31	@cond_branch
	add	r0, r4, #0
	bl	sub_8050F0C
	b	.L32
.L34:
	.align	2, 0
.L33:
	.4byte	0x30005d0
	.4byte	0x30005d8
	.4byte	0x874cc3c
	.4byte	0x30005d4
	.4byte	0x30005dc
	.4byte	0x3005da0
.L31:
	add	r0, r4, #0
	bl	sub_8050E80
.L32:
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L35	@cond_branch
	b	.L81
.L35:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L37	@cond_branch
	b	.L81
.L37:
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L39	@cond_branch
	b	.L77
.L39:
	ldr	r1, .L42
	add	r0, r7, r1
	ldr	r0, [r0]
	strb	r0, [r6, #0x4]
	b	.L77
.L43:
	.align	2, 0
.L42:
	.4byte	0x4b4
.L5:
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L44	@cond_branch
	b	.L47
.L44:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L46	@cond_branch
	b	.L47
.L46:
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L50	@cond_branch
	ldr	r2, .L57
	mov	r0, r8
	ldrh	r1, [r2]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L49	@cond_branch
	mov	r0, #0xf
	ldrb	r1, [r6, #0x2]
	and	r0, r0, r1
	mov	r1, #0x10
	orr	r0, r0, r1
	strb	r0, [r6, #0x2]
.L49:
	ldrh	r2, [r2]
	and	r4, r4, r2
	cmp	r4, #0
	beq	.L50	@cond_branch
	mov	r0, #0xf
	ldrb	r2, [r6, #0x2]
	and	r0, r0, r2
	mov	r1, #0x20
	orr	r0, r0, r1
	strb	r0, [r6, #0x2]
.L50:
	add	r0, r5, #0
	mov	r1, #0x6
	bl	sub_8043970
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L51	@cond_branch
	b	.L81
.L51:
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L54	@cond_branch
	mov	r1, #0x4
	ldsb	r1, [r5, r1]
	ldr	r4, .L57 + 4
	add	r0, r7, r4
	ldr	r0, [r0]
	cmp	r1, r0
	beq	.L54	@cond_branch
	mov	r2, #0x96
	lsl	r2, r2, #0x3
	add	r0, r7, r2
	bl	sub_8050DF8
.L54:
	mov	r0, #0xf0
	ldrb	r4, [r5, #0x2]
	and	r0, r0, r4
	cmp	r0, #0x10
	bne	.L55	@cond_branch
	mov	r0, #0xf
	ldrb	r1, [r6, #0x2]
	and	r0, r0, r1
	mov	r1, #0x10
	orr	r0, r0, r1
	strb	r0, [r6, #0x2]
	ldr	r2, .L57 + 4
	add	r0, r7, r2
	ldr	r0, [r0]
	cmp	r0, #0x4
	bhi	.L56	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, .L57 + 8
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L58:
	.align	2, 0
.L57:
	.4byte	0x3005da0
	.4byte	0x4b4
	.4byte	.L59
.L59:
	.4byte	.L60
	.4byte	.L61
	.4byte	.L62
	.4byte	.L63
	.4byte	.L64
.L60:
	ldr	r0, .L66
	ldr	r0, [r0]
	ldr	r4, .L66 + 4
	add	r0, r0, r4
	mov	r1, #0x1
	b	.L74
.L67:
	.align	2, 0
.L66:
	.4byte	0x3000f48
	.4byte	0x6a5
.L61:
	ldr	r0, .L69
	ldr	r0, [r0]
	ldr	r1, .L69 + 4
	add	r0, r0, r1
	mov	r1, #0x3
	b	.L74
.L70:
	.align	2, 0
.L69:
	.4byte	0x3000f48
	.4byte	0x6a5
.L62:
	ldr	r0, .L72
	ldr	r0, [r0]
	ldr	r2, .L72 + 4
	add	r0, r0, r2
	mov	r1, #0x5
	b	.L74
.L73:
	.align	2, 0
.L72:
	.4byte	0x3000f48
	.4byte	0x6a5
.L63:
	ldr	r0, .L75
	ldr	r0, [r0]
	ldr	r4, .L75 + 4
	add	r0, r0, r4
	mov	r1, #0x7
	b	.L74
.L76:
	.align	2, 0
.L75:
	.4byte	0x3000f48
	.4byte	0x6a5
.L64:
	ldr	r0, .L79
	ldr	r0, [r0]
	ldr	r1, .L79 + 4
	add	r0, r0, r1
	mov	r1, #0x9
.L74:
	strb	r1, [r0]
.L56:
	ldr	r1, .L79 + 8
	ldr	r0, .L79 + 12
	str	r0, [r1]
	ldr	r1, .L79 + 16
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	mov	r2, #0x96
	lsl	r2, r2, #0x3
	add	r0, r7, r2
	bl	sub_8050F98
	mov	r0, #0x1b
	bl	sub_80490F8
.L55:
	mov	r0, #0xf0
	ldrb	r5, [r5, #0x2]
	and	r0, r0, r5
	cmp	r0, #0x20
	bne	.L77	@cond_branch
	mov	r0, #0xf
	ldrb	r4, [r6, #0x2]
	and	r0, r0, r4
	mov	r1, #0x20
	orr	r0, r0, r1
	strb	r0, [r6, #0x2]
	ldr	r1, .L79 + 8
	ldr	r0, .L79 + 12
	str	r0, [r1]
	ldr	r1, .L79 + 16
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	mov	r5, #0x96
	lsl	r5, r5, #0x3
	add	r0, r7, r5
	bl	sub_8050FC8
	mov	r0, #0x20
	bl	sub_80490F8
.L77:
	add	r0, r6, #0
	bl	sub_8043960
	b	.L81
.L80:
	.align	2, 0
.L79:
	.4byte	0x3000f48
	.4byte	0x6a5
	.4byte	0x30005d8
	.4byte	0xffff0000
	.4byte	0x30005dc
.L47:
	ldr	r0, .L82
	ldrh	r0, [r0]
	cmp	r0, #0x1
	bne	.L81	@cond_branch
	mov	r0, #0x1b
	bl	sub_80490F8
.L81:
	add	sp, sp, #0x10
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L83:
	.align	2, 0
.L82:
	.4byte	0x3005da0
	thumb_func_end sub_804868C

.align 2, 0 @ Don't pad with nop.
