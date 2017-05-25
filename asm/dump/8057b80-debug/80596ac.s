	.include "asm/common.inc"

	thumb_func_start sub_80596AC
sub_80596AC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffc4
	add	r5, r0, #0
	mov	r7, #0x0
	mov	r0, #0x0
	mov	r9, r0
	mov	ip, r0
	mov	r3, #0x0
	str	r3, [sp, #0x2c]
	add	r0, r5, #0
	add	r0, r0, #0x64
	mov	r4, #0x1
	mov	sl, r4
	mov	r3, sl
	ldrb	r0, [r0]
	and	r0, r0, r3
	str	r0, [sp, #0x30]
	add	r4, r5, #0
	add	r4, r4, #0x5f
	str	r4, [sp, #0x34]
	mov	r0, sl
	ldrb	r3, [r4]
	LSL	r0, r3
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r8, r0
	add	r3, r5, #0
	add	r3, r3, #0x60
	mov	r0, sl
	ldrb	r3, [r3]
	LSL	r0, r3
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0x38]
	ldr	r4, [r5, #0xc]
	add	r4, r4, r1
	str	r4, [r5, #0xc]
	ldr	r3, [r5, #0x10]
	add	r3, r3, r2
	str	r3, [r5, #0x10]
	ldr	r0, [r5, #0x40]
	add	r0, r0, r1
	str	r0, [r5, #0x40]
	ldr	r0, [r5, #0x44]
	add	r0, r0, r2
	str	r0, [r5, #0x44]
	asr	r4, r4, #0xb
	asr	r6, r3, #0xb
	str	r4, [sp, #0xc]
	str	r6, [sp, #0x10]
	add	r0, r4, #0
	add	r0, r0, #0x1e
	str	r0, [sp, #0x14]
	add	r3, r6, #0
	add	r3, r3, #0x14
	str	r3, [sp, #0x18]
	ldr	r2, [r5, #0x8]
	ldr	r1, [r2, #0x8]
	cmp	r0, r1
	ble	.L1	@cond_branch
	sub	r7, r0, r1
	ldr	r0, [r2, #0x10]
	ADD r0, r8
	str	r0, [sp, #0x1c]
	add	r1, r1, #0x1
	str	r1, [sp, #0x24]
	mov	ip, r7
.L1:
	ldr	r1, [r2]
	cmp	r4, r1
	bge	.L2	@cond_branch
	sub	r7, r4, r1
	ldr	r0, [r2, #0x10]
	add	r0, r0, r7
	str	r0, [sp, #0x1c]
	add	r1, r1, r7
	str	r1, [sp, #0x24]
	NEG	r4, r7
	mov	ip, r4
.L2:
	ldr	r1, [r2, #0xc]
	cmp	r3, r1
	ble	.L3	@cond_branch
	sub	r3, r3, r1
	mov	r9, r3
	ldr	r0, [r2, #0x14]
	ldr	r3, [sp, #0x38]
	add	r0, r0, r3
	str	r0, [sp, #0x20]
	add	r1, r1, #0x1
	str	r1, [sp, #0x28]
	mov	r4, r9
	str	r4, [sp, #0x2c]
.L3:
	ldr	r4, [r2, #0x4]
	cmp	r6, r4
	bge	.L4	@cond_branch
	sub	r6, r6, r4
	mov	r9, r6
	ldr	r0, [r2, #0x14]
	ADD r0, r9
	str	r0, [sp, #0x20]
	mov	r0, r9
	add	r0, r4, r0
	str	r0, [sp, #0x28]
	mov	r1, r9
	NEG	r1, r1
	str	r1, [sp, #0x2c]
.L4:
	cmp	r7, #0
	beq	.L12	@cond_branch
	mov	r3, #0x7c
	add	r3, r3, r5
	mov	r8, r3
	mov	r0, sl
	ldrb	r1, [r3]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L12	@cond_branch
	mov	r1, #0x20
	ldr	r0, [r2, #0x14]
	str	r0, [sp]
	mov	r2, ip
	str	r2, [sp, #0x4]
	str	r1, [sp, #0x8]
	add	r0, r5, #0
	ldr	r1, [sp, #0x24]
	add	r2, r4, #0
	ldr	r3, [sp, #0x1c]
	bl	sub_8059310
	ldr	r1, [r5, #0x8]
	ldr	r0, [r1, #0x10]
	add	r6, r0, r7
	str	r6, [r1, #0x10]
	ldr	r0, [r1]
	add	r3, r0, r7
	str	r3, [r1]
	ldr	r0, [r1, #0x8]
	add	r4, r0, r7
	str	r4, [r1, #0x8]
	mov	r0, #0x8
	mov	r7, r8
	ldrb	r7, [r7]
	and	r0, r0, r7
	cmp	r0, #0
	beq	.L12	@cond_branch
	ldr	r2, [r5]
	cmp	r4, r2
	blt	.L9	@cond_branch
	cmp	r3, r2
	blt	.L9	@cond_branch
	sub	r0, r3, r2
	str	r0, [r1]
	ldr	r0, [r5]
	sub	r0, r4, r0
	str	r0, [r1, #0x8]
	mov	r0, sl
	ldr	r2, [sp, #0x34]
	ldrb	r2, [r2]
	LSL	r0, r2
	sub	r0, r0, #0x1
	and	r6, r6, r0
	str	r6, [r1, #0x10]
	ldr	r1, [r5]
	lsl	r1, r1, #0xb
	ldr	r0, [r5, #0xc]
	sub	r0, r0, r1
	b	.L10
.L9:
	ldr	r3, [r5, #0x8]
	ldr	r1, [r3, #0x8]
	cmp	r1, #0
	bge	.L12	@cond_branch
	ldr	r0, [r3]
	cmp	r0, #0
	bge	.L12	@cond_branch
	add	r0, r0, r2
	str	r0, [r3]
	ldr	r0, [r5]
	add	r0, r1, r0
	str	r0, [r3, #0x8]
	add	r0, r5, #0
	add	r0, r0, #0x5f
	mov	r1, #0x1
	ldrb	r0, [r0]
	LSL	r1, r0
	sub	r1, r1, #0x1
	ldr	r0, [r3, #0x10]
	and	r0, r0, r1
	str	r0, [r3, #0x10]
	ldr	r1, [r5]
	lsl	r1, r1, #0xb
	ldr	r0, [r5, #0xc]
	add	r0, r0, r1
.L10:
	str	r0, [r5, #0xc]
.L12:
	mov	r3, r9
	cmp	r3, #0
	beq	.L20	@cond_branch
	add	r6, r5, #0
	add	r6, r6, #0x7c
	mov	r0, #0x2
	ldrb	r4, [r6]
	and	r0, r0, r4
	cmp	r0, #0
	bne	.L20	@cond_branch
	mov	r2, #0x20
	ldr	r0, [r5, #0x8]
	ldr	r1, [r0]
	ldr	r3, [r0, #0x10]
	ldr	r7, [sp, #0x20]
	str	r7, [sp]
	str	r2, [sp, #0x4]
	ldr	r0, [sp, #0x2c]
	str	r0, [sp, #0x8]
	add	r0, r5, #0
	ldr	r2, [sp, #0x28]
	bl	sub_8059310
	ldr	r1, [r5, #0x8]
	ldr	r0, [r1, #0x14]
	ADD r0, r9
	str	r0, [r1, #0x14]
	ldr	r0, [r1, #0x4]
	mov	r2, r9
	add	r3, r0, r2
	str	r3, [r1, #0x4]
	ldr	r0, [r1, #0xc]
	add	r4, r0, r2
	str	r4, [r1, #0xc]
	mov	r0, #0x4
	ldrb	r6, [r6]
	and	r0, r0, r6
	cmp	r0, #0
	beq	.L20	@cond_branch
	ldr	r2, [r5, #0x4]
	cmp	r4, r2
	blt	.L17	@cond_branch
	ldr	r0, [r5]
	cmp	r3, r0
	blt	.L17	@cond_branch
	sub	r0, r3, r2
	str	r0, [r1, #0x4]
	ldr	r0, [r5, #0x4]
	sub	r0, r4, r0
	str	r0, [r1, #0xc]
	ldr	r1, [r5, #0x4]
	lsl	r1, r1, #0xb
	ldr	r0, [r5, #0x10]
	sub	r0, r0, r1
	b	.L18
.L17:
	ldr	r1, [r5, #0x8]
	ldr	r3, [r1, #0xc]
	cmp	r3, #0
	bge	.L20	@cond_branch
	ldr	r0, [r1, #0x4]
	cmp	r0, #0
	bge	.L20	@cond_branch
	add	r0, r0, r2
	str	r0, [r1, #0x4]
	ldr	r0, [r5, #0x4]
	add	r0, r3, r0
	str	r0, [r1, #0xc]
	ldr	r1, [r5, #0x4]
	lsl	r1, r1, #0xb
	ldr	r0, [r5, #0x10]
	add	r0, r0, r1
.L18:
	str	r0, [r5, #0x10]
.L20:
	ldr	r3, [sp, #0x30]
	cmp	r3, #0
	bne	.L21	@cond_branch
	add	r4, r5, #0
	add	r4, r4, #0x5e
	ldrb	r0, [r4]
	bl	GetBGLayerHOffsetPtr
	ldr	r1, [r5, #0x40]
	asr	r1, r1, #0x8
	strh	r1, [r0]
	ldrb	r0, [r4]
	bl	GetBGLayerVOffsetPtr
	ldr	r1, [r5, #0x44]
	asr	r1, r1, #0x8
	strh	r1, [r0]
	b	.L22
.L21:
	add	r0, r5, #0
	add	r0, r0, #0x5e
	ldrb	r0, [r0]
	ldr	r1, [r5, #0x40]
	ldr	r2, [r5, #0x44]
	bl	SetBGOffset
.L22:
	add	sp, sp, #0x3c
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80596AC

.align 2, 0 @ Don't pad with nop.
