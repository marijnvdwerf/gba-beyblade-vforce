	.include "asm/common.inc"

	thumb_func_start actor_805C48C
actor_805C48C:
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
	ldr	r3, [sp]
	ldr	r0, [r3]
	ldr	r0, [r0, #0x8]
	ldr	r5, [sp, #0x10]
	cmp	r5, r0
	blt	.L805C4BE	@cond_branch
	b	.L805C990
.L805C4BE:
	mov	r0, #0x0
	str	r0, [sp, #0x3c]
	mov	r1, #0x0
	str	r1, [sp, #0x38]
	ldr	r2, [sp, #0x18]
	lsl	r1, r2, #0x5
	ldr	r3, [sp]
	ldr	r0, [r3, #0xc]
	add	r0, r0, r1
	str	r0, [sp, #0xc]
	ldrb	r5, [r0, #0x10]
	mov	sl, r5
	mov	r0, #0x0
	str	r0, [sp, #0x40]
	mov	r9, r0
	ldr	r1, [sp, #0xc]
	ldr	r0, [r1]
	lsl	r0, r0, #0x4
	ldr	r1, [r3, #0x4]
	add	r5, r1, r0
	ldr	r2, [sp, #0xc]
	ldr	r0, [r2, #0x4]
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
	bge	.L805C50C	@cond_branch
	str	r6, [sp, #0x30]
	str	r3, [sp, #0x34]
	b	.L805C510
.L805C50C:
	str	r3, [sp, #0x30]
	str	r6, [sp, #0x34]
.L805C510:
	ldr	r1, [r5, #0x4]
	ldr	r0, [r4, #0x4]
	cmp	r1, r0
	bge	.L805C522	@cond_branch
	mov	r3, r8
	str	r3, [sp, #0x1c]
	mov	r5, ip
	str	r5, [sp, #0x20]
	b	.L805C52A
.L805C522:
	mov	r0, ip
	str	r0, [sp, #0x1c]
	mov	r1, r8
	str	r1, [sp, #0x20]
.L805C52A:
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
	ble	.L805C560	@cond_branch
	add	r5, r3, r5
	str	r5, [sp, #0x24]
	add	r0, r5, #0
	ADD r0, r8
	add	r0, r0, r4
	str	r0, [sp, #0x28]
	add	r6, r3, r6
	str	r0, [sp, #0x2c]
	b	.L805C570
.L805C560:
	add	r6, r3, r6
	str	r6, [sp, #0x28]
	add	r0, r6, #0
	ADD r0, r8
	add	r6, r0, r4
	str	r6, [sp, #0x24]
	add	r3, r3, r5
	str	r3, [sp, #0x2c]
.L805C570:
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
	blt	.L805C59A	@cond_branch
	ldr	r2, [sp, #0x34]
	cmp	r2, r4
	bge	.L805C5AC	@cond_branch
.L805C59A:
	ldr	r3, [sp, #0x2c]
	ldr	r5, [sp, #0x1c]
	cmp	r3, r5
	bge	.L805C5A4	@cond_branch
	b	.L805C97E
.L805C5A4:
	ldr	r0, [sp, #0x20]
	cmp	r0, r6
	bge	.L805C5AC	@cond_branch
	b	.L805C97E
.L805C5AC:
	ldr	r2, [sp, #0x30]
	cmp	r1, r2
	bgt	.L805C5B4	@cond_branch
	b	.L805C728
.L805C5B4:
	ldr	r3, [sp, #0x34]
	cmp	r3, r4
	bgt	.L805C5BC	@cond_branch
	b	.L805C728
.L805C5BC:
	mov	r0, #0x1
	ldr	r5, [sp, #0x3c]
	orr	r5, r5, r0
	str	r5, [sp, #0x3c]
	ldr	r0, [sp, #0x24]
	ldr	r1, [sp, #0x1c]
	cmp	r0, r1
	bgt	.L805C676	@cond_branch
	ldr	r2, [sp, #0x28]
	cmp	r2, r1
	blt	.L805C676	@cond_branch
	mov	r0, #0x3
	mov	r3, sl
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L805C676	@cond_branch
	ldr	r5, [sp, #0x40]
	cmp	r5, #0
	bne	.L805C61C	@cond_branch
	ldr	r0, [r7, #0x44]
	cmp	r0, #0
	ble	.L805C5F2	@cond_branch
	mov	r0, #0x1
	mov	r1, r9
	orr	r1, r1, r0
	mov	r9, r1
	b	.L805C5FE
.L805C5F2:
	mov	r2, r9
	mov	r3, #0x2
	orr	r2, r2, r3
	lsl	r0, r2, #0x10
	lsr	r0, r0, #0x10
	mov	r9, r0
.L805C5FE:
	add	r0, r7, #0
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	mov	r3, r9
	bl	call_rider_94_8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L805C614	@cond_branch
	mov	r5, #0x0
	mov	sl, r5
.L805C614:
	mov	r0, #0x1
	str	r0, [sp, #0x40]
	ldr	r1, [r7, #0x44]
	mov	r8, r1
.L805C61C:
	mov	r2, r8
	cmp	r2, #0
	ble	.L805C64A	@cond_branch
	mov	r0, #0x1
	mov	r3, sl
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L805C676	@cond_branch
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
	b	.L805C676
.L805C64A:
	mov	r0, #0x2
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805C676	@cond_branch
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
.L805C676:
	ldr	r3, [sp, #0x24]
	ldr	r5, [sp, #0x20]
	cmp	r3, r5
	bgt	.L805C728	@cond_branch
	ldr	r0, [sp, #0x28]
	cmp	r0, r5
	blt	.L805C728	@cond_branch
	mov	r0, #0xc
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805C728	@cond_branch
	ldr	r2, [sp, #0x40]
	cmp	r2, #0
	bne	.L805C6CE	@cond_branch
	ldr	r0, [r7, #0x44]
	cmp	r0, #0
	ble	.L805C6A4	@cond_branch
	mov	r0, #0x4
	mov	r3, r9
	orr	r3, r3, r0
	lsl	r0, r3, #0x10
	b	.L805C6AC
.L805C6A4:
	mov	r0, #0x8
	mov	r5, r9
	orr	r5, r5, r0
	lsl	r0, r5, #0x10
.L805C6AC:
	lsr	r0, r0, #0x10
	mov	r9, r0
	add	r0, r7, #0
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	mov	r3, r9
	bl	call_rider_94_8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L805C6C6	@cond_branch
	mov	r0, #0x0
	mov	sl, r0
.L805C6C6:
	mov	r1, #0x1
	str	r1, [sp, #0x40]
	ldr	r2, [r7, #0x44]
	mov	r8, r2
.L805C6CE:
	mov	r3, r8
	cmp	r3, #0
	ble	.L805C6FC	@cond_branch
	mov	r0, #0x4
	mov	r5, sl
	and	r0, r0, r5
	cmp	r0, #0
	beq	.L805C728	@cond_branch
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
	b	.L805C724
.L805C6FC:
	mov	r0, #0x8
	mov	r2, sl
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L805C728	@cond_branch
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
.L805C724:
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x14]
.L805C728:
	ldr	r2, [r7, #0x40]
	cmp	r2, #0
	ble	.L805C742	@cond_branch
	ldr	r5, [sp, #0x4c]
	mov	r1, #0x0
	ldsh	r0, [r5, r1]
	lsl	r0, r0, #0x8
	ldr	r1, [r7, #0x4]
	add	r4, r1, r0
	add	r1, r4, r2
	ldr	r0, [r7, #0x4c]
	add	r5, r1, r0
	b	.L805C754
.L805C742:
	ldr	r3, [sp, #0x44]
	mov	r5, #0x0
	ldsh	r0, [r3, r5]
	lsl	r0, r0, #0x8
	ldr	r1, [r7, #0x4]
	add	r5, r1, r0
	add	r1, r5, r2
	ldr	r0, [r7, #0x4c]
	add	r4, r1, r0
.L805C754:
	ldr	r0, [sp, #0x2c]
	ldr	r1, [sp, #0x1c]
	cmp	r0, r1
	bgt	.L805C75E	@cond_branch
	b	.L805C8D0
.L805C75E:
	ldr	r3, [sp, #0x20]
	cmp	r3, r6
	bgt	.L805C766	@cond_branch
	b	.L805C8D0
.L805C766:
	ldr	r0, [sp, #0x3c]
	mov	r1, #0x2
	orr	r0, r0, r1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0x3c]
	ldr	r3, [sp, #0x30]
	cmp	r4, r3
	bgt	.L805C81E	@cond_branch
	cmp	r5, r3
	blt	.L805C81E	@cond_branch
	mov	r0, #0x30
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805C81E	@cond_branch
	ldr	r3, [sp, #0x40]
	cmp	r3, #0
	bne	.L805C7C4	@cond_branch
	ldr	r0, [r7, #0x40]
	cmp	r0, #0
	ble	.L805C79C	@cond_branch
	mov	r0, #0x10
	mov	r1, r9
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
	b	.L805C7A4
.L805C79C:
	mov	r0, #0x20
	mov	r2, r9
	orr	r2, r2, r0
	lsl	r0, r2, #0x10
.L805C7A4:
	lsr	r0, r0, #0x10
	mov	r9, r0
	add	r0, r7, #0
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	mov	r3, r9
	bl	call_rider_94_8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L805C7BE	@cond_branch
	mov	r3, #0x0
	mov	sl, r3
.L805C7BE:
	mov	r0, #0x1
	str	r0, [sp, #0x40]
	ldr	r2, [r7, #0x40]
.L805C7C4:
	cmp	r2, #0
	ble	.L805C7EC	@cond_branch
	mov	r0, #0x10
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805C81E	@cond_branch
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
	b	.L805C814
.L805C7EC:
	mov	r0, #0x20
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805C81E	@cond_branch
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
.L805C814:
	ldr	r3, [sp, #0x14]
	orr	r3, r3, r0
	lsl	r0, r3, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x14]
.L805C81E:
	ldr	r0, [sp, #0x34]
	cmp	r4, r0
	bgt	.L805C8D0	@cond_branch
	cmp	r5, r0
	blt	.L805C8D0	@cond_branch
	mov	r0, #0xc0
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805C8D0	@cond_branch
	ldr	r3, [sp, #0x40]
	cmp	r3, #0
	bne	.L805C86C	@cond_branch
	ldr	r0, [r7, #0x40]
	cmp	r0, #0
	ble	.L805C848	@cond_branch
	mov	r0, #0x40
	mov	r5, r9
	orr	r5, r5, r0
	lsl	r0, r5, #0x10
	b	.L805C850
.L805C848:
	mov	r0, #0x80
	mov	r1, r9
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
.L805C850:
	lsr	r0, r0, #0x10
	mov	r9, r0
	add	r0, r7, #0
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	mov	r3, r9
	bl	call_rider_94_8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L805C86A	@cond_branch
	mov	r2, #0x0
	mov	sl, r2
.L805C86A:
	ldr	r2, [r7, #0x40]
.L805C86C:
	cmp	r2, #0
	ble	.L805C89E	@cond_branch
	mov	r0, #0x40
	mov	r3, sl
	and	r3, r3, r0
	cmp	r3, #0
	beq	.L805C8D0	@cond_branch
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
	b	.L805C8CC
.L805C89E:
	mov	r0, #0x80
	mov	r2, sl
	and	r2, r2, r0
	cmp	r2, #0
	beq	.L805C8D0	@cond_branch
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
.L805C8CC:
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x14]
.L805C8D0:
	ldr	r0, [sp, #0x3c]
	cmp	r0, #0x3
	bne	.L805C910	@cond_branch
	ldr	r1, [sp, #0x4]
	cmp	r1, #0
	beq	.L805C8F6	@cond_branch
	ldr	r2, [sp, #0x10]
	ldr	r3, [sp, #0x8]
	cmp	r2, r3
	bcs	.L805C8F6	@cond_branch
	lsl	r0, r2, #0x2
	add	r0, r0, r1
	ldr	r5, [sp, #0xc]
	str	r5, [r0]
	add	r0, r2, #0
	add	r0, r0, #0x1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x10]
.L805C8F6:
	add	r0, r7, #0
	add	r0, r0, #0x94
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L805C910	@cond_branch
	ldr	r3, [r0, #0x4]
	cmp	r3, #0
	beq	.L805C910	@cond_branch
	add	r0, r7, #0
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	bl	_call_via_r3
.L805C910:
	mov	r0, #0x1
	ldr	r1, [sp, #0x38]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805C936	@cond_branch
	ldr	r0, [r7, #0x44]
	ldr	r2, [sp, #0xc]
	ldrb	r2, [r2, #0xd]
	mul	r0, r0, r2
	asr	r0, r0, #0x7
	add	r1, r0, #0
	cmp	r0, #0
	bge	.L805C92C	@cond_branch
	NEG	r1, r0
.L805C92C:
	cmp	r1, #0xff
	bgt	.L805C932	@cond_branch
	mov	r0, #0x0
.L805C932:
	NEG	r0, r0
	str	r0, [r7, #0x44]
.L805C936:
	mov	r0, #0x2
	ldr	r3, [sp, #0x38]
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L805C95C	@cond_branch
	ldr	r0, [r7, #0x40]
	ldr	r5, [sp, #0xc]
	ldrb	r5, [r5, #0xd]
	mul	r0, r0, r5
	asr	r0, r0, #0x7
	add	r1, r0, #0
	cmp	r0, #0
	bge	.L805C952	@cond_branch
	NEG	r1, r0
.L805C952:
	cmp	r1, #0xff
	bgt	.L805C958	@cond_branch
	mov	r0, #0x0
.L805C958:
	NEG	r0, r0
	str	r0, [r7, #0x40]
.L805C95C:
	ldr	r0, [sp, #0x38]
	cmp	r0, #0
	beq	.L805C97E	@cond_branch
	add	r0, r7, #0
	add	r0, r0, #0x94
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L805C97E	@cond_branch
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L805C97E	@cond_branch
	add	r0, r7, #0
	ldr	r1, [sp]
	ldr	r2, [sp, #0xc]
	ldr	r3, [sp, #0x14]
	bl	_call_via_r4
.L805C97E:
	ldr	r1, [sp, #0x18]
	add	r1, r1, #0x1
	str	r1, [sp, #0x18]
	ldr	r2, [sp]
	ldr	r0, [r2]
	ldr	r0, [r0, #0x8]
	cmp	r1, r0
	bge	.L805C990	@cond_branch
	b	.L805C4BE
.L805C990:
	ldr	r0, [sp, #0x10]
	add	sp, sp, #0x54
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end actor_805C48C

.align 2, 0 @ Don't pad with nop.
