	.include "asm/common.inc"

	thumb_func_start sub_8043370
sub_8043370:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffd8
	add	r7, r0, #0
	add	r0, r0, #0xb4
	ldr	r0, [r0]
	ldr	r0, [r0, #0x4]
	ldr	r5, [r0, #0x20]
	ldr	r0, .L8
	mov	r8, r0
	cmp	r5, #0
	bne	.L1	@cond_branch
	b	.L4
.L1:
	mov	r1, #0x8f
	lsl	r1, r1, #0x3
	add	r1, r1, r7
	mov	r9, r1
	bl	getLanguage
	ldr	r2, [r5, #0x8]
	ldr	r1, [r2]
	ldr	r2, [r2, #0x4]
	mov	r4, #0x0
	ldsh	r3, [r5, r4]
	mov	r6, #0x2
	ldsh	r4, [r5, r6]
	str	r4, [sp]
	ldrh	r4, [r5, #0x10]
	str	r4, [sp, #0x4]
	ldrh	r4, [r5, #0x12]
	str	r4, [sp, #0x8]
	ldrb	r4, [r5, #0x14]
	str	r4, [sp, #0xc]
	ldrb	r4, [r5, #0x15]
	str	r4, [sp, #0x10]
	ldrb	r4, [r5, #0x16]
	str	r4, [sp, #0x14]
	ldrb	r4, [r5, #0x17]
	str	r4, [sp, #0x18]
	ldr	r4, .L8 + 4
	str	r4, [sp, #0x1c]
	mov	r4, #0x0
	mov	sl, r4
	str	r4, [sp, #0x20]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0x24]
	mov	r0, r9
	bl	sub_805AD24
	ldr	r1, [r5, #0xc]
	mov	r0, r9
	mov	r2, #0x0
	bl	allocateMenuItems
	add	r0, r7, #0
	add	r0, r0, #0x7e
	mov	r6, sl
	strb	r6, [r0]
	sub	r0, r0, #0x1
	strb	r6, [r0]
	mov	r1, #0x92
	lsl	r1, r1, #0x3
	add	r0, r7, r1
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L4	@cond_branch
	mov	r2, r9
	ldr	r1, [r2, #0x18]
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x3
	bl	slowAllocate
	ldr	r3, .L8 + 8
	add	r1, r7, r3
	str	r0, [r1]
	mov	r4, #0xa4
	lsl	r4, r4, #0x3
	add	r1, r7, r4
	ldr	r0, [r0]
	str	r0, [r1]
	add	r4, r0, #0
	mov	r0, r9
	ldr	r6, [r0, #0xc]
	mov	r1, #0xa5
	lsl	r1, r1, #0x3
	add	r0, r7, r1
	mov	r2, sl
	str	r2, [r0]
	mov	r0, #0xa0
	mov	r3, r9
	ldrb	r3, [r3, #0x9]
	sub	r0, r0, r3
	lsr	r1, r0, #0x1f
	add	r0, r0, r1
	asr	r0, r0, #0x1
	mov	r2, #0x6
	ldsh	r1, [r5, r2]
	add	r0, r0, r1
	mov	sl, r0
	mov	r7, #0x0
	mov	r3, r9
	ldr	r0, [r3, #0x18]
	cmp	r7, r0
	bge	.L4	@cond_branch
.L7:
	mov	r0, #0x1
	and	r0, r0, r7
	mov	r5, #0x1
	NEG	r5, r5
	cmp	r0, #0
	beq	.L5	@cond_branch
	mov	r5, #0x1
.L5:
	mov	r2, #0xf0
	cmp	r5, #0
	ble	.L6	@cond_branch
	mov	r2, #0x10
	NEG	r2, r2
.L6:
	add	r0, r6, #0
	mov	r1, #0x0
	bl	sub_8061844
	add	r1, r6, #0
	add	r1, r1, #0x14
	add	r0, r4, #0
	mov	r2, #0x6
	bl	newMotionGroup
	mov	r0, r8
	ldr	r1, [r0]
	ldr	r0, [r0, #0x4]
	add	r2, r0, #0
	mul	r2, r2, r5
	mov	r3, r8
	ldr	r3, [r3, #0x8]
	mov	ip, r3
	mov	r3, r8
	ldr	r0, [r3, #0xc]
	str	r0, [sp]
	add	r0, r4, #0
	mov	r3, ip
	bl	sub_80504E4
	mov	r0, r8
	ldr	r1, [r0, #0x10]
	ldr	r0, [r0, #0x14]
	add	r2, r0, #0
	mul	r2, r2, r5
	mov	r5, r8
	ldr	r3, [r5, #0x18]
	ldr	r0, [r5, #0x1c]
	str	r0, [sp]
	add	r0, r4, #0
	bl	sub_805052C
	mov	r0, sl
	lsl	r1, r0, #0x8
	mov	r3, #0x26
	ldsh	r2, [r5, r3]
	add	r0, r4, #0
	bl	sub_8050578
	mov	r5, r9
	mov	r1, #0xa
	ldsh	r0, [r5, r1]
	ADD sl, r0
	add	r4, r4, #0x18
	add	r6, r6, #0x4c
	add	r7, r7, #0x1
	ldr	r0, [r5, #0x18]
	cmp	r7, r0
	blt	.L7	@cond_branch
.L4:
	add	sp, sp, #0x28
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L9:
	.align	2, 0
.L8:
	.4byte	0x8068840
	.4byte	sub_8043604 + 1
	.4byte	0x524
	thumb_func_end sub_8043370

.align 2, 0 @ Don't pad with nop.
