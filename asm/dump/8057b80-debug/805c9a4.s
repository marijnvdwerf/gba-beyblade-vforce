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
	blt	.L805C9D2	@cond_branch
	b	.L805CEA6
.L805C9D2:
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
	bge	.L805CA24	@cond_branch
	str	r6, [sp, #0x30]
	str	r3, [sp, #0x34]
	b	.L805CA28
.L805CA24:
	str	r3, [sp, #0x30]
	str	r6, [sp, #0x34]
.L805CA28:
	ldr	r1, [r5, #0x4]
	ldr	r0, [r4, #0x4]
	cmp	r1, r0
	bge	.L805CA3A	@cond_branch
	mov	r5, r8
	str	r5, [sp, #0x1c]
	mov	r0, ip
	str	r0, [sp, #0x20]
	b	.L805CA42
.L805CA3A:
	mov	r1, ip
	str	r1, [sp, #0x1c]
	mov	r2, r8
	str	r2, [sp, #0x20]
.L805CA42:
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
	ble	.L805CA78	@cond_branch
	add	r5, r3, r5
	str	r5, [sp, #0x24]
	add	r0, r5, #0
	ADD r0, r8
	add	r0, r0, r4
	str	r0, [sp, #0x28]
	add	r6, r3, r6
	str	r0, [sp, #0x2c]
	b	.L805CA88
.L805CA78:
	add	r6, r3, r6
	str	r6, [sp, #0x28]
	add	r0, r6, #0
	ADD r0, r8
	add	r6, r0, r4
	str	r6, [sp, #0x24]
	add	r3, r3, r5
	str	r3, [sp, #0x2c]
.L805CA88:
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
	blt	.L805CAB2	@cond_branch
	ldr	r2, [sp, #0x34]
	cmp	r2, r4
	bge	.L805CAC4	@cond_branch
.L805CAB2:
	ldr	r3, [sp, #0x2c]
	ldr	r5, [sp, #0x1c]
	cmp	r3, r5
	bge	.L805CABC	@cond_branch
	b	.L805CE96
.L805CABC:
	ldr	r0, [sp, #0x20]
	cmp	r0, r6
	bge	.L805CAC4	@cond_branch
	b	.L805CE96
.L805CAC4:
	ldr	r2, [sp, #0x30]
	cmp	r1, r2
	bgt	.L805CACC	@cond_branch
	b	.L805CC40
.L805CACC:
	ldr	r3, [sp, #0x34]
	cmp	r3, r4
	bgt	.L805CAD4	@cond_branch
	b	.L805CC40
.L805CAD4:
	mov	r0, #0x1
	ldr	r5, [sp, #0x3c]
	orr	r5, r5, r0
	str	r5, [sp, #0x3c]
	ldr	r0, [sp, #0x24]
	ldr	r1, [sp, #0x1c]
	cmp	r0, r1
	bgt	.L805CB8E	@cond_branch
	ldr	r2, [sp, #0x28]
	cmp	r2, r1
	blt	.L805CB8E	@cond_branch
	mov	r0, #0x3
	mov	r3, sl
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L805CB8E	@cond_branch
	ldr	r5, [sp, #0x40]
	cmp	r5, #0
	bne	.L805CB34	@cond_branch
	ldr	r0, [r7, #0x44]
	cmp	r0, #0
	ble	.L805CB0A	@cond_branch
	mov	r0, #0x1
	mov	r1, r9
	orr	r1, r1, r0
	mov	r9, r1
	b	.L805CB16
.L805CB0A:
	mov	r2, r9
	mov	r3, #0x2
	orr	r2, r2, r3
	lsl	r0, r2, #0x10
	lsr	r0, r0, #0x10
	mov	r9, r0
.L805CB16:
	add	r0, r7, #0
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	mov	r3, r9
	bl	call_rider_94_8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L805CB2C	@cond_branch
	mov	r5, #0x0
	mov	sl, r5
.L805CB2C:
	mov	r0, #0x1
	str	r0, [sp, #0x40]
	ldr	r1, [r7, #0x44]
	mov	r8, r1
.L805CB34:
	mov	r2, r8
	cmp	r2, #0
	ble	.L805CB62	@cond_branch
	mov	r0, #0x1
	mov	r3, sl
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L805CB8E	@cond_branch
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
	b	.L805CB8E
.L805CB62:
	mov	r0, #0x2
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805CB8E	@cond_branch
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
.L805CB8E:
	ldr	r3, [sp, #0x24]
	ldr	r5, [sp, #0x20]
	cmp	r3, r5
	bgt	.L805CC40	@cond_branch
	ldr	r0, [sp, #0x28]
	cmp	r0, r5
	blt	.L805CC40	@cond_branch
	mov	r0, #0xc
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805CC40	@cond_branch
	ldr	r2, [sp, #0x40]
	cmp	r2, #0
	bne	.L805CBE6	@cond_branch
	ldr	r0, [r7, #0x44]
	cmp	r0, #0
	ble	.L805CBBC	@cond_branch
	mov	r0, #0x4
	mov	r3, r9
	orr	r3, r3, r0
	lsl	r0, r3, #0x10
	b	.L805CBC4
.L805CBBC:
	mov	r0, #0x8
	mov	r5, r9
	orr	r5, r5, r0
	lsl	r0, r5, #0x10
.L805CBC4:
	lsr	r0, r0, #0x10
	mov	r9, r0
	add	r0, r7, #0
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	mov	r3, r9
	bl	call_rider_94_8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L805CBDE	@cond_branch
	mov	r0, #0x0
	mov	sl, r0
.L805CBDE:
	mov	r1, #0x1
	str	r1, [sp, #0x40]
	ldr	r2, [r7, #0x44]
	mov	r8, r2
.L805CBE6:
	mov	r3, r8
	cmp	r3, #0
	ble	.L805CC14	@cond_branch
	mov	r0, #0x4
	mov	r5, sl
	and	r0, r0, r5
	cmp	r0, #0
	beq	.L805CC40	@cond_branch
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
	b	.L805CC3C
.L805CC14:
	mov	r0, #0x8
	mov	r2, sl
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L805CC40	@cond_branch
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
.L805CC3C:
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x14]
.L805CC40:
	ldr	r2, [r7, #0x40]
	cmp	r2, #0
	ble	.L805CC5A	@cond_branch
	ldr	r5, [sp, #0x4c]
	mov	r1, #0x0
	ldsh	r0, [r5, r1]
	lsl	r0, r0, #0x8
	ldr	r1, [r7, #0x4]
	add	r4, r1, r0
	add	r1, r4, r2
	ldr	r0, [r7, #0x4c]
	add	r5, r1, r0
	b	.L805CC6C
.L805CC5A:
	ldr	r3, [sp, #0x44]
	mov	r5, #0x0
	ldsh	r0, [r3, r5]
	lsl	r0, r0, #0x8
	ldr	r1, [r7, #0x4]
	add	r5, r1, r0
	add	r1, r5, r2
	ldr	r0, [r7, #0x4c]
	add	r4, r1, r0
.L805CC6C:
	ldr	r0, [sp, #0x2c]
	ldr	r1, [sp, #0x1c]
	cmp	r0, r1
	bgt	.L805CC76	@cond_branch
	b	.L805CDE8
.L805CC76:
	ldr	r3, [sp, #0x20]
	cmp	r3, r6
	bgt	.L805CC7E	@cond_branch
	b	.L805CDE8
.L805CC7E:
	ldr	r0, [sp, #0x3c]
	mov	r1, #0x2
	orr	r0, r0, r1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0x3c]
	ldr	r3, [sp, #0x30]
	cmp	r4, r3
	bgt	.L805CD36	@cond_branch
	cmp	r5, r3
	blt	.L805CD36	@cond_branch
	mov	r0, #0x30
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805CD36	@cond_branch
	ldr	r3, [sp, #0x40]
	cmp	r3, #0
	bne	.L805CCDC	@cond_branch
	ldr	r0, [r7, #0x40]
	cmp	r0, #0
	ble	.L805CCB4	@cond_branch
	mov	r0, #0x10
	mov	r1, r9
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
	b	.L805CCBC
.L805CCB4:
	mov	r0, #0x20
	mov	r2, r9
	orr	r2, r2, r0
	lsl	r0, r2, #0x10
.L805CCBC:
	lsr	r0, r0, #0x10
	mov	r9, r0
	add	r0, r7, #0
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	mov	r3, r9
	bl	call_rider_94_8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L805CCD6	@cond_branch
	mov	r3, #0x0
	mov	sl, r3
.L805CCD6:
	mov	r0, #0x1
	str	r0, [sp, #0x40]
	ldr	r2, [r7, #0x40]
.L805CCDC:
	cmp	r2, #0
	ble	.L805CD04	@cond_branch
	mov	r0, #0x10
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805CD36	@cond_branch
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
	b	.L805CD2C
.L805CD04:
	mov	r0, #0x20
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805CD36	@cond_branch
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
.L805CD2C:
	ldr	r3, [sp, #0x14]
	orr	r3, r3, r0
	lsl	r0, r3, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x14]
.L805CD36:
	ldr	r0, [sp, #0x34]
	cmp	r4, r0
	bgt	.L805CDE8	@cond_branch
	cmp	r5, r0
	blt	.L805CDE8	@cond_branch
	mov	r0, #0xc0
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805CDE8	@cond_branch
	ldr	r3, [sp, #0x40]
	cmp	r3, #0
	bne	.L805CD84	@cond_branch
	ldr	r0, [r7, #0x40]
	cmp	r0, #0
	ble	.L805CD60	@cond_branch
	mov	r0, #0x40
	mov	r5, r9
	orr	r5, r5, r0
	lsl	r0, r5, #0x10
	b	.L805CD68
.L805CD60:
	mov	r0, #0x80
	mov	r1, r9
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
.L805CD68:
	lsr	r0, r0, #0x10
	mov	r9, r0
	add	r0, r7, #0
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	mov	r3, r9
	bl	call_rider_94_8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L805CD82	@cond_branch
	mov	r2, #0x0
	mov	sl, r2
.L805CD82:
	ldr	r2, [r7, #0x40]
.L805CD84:
	cmp	r2, #0
	ble	.L805CDB6	@cond_branch
	mov	r0, #0x40
	mov	r3, sl
	and	r3, r3, r0
	cmp	r3, #0
	beq	.L805CDE8	@cond_branch
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
	b	.L805CDE4
.L805CDB6:
	mov	r0, #0x80
	mov	r2, sl
	and	r2, r2, r0
	cmp	r2, #0
	beq	.L805CDE8	@cond_branch
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
.L805CDE4:
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x14]
.L805CDE8:
	ldr	r0, [sp, #0x3c]
	cmp	r0, #0x3
	bne	.L805CE28	@cond_branch
	ldr	r1, [sp, #0x4]
	cmp	r1, #0
	beq	.L805CE0E	@cond_branch
	ldr	r2, [sp, #0x10]
	ldr	r3, [sp, #0x8]
	cmp	r2, r3
	bcs	.L805CE0E	@cond_branch
	lsl	r0, r2, #0x2
	add	r0, r0, r1
	ldr	r5, [sp, #0xc]
	str	r5, [r0]
	add	r0, r2, #0
	add	r0, r0, #0x1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x10]
.L805CE0E:
	add	r0, r7, #0
	add	r0, r0, #0x94
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L805CE28	@cond_branch
	ldr	r3, [r0, #0x4]
	cmp	r3, #0
	beq	.L805CE28	@cond_branch
	add	r0, r7, #0
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	bl	_call_via_r3
.L805CE28:
	mov	r0, #0x1
	ldr	r1, [sp, #0x38]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805CE4E	@cond_branch
	ldr	r0, [r7, #0x44]
	ldr	r2, [sp, #0xc]
	ldrb	r2, [r2, #0xd]
	mul	r0, r0, r2
	asr	r0, r0, #0x7
	add	r1, r0, #0
	cmp	r0, #0
	bge	.L805CE44	@cond_branch
	NEG	r1, r0
.L805CE44:
	cmp	r1, #0xff
	bgt	.L805CE4A	@cond_branch
	mov	r0, #0x0
.L805CE4A:
	NEG	r0, r0
	str	r0, [r7, #0x44]
.L805CE4E:
	mov	r0, #0x2
	ldr	r3, [sp, #0x38]
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L805CE74	@cond_branch
	ldr	r0, [r7, #0x40]
	ldr	r5, [sp, #0xc]
	ldrb	r5, [r5, #0xd]
	mul	r0, r0, r5
	asr	r0, r0, #0x7
	add	r1, r0, #0
	cmp	r0, #0
	bge	.L805CE6A	@cond_branch
	NEG	r1, r0
.L805CE6A:
	cmp	r1, #0xff
	bgt	.L805CE70	@cond_branch
	mov	r0, #0x0
.L805CE70:
	NEG	r0, r0
	str	r0, [r7, #0x40]
.L805CE74:
	ldr	r0, [sp, #0x38]
	cmp	r0, #0
	beq	.L805CE96	@cond_branch
	add	r0, r7, #0
	add	r0, r0, #0x94
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L805CE96	@cond_branch
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L805CE96	@cond_branch
	add	r0, r7, #0
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	ldr	r3, [sp, #0x14]
	bl	_call_via_r4
.L805CE96:
	ldr	r1, [sp, #0x18]
	add	r1, r1, #0x1
	str	r1, [sp, #0x18]
	ldr	r2, [sp, #0x74]
	ldrh	r2, [r2, #0x28]
	cmp	r1, r2
	bge	.L805CEA6	@cond_branch
	b	.L805C9D2
.L805CEA6:
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
