	.include "asm/common.inc"

	thumb_func_start renderActor
renderActor:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffff4
	add	r5, r0, #0
	add	r0, r0, #0xb0
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L8057DAC	@cond_branch
	add	r0, r5, #0
	mov	r1, sp
	bl	_call_via_r2
	ldr	r0, [sp]
	asr	r4, r0, #0x8
	ldr	r0, [sp, #0x4]
	b	.L8057DB2
.L8057DAC:
	ldr	r0, [r5, #0x4]
	asr	r4, r0, #0x8
	ldr	r0, [r5, #0x8]
.L8057DB2:
	asr	r7, r0, #0x8
	ldr	r1, [r5, #0x3c]
	cmp	r1, #0
	beq	.L8057DC6	@cond_branch
	ldr	r0, [r1, #0x40]
	asr	r0, r0, #0x8
	sub	r4, r4, r0
	ldr	r0, [r1, #0x44]
	asr	r0, r0, #0x8
	sub	r7, r7, r0
.L8057DC6:
	add	r1, r5, #0
	add	r1, r1, #0x31
	mov	r0, #0x1
	ldrb	r2, [r1]
	and	r0, r0, r2
	mov	r9, r1
	cmp	r0, #0
	beq	.L8057DEC	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0xa0
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	add	r1, r5, #0
	add	r1, r1, #0xa4
	ldrb	r1, [r1]
	lsl	r1, r1, #0x18
	asr	r1, r1, #0x18
	sub	r0, r0, r1
	b	.L8057E00
.L8057DEC:
	add	r0, r5, #0
	add	r0, r0, #0xa0
	mov	r2, #0x0
	ldsh	r0, [r0, r2]
	add	r1, r5, #0
	add	r1, r1, #0xa4
	ldrb	r1, [r1]
	lsl	r1, r1, #0x18
	asr	r1, r1, #0x18
	add	r0, r0, r1
.L8057E00:
	sub	r4, r4, r0
	add	r0, r5, #0
	add	r0, r0, #0xa2
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	add	r1, r5, #0
	add	r1, r1, #0xa5
	ldrb	r1, [r1]
	lsl	r1, r1, #0x18
	asr	r1, r1, #0x18
	add	r0, r0, r1
	sub	r7, r7, r0
	ldr	r0, [r5, #0x70]
	cmp	r0, #0
	beq	.L8057E46	@cond_branch
	ldrh	r2, [r5, #0x12]
	ldrb	r1, [r5, #0x10]
	add	r0, r2, #0
	mul	r0, r0, r1
	asr	r0, r0, #0x8
	add	r0, r4, r0
	cmp	r0, #0
	blt	.L8057E46	@cond_branch
	cmp	r4, #0xef
	bgt	.L8057E46	@cond_branch
	ldrh	r2, [r5, #0x14]
	ldrb	r1, [r5, #0x11]
	add	r0, r2, #0
	mul	r0, r0, r1
	asr	r0, r0, #0x8
	add	r0, r7, r0
	cmp	r0, #0
	blt	.L8057E46	@cond_branch
	cmp	r7, #0x9f
	ble	.L8057E5C	@cond_branch
.L8057E46:
	add	r4, r5, #0
	add	r4, r4, #0xb8
	ldr	r0, [r4]
	cmp	r0, #0
	bne	.L8057E52	@cond_branch
	b	.L8057F98
.L8057E52:
	bl	sub_8060A94
	mov	r0, #0x0
	str	r0, [r4]
	b	.L8057F98
.L8057E5C:
	add	r0, r5, #0
	add	r0, r0, #0xb8
	ldr	r2, [r0]
	mov	r8, r2
	add	r6, r0, #0
	cmp	r2, #0
	bne	.L8057EAA	@cond_branch
	add	r0, r0, #0x4
	ldrh	r0, [r0]
	bl	allocSprite
	str	r0, [r6]
	cmp	r0, #0
	bne	.L8057E7A	@cond_branch
	b	.L8057F98
.L8057E7A:
	mov	r1, r8
	strh	r1, [r0, #0x20]
	add	r1, r5, #0
	add	r1, r1, #0x98
	mov	r0, #0x2
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8057E96	@cond_branch
	ldr	r1, [r6]
	mov	r0, #0x1
	ldrh	r2, [r1, #0x20]
	orr	r0, r0, r2
	strh	r0, [r1, #0x20]
.L8057E96:
	ldr	r1, [r6]
	ldr	r0, .L8057F50
	strh	r0, [r1, #0x1a]
	ldr	r0, [r6]
	mov	r1, r8
	str	r1, [r0, #0x30]
	ldr	r1, [r6]
	mov	r0, #0x1
	NEG	r0, r0
	str	r0, [r1, #0x24]
.L8057EAA:
	ldrb	r0, [r5, #0x16]
	strh	r0, [r5, #0x16]
	ldr	r1, [r6]
	ldr	r0, [r5]
	str	r0, [r1, #0x2c]
	ldr	r1, [r6]
	mov	r2, r9
	ldrb	r0, [r2]
	strh	r0, [r1, #0x1c]
	ldr	r1, [r6]
	lsl	r0, r4, #0x8
	str	r0, [r1, #0x8]
	ldr	r1, [r6]
	lsl	r0, r7, #0x8
	str	r0, [r1, #0xc]
	ldr	r1, [r6]
	ldrh	r0, [r5, #0x22]
	strh	r0, [r1, #0x18]
	ldr	r1, [r6]
	add	r0, r5, #0
	add	r0, r0, #0x30
	ldrb	r0, [r0]
	strh	r0, [r1, #0x16]
	ldr	r2, [r6]
	ldr	r0, [r5]
	ldr	r1, [r0, #0x10]
	add	r0, r0, r1
	str	r0, [r2, #0x28]
	ldr	r4, [r6]
	add	r0, r5, #0
	add	r0, r0, #0x38
	ldrb	r3, [r0]
	mov	r0, #0x3
	mov	r8, r0
	mov	r2, r8
	and	r2, r2, r3
	lsl	r2, r2, #0xe
	add	r7, r5, #0
	add	r7, r7, #0x3a
	ldrb	r1, [r7]
	MVN	r0, r1
	mov	r1, #0x1
	and	r0, r0, r1
	lsl	r0, r0, #0xd
	orr	r2, r2, r0
	add	r1, r5, #0
	add	r1, r1, #0x39
	mov	r0, r8
	ldrb	r1, [r1]
	and	r0, r0, r1
	lsl	r0, r0, #0xa
	mov	r1, #0x80
	lsl	r1, r1, #0x5
	orr	r0, r0, r1
	orr	r2, r2, r0
	mov	r0, #0xc
	and	r0, r0, r3
	lsl	r0, r0, #0x1c
	orr	r2, r2, r0
	str	r2, [r4, #0x10]
	ldr	r2, [r6]
	mov	r9, r2
	ldrb	r7, [r7]
	lsr	r0, r7, #0x1
	mov	r1, #0xf
	and	r0, r0, r1
	lsl	r4, r0, #0xc
	ldr	r0, [r5, #0x3c]
	cmp	r0, #0
	beq	.L8057F54	@cond_branch
	bl	sub_8059CB4
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	add	r1, r5, #0
	add	r1, r1, #0x3b
	ldrb	r1, [r1]
	lsl	r1, r1, #0x18
	asr	r1, r1, #0x18
	add	r0, r0, r1
	mov	r1, r8
	and	r0, r0, r1
	b	.L8057F62
.L8057F50:
	.align	2, 0

	.4byte	0xffff
.L8057F54:
	add	r0, r5, #0
	add	r0, r0, #0x3b
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	mov	r2, r8
	and	r0, r0, r2
.L8057F62:
	lsl	r0, r0, #0xa
	orr	r0, r0, r4
	mov	r1, r9
	strh	r0, [r1, #0x14]
	ldr	r0, [r6]
	ldrh	r1, [r5, #0x12]
	ldrh	r2, [r5, #0x14]
	ldrb	r3, [r5, #0x16]
	bl	sub_8060F64
	ldr	r4, [r6]
	ldr	r1, [r4, #0x30]
	cmp	r1, #0
	beq	.L8057F98	@cond_branch
	ldr	r2, [r4, #0x10]
	ldr	r0, .L8057FA8
	and	r2, r2, r0
	ldr	r0, [r1, #0x8]
	mov	r1, #0xf8
	lsl	r1, r1, #0x2
	and	r0, r0, r1
	lsl	r0, r0, #0x14
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	orr	r0, r0, r1
	orr	r2, r2, r0
	str	r2, [r4, #0x10]
.L8057F98:
	add	sp, sp, #0xc
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8057FA6:
	.align	2, 0
.L8057FA8:
	.4byte	0xc1ffffff
	thumb_func_end renderActor

.align 2, 0 @ Don't pad with nop.
