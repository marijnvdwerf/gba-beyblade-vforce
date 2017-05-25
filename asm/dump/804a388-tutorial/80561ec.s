	.include "asm/common.inc"

	thumb_func_start sub_80561EC
sub_80561EC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffff7c
	add	r4, r0, #0
	add	r6, r1, #0
	add	r5, r2, #0
	add	r0, r0, #0xb4
	ldr	r0, [r0]
	mov	sl, r0
	ldr	r0, [r5]
	lsl	r0, r0, #0x4
	ldr	r1, [r6, #0x4]
	add	r0, r0, r1
	mov	r8, r0
	ldr	r0, [r5, #0x4]
	lsl	r0, r0, #0x4
	add	r1, r1, r0
	mov	r9, r1
	mov	r0, r8
	ldr	r1, [r0]
	mov	r2, r9
	ldr	r0, [r2]
	cmp	r1, r0
	bge	.L1	@cond_branch
	lsl	r3, r1, #0x5
	lsl	r0, r0, #0x5
	str	r0, [sp, #0x78]
	b	.L2
.L1:
	lsl	r3, r0, #0x5
	lsl	r1, r1, #0x5
	str	r1, [sp, #0x78]
.L2:
	mov	r7, r8
	ldr	r1, [r7, #0x4]
	mov	r2, r9
	ldr	r0, [r2, #0x4]
	cmp	r1, r0
	bge	.L3	@cond_branch
	lsl	r2, r1, #0x5
	lsl	r0, r0, #0x5
	str	r0, [sp, #0x7c]
	b	.L4
.L3:
	lsl	r2, r0, #0x5
	lsl	r1, r1, #0x5
	str	r1, [sp, #0x7c]
.L4:
	ldrb	r1, [r5, #0x11]
	mov	r0, #0x8
	and	r0, r0, r1
	add	r7, sp, #0x80
	strb	r1, [r7]
	cmp	r0, #0
	beq	.L12	@cond_branch
	ldr	r0, [r4, #0x4]
	cmp	r0, r3
	bgt	.L6	@cond_branch
	b	.L117
.L6:
	ldr	r1, [sp, #0x78]
	cmp	r0, r1
	blt	.L8	@cond_branch
	b	.L117
.L8:
	ldr	r0, [r4, #0x8]
	cmp	r0, r2
	bgt	.L10	@cond_branch
	b	.L117
.L10:
	ldr	r2, [sp, #0x7c]
	cmp	r0, r2
	blt	.L12	@cond_branch
	b	.L117
.L12:
	mov	r7, sp
	mov	r0, sl
	cmp	r0, #0
	beq	.L14	@cond_branch
	mov	r7, sl
	add	r7, r7, #0xf4
.L14:
	ldrb	r0, [r5, #0xf]
	sub	r0, r0, #0x80
	cmp	r0, #0x18
	bls	.L15	@cond_branch
	b	.L42
.L15:
	lsl	r0, r0, #0x2
	ldr	r1, .L18
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L19:
	.align	2, 0
.L18:
	.4byte	.L17
.L17:
	.4byte	.L20
	.4byte	.L42
	.4byte	.L42
	.4byte	.L42
	.4byte	.L42
	.4byte	.L42
	.4byte	.L117
	.4byte	.L117
	.4byte	.L42
	.4byte	.L117
	.4byte	.L30
	.4byte	.L31
	.4byte	.L32
	.4byte	.L33
	.4byte	.L117
	.4byte	.L42
	.4byte	.L117
	.4byte	.L117
	.4byte	.L38
	.4byte	.L42
	.4byte	.L40
	.4byte	.L42
	.4byte	.L42
	.4byte	.L43
	.4byte	.L117
.L20:
	add	r7, sp, #0x28
	add	r0, r6, #0
	add	r1, r5, #0
	add	r2, r4, #0
	add	r3, r7, #0
	bl	sub_80567E4
	ldr	r0, [r4, #0x4]
	ldr	r1, [sp, #0x78]
	cmp	r0, r1
	ble	.L45	@cond_branch
	b	.L117
.L45:
	ldr	r0, [r4, #0x8]
	ldr	r2, [sp, #0x7c]
	cmp	r0, r2
	ble	.L47	@cond_branch
	b	.L117
.L47:
	ldr	r1, [r4, #0xc]
	ldr	r0, [r7, #0x8]
	cmp	r1, r0
	ble	.L52	@cond_branch
	mov	r7, r8
	ldr	r0, [r7, #0x8]
	cmp	r0, #0
	beq	.L50	@cond_branch
	b	.L117
.L50:
	mov	r1, r9
	ldr	r0, [r1, #0x8]
	cmp	r0, #0
	beq	.L52	@cond_branch
	b	.L117
.L52:
	mov	r1, #0xe0
	lsl	r1, r1, #0x1
	ADD r1, sl
	ldrb	r0, [r5, #0xd]
	ldrb	r2, [r1]
	cmp	r0, r2
	bls	.L54	@cond_branch
	strb	r0, [r1]
	b	.L55
.L54:
	mov	r7, #0x16
	ldsh	r0, [r5, r7]
	ldrb	r2, [r1]
	cmp	r0, r2
	bgt	.L56	@cond_branch
	b	.L117
.L56:
	ldrh	r0, [r5, #0x16]
	strb	r0, [r1]
	mov	r1, #0x80
	lsl	r1, r1, #0x11
	mov	r0, sl
	bl	SetRiderFlag
	b	.L117
.L38:
	add	r7, sp, #0x50
	add	r0, r6, #0
	add	r1, r5, #0
	add	r2, r4, #0
	add	r3, r7, #0
	bl	sub_80567E4
	ldr	r3, [r4, #0x4]
	ldr	r0, [sp, #0x78]
	cmp	r3, r0
	ble	.L59	@cond_branch
	b	.L117
.L59:
	ldr	r2, [r4, #0x8]
	ldr	r1, [sp, #0x7c]
	cmp	r2, r1
	ble	.L61	@cond_branch
	b	.L117
.L61:
	ldr	r1, [r4, #0xc]
	ldr	r0, [r7, #0x8]
	cmp	r1, r0
	ble	.L66	@cond_branch
	mov	r7, r8
	ldr	r0, [r7, #0x8]
	cmp	r0, #0
	beq	.L64	@cond_branch
	b	.L117
.L64:
	mov	r1, r9
	ldr	r0, [r1, #0x8]
	cmp	r0, #0
	beq	.L66	@cond_branch
	b	.L117
.L66:
	sub	r4, r3, r2
	mov	r2, r8
	ldr	r0, [r2]
	ldr	r1, [r2, #0x4]
	sub	r0, r0, r1
	lsl	r3, r0, #0x5
	mov	r7, r9
	ldr	r0, [r7]
	ldr	r1, [r7, #0x4]
	sub	r0, r0, r1
	lsl	r1, r0, #0x5
	cmp	r3, r1
	ble	.L68	@cond_branch
	add	r0, r3, #0
	add	r3, r1, #0
	add	r1, r0, #0
.L68:
	ldr	r0, .L76
	add	r3, r3, r0
	mov	r2, #0x80
	lsl	r2, r2, #0x5
	add	r1, r1, r2
	mov	r2, #0xe0
	lsl	r2, r2, #0x1
	ADD r2, sl
	ldrb	r0, [r5, #0xd]
	ldrb	r5, [r2]
	cmp	r0, r5
	bhi	.L69	@cond_branch
	b	.L117
.L69:
	cmp	r4, r3
	bge	.L71	@cond_branch
	b	.L117
.L71:
	cmp	r4, r1
	blt	.L73	@cond_branch
	b	.L117
.L73:
	strb	r0, [r2]
.L55:
	mov	r0, sl
	mov	r1, #0x4
	bl	SetRiderFlag
	b	.L117
.L77:
	.align	2, 0
.L76:
	.4byte	0xfffff000
.L30:
	mov	r0, #0x4
	add	r1, sp, #0x80
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L78	@cond_branch
	b	.L79
.L78:
	b	.L112
.L31:
	mov	r2, r8
	ldr	r1, [r2, #0x8]
	mov	r5, r9
	ldr	r0, [r5, #0x8]
	mov	r2, r9
	cmp	r1, r0
	bge	.L81	@cond_branch
	mov	r2, r8
.L81:
	ldr	r0, [r2, #0x8]
	lsl	r0, r0, #0x5
	ldr	r1, [r4, #0xc]
	cmp	r1, r0
	ble	.L82	@cond_branch
	b	.L117
.L82:
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	mov	r0, sl
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L84	@cond_branch
	b	.L117
.L84:
	mov	r1, #0x80
	lsl	r1, r1, #0x3
	mov	r0, sl
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, #0
	beq	.L86	@cond_branch
	b	.L117
.L86:
	bl	sub_8056EC0
	mov	r0, #0xa
	bl	sub_804ABFC
	ldr	r0, .L90
	ldr	r0, [r0]
	ldr	r7, .L90 + 4
	add	r0, r0, r7
	mov	r2, #0x0
	ldsh	r1, [r0, r2]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	bne	.L88	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x4
	mov	r0, sl
	bl	SetRiderFlag
.L88:
	str	r5, [r4, #0x48]
	mov	r1, #0x80
	lsl	r1, r1, #0xa
	mov	r0, sl
	bl	SetRiderFlag
	mov	r0, #0x0
	bl	sub_8053E18
	b	.L117
.L91:
	.align	2, 0
.L90:
	.4byte	0x3000fb0
	.4byte	0xc6c
.L32:
	ldr	r0, [r5]
	lsl	r0, r0, #0x4
	ldr	r1, [r6, #0x4]
	add	r3, r1, r0
	ldr	r0, [r5, #0x4]
	lsl	r0, r0, #0x4
	add	r1, r1, r0
	ldr	r2, [r3, #0x8]
	ldr	r0, [r1, #0x8]
	cmp	r2, r0
	bge	.L92	@cond_branch
	add	r1, r3, #0
.L92:
	mov	r7, #0x16
	ldsh	r0, [r5, r7]
	lsl	r0, r0, #0x3
	ldr	r1, [r1, #0x8]
	sub	r0, r1, r0
	lsl	r7, r0, #0x5
	lsl	r1, r1, #0x5
	mov	r8, r1
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	mov	r0, sl
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L105	@cond_branch
	ldrh	r0, [r5, #0x16]
	cmp	r0, #0
	bne	.L94	@cond_branch
	b	.L117
.L94:
	ldrb	r0, [r5, #0x10]
	cmp	r0, #0
	bne	.L96	@cond_branch
	b	.L117
.L96:
	ldr	r1, [r4, #0xc]
	cmp	r1, r7
	bge	.L98	@cond_branch
	ldr	r0, [r4, #0x48]
	add	r0, r1, r0
	cmp	r0, r7
	bgt	.L102	@cond_branch
.L98:
	cmp	r1, r8
	bgt	.L100	@cond_branch
	b	.L117
.L100:
	ldr	r0, [r4, #0x48]
	add	r0, r1, r0
	cmp	r0, r8
	blt	.L102	@cond_branch
	b	.L117
.L102:
	add	r0, r6, #0
	add	r1, r5, #0
	bl	sub_805BAC0
	add	r1, r0, #0
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	beq	.L105	@cond_branch
	add	r0, r6, #0
	bl	GetLineMetaData
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L105	@cond_branch
	add	r0, r6, #0
	mov	r2, #0x6
	bl	getLineMetaObjectBytype
	cmp	r0, #0
	bne	.L117	@cond_branch
.L105:
	mov	r0, #0x0
	b	.L117
.L33:
	ldr	r0, [r5]
	lsl	r0, r0, #0x4
	ldr	r1, [r6, #0x4]
	add	r0, r0, r1
	mov	ip, r0
	ldr	r0, [r5, #0x4]
	lsl	r0, r0, #0x4
	add	r1, r1, r0
	mov	r0, ip
	ldr	r2, [r0, #0x8]
	ldr	r0, [r1, #0x8]
	add	r3, r1, #0
	cmp	r2, r0
	bge	.L108	@cond_branch
	mov	r3, ip
.L108:
	ldrh	r2, [r5, #0x16]
	lsl	r1, r2, #0x3
	ldr	r0, [r3, #0x8]
	sub	r0, r0, r1
	lsl	r1, r0, #0x5
	ldr	r2, [r4, #0xc]
	cmp	r2, r1
	bgt	.L109	@cond_branch
	ldr	r0, [r4, #0x48]
	add	r0, r2, r0
	cmp	r0, r1
	ble	.L117	@cond_branch
	mov	r0, #0x0
	str	r0, [r4, #0x48]
	str	r1, [r4, #0xc]
	b	.L117
.L109:
	mov	r0, #0x4
	add	r1, sp, #0x80
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L112	@cond_branch
.L79:
	add	r0, r6, #0
	add	r1, r5, #0
	add	r2, r4, #0
	add	r3, r7, #0
	bl	sub_80567E4
	b	.L113
.L112:
	add	r0, r6, #0
	add	r1, r5, #0
	add	r2, r4, #0
	add	r3, r7, #0
	bl	sub_8056910
.L113:
	add	r0, r6, #0
	add	r1, r5, #0
	mov	r2, sl
	add	r3, r7, #0
	bl	sub_8056610
	b	.L117
.L43:
	mov	r2, sl
	str	r5, [r2, #0x68]
	b	.L117
.L40:
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	mov	r0, sl
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L117	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x12
	mov	r0, sl
	bl	SetRiderFlag
	ldrh	r0, [r5, #0x8]
	ldr	r3, .L118
	ADD r3, sl
	strb	r0, [r3]
	b	.L117
.L119:
	.align	2, 0
.L118:
	.4byte	0x1c3
.L42:
	mov	r0, #0x4
	add	r1, sp, #0x80
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L120	@cond_branch
	add	r0, r6, #0
	add	r1, r5, #0
	add	r2, r4, #0
	add	r3, r7, #0
	bl	sub_80567E4
	b	.L121
.L120:
	add	r0, r6, #0
	add	r1, r5, #0
	add	r2, r4, #0
	add	r3, r7, #0
	bl	sub_8056910
.L121:
	add	r0, r6, #0
	add	r1, r5, #0
	mov	r2, sl
	add	r3, r7, #0
	bl	sub_8056610
.L117:
	add	sp, sp, #0x84
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_80561EC

.align 2, 0 @ Don't pad with nop.
