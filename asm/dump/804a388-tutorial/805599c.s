	.include "asm/common.inc"

	thumb_func_start sub_805599C
sub_805599C:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff0
	add	r5, r0, #0
	ldr	r0, [r5, #0x8]
	mov	r1, #0x80
	lsl	r1, r1, #0x7
	add	r0, r0, r1
	mov	r1, #0x98
	lsl	r1, r1, #0x9
	cmp	r0, r1
	bls	.L8055A1C	@cond_branch
	ldr	r0, .L8055A08
	ldrh	r2, [r5, #0x28]
	and	r0, r0, r2
	mov	r4, #0x0
	strh	r0, [r5, #0x28]
	ldr	r0, [r5, #0x2c]
	cmp	r0, #0
	beq	.L8055A24	@cond_branch
	ldr	r0, [r5]
	bl	sub_8060A60
	ldr	r0, [r5]
	ldr	r1, [r5, #0x2c]
	ldr	r2, .L8055A08 + 4
	ldr	r3, [r5, #0xc]
	str	r4, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	bl	LoadSpriteSheet
	ldr	r2, [r5, #0x30]
	cmp	r2, #0
	beq	.L80559F0	@cond_branch
	ldr	r0, .L8055A08 + 8
	ldr	r1, .L8055A08 + 12
	ldr	r3, [r0]
	add	r0, r2, #0
	mov	r2, #0x20
	bl	_call_via_r3
.L80559F0:
	ldr	r1, [r5]
	ldr	r0, .L8055A08 + 16
	ldrh	r3, [r1, #0x14]
	and	r0, r0, r3
	strh	r0, [r1, #0x14]
	add	r0, r5, #0
	mov	r1, #0x0
	bl	sub_8055B64
	str	r4, [r5, #0x2c]
	str	r4, [r5, #0x30]
	b	.L8055A24
.L8055A08:
	.align	2, 0

	.4byte	0xfffe
	.4byte	0xffffbc00
	.4byte	__fastMemoryCopyARM
	.4byte	0x5000200
	.4byte	0xfff
.L8055A1C:
	mov	r0, #0x1
	ldrh	r1, [r5, #0x28]
	orr	r0, r0, r1
	strh	r0, [r5, #0x28]
.L8055A24:
	ldr	r0, [r5, #0x10]
	mov	r2, #0x80
	lsl	r2, r2, #0x7
	add	r0, r0, r2
	mov	r1, #0x98
	lsl	r1, r1, #0x9
	cmp	r0, r1
	bls	.L8055AA8	@cond_branch
	ldr	r0, .L8055A94
	ldrh	r3, [r5, #0x2a]
	and	r0, r0, r3
	mov	r6, #0x0
	strh	r0, [r5, #0x2a]
	ldr	r0, [r5, #0x34]
	cmp	r0, #0
	beq	.L8055AB0	@cond_branch
	ldr	r0, [r5, #0x4]
	bl	sub_8060A60
	ldr	r0, [r5, #0x4]
	ldr	r1, [r5, #0x34]
	ldr	r2, .L8055A94 + 4
	ldr	r3, [r5, #0xc]
	str	r6, [sp]
	str	r6, [sp, #0x4]
	mov	r4, #0x1
	str	r4, [sp, #0x8]
	str	r6, [sp, #0xc]
	bl	LoadSpriteSheet
	ldr	r2, [r5, #0x38]
	cmp	r2, #0
	beq	.L8055A74	@cond_branch
	ldr	r0, .L8055A94 + 8
	ldr	r1, .L8055A94 + 12
	ldr	r3, [r0]
	add	r0, r2, #0
	mov	r2, #0x20
	bl	_call_via_r3
.L8055A74:
	ldr	r0, [r5, #0x4]
	ldr	r1, .L8055A94 + 16
	ldrh	r2, [r0, #0x14]
	and	r1, r1, r2
	mov	r3, #0x80
	lsl	r3, r3, #0x5
	add	r2, r3, #0
	orr	r1, r1, r2
	strh	r1, [r0, #0x14]
	add	r0, r5, #0
	mov	r1, #0x1
	bl	sub_8055B64
	str	r6, [r5, #0x34]
	str	r6, [r5, #0x38]
	b	.L8055AB0
.L8055A94:
	.align	2, 0

	.4byte	0xfffe
	.4byte	0xffffbc00
	.4byte	__fastMemoryCopyARM
	.4byte	0x5000220
	.4byte	0xfff
.L8055AA8:
	mov	r0, #0x1
	ldrh	r1, [r5, #0x2a]
	orr	r0, r0, r1
	strh	r0, [r5, #0x2a]
.L8055AB0:
	ldr	r0, [r5, #0x18]
	ldr	r2, [r5, #0x8]
	sub	r0, r0, r2
	asr	r0, r0, #0x2
	add	r2, r2, r0
	str	r2, [r5, #0x8]
	ldr	r0, [r5, #0x20]
	ldr	r1, [r5, #0x10]
	sub	r0, r0, r1
	asr	r0, r0, #0x2
	add	r1, r1, r0
	str	r1, [r5, #0x10]
	ldr	r3, [r5]
	str	r2, [r3, #0x8]
	ldr	r1, [r5, #0x4]
	ldr	r0, [r5, #0x10]
	str	r0, [r1, #0x8]
	mov	r2, #0x1
	add	r0, r2, #0
	ldrh	r1, [r5, #0x28]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8055AE6	@cond_branch
	ldr	r0, [r5, #0x18]
	ldr	r1, [r5, #0x1c]
	add	r0, r0, r1
	str	r0, [r5, #0x18]
.L8055AE6:
	add	r0, r2, #0
	ldrh	r2, [r5, #0x2a]
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L8055AF8	@cond_branch
	ldr	r0, [r5, #0x20]
	ldr	r1, [r5, #0x24]
	add	r0, r0, r1
	str	r0, [r5, #0x20]
.L8055AF8:
	mov	r0, #0x4
	ldrh	r1, [r5, #0x28]
	and	r0, r0, r1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	cmp	r0, #0
	beq	.L8055B26	@cond_branch
	bl	sub_8057C40
	asr	r2, r0, #0x4
	mov	r0, #0x7
	and	r2, r2, r0
	cmp	r2, #0
	bne	.L8055B28	@cond_branch
	ldr	r1, [r5]
	ldrh	r0, [r1, #0x18]
	cmp	r0, #0x1
	bhi	.L8055B22	@cond_branch
	add	r0, r0, #0x1
	strh	r0, [r1, #0x18]
	b	.L8055B28
.L8055B22:
	strh	r2, [r1, #0x18]
	b	.L8055B28
.L8055B26:
	strh	r0, [r3, #0x18]
.L8055B28:
	mov	r0, #0x4
	ldrh	r2, [r5, #0x2a]
	and	r0, r0, r2
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	cmp	r1, #0
	beq	.L8055B56	@cond_branch
	bl	sub_8057C40
	asr	r2, r0, #0x4
	mov	r0, #0x7
	and	r2, r2, r0
	cmp	r2, #0
	bne	.L8055B5A	@cond_branch
	ldr	r1, [r5, #0x4]
	ldrh	r0, [r1, #0x18]
	cmp	r0, #0x1
	bhi	.L8055B52	@cond_branch
	add	r0, r0, #0x1
	strh	r0, [r1, #0x18]
	b	.L8055B5A
.L8055B52:
	strh	r2, [r1, #0x18]
	b	.L8055B5A
.L8055B56:
	ldr	r0, [r5, #0x4]
	strh	r1, [r0, #0x18]
.L8055B5A:
	add	sp, sp, #0x10
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805599C

.align 2, 0 @ Don't pad with nop.
