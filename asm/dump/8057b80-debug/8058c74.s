	.include "asm/common.inc"

	thumb_func_start unref_8058C74
unref_8058C74:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	r6, r0, #0
	lsl	r1, r1, #0x18
	lsr	r5, r1, #0x18
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	mov	r9, r2
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	mov	r8, r3
	mov	r4, #0x0
	str	r4, [r6, #0x68]
	add	r0, r0, #0x64
	mov	r1, #0x0
	mov	sl, r1
	strh	r4, [r0]
	add	r0, r6, #0
	mov	r1, r8
	mov	r2, #0x0
	bl	sub_8059284
	add	r7, r0, #0
	lsl	r2, r5, #0x1
	add	r2, r2, r5
	lsl	r2, r2, #0x3
	ldr	r0, .L3
	add	r2, r2, r0
	str	r2, [r6, #0x8]
	str	r4, [r2, #0x10]
	str	r4, [r2, #0x14]
	str	r4, [r2]
	add	r3, r6, #0
	add	r3, r3, #0x5f
	mov	r1, #0x1
	add	r0, r1, #0
	ldrb	r3, [r3]
	LSL	r0, r3
	sub	r0, r0, #0x1
	str	r0, [r2, #0x8]
	str	r4, [r2, #0x4]
	add	r0, r6, #0
	add	r0, r0, #0x60
	ldrb	r0, [r0]
	LSL	r1, r0
	sub	r1, r1, #0x1
	str	r1, [r2, #0xc]
	mov	r0, #0x20
	str	r0, [r6]
	str	r0, [r6, #0x4]
	add	r0, r6, #0
	add	r0, r0, #0x5e
	strb	r5, [r0]
	str	r4, [r6, #0xc]
	str	r4, [r6, #0x10]
	str	r4, [r6, #0x14]
	str	r4, [r6, #0x18]
	str	r4, [r6, #0x1c]
	str	r4, [r6, #0x20]
	str	r4, [r6, #0x54]
	str	r4, [r6, #0x58]
	mov	r0, #0x10
	str	r0, [r6, #0x24]
	str	r4, [r6, #0x40]
	str	r4, [r6, #0x44]
	str	r4, [r6, #0x28]
	str	r4, [r6, #0x2c]
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	str	r0, [r6, #0x30]
	str	r0, [r6, #0x34]
	str	r4, [r6, #0x38]
	str	r4, [r6, #0x3c]
	add	r0, r6, #0
	add	r0, r0, #0x48
	strh	r4, [r0]
	add	r0, r0, #0x2
	strh	r4, [r0]
	str	r4, [r6, #0x4c]
	str	r4, [r6, #0x50]
	add	r0, r0, #0x32
	mov	r2, sl
	strb	r2, [r0]
	add	r1, r6, #0
	add	r1, r1, #0x80
	mov	r0, #0x1
	NEG	r0, r0
	str	r0, [r1]
	add	r0, r6, #0
	add	r0, r0, #0x84
	str	r4, [r0]
	str	r4, [r6, #0x6c]
	mov	r0, #0x80
	mov	r3, r8
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r4, r9
	lsl	r0, r4, #0x6
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000ca0
.L1:
	mov	r1, r9
	lsl	r0, r1, #0x5
.L2:
	str	r0, [r6, #0x74]
	mov	r0, #0x0
	str	r0, [r6, #0x70]
	str	r0, [r6, #0x78]
	ldr	r0, [r6, #0x74]
	sub	r0, r0, #0x1
	lsr	r4, r0, #0xe
	ldr	r1, .L7
	ldrb	r3, [r1]
	add	r0, r6, #0
	add	r0, r0, #0x5d
	strb	r3, [r0]
	ldr	r2, [r6, #0x74]
	mov	ip, r1
	mov	r9, r0
	cmp	r2, #0
	beq	.L5	@cond_branch
	add	r0, r3, #1
	add	r0, r0, r4
	strb	r0, [r1]
	b	.L6
.L8:
	.align	2, 0
.L7:
	.4byte	0x3000de0
.L5:
	mov	r3, r9
	strb	r2, [r3]
.L6:
	add	r0, r4, #1
	lsl	r0, r0, #0xe
	ldr	r2, [r6, #0x74]
	sub	r0, r0, r2
	cmp	r0, r7
	bcc	.L10	@cond_branch
	cmp	r2, #0
	beq	.L10	@cond_branch
	lsr	r2, r7, #0xb
	add	r1, r2, #0
	cmp	r2, #0
	bne	.L11	@cond_branch
	mov	r1, #0x1
.L11:
	mov	r4, ip
	ldrb	r4, [r4]
	lsl	r0, r4, #0x3
	sub	r0, r0, r1
	add	r1, r6, #0
	add	r1, r1, #0x5c
	strb	r0, [r1]
	ldr	r3, .L14
	ldrb	r4, [r3]
	sub	r0, r4, r2
	add	r4, r1, #0
	ldrb	r1, [r4]
	cmp	r1, r0
	bcc	.L13	@cond_branch
	strb	r0, [r3]
	strb	r0, [r4]
	b	.L13
.L15:
	.align	2, 0
.L14:
	.4byte	0x3000e3c
.L10:
	ldr	r0, .L16
	lsr	r1, r7, #0xb
	ldrb	r2, [r0]
	sub	r1, r2, r1
	strb	r1, [r0]
	add	r0, r6, #0
	add	r0, r0, #0x5c
	strb	r1, [r0]
	add	r4, r0, #0
.L13:
	ldrb	r3, [r4]
	lsl	r1, r3, #0xb
	mov	r0, #0xc0
	lsl	r0, r0, #0x13
	add	r1, r1, r0
	ldr	r0, .L16 + 4
	ldr	r3, [r0]
	mov	r0, #0x0
	add	r2, r7, #0
	bl	_call_via_r3
	add	r0, r5, #0
	bl	GetBGLayerCntPtr
	ldrb	r4, [r4]
	lsl	r1, r4, #0x8
	mov	r4, r8
	orr	r1, r1, r4
	mov	r3, r9
	ldrb	r3, [r3]
	lsl	r2, r3, #0x2
	orr	r1, r1, r2
	strh	r1, [r0]
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L17:
	.align	2, 0
.L16:
	.4byte	0x3000e3c
	.4byte	0x807d970
	thumb_func_end unref_8058C74

.align 2, 0 @ Don't pad with nop.
