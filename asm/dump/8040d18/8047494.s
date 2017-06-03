	.include "asm/common.inc"

	thumb_func_start sub_8047494
sub_8047494:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff0
	add	r7, r0, #0
	add	r5, r1, #0
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	mov	r8, r2
	mov	r9, r8
	bl	getLanguage
	mov	sl, r0
	add	r4, r7, #0
	add	r4, r4, #0x36
	mov	r0, #0x1
	ldrb	r1, [r4]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldr	r0, [r7]
	bl	sub_8060A60
.L1:
	ldr	r1, [r7, #0x8]
	cmp	r1, #0
	beq	.L2	@cond_branch
	mov	r0, #0x0
	strh	r0, [r1, #0x18]
.L2:
	ldr	r1, [r7, #0xc]
	cmp	r1, #0
	beq	.L3	@cond_branch
	mov	r0, #0x0
	strh	r0, [r1, #0x18]
.L3:
	ldr	r1, [r7, #0x10]
	cmp	r1, #0
	beq	.L4	@cond_branch
	mov	r0, #0x0
	strh	r0, [r1, #0x18]
.L4:
	mov	r0, #0x1
	ldrb	r1, [r4]
	orr	r1, r1, r0
	mov	r6, #0x0
	strb	r1, [r4]
	mov	r2, r8
	cmp	r2, #0
	beq	.L5	@cond_branch
	mov	r0, #0x2
	orr	r1, r1, r0
	strb	r1, [r4]
.L5:
	ldr	r0, [r7]
	cmp	r0, #0
	beq	.L6	@cond_branch
	ldr	r1, [r5, #0x2c]
	ldr	r2, [r0, #0x8]
	mov	r3, #0xe0
	lsl	r3, r3, #0x6
	str	r6, [sp]
	str	r6, [sp, #0x4]
	str	r6, [sp, #0x8]
	str	r6, [sp, #0xc]
	bl	LoadSpriteSheet
.L6:
	ldr	r2, [r5, #0x28]
	cmp	r2, #0
	beq	.L8	@cond_branch
	mov	r0, r9
	cmp	r0, #0
	beq	.L8	@cond_branch
	ldr	r0, .L12
	ldr	r1, .L12 + 4
	ldr	r3, [r0]
	add	r0, r2, #0
	mov	r2, #0x20
	bl	_call_via_r3
.L8:
	ldr	r0, [r7, #0x14]
	ldr	r1, .L12 + 8
	mov	r2, sl
	lsl	r4, r2, #0x2
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x18]
	ldr	r6, .L12 + 12
	add	r1, r4, r6
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x18]
	add	r1, r5, r4
	ldr	r1, [r1]
	mov	r2, #0xf
	bl	showString
	ldr	r0, [r7, #0x1c]
	add	r1, r6, #0
	add	r1, r1, #0x14
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x1c]
	add	r5, r5, #0x14
	add	r5, r5, r4
	ldr	r1, [r5]
	mov	r2, #0xf
	bl	showString
	ldr	r0, [r7, #0x20]
	add	r6, r6, #0x28
	add	r4, r4, r6
	ldr	r1, [r4]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x20]
	ldr	r1, [r5]
	mov	r2, #0xf
	bl	showString
	ldr	r0, [r7, #0x28]
	bl	sub_8061228
	ldr	r0, [r7, #0x2c]
	bl	sub_8061228
	ldr	r1, [r7, #0x8]
	cmp	r1, #0
	beq	.L9	@cond_branch
	mov	r0, #0xa0
	lsl	r0, r0, #0x8
	str	r0, [r1, #0xc]
.L9:
	ldr	r1, [r7, #0xc]
	cmp	r1, #0
	beq	.L10	@cond_branch
	mov	r0, #0xa0
	lsl	r0, r0, #0x8
	str	r0, [r1, #0xc]
.L10:
	ldr	r1, [r7, #0x10]
	cmp	r1, #0
	beq	.L11	@cond_branch
	mov	r0, #0xa0
	lsl	r0, r0, #0x8
	str	r0, [r1, #0xc]
.L11:
	add	sp, sp, #0x10
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L13:
	.align	2, 0
.L12:
	.4byte	0x807d974
	.4byte	0x5000200
	.4byte	0x806e240
	.4byte	0x806e31c
	thumb_func_end sub_8047494

.align 2, 0 @ Don't pad with nop.
