	.include "asm/common.inc"

	thumb_func_start sub_8065108
sub_8065108:
	push	{r4, r5, lr}
	mov	r3, #0x0
	mov	r1, #0x0
	ldrb	r2, [r0, #0x4]
	cmp	r3, r2
	bcs	.L1A	@cond_branch
	mov	r5, #0xc4
	ldr	r4, [r0]
.L3A:
	add	r0, r1, #0
	mul	r0, r0, r5
	add	r0, r4, r0
	ldr	r0, [r0, #0x70]
	cmp	r0, #0
	beq	.L2A	@cond_branch
	add	r0, r3, #1
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
.L2A:
	add	r0, r1, #1
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	cmp	r1, r2
	bcc	.L3A	@cond_branch
.L1A:
	lsl	r0, r3, #0x18
	lsr	r0, r0, #0x18
	pop	{r4, r5}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8065108


	non_word_aligned_thumb_func_start sub_806513E
sub_806513E:
	lsl	r0, r0, #0x0
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff8
	add	r5, r0, #0
	ldrh	r0, [r5, #0x24]
	mov	r9, r0
	ldrh	r1, [r5, #0x26]
	str	r1, [sp, #0x4]
	mov	r2, #0x0
	mov	r8, r2
	ldr	r2, [r5, #0x2c]
	cmp	r2, #0
	ble	.L2	@cond_branch
	ldr	r0, .L7
	ldr	r1, [r0]
	ldr	r0, [r0, #0x4]
	sub	r1, r1, r0
	sub	r1, r2, r1
	str	r1, [r5, #0x2c]
	cmp	r1, #0
	bge	.L2	@cond_branch
	mov	r0, r8
	str	r0, [r5, #0x2c]
.L2:
	ldr	r0, [r5, #0x10]
	cmp	r0, #0
	bne	.L3	@cond_branch
	ldr	r1, [r5, #0x8]
	ldr	r0, [r5, #0xc]
	cmp	r1, r0
	beq	.L12	@cond_branch
	mov	r0, #0x8
	ldrh	r1, [r5, #0x6]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L5	@cond_branch
	add	r0, r5, #0
	bl	sub_8065508
	b	.L12
.L8:
	.align	2, 0
.L7:
	.4byte	0x3000e30
.L5:
	add	r0, r5, #0
	bl	sub_80653D8
	b	.L12
.L3:
	mov	r0, #0x4
	ldrh	r2, [r5, #0x6]
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L10	@cond_branch
	add	r0, r5, #0
	bl	sub_80656B8
	add	r0, r5, #0
	bl	sub_8065108
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldrb	r1, [r5, #0x4]
	cmp	r0, r1
	bcs	.L12	@cond_branch
	ldr	r1, [r5, #0x8]
	ldrb	r3, [r5, #0x4]
	sub	r2, r3, #1
	sub	r3, r3, r0
	mov	r0, #0x0
	str	r0, [sp]
	add	r0, r5, #0
	bl	sub_80655C0
	b	.L12
.L10:
	add	r0, r5, #0
	bl	sub_80656B8
.L12:
	ldr	r0, [r5, #0x8]
	str	r0, [r5, #0xc]
	mov	r0, #0x3
	ldrh	r2, [r5, #0x6]
	and	r0, r0, r2
	cmp	r0, #0x1
	beq	.L13	@cond_branch
	cmp	r0, #0x1
	bgt	.L14	@cond_branch
	cmp	r0, #0
	beq	.L15	@cond_branch
	b	.L20
.L14:
	cmp	r0, #0x2
	beq	.L17	@cond_branch
	b	.L20
.L15:
	ldr	r0, [r5, #0x14]
	lsl	r6, r0, #0x8
	b	.L20
.L13:
	ldrh	r4, [r5, #0x24]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	strh	r0, [r5, #0x24]
	add	r0, r5, #0
	bl	sub_8065334
	ldr	r1, [r5, #0x14]
	sub	r1, r1, r0
	lsl	r6, r1, #0x8
	strh	r4, [r5, #0x24]
	b	.L20
.L17:
	add	r0, r5, #0
	bl	sub_8065334
	str	r0, [r5, #0x20]
	asr	r0, r0, #0x1
	ldr	r1, [r5, #0x14]
	sub	r1, r1, r0
	lsl	r6, r1, #0x8
.L20:
	mov	r7, #0x0
	ldrb	r0, [r5, #0x4]
	cmp	r7, r0
	bcs	.L21	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	mov	sl, r1
.L33:
	ldr	r1, [r5, #0x10]
	cmp	r1, #0
	beq	.L23	@cond_branch
	mov	r2, r8
	add	r0, r7, r2
	add	r0, r1, r0
	ldrb	r0, [r0]
	cmp	r0, #0x20
	bne	.L23	@cond_branch
	mov	r0, #0xa0
	lsl	r0, r0, #0x3
	add	r6, r6, r0
	mov	r0, r8
	add	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r8, r0
.L23:
	mov	r0, #0xc4
	add	r1, r7, #0
	mul	r1, r1, r0
	ldr	r0, [r5]
	add	r4, r0, r1
	mov	r3, #0x10
	add	r0, r3, #0
	ldrb	r1, [r5, #0x5]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L24	@cond_branch
	add	r2, r4, #0
	add	r2, r2, #0x3a
	mov	r1, #0xe1
	ldrb	r0, [r2]
	and	r1, r1, r0
	strb	r1, [r2]
	ldrb	r0, [r5, #0x5]
	lsl	r0, r0, #0x1c
	lsr	r0, r0, #0x1b
	orr	r1, r1, r0
	strb	r1, [r2]
.L24:
	mov	r0, #0x20
	ldrh	r1, [r5, #0x6]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L25	@cond_branch
	str	r6, [r4, #0x4]
.L25:
	add	r0, r3, #0
	ldrh	r2, [r5, #0x6]
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L26	@cond_branch
	ldr	r0, [r5, #0x18]
	lsl	r0, r0, #0x8
	str	r0, [r4, #0x8]
.L26:
	mov	r0, #0x40
	ldrh	r1, [r5, #0x6]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L27	@cond_branch
	mov	r2, r9
	strh	r2, [r4, #0x12]
	mov	r0, sp
	ldrh	r0, [r0, #0x4]
	strh	r0, [r4, #0x14]
.L27:
	ldr	r0, [r5, #0x2c]
	cmp	r0, #0
	bne	.L28	@cond_branch
	str	r0, [r4, #0x70]
.L28:
	add	r0, r4, #0
	bl	sub_80584B8
	ldr	r0, [r4, #0x70]
	cmp	r0, #0
	beq	.L29	@cond_branch
	ldr	r1, [r5, #0x28]
	cmp	r1, #0
	beq	.L30	@cond_branch
	mov	r2, #0x22
	ldsh	r0, [r4, r2]
	add	r0, r1, r0
	ldrb	r4, [r4, #0x10]
	ldrb	r0, [r0]
	sub	r0, r4, r0
	lsl	r1, r0, #0x8
	mov	r2, r9
	lsl	r0, r2, #0x10
	asr	r0, r0, #0x10
	cmp	r0, sl
	beq	.L32	@cond_branch
	mul	r0, r0, r1
	asr	r1, r0, #0x8
	b	.L32
.L30:
	ldrb	r4, [r4, #0x10]
	lsl	r1, r4, #0x8
.L32:
	add	r6, r6, r1
.L29:
	add	r0, r7, #1
	lsl	r0, r0, #0x10
	lsr	r7, r0, #0x10
	ldrb	r0, [r5, #0x4]
	cmp	r7, r0
	bcc	.L33	@cond_branch
.L21:
	add	sp, sp, #0x8
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_806513E

.align 2, 0 @ Don't pad with nop.
