	.include "asm/common.inc"

	thumb_func_start sub_804967C
sub_804967C:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff4
	mov	r0, #0x7
	mov	r1, #0x0
	bl	sub_80490CC
	ldr	r1, .L9
	ldr	r0, [r1]
	mov	r2, #0x1
	NEG	r2, r2
	cmp	r0, r2
	beq	.L6	@cond_branch
	ldr	r3, .L9 + 4
	add	r0, r1, r3
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L2	@cond_branch
	add	r3, r3, #0x4c
	add	r0, r1, r3
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L3	@cond_branch
	add	r5, r0, #0
	add	r0, r1, #0
	add	r0, r0, #0xb4
	ldr	r0, [r0]
	ldr	r0, [r0, #0x4]
	ldr	r4, [r0, #0x14]
	sub	r4, r4, #0x1
	cmp	r4, r2
	beq	.L4	@cond_branch
	add	r6, r2, #0
.L5:
	add	r0, r5, #0
	bl	sub_8061204
	add	r5, r5, #0x30
	sub	r4, r4, #0x1
	cmp	r4, r6
	bne	.L5	@cond_branch
.L4:
	ldr	r0, .L9
	mov	r1, #0x8e
	lsl	r1, r1, #0x3
	add	r0, r0, r1
	mov	r1, #0x0
	str	r1, [r0]
.L3:
	ldr	r4, .L9
	ldr	r2, .L9 + 4
	add	r4, r4, r2
	ldr	r0, [r4]
	bl	deallocateBlock
	mov	r0, #0x0
	str	r0, [r4]
.L2:
	ldr	r4, .L9
	add	r0, r4, #0
	bl	sub_80436B0
	ldr	r3, .L9 + 8
	add	r0, r4, r3
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	cmp	r0, #0
	beq	.L6	@cond_branch
	mov	r2, #0x8b
	lsl	r2, r2, #0x3
	add	r0, r4, r2
	bl	sub_8050584
	mov	r3, #0x85
	lsl	r3, r3, #0x3
	add	r0, r4, r3
	bl	sub_8061204
.L6:
	ldr	r1, .L9
	ldr	r2, [r1, #0x4]
	mov	r0, #0x1
	NEG	r0, r0
	add	r5, r1, #0
	cmp	r2, r0
	beq	.L7	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0xb4
	lsl	r1, r2, #0x1
	add	r1, r1, r2
	lsl	r1, r1, #0x3
	ldr	r2, .L9 + 12
	add	r1, r1, r2
	str	r1, [r0]
	b	.L8
.L10:
	.align	2, 0
.L9:
	.4byte	0x3000650
	.4byte	0x424
	.4byte	0x464
	.4byte	0x8069fc8
.L7:
	add	r1, r5, #0
	add	r1, r1, #0xb4
	mov	r0, #0x0
	str	r0, [r1]
.L8:
	ldr	r1, [r5, #0x4]
	str	r1, [r5]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	bne	.L11	@cond_branch
	b	.L12
.L11:
	add	r6, r5, #0
	add	r6, r6, #0xb4
	ldr	r0, [r6]
	ldr	r7, [r0, #0x4]
	add	r1, r5, #0
	add	r1, r1, #0x80
	mov	r0, #0xf3
	ldrb	r2, [r1]
	and	r0, r0, r2
	mov	r4, #0x0
	strb	r0, [r1]
	mov	r0, #0x0
	bl	StoreFunction
	ldr	r0, .L15
	strb	r4, [r0]
	ldr	r3, .L15 + 4
	add	r0, r5, r3
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L13	@cond_branch
	bl	call_via_r0
	b	.L17
.L16:
	.align	2, 0
.L15:
	.4byte	0x3000bfd
	.4byte	0x58c
.L13:
	ldr	r0, [r6]
	ldr	r0, [r0, #0xc]
	cmp	r0, #0
	beq	.L17	@cond_branch
	bl	call_via_r0
.L17:
	mov	r0, #0x0
	bl	sub_8049330
	mov	r0, #0x2
	bl	sub_8049344
	ldr	r1, [r7, #0x14]
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x4
	cmp	r0, #0
	beq	.L19	@cond_branch
	bl	slowAllocate
	add	r2, r0, #0
	ldr	r1, .L21
	ldr	r3, .L21 + 4
	add	r0, r1, r3
	str	r2, [r0]
	cmp	r2, #0
	beq	.L19	@cond_branch
	mov	r0, #0x8e
	lsl	r0, r0, #0x3
	add	r1, r1, r0
	ldr	r0, [r2]
	str	r0, [r1]
	add	r6, r0, #0
	ldr	r4, [r7, #0x18]
	ldr	r5, [r7, #0x14]
	b	.L20
.L22:
	.align	2, 0
.L21:
	.4byte	0x3000650
	.4byte	0x424
.L23:
	ldr	r0, [r4, #0x8]
	ldr	r1, [r0]
	ldr	r2, [r0, #0x4]
	mov	r0, #0x0
	ldsh	r3, [r4, r0]
	mov	ip, r3
	mov	r3, #0x2
	ldsh	r0, [r4, r3]
	str	r0, [sp]
	ldrh	r0, [r4, #0x20]
	str	r0, [sp, #0x4]
	ldr	r0, [r4, #0x8]
	ldrh	r0, [r0, #0x8]
	str	r0, [sp, #0x8]
	add	r0, r6, #0
	mov	r3, ip
	bl	allocFont
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r1, r4, #0
	add	r1, r1, #0xc
	add	r1, r1, r0
	ldr	r1, [r1]
	ldr	r0, [r4, #0x8]
	ldrb	r2, [r0, #0xa]
	add	r0, r6, #0
	bl	sub_8061660
	add	r4, r4, #0x2c
	add	r6, r6, #0x30
.L20:
	sub	r5, r5, #0x1
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r5, r0
	bne	.L23	@cond_branch
.L19:
	ldr	r4, [r7, #0x10]
	cmp	r4, #0
	beq	.L25	@cond_branch
	ldr	r5, [r4, #0x24]
	ldr	r6, .L26
	ldr	r0, [r4, #0x8]
	ldr	r1, [r0]
	ldr	r2, [r0, #0x4]
	mov	r3, #0x0
	ldsh	r0, [r4, r3]
	mov	ip, r0
	mov	r3, #0x2
	ldsh	r0, [r4, r3]
	str	r0, [sp]
	ldr	r0, [r7, #0x10]
	ldrh	r0, [r0, #0x20]
	str	r0, [sp, #0x4]
	ldr	r0, [r7, #0x10]
	ldr	r0, [r0, #0x8]
	ldrh	r0, [r0, #0x8]
	str	r0, [sp, #0x8]
	add	r0, r6, #0
	mov	r3, ip
	bl	allocFont
	ldr	r4, [r7, #0x10]
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r4, r4, #0xc
	add	r4, r4, r0
	ldr	r1, [r4]
	ldr	r0, [r7, #0x10]
	ldr	r0, [r0, #0x8]
	ldrb	r2, [r0, #0xa]
	add	r0, r6, #0
	bl	sub_8061660
	ldr	r0, [r7, #0x10]
	ldr	r0, [r0, #0x24]
	cmp	r0, #0
	beq	.L25	@cond_branch
	add	r4, r6, #0
	add	r4, r4, #0x30
	add	r1, r6, #0
	add	r1, r1, #0x14
	ldrh	r2, [r5, #0x24]
	add	r0, r4, #0
	bl	newMotionGroup
	ldr	r1, [r5]
	ldr	r2, [r5, #0x4]
	ldr	r3, [r5, #0x8]
	ldr	r0, [r5, #0xc]
	str	r0, [sp]
	add	r0, r4, #0
	bl	sub_80504E4
	ldr	r1, [r5, #0x10]
	ldr	r2, [r5, #0x14]
	ldr	r3, [r5, #0x18]
	ldr	r0, [r5, #0x1c]
	str	r0, [sp]
	add	r0, r4, #0
	bl	sub_805052C
	ldr	r1, [r5, #0x20]
	mov	r0, #0x26
	ldsh	r2, [r5, r0]
	add	r0, r4, #0
	bl	sub_8050578
.L25:
	ldr	r0, .L26 + 4
	bl	sub_8043370
	mov	r0, #0x0
	mov	r1, #0x0
	bl	sub_80490CC
.L12:
	add	sp, sp, #0xc
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L27:
	.align	2, 0
.L26:
	.4byte	0x3000a78
	.4byte	0x3000650
	thumb_func_end sub_804967C

.align 2, 0 @ Don't pad with nop.
