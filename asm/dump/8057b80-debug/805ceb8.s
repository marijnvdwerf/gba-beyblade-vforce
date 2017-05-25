	.include "asm/common.inc"

	thumb_func_start sub_805CEB8
sub_805CEB8:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffa0
	mov	r8, r0
	str	r1, [sp]
	str	r2, [sp, #0x4]
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	str	r3, [sp, #0x8]
	mov	r0, #0x0
	str	r0, [sp, #0x10]
	mov	r1, #0x0
	str	r1, [sp, #0x14]
	cmp	r1, r3
	blt	.L84	@cond_branch
	b	.L83
.L84:
	mov	r2, #0x0
	str	r2, [sp, #0x48]
	mov	r3, #0x0
	str	r3, [sp, #0x44]
	ldr	r4, [sp, #0x14]
	lsl	r2, r4, #0x2
	ldr	r1, [sp, #0x4]
	add	r0, r2, r1
	ldr	r0, [r0]
	lsl	r0, r0, #0x5
	ldr	r3, [sp]
	ldr	r1, [r3, #0xc]
	add	r1, r1, r0
	str	r1, [sp, #0xc]
	ldr	r4, [sp, #0x80]
	add	r2, r2, r4
	ldr	r2, [r2]
	ldrb	r0, [r1, #0x10]
	mov	sl, r0
	mov	r1, #0x0
	str	r1, [sp, #0x4c]
	mov	r9, r1
	ldr	r3, [sp, #0xc]
	ldr	r0, [r3]
	lsl	r0, r0, #0x4
	ldr	r4, [sp]
	ldr	r1, [r4, #0x4]
	add	r4, r1, r0
	ldr	r0, [r3, #0x4]
	lsl	r0, r0, #0x4
	add	r6, r1, r0
	cmp	r2, #0
	beq	.L3	@cond_branch
	ldr	r0, [r2]
	str	r0, [sp, #0x30]
	ldr	r2, [r2, #0x4]
	str	r2, [sp, #0x34]
	b	.L4
.L3:
	mov	r1, #0x0
	str	r1, [sp, #0x34]
	mov	r2, #0x0
	str	r2, [sp, #0x30]
.L4:
	mov	r3, r8
	ldr	r0, [r3, #0x4]
	ldr	r1, [sp, #0x30]
	add	r0, r0, r1
	ldr	r1, [r3, #0x40]
	sub	r0, r0, r1
	str	r0, [sp, #0x38]
	ldr	r2, [sp, #0x30]
	sub	r1, r1, r2
	str	r1, [sp, #0x3c]
	ldr	r0, [r3, #0x8]
	ldr	r3, [sp, #0x34]
	add	r0, r0, r3
	mov	r2, r8
	ldr	r1, [r2, #0x44]
	sub	r7, r0, r1
	sub	r1, r1, r3
	str	r1, [sp, #0x40]
	ldr	r3, [r4]
	lsl	r5, r3, #0x5
	ldr	r1, [r4, #0x4]
	lsl	r4, r1, #0x5
	mov	ip, r4
	ldr	r2, [r6]
	lsl	r4, r2, #0x5
	ldr	r0, [r6, #0x4]
	lsl	r6, r0, #0x5
	cmp	r3, r2
	bge	.L5	@cond_branch
	str	r5, [sp, #0x28]
	str	r4, [sp, #0x2c]
	b	.L6
.L5:
	str	r4, [sp, #0x28]
	str	r5, [sp, #0x2c]
.L6:
	cmp	r1, r0
	bge	.L7	@cond_branch
	mov	r0, ip
	str	r0, [sp, #0x18]
	b	.L8
.L7:
	str	r6, [sp, #0x18]
	mov	r6, ip
.L8:
	mov	r2, r8
	add	r2, r2, #0xaa
	mov	r1, #0x0
	ldsh	r0, [r2, r1]
	lsl	r5, r0, #0x8
	mov	r1, r8
	add	r1, r1, #0xae
	mov	r3, #0x0
	ldsh	r0, [r1, r3]
	lsl	r4, r0, #0x8
	mov	r0, r8
	ldr	r3, [r0, #0x50]
	str	r2, [sp, #0x54]
	str	r1, [sp, #0x5c]
	ldr	r1, [sp, #0x40]
	cmp	r1, #0
	ble	.L9	@cond_branch
	add	r4, r7, r4
	str	r4, [sp, #0x1c]
	add	r0, r4, r1
	add	r0, r0, r3
	str	r0, [sp, #0x20]
	add	r5, r7, r5
	str	r5, [sp, #0x24]
	add	r7, r0, #0
	b	.L10
.L9:
	add	r5, r7, r5
	str	r5, [sp, #0x20]
	ldr	r2, [sp, #0x40]
	add	r0, r5, r2
	add	r0, r0, r3
	str	r0, [sp, #0x24]
	str	r0, [sp, #0x1c]
	add	r7, r7, r4
.L10:
	mov	r2, r8
	add	r2, r2, #0xa8
	mov	r3, #0x0
	ldsh	r0, [r2, r3]
	lsl	r0, r0, #0x8
	ldr	r4, [sp, #0x38]
	add	r3, r4, r0
	mov	r1, r8
	add	r1, r1, #0xac
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	lsl	r0, r0, #0x8
	ldr	r4, [sp, #0x38]
	add	r0, r4, r0
	str	r2, [sp, #0x50]
	str	r1, [sp, #0x58]
	ldr	r1, [sp, #0x28]
	cmp	r0, r1
	blt	.L11	@cond_branch
	ldr	r2, [sp, #0x2c]
	cmp	r2, r3
	bge	.L15	@cond_branch
.L11:
	ldr	r4, [sp, #0x18]
	cmp	r7, r4
	bge	.L13	@cond_branch
	b	.L82
.L13:
	ldr	r1, [sp, #0x24]
	cmp	r6, r1
	bge	.L15	@cond_branch
	b	.L82
.L15:
	ldr	r2, [sp, #0x28]
	cmp	r0, r2
	bgt	.L17	@cond_branch
	b	.L42
.L17:
	ldr	r4, [sp, #0x2c]
	cmp	r4, r3
	bgt	.L19	@cond_branch
	b	.L42
.L19:
	mov	r0, #0x1
	ldr	r1, [sp, #0x48]
	orr	r1, r1, r0
	str	r1, [sp, #0x48]
	ldr	r2, [sp, #0x1c]
	ldr	r3, [sp, #0x18]
	cmp	r2, r3
	bgt	.L31	@cond_branch
	ldr	r4, [sp, #0x20]
	cmp	r4, r3
	blt	.L31	@cond_branch
	mov	r0, #0x3
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L31	@cond_branch
	ldr	r2, [sp, #0x4c]
	cmp	r2, #0
	bne	.L24	@cond_branch
	ldr	r3, [sp, #0x40]
	cmp	r3, #0
	ble	.L25	@cond_branch
	mov	r0, #0x1
	mov	r4, r9
	orr	r4, r4, r0
	mov	r9, r4
	b	.L26
.L25:
	mov	r0, r9
	mov	r1, #0x2
	orr	r0, r0, r1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r9, r0
.L26:
	mov	r0, r8
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	mov	r3, r9
	bl	call_rider_94_8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L27	@cond_branch
	mov	r2, #0x0
	mov	sl, r2
.L27:
	mov	r3, #0x1
	str	r3, [sp, #0x4c]
.L24:
	ldr	r4, [sp, #0x40]
	cmp	r4, #0
	ble	.L28	@cond_branch
	mov	r0, #0x1
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L31	@cond_branch
	ldr	r2, [sp, #0x5c]
	mov	r3, #0x0
	ldsh	r0, [r2, r3]
	lsl	r0, r0, #0x8
	ldr	r4, [sp, #0x18]
	sub	r0, r4, r0
	ldr	r1, [sp, #0x34]
	add	r0, r0, r1
	mov	r2, r8
	str	r0, [r2, #0x8]
	ldr	r7, [sp, #0x18]
	mov	r3, #0x1
	str	r3, [sp, #0x44]
	mov	r0, #0x1
	ldr	r4, [sp, #0x10]
	orr	r4, r4, r0
	str	r4, [sp, #0x10]
	b	.L31
.L28:
	mov	r0, #0x2
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L31	@cond_branch
	ldr	r2, [sp, #0x54]
	mov	r3, #0x0
	ldsh	r0, [r2, r3]
	lsl	r0, r0, #0x8
	ldr	r4, [sp, #0x18]
	sub	r0, r4, r0
	ldr	r1, [sp, #0x34]
	add	r0, r0, r1
	add	r0, r0, #0x80
	mov	r2, r8
	str	r0, [r2, #0x8]
	str	r4, [sp, #0x24]
	mov	r3, #0x1
	str	r3, [sp, #0x44]
	ldr	r4, [sp, #0x10]
	mov	r0, #0x2
	orr	r4, r4, r0
	lsl	r0, r4, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x10]
.L31:
	ldr	r1, [sp, #0x1c]
	cmp	r1, r6
	bgt	.L42	@cond_branch
	ldr	r2, [sp, #0x20]
	cmp	r2, r6
	blt	.L42	@cond_branch
	mov	r0, #0xc
	mov	r3, sl
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L42	@cond_branch
	ldr	r4, [sp, #0x4c]
	cmp	r4, #0
	bne	.L35	@cond_branch
	ldr	r0, [sp, #0x40]
	cmp	r0, #0
	ble	.L36	@cond_branch
	mov	r0, #0x4
	mov	r1, r9
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
	b	.L37
.L36:
	mov	r0, #0x8
	mov	r2, r9
	orr	r2, r2, r0
	lsl	r0, r2, #0x10
.L37:
	lsr	r0, r0, #0x10
	mov	r9, r0
	mov	r0, r8
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	mov	r3, r9
	bl	call_rider_94_8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L38	@cond_branch
	mov	r3, #0x0
	mov	sl, r3
.L38:
	mov	r4, #0x1
	str	r4, [sp, #0x4c]
.L35:
	ldr	r0, [sp, #0x40]
	cmp	r0, #0
	ble	.L39	@cond_branch
	mov	r0, #0x4
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L42	@cond_branch
	ldr	r2, [sp, #0x5c]
	mov	r3, #0x0
	ldsh	r0, [r2, r3]
	lsl	r0, r0, #0x8
	sub	r0, r6, r0
	ldr	r4, [sp, #0x34]
	add	r0, r0, r4
	mov	r1, r8
	str	r0, [r1, #0x8]
	add	r7, r6, #0
	mov	r2, #0x1
	str	r2, [sp, #0x44]
	mov	r0, #0x4
	ldr	r3, [sp, #0x10]
	orr	r3, r3, r0
	lsl	r0, r3, #0x10
	b	.L41
.L39:
	mov	r0, #0x8
	mov	r4, sl
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L42	@cond_branch
	ldr	r1, [sp, #0x54]
	mov	r2, #0x0
	ldsh	r0, [r1, r2]
	lsl	r0, r0, #0x8
	sub	r0, r6, r0
	ldr	r3, [sp, #0x34]
	add	r0, r0, r3
	mov	r4, r8
	str	r0, [r4, #0x8]
	str	r6, [sp, #0x24]
	mov	r0, #0x1
	str	r0, [sp, #0x44]
	mov	r0, #0x8
	ldr	r1, [sp, #0x10]
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
.L41:
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x10]
.L42:
	ldr	r2, [sp, #0x3c]
	cmp	r2, #0
	ble	.L43	@cond_branch
	ldr	r3, [sp, #0x58]
	mov	r4, #0x0
	ldsh	r0, [r3, r4]
	lsl	r0, r0, #0x8
	ldr	r1, [sp, #0x38]
	add	r4, r1, r0
	add	r1, r4, r2
	mov	r2, r8
	ldr	r0, [r2, #0x4c]
	add	r5, r1, r0
	b	.L44
.L43:
	ldr	r3, [sp, #0x50]
	mov	r4, #0x0
	ldsh	r0, [r3, r4]
	lsl	r0, r0, #0x8
	ldr	r1, [sp, #0x38]
	add	r5, r1, r0
	ldr	r2, [sp, #0x3c]
	add	r1, r5, r2
	mov	r3, r8
	ldr	r0, [r3, #0x4c]
	add	r4, r1, r0
.L44:
	ldr	r0, [sp, #0x18]
	cmp	r7, r0
	bgt	.L45	@cond_branch
	b	.L70
.L45:
	ldr	r1, [sp, #0x24]
	cmp	r6, r1
	bgt	.L47	@cond_branch
	b	.L70
.L47:
	ldr	r2, [sp, #0x48]
	mov	r3, #0x2
	orr	r2, r2, r3
	lsl	r0, r2, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0x48]
	ldr	r0, [sp, #0x28]
	cmp	r4, r0
	bgt	.L59	@cond_branch
	cmp	r5, r0
	blt	.L59	@cond_branch
	mov	r0, #0x30
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L59	@cond_branch
	ldr	r2, [sp, #0x4c]
	cmp	r2, #0
	bne	.L52	@cond_branch
	ldr	r3, [sp, #0x3c]
	cmp	r3, #0
	ble	.L53	@cond_branch
	mov	r0, #0x10
	mov	r1, r9
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
	b	.L54
.L53:
	mov	r0, #0x20
	mov	r2, r9
	orr	r2, r2, r0
	lsl	r0, r2, #0x10
.L54:
	lsr	r0, r0, #0x10
	mov	r9, r0
	mov	r0, r8
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	mov	r3, r9
	bl	call_rider_94_8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L55	@cond_branch
	mov	r3, #0x0
	mov	sl, r3
.L55:
	mov	r0, #0x1
	str	r0, [sp, #0x4c]
.L52:
	ldr	r1, [sp, #0x3c]
	cmp	r1, #0
	ble	.L56	@cond_branch
	mov	r0, #0x10
	mov	r2, sl
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L59	@cond_branch
	ldr	r3, [sp, #0x58]
	mov	r1, #0x0
	ldsh	r0, [r3, r1]
	lsl	r0, r0, #0x8
	ldr	r2, [sp, #0x28]
	sub	r0, r2, r0
	ldr	r3, [sp, #0x30]
	add	r0, r0, r3
	mov	r1, r8
	str	r0, [r1, #0x4]
	mov	r2, #0x2
	ldr	r3, [sp, #0x44]
	orr	r2, r2, r3
	str	r2, [sp, #0x44]
	mov	r0, #0x10
	ldr	r1, [sp, #0x10]
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
	b	.L58
.L56:
	mov	r0, #0x20
	mov	r2, sl
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L59	@cond_branch
	ldr	r3, [sp, #0x50]
	mov	r1, #0x0
	ldsh	r0, [r3, r1]
	lsl	r0, r0, #0x8
	ldr	r2, [sp, #0x28]
	sub	r0, r2, r0
	add	r0, r0, #0x80
	mov	r3, r8
	str	r0, [r3, #0x4]
	ldr	r0, [sp, #0x44]
	mov	r1, #0x2
	orr	r0, r0, r1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0x44]
	mov	r0, #0x20
	ldr	r2, [sp, #0x10]
	orr	r2, r2, r0
	lsl	r0, r2, #0x10
.L58:
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x10]
.L59:
	ldr	r3, [sp, #0x2c]
	cmp	r4, r3
	bgt	.L70	@cond_branch
	cmp	r5, r3
	blt	.L70	@cond_branch
	mov	r0, #0xc0
	mov	r4, sl
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L70	@cond_branch
	ldr	r0, [sp, #0x4c]
	cmp	r0, #0
	bne	.L66	@cond_branch
	ldr	r1, [sp, #0x3c]
	cmp	r1, #0
	ble	.L64	@cond_branch
	mov	r0, #0x40
	mov	r2, r9
	orr	r2, r2, r0
	lsl	r0, r2, #0x10
	b	.L65
.L64:
	mov	r0, #0x80
	mov	r3, r9
	orr	r3, r3, r0
	lsl	r0, r3, #0x10
.L65:
	lsr	r0, r0, #0x10
	mov	r9, r0
	mov	r0, r8
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	mov	r3, r9
	bl	call_rider_94_8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L66	@cond_branch
	mov	r4, #0x0
	mov	sl, r4
.L66:
	ldr	r0, [sp, #0x3c]
	cmp	r0, #0
	ble	.L67	@cond_branch
	mov	r0, #0x40
	mov	r1, sl
	and	r1, r1, r0
	cmp	r1, #0
	beq	.L70	@cond_branch
	ldr	r2, [sp, #0x58]
	mov	r3, #0x0
	ldsh	r0, [r2, r3]
	lsl	r0, r0, #0x8
	ldr	r4, [sp, #0x2c]
	sub	r0, r4, r0
	mov	r1, r8
	str	r0, [r1, #0x4]
	ldr	r2, [sp, #0x44]
	mov	r3, #0x2
	orr	r2, r2, r3
	lsl	r0, r2, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0x44]
	mov	r0, #0x40
	ldr	r4, [sp, #0x10]
	orr	r4, r4, r0
	lsl	r0, r4, #0x10
	b	.L69
.L67:
	mov	r0, #0x80
	mov	r1, sl
	and	r1, r1, r0
	cmp	r1, #0
	beq	.L70	@cond_branch
	ldr	r2, [sp, #0x50]
	mov	r3, #0x0
	ldsh	r0, [r2, r3]
	lsl	r0, r0, #0x8
	ldr	r4, [sp, #0x2c]
	sub	r0, r4, r0
	ldr	r1, [sp, #0x30]
	add	r0, r0, r1
	mov	r2, r8
	str	r0, [r2, #0x4]
	ldr	r3, [sp, #0x44]
	mov	r4, #0x2
	orr	r3, r3, r4
	lsl	r0, r3, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0x44]
	mov	r0, #0x80
	ldr	r1, [sp, #0x10]
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
.L69:
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x10]
.L70:
	ldr	r2, [sp, #0x48]
	cmp	r2, #0x3
	bne	.L73	@cond_branch
	mov	r0, r8
	add	r0, r0, #0x94
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L73	@cond_branch
	ldr	r3, [r0, #0x4]
	cmp	r3, #0
	beq	.L73	@cond_branch
	mov	r0, r8
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	bl	call_via_r3
.L73:
	mov	r0, #0x1
	ldr	r3, [sp, #0x44]
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L74	@cond_branch
	ldr	r4, [sp, #0xc]
	ldrb	r4, [r4, #0xd]
	ldr	r1, [sp, #0x40]
	add	r0, r4, #0
	mul	r0, r0, r1
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
	mov	r2, r8
	str	r0, [r2, #0x44]
.L74:
	mov	r0, #0x2
	ldr	r3, [sp, #0x44]
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L77	@cond_branch
	ldr	r4, [sp, #0xc]
	ldrb	r4, [r4, #0xd]
	ldr	r1, [sp, #0x3c]
	add	r0, r4, #0
	mul	r0, r0, r1
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
	mov	r2, r8
	str	r0, [r2, #0x40]
.L77:
	ldr	r3, [sp, #0x44]
	cmp	r3, #0
	beq	.L82	@cond_branch
	mov	r0, r8
	add	r0, r0, #0x94
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L82	@cond_branch
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L82	@cond_branch
	mov	r0, r8
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	ldr	r3, [sp, #0x10]
	bl	call_via_r4
.L82:
	ldr	r4, [sp, #0x14]
	add	r4, r4, #0x1
	str	r4, [sp, #0x14]
	ldr	r0, [sp, #0x8]
	cmp	r4, r0
	bge	.L83	@cond_branch
	b	.L84
.L83:
	mov	r0, #0x0
	add	sp, sp, #0x60
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805CEB8

.align 2, 0 @ Don't pad with nop.
