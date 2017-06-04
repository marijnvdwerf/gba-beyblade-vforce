	.include "asm/common.inc"

	thumb_func_start sub_8052588
sub_8052588:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffe8
	ldr	r4, [sp, #0x38]
	mov	r9, r4
	ldr	r4, [r1, #0x8]
	ldr	r5, [r2, #0xc]
	mov	r8, r5
	ADD r4, r8
	asr	r4, r4, #0xb
	mov	sl, r4
	ldr	r4, [r1, #0xc]
	ldr	r6, [r2, #0x10]
	add	r1, r4, r6
	asr	r1, r1, #0xb
	mov	ip, r1
	asr	r5, r5, #0xb
	mov	r1, sl
	sub	r5, r1, r5
	asr	r2, r6, #0xb
	mov	r1, ip
	sub	r1, r1, r2
	str	r1, [sp, #0x10]
	mov	r2, #0xe0
	lsl	r2, r2, #0x1
	add	r3, r3, r2
	ldrb	r3, [r3]
	str	r3, [sp, #0xc]
	ldr	r1, .L5
	ldr	r3, [r1]
	ldr	r1, .L5 + 4
	add	r7, r3, r1
	lsl	r5, r5, #0xb
	mov	r1, #0xe0
	lsl	r1, r1, #0x3
	mov	r2, r8
	and	r2, r2, r1
	sub	r5, r5, r2
	mov	r8, r5
	ldr	r5, [sp, #0x10]
	lsl	r2, r5, #0xb
	and	r6, r6, r1
	sub	r2, r2, r6
	sub	r4, r4, r2
	asr	r4, r4, #0x8
	add	r4, r4, #0x8
	ADD r4, r9
	asr	r4, r4, #0x3
	mov	r9, r4
	mov	r1, r8
	str	r1, [r0, #0x8]
	str	r2, [r0, #0xc]
	ldr	r0, [r7]
	cmp	sl, r0
	bne	.L1	@cond_branch
	ldr	r0, [r7, #0x4]
	cmp	ip, r0
	beq	.L2	@cond_branch
.L1:
	ldr	r0, [r7, #0xc]
	mov	r2, r9
	sub	r4, r0, r2
	mov	r5, sl
	str	r5, [r7]
	mov	r0, ip
	str	r0, [r7, #0x4]
	str	r2, [r7, #0xc]
	ldr	r1, .L5 + 8
	add	r0, r3, r1
	str	r2, [sp]
	ldr	r1, [sp, #0xc]
	sub	r1, r1, #0x1
	str	r1, [sp, #0x4]
	ldr	r1, .L5 + 12
	str	r1, [sp, #0x8]
	mov	r1, sl
	mov	r2, ip
	mov	r3, #0x8
	bl	sub_805EF18
	cmp	r4, #0
	ble	.L11	@cond_branch
	ldr	r0, .L5 + 16
	mov	r2, r9
	lsl	r1, r2, #0x8
	ldr	r3, .L5 + 12
	add	r1, r1, r3
	lsl	r2, r4, #0x8
	ldr	r3, [r0]
	mov	r0, #0x0
	bl	_call_via_r3
	b	.L11
.L6:
	.align	2, 0
.L5:
	.4byte	0x3000fb0
	.4byte	0x153c
	.4byte	0x434
	.4byte	0x6012000
	.4byte	0x807d970
.L2:
	ldr	r2, [r7, #0xc]
	cmp	r9, r2
	ble	.L7	@cond_branch
	mov	r4, r9
	sub	r1, r4, r2
	ldr	r5, .L9
	add	r0, r3, r5
	ADD r2, ip
	str	r1, [sp]
	ldr	r1, [sp, #0xc]
	sub	r1, r1, #0x1
	str	r1, [sp, #0x4]
	ldr	r1, [r7, #0xc]
	lsl	r1, r1, #0x8
	ldr	r3, .L9 + 4
	add	r1, r1, r3
	str	r1, [sp, #0x8]
	mov	r1, sl
	mov	r3, #0x8
	bl	sub_805EF18
	str	r4, [r7, #0xc]
	b	.L11
.L10:
	.align	2, 0
.L9:
	.4byte	0x434
	.4byte	0x6012000
.L7:
	cmp	r9, r2
	bge	.L11	@cond_branch
	ldr	r0, .L12
	mov	r4, r9
	lsl	r1, r4, #0x8
	ldr	r5, .L12 + 4
	add	r1, r1, r5
	sub	r2, r2, r4
	lsl	r2, r2, #0x8
	ldr	r3, [r0]
	mov	r0, #0x0
	bl	_call_via_r3
.L11:
	add	sp, sp, #0x18
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
	.4byte	0x807d970
	.4byte	0x6012000
	thumb_func_end sub_8052588

.align 2, 0 @ Don't pad with nop.
