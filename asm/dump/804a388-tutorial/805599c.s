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
	bls	.L1	@cond_branch
	ldr	r0, .L5
	ldrh	r2, [r5, #0x28]
	and	r0, r0, r2
	mov	r4, #0x0
	strh	r0, [r5, #0x28]
	ldr	r0, [r5, #0x2c]
	cmp	r0, #0
	beq	.L4	@cond_branch
	ldr	r0, [r5]
	bl	sub_8060A60
	ldr	r0, [r5]
	ldr	r1, [r5, #0x2c]
	ldr	r2, .L5 + 4
	ldr	r3, [r5, #0xc]
	str	r4, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	bl	LoadSpriteSheet
	ldr	r2, [r5, #0x30]
	cmp	r2, #0
	beq	.L3	@cond_branch
	ldr	r0, .L5 + 8
	ldr	r1, .L5 + 12
	ldr	r3, [r0]
	add	r0, r2, #0
	mov	r2, #0x20
	bl	_call_via_r3
.L3:
	ldr	r1, [r5]
	ldr	r0, .L5 + 16
	ldrh	r3, [r1, #0x14]
	and	r0, r0, r3
	strh	r0, [r1, #0x14]
	add	r0, r5, #0
	mov	r1, #0x0
	bl	sub_8055B64
	str	r4, [r5, #0x2c]
	str	r4, [r5, #0x30]
	b	.L4
.L6:
	.align	2, 0
.L5:
	.4byte	0xfffe
	.4byte	0xffffbc00
	.4byte	0x807d974
	.4byte	0x5000200
	.4byte	0xfff
.L1:
	mov	r0, #0x1
	ldrh	r1, [r5, #0x28]
	orr	r0, r0, r1
	strh	r0, [r5, #0x28]
.L4:
	ldr	r0, [r5, #0x10]
	mov	r2, #0x80
	lsl	r2, r2, #0x7
	add	r0, r0, r2
	mov	r1, #0x98
	lsl	r1, r1, #0x9
	cmp	r0, r1
	bls	.L7	@cond_branch
	ldr	r0, .L11
	ldrh	r3, [r5, #0x2a]
	and	r0, r0, r3
	mov	r6, #0x0
	strh	r0, [r5, #0x2a]
	ldr	r0, [r5, #0x34]
	cmp	r0, #0
	beq	.L10	@cond_branch
	ldr	r0, [r5, #0x4]
	bl	sub_8060A60
	ldr	r0, [r5, #0x4]
	ldr	r1, [r5, #0x34]
	ldr	r2, .L11 + 4
	ldr	r3, [r5, #0xc]
	str	r6, [sp]
	str	r6, [sp, #0x4]
	mov	r4, #0x1
	str	r4, [sp, #0x8]
	str	r6, [sp, #0xc]
	bl	LoadSpriteSheet
	ldr	r2, [r5, #0x38]
	cmp	r2, #0
	beq	.L9	@cond_branch
	ldr	r0, .L11 + 8
	ldr	r1, .L11 + 12
	ldr	r3, [r0]
	add	r0, r2, #0
	mov	r2, #0x20
	bl	_call_via_r3
.L9:
	ldr	r0, [r5, #0x4]
	ldr	r1, .L11 + 16
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
	b	.L10
.L12:
	.align	2, 0
.L11:
	.4byte	0xfffe
	.4byte	0xffffbc00
	.4byte	0x807d974
	.4byte	0x5000220
	.4byte	0xfff
.L7:
	mov	r0, #0x1
	ldrh	r1, [r5, #0x2a]
	orr	r0, r0, r1
	strh	r0, [r5, #0x2a]
.L10:
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
	beq	.L13	@cond_branch
	ldr	r0, [r5, #0x18]
	ldr	r1, [r5, #0x1c]
	add	r0, r0, r1
	str	r0, [r5, #0x18]
.L13:
	add	r0, r2, #0
	ldrh	r2, [r5, #0x2a]
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L14	@cond_branch
	ldr	r0, [r5, #0x20]
	ldr	r1, [r5, #0x24]
	add	r0, r0, r1
	str	r0, [r5, #0x20]
.L14:
	mov	r0, #0x4
	ldrh	r1, [r5, #0x28]
	and	r0, r0, r1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	cmp	r0, #0
	beq	.L15	@cond_branch
	bl	sub_8057C40
	asr	r2, r0, #0x4
	mov	r0, #0x7
	and	r2, r2, r0
	cmp	r2, #0
	bne	.L19	@cond_branch
	ldr	r1, [r5]
	ldrh	r0, [r1, #0x18]
	cmp	r0, #0x1
	bhi	.L17	@cond_branch
	add	r0, r0, #0x1
	strh	r0, [r1, #0x18]
	b	.L19
.L17:
	strh	r2, [r1, #0x18]
	b	.L19
.L15:
	strh	r0, [r3, #0x18]
.L19:
	mov	r0, #0x4
	ldrh	r2, [r5, #0x2a]
	and	r0, r0, r2
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	cmp	r1, #0
	beq	.L20	@cond_branch
	bl	sub_8057C40
	asr	r2, r0, #0x4
	mov	r0, #0x7
	and	r2, r2, r0
	cmp	r2, #0
	bne	.L24	@cond_branch
	ldr	r1, [r5, #0x4]
	ldrh	r0, [r1, #0x18]
	cmp	r0, #0x1
	bhi	.L22	@cond_branch
	add	r0, r0, #0x1
	strh	r0, [r1, #0x18]
	b	.L24
.L22:
	strh	r2, [r1, #0x18]
	b	.L24
.L20:
	ldr	r0, [r5, #0x4]
	strh	r1, [r0, #0x18]
.L24:
	add	sp, sp, #0x10
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805599C

.align 2, 0 @ Don't pad with nop.
