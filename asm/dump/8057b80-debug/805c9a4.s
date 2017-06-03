	.include "asm/common.inc"

	thumb_func_start sub_805C9A4
sub_805C9A4:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffac
	add	r7, r0, #0
	str	r1, [sp]
	str	r2, [sp, #0x4]
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	str	r3, [sp, #0x8]
	mov	r0, #0x0
	str	r0, [sp, #0x10]
	mov	r1, #0x0
	str	r1, [sp, #0x14]
	mov	r2, #0x0
	str	r2, [sp, #0x18]
	ldr	r3, [sp, #0x74]
	ldrh	r3, [r3, #0x28]
	cmp	r0, r3
	blt	.L84	@cond_branch
	b	.L83
.L84:
	mov	r5, #0x0
	str	r5, [sp, #0x3c]
	mov	r0, #0x0
	str	r0, [sp, #0x38]
	ldr	r2, [sp, #0x74]
	ldr	r1, [r2, #0x10]
	ldr	r3, [sp, #0x18]
	lsl	r0, r3, #0x2
	add	r0, r0, r1
	ldr	r0, [r0]
	str	r0, [sp, #0xc]
	ldrb	r5, [r0, #0x10]
	mov	sl, r5
	mov	r0, #0x0
	str	r0, [sp, #0x40]
	mov	r9, r0
	ldr	r1, [sp, #0xc]
	ldr	r0, [r1]
	lsl	r0, r0, #0x4
	ldr	r2, [sp]
	ldr	r1, [r2, #0x4]
	add	r5, r1, r0
	ldr	r3, [sp, #0xc]
	ldr	r0, [r3, #0x4]
	lsl	r0, r0, #0x4
	add	r4, r1, r0
	ldr	r2, [r5]
	lsl	r6, r2, #0x5
	ldr	r0, [r5, #0x4]
	lsl	r0, r0, #0x5
	mov	r8, r0
	ldr	r1, [r4]
	lsl	r3, r1, #0x5
	ldr	r0, [r4, #0x4]
	lsl	r0, r0, #0x5
	mov	ip, r0
	cmp	r2, r1
	bge	.L3	@cond_branch
	str	r6, [sp, #0x30]
	str	r3, [sp, #0x34]
	b	.L4
.L3:
	str	r3, [sp, #0x30]
	str	r6, [sp, #0x34]
.L4:
	ldr	r1, [r5, #0x4]
	ldr	r0, [r4, #0x4]
	cmp	r1, r0
	bge	.L5	@cond_branch
	mov	r5, r8
	str	r5, [sp, #0x1c]
	mov	r0, ip
	str	r0, [sp, #0x20]
	b	.L6
.L5:
	mov	r1, ip
	str	r1, [sp, #0x1c]
	mov	r2, r8
	str	r2, [sp, #0x20]
.L6:
	add	r2, r7, #0
	add	r2, r2, #0xaa
	mov	r3, #0x0
	ldsh	r0, [r2, r3]
	lsl	r6, r0, #0x8
	add	r1, r7, #0
	add	r1, r1, #0xae
	mov	r5, #0x0
	ldsh	r0, [r1, r5]
	lsl	r5, r0, #0x8
	ldr	r3, [r7, #0x8]
	ldr	r4, [r7, #0x50]
	str	r2, [sp, #0x48]
	str	r1, [sp, #0x50]
	ldr	r0, [r7, #0x44]
	mov	r8, r0
	cmp	r0, #0
	ble	.L7	@cond_branch
	add	r5, r3, r5
	str	r5, [sp, #0x24]
	add	r0, r5, #0
	ADD r0, r8
	add	r0, r0, r4
	str	r0, [sp, #0x28]
	add	r6, r3, r6
	str	r0, [sp, #0x2c]
	b	.L8
.L7:
	add	r6, r3, r6
	str	r6, [sp, #0x28]
	add	r0, r6, #0
	ADD r0, r8
	add	r6, r0, r4
	str	r6, [sp, #0x24]
	add	r3, r3, r5
	str	r3, [sp, #0x2c]
.L8:
	add	r3, r7, #0
	add	r3, r3, #0xa8
	mov	r1, #0x0
	ldsh	r0, [r3, r1]
	lsl	r0, r0, #0x8
	ldr	r1, [r7, #0x4]
	add	r4, r1, r0
	add	r2, r7, #0
	add	r2, r2, #0xac
	mov	r5, #0x0
	ldsh	r0, [r2, r5]
	lsl	r0, r0, #0x8
	add	r1, r1, r0
	str	r3, [sp, #0x44]
	str	r2, [sp, #0x4c]
	ldr	r0, [sp, #0x30]
	cmp	r1, r0
	blt	.L9	@cond_branch
	ldr	r2, [sp, #0x34]
	cmp	r2, r4
	bge	.L13	@cond_branch
.L9:
	ldr	r3, [sp, #0x2c]
	ldr	r5, [sp, #0x1c]
	cmp	r3, r5
	bge	.L11	@cond_branch
	b	.L82
.L11:
	ldr	r0, [sp, #0x20]
	cmp	r0, r6
	bge	.L13	@cond_branch
	b	.L82
.L13:
	ldr	r2, [sp, #0x30]
	cmp	r1, r2
	bgt	.L15	@cond_branch
	b	.L40
.L15:
	ldr	r3, [sp, #0x34]
	cmp	r3, r4
	bgt	.L17	@cond_branch
	b	.L40
.L17:
	mov	r0, #0x1
	ldr	r5, [sp, #0x3c]
	orr	r5, r5, r0
	str	r5, [sp, #0x3c]
	ldr	r0, [sp, #0x24]
	ldr	r1, [sp, #0x1c]
	cmp	r0, r1
	bgt	.L29	@cond_branch
	ldr	r2, [sp, #0x28]
	cmp	r2, r1
	blt	.L29	@cond_branch
	mov	r0, #0x3
	mov	r3, sl
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L29	@cond_branch
	ldr	r5, [sp, #0x40]
	cmp	r5, #0
	bne	.L22	@cond_branch
	ldr	r0, [r7, #0x44]
	cmp	r0, #0
	ble	.L23	@cond_branch
	mov	r0, #0x1
	mov	r1, r9
	orr	r1, r1, r0
	mov	r9, r1
	b	.L24
.L23:
	mov	r2, r9
	mov	r3, #0x2
	orr	r2, r2, r3
	lsl	r0, r2, #0x10
	lsr	r0, r0, #0x10
	mov	r9, r0
.L24:
	add	r0, r7, #0
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	mov	r3, r9
	bl	call_rider_94_8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L25	@cond_branch
	mov	r5, #0x0
	mov	sl, r5
.L25:
	mov	r0, #0x1
	str	r0, [sp, #0x40]
	ldr	r1, [r7, #0x44]
	mov	r8, r1
.L22:
	mov	r2, r8
	cmp	r2, #0
	ble	.L26	@cond_branch
	mov	r0, #0x1
	mov	r3, sl
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L29	@cond_branch
	ldr	r5, [sp, #0x50]
	mov	r1, #0x0
	ldsh	r0, [r5, r1]
	lsl	r0, r0, #0x8
	ldr	r2, [sp, #0x1c]
	sub	r0, r2, r0
	str	r0, [r7, #0x8]
	str	r2, [sp, #0x2c]
	mov	r3, #0x1
	str	r3, [sp, #0x38]
	mov	r0, #0x1
	ldr	r5, [sp, #0x14]
	orr	r5, r5, r0
	str	r5, [sp, #0x14]
	b	.L29
.L26:
	mov	r0, #0x2
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L29	@cond_branch
	ldr	r2, [sp, #0x48]
	mov	r3, #0x0
	ldsh	r0, [r2, r3]
	lsl	r0, r0, #0x8
	ldr	r5, [sp, #0x1c]
	sub	r0, r5, r0
	add	r0, r0, #0x80
	str	r0, [r7, #0x8]
	ldr	r6, [sp, #0x1c]
	mov	r0, #0x1
	str	r0, [sp, #0x38]
	ldr	r1, [sp, #0x14]
	mov	r2, #0x2
	orr	r1, r1, r2
	lsl	r0, r1, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x14]
.L29:
	ldr	r3, [sp, #0x24]
	ldr	r5, [sp, #0x20]
	cmp	r3, r5
	bgt	.L40	@cond_branch
	ldr	r0, [sp, #0x28]
	cmp	r0, r5
	blt	.L40	@cond_branch
	mov	r0, #0xc
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L40	@cond_branch
	ldr	r2, [sp, #0x40]
	cmp	r2, #0
	bne	.L33	@cond_branch
	ldr	r0, [r7, #0x44]
	cmp	r0, #0
	ble	.L34	@cond_branch
	mov	r0, #0x4
	mov	r3, r9
	orr	r3, r3, r0
	lsl	r0, r3, #0x10
	b	.L35
.L34:
	mov	r0, #0x8
	mov	r5, r9
	orr	r5, r5, r0
	lsl	r0, r5, #0x10
.L35:
	lsr	r0, r0, #0x10
	mov	r9, r0
	add	r0, r7, #0
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	mov	r3, r9
	bl	call_rider_94_8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L36	@cond_branch
	mov	r0, #0x0
	mov	sl, r0
.L36:
	mov	r1, #0x1
	str	r1, [sp, #0x40]
	ldr	r2, [r7, #0x44]
	mov	r8, r2
.L33:
	mov	r3, r8
	cmp	r3, #0
	ble	.L37	@cond_branch
	mov	r0, #0x4
	mov	r5, sl
	and	r0, r0, r5
	cmp	r0, #0
	beq	.L40	@cond_branch
	ldr	r1, [sp, #0x50]
	mov	r2, #0x0
	ldsh	r0, [r1, r2]
	lsl	r0, r0, #0x8
	ldr	r3, [sp, #0x20]
	sub	r0, r3, r0
	str	r0, [r7, #0x8]
	str	r3, [sp, #0x2c]
	mov	r5, #0x1
	str	r5, [sp, #0x38]
	mov	r0, #0x4
	ldr	r1, [sp, #0x14]
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
	b	.L39
.L37:
	mov	r0, #0x8
	mov	r2, sl
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L40	@cond_branch
	ldr	r3, [sp, #0x48]
	mov	r5, #0x0
	ldsh	r0, [r3, r5]
	lsl	r0, r0, #0x8
	ldr	r1, [sp, #0x20]
	sub	r0, r1, r0
	add	r0, r0, #0x80
	str	r0, [r7, #0x8]
	ldr	r6, [sp, #0x20]
	mov	r2, #0x1
	str	r2, [sp, #0x38]
	mov	r0, #0x8
	ldr	r3, [sp, #0x14]
	orr	r3, r3, r0
	lsl	r0, r3, #0x10
.L39:
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x14]
.L40:
	ldr	r2, [r7, #0x40]
	cmp	r2, #0
	ble	.L41	@cond_branch
	ldr	r5, [sp, #0x4c]
	mov	r1, #0x0
	ldsh	r0, [r5, r1]
	lsl	r0, r0, #0x8
	ldr	r1, [r7, #0x4]
	add	r4, r1, r0
	add	r1, r4, r2
	ldr	r0, [r7, #0x4c]
	add	r5, r1, r0
	b	.L42
.L41:
	ldr	r3, [sp, #0x44]
	mov	r5, #0x0
	ldsh	r0, [r3, r5]
	lsl	r0, r0, #0x8
	ldr	r1, [r7, #0x4]
	add	r5, r1, r0
	add	r1, r5, r2
	ldr	r0, [r7, #0x4c]
	add	r4, r1, r0
.L42:
	ldr	r0, [sp, #0x2c]
	ldr	r1, [sp, #0x1c]
	cmp	r0, r1
	bgt	.L43	@cond_branch
	b	.L68
.L43:
	ldr	r3, [sp, #0x20]
	cmp	r3, r6
	bgt	.L45	@cond_branch
	b	.L68
.L45:
	ldr	r0, [sp, #0x3c]
	mov	r1, #0x2
	orr	r0, r0, r1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0x3c]
	ldr	r3, [sp, #0x30]
	cmp	r4, r3
	bgt	.L57	@cond_branch
	cmp	r5, r3
	blt	.L57	@cond_branch
	mov	r0, #0x30
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L57	@cond_branch
	ldr	r3, [sp, #0x40]
	cmp	r3, #0
	bne	.L50	@cond_branch
	ldr	r0, [r7, #0x40]
	cmp	r0, #0
	ble	.L51	@cond_branch
	mov	r0, #0x10
	mov	r1, r9
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
	b	.L52
.L51:
	mov	r0, #0x20
	mov	r2, r9
	orr	r2, r2, r0
	lsl	r0, r2, #0x10
.L52:
	lsr	r0, r0, #0x10
	mov	r9, r0
	add	r0, r7, #0
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	mov	r3, r9
	bl	call_rider_94_8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L53	@cond_branch
	mov	r3, #0x0
	mov	sl, r3
.L53:
	mov	r0, #0x1
	str	r0, [sp, #0x40]
	ldr	r2, [r7, #0x40]
.L50:
	cmp	r2, #0
	ble	.L54	@cond_branch
	mov	r0, #0x10
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L57	@cond_branch
	ldr	r3, [sp, #0x4c]
	mov	r1, #0x0
	ldsh	r0, [r3, r1]
	lsl	r0, r0, #0x8
	ldr	r3, [sp, #0x30]
	sub	r0, r3, r0
	str	r0, [r7, #0x4]
	mov	r0, #0x2
	ldr	r1, [sp, #0x38]
	orr	r0, r0, r1
	str	r0, [sp, #0x38]
	mov	r0, #0x10
	b	.L56
.L54:
	mov	r0, #0x20
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L57	@cond_branch
	ldr	r3, [sp, #0x44]
	mov	r1, #0x0
	ldsh	r0, [r3, r1]
	lsl	r0, r0, #0x8
	ldr	r3, [sp, #0x30]
	sub	r0, r3, r0
	add	r0, r0, #0x80
	str	r0, [r7, #0x4]
	ldr	r0, [sp, #0x38]
	mov	r1, #0x2
	orr	r0, r0, r1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0x38]
	mov	r0, #0x20
.L56:
	ldr	r3, [sp, #0x14]
	orr	r3, r3, r0
	lsl	r0, r3, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x14]
.L57:
	ldr	r0, [sp, #0x34]
	cmp	r4, r0
	bgt	.L68	@cond_branch
	cmp	r5, r0
	blt	.L68	@cond_branch
	mov	r0, #0xc0
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L68	@cond_branch
	ldr	r3, [sp, #0x40]
	cmp	r3, #0
	bne	.L61	@cond_branch
	ldr	r0, [r7, #0x40]
	cmp	r0, #0
	ble	.L62	@cond_branch
	mov	r0, #0x40
	mov	r5, r9
	orr	r5, r5, r0
	lsl	r0, r5, #0x10
	b	.L63
.L62:
	mov	r0, #0x80
	mov	r1, r9
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
.L63:
	lsr	r0, r0, #0x10
	mov	r9, r0
	add	r0, r7, #0
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	mov	r3, r9
	bl	call_rider_94_8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L64	@cond_branch
	mov	r2, #0x0
	mov	sl, r2
.L64:
	ldr	r2, [r7, #0x40]
.L61:
	cmp	r2, #0
	ble	.L65	@cond_branch
	mov	r0, #0x40
	mov	r3, sl
	and	r3, r3, r0
	cmp	r3, #0
	beq	.L68	@cond_branch
	ldr	r5, [sp, #0x4c]
	mov	r1, #0x0
	ldsh	r0, [r5, r1]
	lsl	r0, r0, #0x8
	ldr	r2, [sp, #0x34]
	sub	r0, r2, r0
	str	r0, [r7, #0x4]
	ldr	r3, [sp, #0x38]
	mov	r5, #0x2
	orr	r3, r3, r5
	lsl	r0, r3, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0x38]
	mov	r0, #0x40
	ldr	r1, [sp, #0x14]
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
	b	.L67
.L65:
	mov	r0, #0x80
	mov	r2, sl
	and	r2, r2, r0
	cmp	r2, #0
	beq	.L68	@cond_branch
	ldr	r3, [sp, #0x44]
	mov	r5, #0x0
	ldsh	r0, [r3, r5]
	lsl	r0, r0, #0x8
	ldr	r1, [sp, #0x34]
	sub	r0, r1, r0
	add	r0, r0, #0x80
	str	r0, [r7, #0x4]
	ldr	r2, [sp, #0x38]
	mov	r3, #0x2
	orr	r2, r2, r3
	lsl	r0, r2, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0x38]
	mov	r0, #0x80
	ldr	r5, [sp, #0x14]
	orr	r5, r5, r0
	lsl	r0, r5, #0x10
.L67:
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x14]
.L68:
	ldr	r0, [sp, #0x3c]
	cmp	r0, #0x3
	bne	.L73	@cond_branch
	ldr	r1, [sp, #0x4]
	cmp	r1, #0
	beq	.L71	@cond_branch
	ldr	r2, [sp, #0x10]
	ldr	r3, [sp, #0x8]
	cmp	r2, r3
	bcs	.L71	@cond_branch
	lsl	r0, r2, #0x2
	add	r0, r0, r1
	ldr	r5, [sp, #0xc]
	str	r5, [r0]
	add	r0, r2, #0
	add	r0, r0, #0x1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x10]
.L71:
	add	r0, r7, #0
	add	r0, r0, #0x94
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L73	@cond_branch
	ldr	r3, [r0, #0x4]
	cmp	r3, #0
	beq	.L73	@cond_branch
	add	r0, r7, #0
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	bl	_call_via_r3
.L73:
	mov	r0, #0x1
	ldr	r1, [sp, #0x38]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L74	@cond_branch
	ldr	r0, [r7, #0x44]
	ldr	r2, [sp, #0xc]
	ldrb	r2, [r2, #0xd]
	mul	r0, r0, r2
	asr	r0, r0, #0x7
	add	r1, r0, #0
	cmp	r0, #0
	bge	.L75	@cond_branch
	NEG	r1, r0
.L75:
	cmp	r1, #0xff
	bgt	.L76	@cond_branch
	mov	r0, #0x0
.L76:
	NEG	r0, r0
	str	r0, [r7, #0x44]
.L74:
	mov	r0, #0x2
	ldr	r3, [sp, #0x38]
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L77	@cond_branch
	ldr	r0, [r7, #0x40]
	ldr	r5, [sp, #0xc]
	ldrb	r5, [r5, #0xd]
	mul	r0, r0, r5
	asr	r0, r0, #0x7
	add	r1, r0, #0
	cmp	r0, #0
	bge	.L78	@cond_branch
	NEG	r1, r0
.L78:
	cmp	r1, #0xff
	bgt	.L79	@cond_branch
	mov	r0, #0x0
.L79:
	NEG	r0, r0
	str	r0, [r7, #0x40]
.L77:
	ldr	r0, [sp, #0x38]
	cmp	r0, #0
	beq	.L82	@cond_branch
	add	r0, r7, #0
	add	r0, r0, #0x94
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L82	@cond_branch
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L82	@cond_branch
	add	r0, r7, #0
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	ldr	r3, [sp, #0x14]
	bl	_call_via_r4
.L82:
	ldr	r1, [sp, #0x18]
	add	r1, r1, #0x1
	str	r1, [sp, #0x18]
	ldr	r2, [sp, #0x74]
	ldrh	r2, [r2, #0x28]
	cmp	r1, r2
	bge	.L83	@cond_branch
	b	.L84
.L83:
	ldr	r0, [sp, #0x10]
	add	sp, sp, #0x54
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805C9A4

.align 2, 0 @ Don't pad with nop.
