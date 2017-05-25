	.include "asm/common.inc"

	thumb_func_start sub_804444C
sub_804444C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	str	r0, [sp]
	add	r4, r1, #0
	bl	isMultiplayer
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r1, #0x1
	mov	sl, r1
	sub	r0, r1, r0
	lsl	r0, r0, #0x4
	ldr	r2, .L7
	add	r0, r0, r2
	ldr	r3, .L7 + 4
	ldr	r1, [r3]
	add	r7, r1, r0
	ldr	r0, .L7 + 8
	add	r5, r1, r0
	ldr	r2, .L7 + 12
	mov	r9, r2
	ldr	r0, [r2]
	ldr	r3, .L7 + 16
	add	r6, r0, r3
	mov	r8, r1
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
	b	.L77
.L8:
	.align	2, 0
.L7:
	.4byte	0x15d4
	.4byte	0x3000fb0
	.4byte	0x15c4
	.4byte	0x3000f48
	.4byte	0x6ec
.L3:
	bl	sub_8049168
	mov	r4, r9
	ldr	r0, [r4]
	ldr	r1, .L12
	add	r0, r0, r1
	ldrb	r1, [r0]
	add	r1, r1, #0x1
	mov	r4, #0x0
	strb	r1, [r0]
	ldr	r0, .L12 + 4
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	str	r1, [r0]
	ldr	r0, .L12 + 8
	str	r4, [r0]
	ldr	r0, .L12 + 12
	str	r4, [r0]
	ldr	r0, .L12 + 16
	str	r4, [r0]
	ldr	r0, .L12 + 20
	strh	r4, [r0]
	ldr	r2, [sp]
	mov	r3, #0x94
	lsl	r3, r3, #0x2
	add	r0, r2, r3
	NEG	r1, r1
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r1, [sp]
	add	r1, r1, #0x80
	mov	r0, #0x30
	ldrb	r2, [r1]
	orr	r0, r0, r2
	strb	r0, [r1]
	ldr	r0, .L12 + 24
	str	r4, [r0]
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L10	@cond_branch
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L10	@cond_branch
	mov	r0, #0x7
	strb	r0, [r5, #0x2]
	ldr	r0, [r6, #0x4]
	strb	r0, [r5, #0x4]
	mov	r1, #0x80
	lsl	r1, r1, #0x14
	mov	r0, r8
	bl	RiderHasFlag
	strb	r0, [r5, #0x5]
	ldr	r0, [r6]
	strb	r0, [r5, #0x6]
	ldr	r0, [r6]
	asr	r0, r0, #0x8
	strb	r0, [r5, #0x7]
	mov	r3, #0x2
	ldsh	r0, [r6, r3]
	strb	r0, [r5, #0x8]
	mov	r0, #0x3
	ldsb	r0, [r6, r0]
	strb	r0, [r5, #0x9]
	mov	r0, #0x0
	strb	r0, [r5, #0xa]
	mov	r1, #0x80
	lsl	r1, r1, #0x4
	mov	r0, r8
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	NEG	r0, r0
	lsr	r0, r0, #0x1f
	strb	r0, [r5, #0xb]
	add	r0, r5, #0
	bl	sub_8043960
.L10:
	mov	r0, #0x0
	bl	sub_804A0E0
	ldr	r4, .L12 + 28
	str	r0, [r4]
	mov	r0, #0x1
	bl	sub_804A0E0
	str	r0, [r4, #0x4]
	mov	r0, #0x2
	bl	sub_804A0E0
	str	r0, [r4, #0x8]
	mov	r0, #0x3
	bl	sub_804A0E0
	str	r0, [r4, #0xc]
	mov	r0, #0x4
	bl	sub_804A0E0
	str	r0, [r4, #0x10]
	mov	r0, #0x5
	bl	sub_804A0E0
	str	r0, [r4, #0x14]
	mov	r0, #0x6
	bl	sub_804A0E0
	str	r0, [r4, #0x18]
	mov	r0, #0x7
	bl	sub_804A0E0
	str	r0, [r4, #0x1c]
	mov	r0, #0x8
	bl	sub_804A0E0
	str	r0, [r4, #0x20]
	mov	r0, #0x9
	bl	sub_804A0E0
	str	r0, [r4, #0x24]
	b	.L77
.L13:
	.align	2, 0
.L12:
	.4byte	0x6a6
	.4byte	0x30001b0
	.4byte	0x30001ac
	.4byte	0x30001b4
	.4byte	0x30001bc
	.4byte	0x30001c0
	.4byte	0x30001b8
	.4byte	0x30001c8
.L2:
	ldr	r0, .L24
	ldr	r1, .L24 + 4
	ldr	r1, [r1]
	bl	sub_804423C
	ldr	r4, [sp]
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r4, r1
	bl	sub_80439A0
	ldr	r5, .L24 + 8
	ldr	r4, [r5]
	cmp	r4, #0
	beq	.L14	@cond_branch
	b	.L51
.L14:
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L16	@cond_branch
	b	.L51
.L16:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L18	@cond_branch
	b	.L51
.L18:
	add	r0, r7, #0
	mov	r1, #0x7
	bl	sub_8043970
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L20	@cond_branch
	b	.L51
.L20:
	mov	r2, sl
	str	r2, [r5]
	ldr	r3, .L24 + 12
	ldr	r0, [r3]
	ldr	r1, .L24 + 16
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L22	@cond_branch
	ldr	r0, .L24 + 20
	str	r4, [r0]
	b	.L39
.L25:
	.align	2, 0
.L24:
	.4byte	0x30001c8
	.4byte	0x30001b0
	.4byte	0x30001b8
	.4byte	0x3000fb0
	.4byte	0x161b
	.4byte	0x30001bc
.L22:
	mov	r2, r9
	ldr	r0, [r2]
	ldr	r3, .L30
	add	r0, r0, r3
	ldrb	r0, [r0]
	cmp	r0, #0x1
	bne	.L26	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x4
	mov	r0, r8
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L28	@cond_branch
	mov	r0, #0xb
	ldsb	r0, [r7, r0]
	cmp	r0, #0
	bne	.L28	@cond_branch
	ldr	r0, .L30 + 4
	mov	r4, sl
	str	r4, [r0]
	b	.L39
.L31:
	.align	2, 0
.L30:
	.4byte	0x6a4
	.4byte	0x30001bc
.L28:
	mov	r1, #0x80
	lsl	r1, r1, #0x4
	mov	r0, r8
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L32	@cond_branch
	mov	r0, #0xb
	ldsb	r0, [r7, r0]
	cmp	r0, #0
	bne	.L43	@cond_branch
.L32:
	ldr	r1, .L35
	mov	r0, #0x2
	b	.L44
.L36:
	.align	2, 0
.L35:
	.4byte	0x30001bc
.L26:
	mov	r1, #0x80
	lsl	r1, r1, #0x14
	mov	r0, r8
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L38	@cond_branch
	mov	r0, #0x5
	ldsb	r0, [r7, r0]
	cmp	r0, #0
	beq	.L38	@cond_branch
	ldr	r0, .L40
	mov	r1, sl
	str	r1, [r0]
	b	.L39
.L41:
	.align	2, 0
.L40:
	.4byte	0x30001bc
.L38:
	mov	r1, #0x80
	lsl	r1, r1, #0x14
	mov	r0, r8
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L43	@cond_branch
	mov	r0, #0x5
	ldsb	r0, [r7, r0]
	cmp	r0, #0
	bne	.L43	@cond_branch
	ldr	r1, .L45
	mov	r0, #0x2
	b	.L44
.L46:
	.align	2, 0
.L45:
	.4byte	0x30001bc
.L43:
	ldr	r1, .L49
	mov	r0, #0x0
.L44:
	str	r0, [r1]
	add	r0, r1, #0
.L39:
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L47	@cond_branch
	ldr	r0, .L49 + 4
	ldr	r0, [r0]
	mov	r2, #0xd5
	lsl	r2, r2, #0x3
	add	r0, r0, r2
	b	.L48
.L50:
	.align	2, 0
.L49:
	.4byte	0x30001bc
	.4byte	0x3000f48
.L47:
	cmp	r0, #0x1
	bne	.L51	@cond_branch
	ldr	r0, .L53
	ldr	r0, [r0]
	ldr	r3, .L53 + 4
	add	r0, r0, r3
.L48:
	ldrb	r1, [r0]
	add	r1, r1, #0x1
	strb	r1, [r0]
.L51:
	ldr	r0, .L53 + 8
	ldr	r5, .L53 + 12
	ldr	r4, [r0]
	ldr	r0, [r5]
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	ldr	r1, [sp]
	mov	r2, #0x94
	lsl	r2, r2, #0x2
	add	r0, r1, r2
	NEG	r1, r4
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, [r5]
	add	r0, r0, r4
	str	r0, [r5]
	b	.L77
.L54:
	.align	2, 0
.L53:
	.4byte	0x3000f48
	.4byte	0x6a7
	.4byte	0x30001ac
	.4byte	0x30001b0
.L5:
	ldr	r0, .L59
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L64	@cond_branch
	ldr	r0, .L59 + 4
	ldr	r4, .L59 + 8
	ldr	r2, [r4]
	ldr	r1, .L59 + 12
	ldr	r3, [r1]
	add	r1, r7, #0
	bl	sub_8044314
	ldr	r1, .L59 + 16
	ldrh	r0, [r1]
	cmp	r0, #0
	beq	.L56	@cond_branch
	ldr	r0, [r4]
	mov	r2, #0x1f
	add	r1, r0, #0
	and	r1, r1, r2
	cmp	r1, #0x1f
	bne	.L57	@cond_branch
	add	r0, r0, #0x1
	str	r0, [r4]
	b	.L64
.L60:
	.align	2, 0
.L59:
	.4byte	0x30001b8
	.4byte	0x30001c8
	.4byte	0x30001b4
	.4byte	0x30001bc
	.4byte	0x30001c0
.L57:
	cmp	r1, #0
	bne	.L61	@cond_branch
	add	r0, r0, #0x1f
	str	r0, [r4]
	b	.L64
.L61:
	orr	r0, r0, r2
	str	r0, [r4]
	b	.L64
.L56:
	ldr	r0, [r4]
	add	r0, r0, #0x1
	str	r0, [r4]
	cmp	r0, #0x7e
	ble	.L64	@cond_branch
	mov	r3, sl
	strh	r3, [r1]
.L64:
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L65	@cond_branch
	b	.L77
.L65:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L67	@cond_branch
	b	.L77
.L67:
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L72	@cond_branch
	ldr	r1, .L73
	mov	r6, #0x1
	add	r0, r6, #0
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L72	@cond_branch
	ldr	r4, .L73 + 4
	ldrh	r0, [r4]
	cmp	r0, #0
	beq	.L71	@cond_branch
	mov	r0, #0xf
	ldrb	r4, [r5, #0x2]
	and	r0, r0, r4
	mov	r1, #0x10
	orr	r0, r0, r1
	strb	r0, [r5, #0x2]
	add	r0, r5, #0
	bl	sub_8043960
	b	.L72
.L74:
	.align	2, 0
.L73:
	.4byte	0x3005da0
	.4byte	0x30001c0
.L71:
	mov	r0, #0x1
	strb	r0, [r5, #0xa]
	add	r0, r5, #0
	bl	sub_8043960
	strh	r6, [r4]
.L72:
	add	r0, r7, #0
	mov	r1, #0x7
	bl	sub_8043970
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L77	@cond_branch
	ldr	r0, .L81
	ldr	r1, [r0]
	ldr	r2, .L81 + 4
	mov	sl, r2
	add	r3, r1, r2
	ldr	r4, .L81 + 8
	mov	r9, r4
	add	r2, r1, r4
	add	r4, r4, #0x1
	add	r0, r1, r4
	ldrb	r4, [r0]
	mov	r0, #0xd5
	lsl	r0, r0, #0x3
	add	r1, r1, r0
	ldrb	r0, [r1]
	ldrb	r2, [r2]
	sub	r1, r2, r0
	sub	r1, r1, r4
	mov	r8, r1
	ldrb	r3, [r3]
	sub	r0, r3, r0
	asr	r0, r0, #0x1
	add	r6, r0, #1
	mov	r0, #0xa
	ldsb	r0, [r7, r0]
	cmp	r0, #0
	beq	.L76	@cond_branch
	ldr	r1, .L81 + 12
	mov	r0, #0x1
	strh	r0, [r1]
.L76:
	mov	r0, #0xf0
	ldrb	r7, [r7, #0x2]
	and	r0, r0, r7
	cmp	r0, #0x10
	bne	.L77	@cond_branch
	mov	r0, #0xf
	ldrb	r1, [r5, #0x2]
	and	r0, r0, r1
	mov	r1, #0x10
	orr	r0, r0, r1
	strb	r0, [r5, #0x2]
	add	r0, r5, #0
	bl	sub_8043960
	ldr	r1, .L81 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	str	r0, [r1]
	ldr	r2, .L81
	ldr	r0, [r2]
	mov	r3, sl
	add	r1, r0, r3
	ADD r0, r9
	ldrb	r1, [r1]
	ldrb	r0, [r0]
	cmp	r1, r0
	bne	.L79	@cond_branch
	cmp	r4, r8
	bne	.L79	@cond_branch
	mov	r0, #0x25
	bl	sub_80490F8
	b	.L86
.L82:
	.align	2, 0
.L81:
	.4byte	0x3000f48
	.4byte	0x6a5
	.4byte	0x6a6
	.4byte	0x30001c0
	.4byte	0x30001ac
.L79:
	sub	r0, r6, r4
	cmp	r0, #0
	bgt	.L83	@cond_branch
	mov	r0, #0x23
	bl	sub_80490F8
	b	.L86
.L83:
	mov	r4, r8
	sub	r0, r6, r4
	cmp	r0, #0
	bgt	.L85	@cond_branch
	mov	r0, #0x24
	bl	sub_80490F8
	b	.L86
.L85:
	mov	r0, #0x22
	bl	sub_80490F8
.L86:
	mov	r0, #0x8
	bl	sub_804ABFC
.L77:
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804444C

.align 2, 0 @ Don't pad with nop.
