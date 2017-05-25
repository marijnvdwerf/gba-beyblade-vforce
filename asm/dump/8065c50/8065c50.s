	.include "asm/common.inc"

	thumb_func_start sub_8065C50
sub_8065C50:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffcc
	mov	r4, #0x0
	str	r4, [sp]
	add	r5, r1, #0
	add	r4, r0, #0
	cmp	r5, #0
	bge	.L1	@cond_branch
	ldr	r0, [sp]
	MVN	r0, r0
	str	r0, [sp]
	NEG	r0, r4
	add	r6, r0, #0
	NEG	r1, r5
	cmp	r0, #0
	beq	.L2	@cond_branch
	sub	r1, r1, #0x1
.L2:
	add	r7, r1, #0
	add	r5, r7, #0
	add	r4, r6, #0
.L1:
	cmp	r3, #0
	bge	.L3	@cond_branch
	ldr	r1, [sp]
	MVN	r1, r1
	str	r1, [sp]
	NEG	r0, r2
	str	r0, [sp, #0x4]
	NEG	r2, r3
	cmp	r0, #0
	beq	.L4	@cond_branch
	sub	r2, r2, #0x1
.L4:
	str	r2, [sp, #0x8]
	ldr	r2, [sp, #0x4]
	ldr	r3, [sp, #0x8]
.L3:
	add	r7, r2, #0
	add	r6, r3, #0
	mov	sl, r4
	mov	r8, r5
	cmp	r6, #0
	beq	.L5	@cond_branch
	b	.L6
.L5:
	cmp	r7, r8
	bls	.L7	@cond_branch
	ldr	r0, .L11
	cmp	r7, r0
	bhi	.L8	@cond_branch
	mov	r1, #0x0
	cmp	r7, #0xff
	bls	.L13	@cond_branch
	mov	r1, #0x8
	b	.L13
.L12:
	.align	2, 0
.L11:
	.4byte	0xffff
.L8:
	ldr	r0, .L22
	mov	r1, #0x18
	cmp	r7, r0
	bhi	.L13	@cond_branch
	mov	r1, #0x10
.L13:
	ldr	r0, .L22 + 4
	LSR	r2, r1
	add	r0, r2, r0
	ldrb	r0, [r0]
	add	r0, r0, r1
	mov	r1, #0x20
	sub	r2, r1, r0
	cmp	r2, #0
	beq	.L14	@cond_branch
	LSL	r7, r2
	mov	r3, r8
	LSL	r3, r2
	sub	r1, r1, r2
	mov	r0, sl
	LSR	r0, r1
	orr	r3, r3, r0
	mov	r8, r3
	mov	r4, sl
	LSL	r4, r2
	mov	sl, r4
.L14:
	lsr	r0, r7, #0x10
	mov	r9, r0
	ldr	r1, .L22 + 8
	and	r1, r1, r7
	str	r1, [sp, #0xc]
	mov	r0, r8
	mov	r1, r9
	bl	sub_8066238
	add	r4, r0, #0
	mov	r0, r8
	mov	r1, r9
	bl	sub_80661C0
	add	r6, r0, #0
	ldr	r3, [sp, #0xc]
	add	r2, r6, #0
	mul	r2, r2, r3
	lsl	r4, r4, #0x10
	mov	r1, sl
	lsr	r0, r1, #0x10
	orr	r4, r4, r0
	cmp	r4, r2
	bcs	.L17	@cond_branch
	sub	r6, r6, #0x1
	add	r4, r4, r7
	cmp	r4, r7
	bcc	.L17	@cond_branch
	cmp	r4, r2
	bcs	.L17	@cond_branch
	sub	r6, r6, #0x1
	add	r4, r4, r7
.L17:
	sub	r4, r4, r2
	add	r0, r4, #0
	mov	r1, r9
	bl	sub_8066238
	add	r5, r0, #0
	add	r0, r4, #0
	mov	r1, r9
	bl	sub_80661C0
	add	r1, r0, #0
	ldr	r3, [sp, #0xc]
	add	r2, r1, #0
	mul	r2, r2, r3
	lsl	r5, r5, #0x10
	ldr	r0, .L22 + 8
	mov	r4, sl
	and	r4, r4, r0
	orr	r5, r5, r4
	cmp	r5, r2
	bcs	.L20	@cond_branch
	sub	r1, r1, #0x1
	add	r5, r5, r7
	cmp	r5, r7
	bcc	.L20	@cond_branch
	cmp	r5, r2
	bcs	.L20	@cond_branch
	sub	r1, r1, #0x1
.L20:
	lsl	r6, r6, #0x10
	orr	r6, r6, r1
	mov	r0, #0x0
	str	r0, [sp, #0x10]
	b	.L51
.L23:
	.align	2, 0
.L22:
	.4byte	0xffffff
	.4byte	0x87568f4
	.4byte	0xffff
.L7:
	cmp	r2, #0
	bne	.L24	@cond_branch
	mov	r0, #0x1
	mov	r1, #0x0
	bl	sub_80661C0
	add	r7, r0, #0
.L24:
	add	r1, r7, #0
	ldr	r0, .L28
	cmp	r7, r0
	bhi	.L25	@cond_branch
	mov	r2, #0x0
	cmp	r7, #0xff
	bls	.L30	@cond_branch
	mov	r2, #0x8
	b	.L30
.L29:
	.align	2, 0
.L28:
	.4byte	0xffff
.L25:
	ldr	r0, .L33
	mov	r2, #0x18
	cmp	r7, r0
	bhi	.L30	@cond_branch
	mov	r2, #0x10
.L30:
	ldr	r0, .L33 + 4
	LSR	r1, r2
	add	r0, r1, r0
	ldrb	r0, [r0]
	add	r0, r0, r2
	mov	r1, #0x20
	sub	r2, r1, r0
	cmp	r2, #0
	bne	.L31	@cond_branch
	mov	r1, r8
	sub	r1, r1, r7
	mov	r8, r1
	mov	r2, #0x1
	str	r2, [sp, #0x10]
	b	.L32
.L34:
	.align	2, 0
.L33:
	.4byte	0xffffff
	.4byte	0x87568f4
.L31:
	sub	r1, r1, r2
	LSL	r7, r2
	mov	r5, r8
	LSR	r5, r1
	mov	r3, r8
	LSL	r3, r2
	mov	r0, sl
	LSR	r0, r1
	orr	r3, r3, r0
	mov	r8, r3
	mov	r4, sl
	LSL	r4, r2
	mov	sl, r4
	lsr	r0, r7, #0x10
	mov	r9, r0
	ldr	r1, .L48
	and	r1, r1, r7
	str	r1, [sp, #0x14]
	add	r0, r5, #0
	mov	r1, r9
	bl	sub_8066238
	add	r4, r0, #0
	add	r0, r5, #0
	mov	r1, r9
	bl	sub_80661C0
	add	r6, r0, #0
	ldr	r2, [sp, #0x14]
	add	r1, r6, #0
	mul	r1, r1, r2
	lsl	r4, r4, #0x10
	mov	r3, r8
	lsr	r0, r3, #0x10
	orr	r4, r4, r0
	cmp	r4, r1
	bcs	.L37	@cond_branch
	sub	r6, r6, #0x1
	add	r4, r4, r7
	cmp	r4, r7
	bcc	.L37	@cond_branch
	cmp	r4, r1
	bcs	.L37	@cond_branch
	sub	r6, r6, #0x1
	add	r4, r4, r7
.L37:
	sub	r4, r4, r1
	add	r0, r4, #0
	mov	r1, r9
	bl	sub_8066238
	add	r5, r0, #0
	add	r0, r4, #0
	mov	r1, r9
	bl	sub_80661C0
	add	r2, r0, #0
	ldr	r4, [sp, #0x14]
	add	r1, r2, #0
	mul	r1, r1, r4
	lsl	r5, r5, #0x10
	ldr	r0, .L48
	mov	r3, r8
	and	r3, r3, r0
	orr	r5, r5, r3
	cmp	r5, r1
	bcs	.L40	@cond_branch
	sub	r2, r2, #0x1
	add	r5, r5, r7
	cmp	r5, r7
	bcc	.L40	@cond_branch
	cmp	r5, r1
	bcs	.L40	@cond_branch
	sub	r2, r2, #0x1
	add	r5, r5, r7
.L40:
	lsl	r6, r6, #0x10
	orr	r6, r6, r2
	str	r6, [sp, #0x10]
	sub	r1, r5, r1
	mov	r8, r1
.L32:
	lsr	r4, r7, #0x10
	mov	r9, r4
	ldr	r0, .L48
	and	r0, r0, r7
	str	r0, [sp, #0x18]
	mov	r0, r8
	mov	r1, r9
	bl	sub_8066238
	add	r4, r0, #0
	mov	r0, r8
	mov	r1, r9
	bl	sub_80661C0
	add	r6, r0, #0
	ldr	r1, [sp, #0x18]
	add	r2, r6, #0
	mul	r2, r2, r1
	lsl	r4, r4, #0x10
	mov	r3, sl
	lsr	r0, r3, #0x10
	orr	r4, r4, r0
	cmp	r4, r2
	bcs	.L43	@cond_branch
	sub	r6, r6, #0x1
	add	r4, r4, r7
	cmp	r4, r7
	bcc	.L43	@cond_branch
	cmp	r4, r2
	bcs	.L43	@cond_branch
	sub	r6, r6, #0x1
	add	r4, r4, r7
.L43:
	sub	r4, r4, r2
	add	r0, r4, #0
	mov	r1, r9
	bl	sub_8066238
	add	r5, r0, #0
	add	r0, r4, #0
	mov	r1, r9
	bl	sub_80661C0
	add	r1, r0, #0
	ldr	r4, [sp, #0x18]
	add	r2, r1, #0
	mul	r2, r2, r4
	lsl	r5, r5, #0x10
	ldr	r0, .L48
	mov	r3, sl
	and	r3, r3, r0
	orr	r5, r5, r3
	cmp	r5, r2
	bcs	.L46	@cond_branch
	sub	r1, r1, #0x1
	add	r5, r5, r7
	cmp	r5, r7
	bcc	.L46	@cond_branch
	cmp	r5, r2
	bcs	.L46	@cond_branch
	sub	r1, r1, #0x1
.L46:
	lsl	r6, r6, #0x10
	orr	r6, r6, r1
	b	.L51
.L49:
	.align	2, 0
.L48:
	.4byte	0xffff
.L6:
	cmp	r6, r8
	bls	.L50	@cond_branch
	mov	r6, #0x0
	mov	r4, #0x0
	str	r4, [sp, #0x10]
	b	.L51
.L50:
	add	r1, r6, #0
	ldr	r0, .L55
	cmp	r6, r0
	bhi	.L52	@cond_branch
	mov	r2, #0x0
	cmp	r6, #0xff
	bls	.L57	@cond_branch
	mov	r2, #0x8
	b	.L57
.L56:
	.align	2, 0
.L55:
	.4byte	0xffff
.L52:
	ldr	r0, .L62
	mov	r2, #0x18
	cmp	r6, r0
	bhi	.L57	@cond_branch
	mov	r2, #0x10
.L57:
	ldr	r0, .L62 + 4
	LSR	r1, r2
	add	r0, r1, r0
	ldrb	r0, [r0]
	add	r0, r0, r2
	mov	r1, #0x20
	sub	r2, r1, r0
	cmp	r2, #0
	bne	.L58	@cond_branch
	cmp	r8, r6
	bhi	.L59	@cond_branch
	cmp	sl, r7
	bcc	.L60	@cond_branch
.L59:
	mov	r6, #0x1
	mov	r1, sl
	b	.L61
.L63:
	.align	2, 0
.L62:
	.4byte	0xffffff
	.4byte	0x87568f4
.L60:
	mov	r6, #0x0
	b	.L74
.L58:
	sub	r1, r1, r2
	LSL	r6, r2
	add	r0, r7, #0
	LSR	r0, r1
	orr	r6, r6, r0
	LSL	r7, r2
	mov	r5, r8
	LSR	r5, r1
	mov	r3, r8
	LSL	r3, r2
	mov	r0, sl
	LSR	r0, r1
	orr	r3, r3, r0
	mov	r8, r3
	mov	r4, sl
	LSL	r4, r2
	mov	sl, r4
	lsr	r0, r6, #0x10
	mov	r9, r0
	ldr	r1, .L77
	and	r1, r1, r6
	str	r1, [sp, #0x1c]
	add	r0, r5, #0
	mov	r1, r9
	bl	sub_8066238
	add	r4, r0, #0
	add	r0, r5, #0
	mov	r1, r9
	bl	sub_80661C0
	add	r3, r0, #0
	ldr	r2, [sp, #0x1c]
	add	r1, r3, #0
	mul	r1, r1, r2
	lsl	r4, r4, #0x10
	mov	r2, r8
	lsr	r0, r2, #0x10
	orr	r4, r4, r0
	cmp	r4, r1
	bcs	.L67	@cond_branch
	sub	r3, r3, #0x1
	add	r4, r4, r6
	cmp	r4, r6
	bcc	.L67	@cond_branch
	cmp	r4, r1
	bcs	.L67	@cond_branch
	sub	r3, r3, #0x1
	add	r4, r4, r6
.L67:
	sub	r4, r4, r1
	add	r0, r4, #0
	mov	r1, r9
	str	r3, [sp, #0x30]
	bl	sub_8066238
	add	r5, r0, #0
	add	r0, r4, #0
	mov	r1, r9
	bl	sub_80661C0
	add	r2, r0, #0
	ldr	r4, [sp, #0x1c]
	add	r1, r2, #0
	mul	r1, r1, r4
	lsl	r5, r5, #0x10
	ldr	r0, .L77
	mov	r4, r8
	and	r4, r4, r0
	orr	r5, r5, r4
	ldr	r3, [sp, #0x30]
	cmp	r5, r1
	bcs	.L70	@cond_branch
	sub	r2, r2, #0x1
	add	r5, r5, r6
	cmp	r5, r6
	bcc	.L70	@cond_branch
	cmp	r5, r1
	bcs	.L70	@cond_branch
	sub	r2, r2, #0x1
	add	r5, r5, r6
.L70:
	lsl	r6, r3, #0x10
	orr	r6, r6, r2
	sub	r1, r5, r1
	mov	r8, r1
	ldr	r0, .L77
	mov	r9, r0
	add	r1, r6, #0
	and	r1, r1, r0
	lsr	r3, r6, #0x10
	add	r0, r7, #0
	mov	r2, r9
	and	r0, r0, r2
	lsr	r2, r7, #0x10
	add	r5, r1, #0
	mul	r5, r5, r0
	add	r4, r1, #0
	mul	r4, r4, r2
	add	r1, r3, #0
	mul	r1, r1, r0
	mul	r3, r3, r2
	lsr	r0, r5, #0x10
	add	r4, r4, r0
	add	r4, r4, r1
	cmp	r4, r1
	bcs	.L71	@cond_branch
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	add	r3, r3, r0
.L71:
	lsr	r0, r4, #0x10
	add	r3, r3, r0
	mov	r1, r9
	and	r4, r4, r1
	lsl	r0, r4, #0x10
	and	r5, r5, r1
	add	r1, r0, r5
	cmp	r3, r8
	bhi	.L72	@cond_branch
	cmp	r3, r8
	bne	.L74	@cond_branch
	cmp	r1, sl
	bls	.L74	@cond_branch
.L72:
	sub	r6, r6, #0x1
.L61:
	sub	r0, r1, r7
.L74:
	mov	r2, #0x0
	str	r2, [sp, #0x10]
.L51:
	str	r6, [sp, #0x20]
	ldr	r3, [sp, #0x10]
	str	r3, [sp, #0x24]
	ldr	r1, [sp, #0x20]
	ldr	r2, [sp, #0x24]
	ldr	r4, [sp]
	cmp	r4, #0
	beq	.L75	@cond_branch
	NEG	r0, r1
	str	r0, [sp, #0x28]
	NEG	r1, r2
	cmp	r0, #0
	beq	.L76	@cond_branch
	sub	r1, r1, #0x1
.L76:
	str	r1, [sp, #0x2c]
	ldr	r1, [sp, #0x28]
	ldr	r2, [sp, #0x2c]
.L75:
	add	r0, r1, #0
	add	r1, r2, #0
	add	sp, sp, #0x34
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7, pc}
.L78:
	.align	2, 0
.L77:
	.4byte	0xffff
	thumb_func_end sub_8065C50

.align 2, 0 @ Don't pad with nop.
