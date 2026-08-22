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
	blt	.L805CEDE	@cond_branch
	b	.L805D3EC
.L805CEDE:
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
	beq	.L805CF2A	@cond_branch
	ldr	r0, [r2]
	str	r0, [sp, #0x30]
	ldr	r2, [r2, #0x4]
	str	r2, [sp, #0x34]
	b	.L805CF32
.L805CF2A:
	mov	r1, #0x0
	str	r1, [sp, #0x34]
	mov	r2, #0x0
	str	r2, [sp, #0x30]
.L805CF32:
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
	bge	.L805CF72	@cond_branch
	str	r5, [sp, #0x28]
	str	r4, [sp, #0x2c]
	b	.L805CF76
.L805CF72:
	str	r4, [sp, #0x28]
	str	r5, [sp, #0x2c]
.L805CF76:
	cmp	r1, r0
	bge	.L805CF80	@cond_branch
	mov	r0, ip
	str	r0, [sp, #0x18]
	b	.L805CF84
.L805CF80:
	str	r6, [sp, #0x18]
	mov	r6, ip
.L805CF84:
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
	ble	.L805CFB8	@cond_branch
	add	r4, r7, r4
	str	r4, [sp, #0x1c]
	add	r0, r4, r1
	add	r0, r0, r3
	str	r0, [sp, #0x20]
	add	r5, r7, r5
	str	r5, [sp, #0x24]
	add	r7, r0, #0
	b	.L805CFC8
.L805CFB8:
	add	r5, r7, r5
	str	r5, [sp, #0x20]
	ldr	r2, [sp, #0x40]
	add	r0, r5, r2
	add	r0, r0, r3
	str	r0, [sp, #0x24]
	str	r0, [sp, #0x1c]
	add	r7, r7, r4
.L805CFC8:
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
	blt	.L805CFF4	@cond_branch
	ldr	r2, [sp, #0x2c]
	cmp	r2, r3
	bge	.L805D004	@cond_branch
.L805CFF4:
	ldr	r4, [sp, #0x18]
	cmp	r7, r4
	bge	.L805CFFC	@cond_branch
	b	.L805D3DE
.L805CFFC:
	ldr	r1, [sp, #0x24]
	cmp	r6, r1
	bge	.L805D004	@cond_branch
	b	.L805D3DE
.L805D004:
	ldr	r2, [sp, #0x28]
	cmp	r0, r2
	bgt	.L805D00C	@cond_branch
	b	.L805D188
.L805D00C:
	ldr	r4, [sp, #0x2c]
	cmp	r4, r3
	bgt	.L805D014	@cond_branch
	b	.L805D188
.L805D014:
	mov	r0, #0x1
	ldr	r1, [sp, #0x48]
	orr	r1, r1, r0
	str	r1, [sp, #0x48]
	ldr	r2, [sp, #0x1c]
	ldr	r3, [sp, #0x18]
	cmp	r2, r3
	bgt	.L805D0D6	@cond_branch
	ldr	r4, [sp, #0x20]
	cmp	r4, r3
	blt	.L805D0D6	@cond_branch
	mov	r0, #0x3
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805D0D6	@cond_branch
	ldr	r2, [sp, #0x4c]
	cmp	r2, #0
	bne	.L805D070	@cond_branch
	ldr	r3, [sp, #0x40]
	cmp	r3, #0
	ble	.L805D04A	@cond_branch
	mov	r0, #0x1
	mov	r4, r9
	orr	r4, r4, r0
	mov	r9, r4
	b	.L805D056
.L805D04A:
	mov	r0, r9
	mov	r1, #0x2
	orr	r0, r0, r1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r9, r0
.L805D056:
	mov	r0, r8
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	mov	r3, r9
	bl	call_rider_94_8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L805D06C	@cond_branch
	mov	r2, #0x0
	mov	sl, r2
.L805D06C:
	mov	r3, #0x1
	str	r3, [sp, #0x4c]
.L805D070:
	ldr	r4, [sp, #0x40]
	cmp	r4, #0
	ble	.L805D0A4	@cond_branch
	mov	r0, #0x1
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805D0D6	@cond_branch
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
	b	.L805D0D6
.L805D0A4:
	mov	r0, #0x2
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805D0D6	@cond_branch
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
.L805D0D6:
	ldr	r1, [sp, #0x1c]
	cmp	r1, r6
	bgt	.L805D188	@cond_branch
	ldr	r2, [sp, #0x20]
	cmp	r2, r6
	blt	.L805D188	@cond_branch
	mov	r0, #0xc
	mov	r3, sl
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L805D188	@cond_branch
	ldr	r4, [sp, #0x4c]
	cmp	r4, #0
	bne	.L805D128	@cond_branch
	ldr	r0, [sp, #0x40]
	cmp	r0, #0
	ble	.L805D102	@cond_branch
	mov	r0, #0x4
	mov	r1, r9
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
	b	.L805D10A
.L805D102:
	mov	r0, #0x8
	mov	r2, r9
	orr	r2, r2, r0
	lsl	r0, r2, #0x10
.L805D10A:
	lsr	r0, r0, #0x10
	mov	r9, r0
	mov	r0, r8
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	mov	r3, r9
	bl	call_rider_94_8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L805D124	@cond_branch
	mov	r3, #0x0
	mov	sl, r3
.L805D124:
	mov	r4, #0x1
	str	r4, [sp, #0x4c]
.L805D128:
	ldr	r0, [sp, #0x40]
	cmp	r0, #0
	ble	.L805D15A	@cond_branch
	mov	r0, #0x4
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805D188	@cond_branch
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
	b	.L805D184
.L805D15A:
	mov	r0, #0x8
	mov	r4, sl
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L805D188	@cond_branch
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
.L805D184:
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x10]
.L805D188:
	ldr	r2, [sp, #0x3c]
	cmp	r2, #0
	ble	.L805D1A4	@cond_branch
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
	b	.L805D1BA
.L805D1A4:
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
.L805D1BA:
	ldr	r0, [sp, #0x18]
	cmp	r7, r0
	bgt	.L805D1C2	@cond_branch
	b	.L805D348
.L805D1C2:
	ldr	r1, [sp, #0x24]
	cmp	r6, r1
	bgt	.L805D1CA	@cond_branch
	b	.L805D348
.L805D1CA:
	ldr	r2, [sp, #0x48]
	mov	r3, #0x2
	orr	r2, r2, r3
	lsl	r0, r2, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0x48]
	ldr	r0, [sp, #0x28]
	cmp	r4, r0
	bgt	.L805D290	@cond_branch
	cmp	r5, r0
	blt	.L805D290	@cond_branch
	mov	r0, #0x30
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805D290	@cond_branch
	ldr	r2, [sp, #0x4c]
	cmp	r2, #0
	bne	.L805D226	@cond_branch
	ldr	r3, [sp, #0x3c]
	cmp	r3, #0
	ble	.L805D200	@cond_branch
	mov	r0, #0x10
	mov	r1, r9
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
	b	.L805D208
.L805D200:
	mov	r0, #0x20
	mov	r2, r9
	orr	r2, r2, r0
	lsl	r0, r2, #0x10
.L805D208:
	lsr	r0, r0, #0x10
	mov	r9, r0
	mov	r0, r8
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	mov	r3, r9
	bl	call_rider_94_8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L805D222	@cond_branch
	mov	r3, #0x0
	mov	sl, r3
.L805D222:
	mov	r0, #0x1
	str	r0, [sp, #0x4c]
.L805D226:
	ldr	r1, [sp, #0x3c]
	cmp	r1, #0
	ble	.L805D25C	@cond_branch
	mov	r0, #0x10
	mov	r2, sl
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L805D290	@cond_branch
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
	b	.L805D28C
.L805D25C:
	mov	r0, #0x20
	mov	r2, sl
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L805D290	@cond_branch
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
.L805D28C:
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x10]
.L805D290:
	ldr	r3, [sp, #0x2c]
	cmp	r4, r3
	bgt	.L805D348	@cond_branch
	cmp	r5, r3
	blt	.L805D348	@cond_branch
	mov	r0, #0xc0
	mov	r4, sl
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L805D348	@cond_branch
	ldr	r0, [sp, #0x4c]
	cmp	r0, #0
	bne	.L805D2DC	@cond_branch
	ldr	r1, [sp, #0x3c]
	cmp	r1, #0
	ble	.L805D2BA	@cond_branch
	mov	r0, #0x40
	mov	r2, r9
	orr	r2, r2, r0
	lsl	r0, r2, #0x10
	b	.L805D2C2
.L805D2BA:
	mov	r0, #0x80
	mov	r3, r9
	orr	r3, r3, r0
	lsl	r0, r3, #0x10
.L805D2C2:
	lsr	r0, r0, #0x10
	mov	r9, r0
	mov	r0, r8
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	mov	r3, r9
	bl	call_rider_94_8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L805D2DC	@cond_branch
	mov	r4, #0x0
	mov	sl, r4
.L805D2DC:
	ldr	r0, [sp, #0x3c]
	cmp	r0, #0
	ble	.L805D312	@cond_branch
	mov	r0, #0x40
	mov	r1, sl
	and	r1, r1, r0
	cmp	r1, #0
	beq	.L805D348	@cond_branch
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
	b	.L805D344
.L805D312:
	mov	r0, #0x80
	mov	r1, sl
	and	r1, r1, r0
	cmp	r1, #0
	beq	.L805D348	@cond_branch
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
.L805D344:
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x10]
.L805D348:
	ldr	r2, [sp, #0x48]
	cmp	r2, #0x3
	bne	.L805D368	@cond_branch
	mov	r0, r8
	add	r0, r0, #0x94
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L805D368	@cond_branch
	ldr	r3, [r0, #0x4]
	cmp	r3, #0
	beq	.L805D368	@cond_branch
	mov	r0, r8
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	bl	_call_via_r3
.L805D368:
	mov	r0, #0x1
	ldr	r3, [sp, #0x44]
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L805D392	@cond_branch
	ldr	r4, [sp, #0xc]
	ldrb	r4, [r4, #0xd]
	ldr	r1, [sp, #0x40]
	add	r0, r4, #0
	mul	r0, r0, r1
	asr	r0, r0, #0x7
	add	r1, r0, #0
	cmp	r0, #0
	bge	.L805D386	@cond_branch
	neg	r1, r0
.L805D386:
	cmp	r1, #0xff
	bgt	.L805D38C	@cond_branch
	mov	r0, #0x0
.L805D38C:
	neg	r0, r0
	mov	r2, r8
	str	r0, [r2, #0x44]
.L805D392:
	mov	r0, #0x2
	ldr	r3, [sp, #0x44]
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L805D3BC	@cond_branch
	ldr	r4, [sp, #0xc]
	ldrb	r4, [r4, #0xd]
	ldr	r1, [sp, #0x3c]
	add	r0, r4, #0
	mul	r0, r0, r1
	asr	r0, r0, #0x7
	add	r1, r0, #0
	cmp	r0, #0
	bge	.L805D3B0	@cond_branch
	neg	r1, r0
.L805D3B0:
	cmp	r1, #0xff
	bgt	.L805D3B6	@cond_branch
	mov	r0, #0x0
.L805D3B6:
	neg	r0, r0
	mov	r2, r8
	str	r0, [r2, #0x40]
.L805D3BC:
	ldr	r3, [sp, #0x44]
	cmp	r3, #0
	beq	.L805D3DE	@cond_branch
	mov	r0, r8
	add	r0, r0, #0x94
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L805D3DE	@cond_branch
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L805D3DE	@cond_branch
	mov	r0, r8
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	ldr	r3, [sp, #0x10]
	bl	_call_via_r4
.L805D3DE:
	ldr	r4, [sp, #0x14]
	add	r4, r4, #0x1
	str	r4, [sp, #0x14]
	ldr	r0, [sp, #0x8]
	cmp	r4, r0
	bge	.L805D3EC	@cond_branch
	b	.L805CEDE
.L805D3EC:
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
