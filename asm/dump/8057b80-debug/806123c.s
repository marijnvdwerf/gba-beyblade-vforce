	.include "asm/common.inc"

	thumb_func_start sub_806123C
sub_806123C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffd4
	mov	ip, r0
	ldr	r0, [r0, #0x20]
	str	r0, [sp]
	mov	r1, ip
	ldr	r0, [r1, #0x24]
	ldrb	r0, [r0, #0x4]
	mov	sl, r0
	ldr	r2, [r1]
	str	r2, [sp, #0x4]
	ldr	r3, [r1, #0x4]
	str	r3, [sp, #0x8]
	ldrh	r7, [r1, #0xc]
	str	r7, [sp, #0xc]
	mov	r0, #0x0
	mov	r9, r0
	ldr	r4, [r1, #0x1c]
	ldr	r5, [r1, #0x14]
	mov	r1, #0x0
	str	r1, [sp, #0x10]
	add	r6, r5, #0
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	str	r2, [sp, #0x14]
	mov	r3, ip
	ldr	r0, [r3, #0x2c]
	mov	r7, #0x0
	str	r7, [sp, #0x18]
	strb	r7, [r3, #0xf]
	cmp	r4, #0
	bne	.L1	@cond_branch
	b	.L48
.L1:
	cmp	r0, #0
	beq	.L3	@cond_branch
	ldrh	r0, [r0, #0x14]
	str	r0, [sp, #0x14]
.L3:
	mov	r2, ip
	ldrh	r0, [r2, #0x8]
	mov	r1, #0x3
	and	r1, r1, r0
	mov	r3, sp
	strh	r0, [r3, #0x20]
	cmp	r1, #0x1
	beq	.L4	@cond_branch
	cmp	r1, #0x2
	beq	.L5	@cond_branch
	b	.L7
.L4:
	ldr	r7, [sp, #0xc]
	lsl	r0, r7, #0x8
	ldr	r1, [sp, #0x4]
	add	r1, r1, r0
	str	r1, [sp, #0x4]
	b	.L7
.L5:
	mov	r0, #0x2
	NEG	r0, r0
	ldr	r2, [sp, #0xc]
	and	r0, r0, r2
	lsl	r0, r0, #0x7
	ldr	r3, [sp, #0x4]
	add	r3, r3, r0
	str	r3, [sp, #0x4]
.L7:
	add	r0, r4, #0
	sub	r4, r4, #0x1
	mov	r7, ip
	ldr	r7, [r7, #0x14]
	str	r7, [sp, #0x1c]
	cmp	r0, #0
	bne	.L43	@cond_branch
	b	.L42
.L43:
	ldrh	r1, [r5, #0x1e]
	ldr	r2, .L14
	and	r2, r2, r1
	mov	r0, #0x80
	lsl	r0, r0, #0x8
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L10	@cond_branch
	str	r5, [sp, #0x10]
.L10:
	mov	r0, ip
	add	r0, r0, #0x29
	mov	r1, #0x0
	ldsb	r1, [r0, r1]
	str	r1, [sp, #0x24]
	mov	r3, r9
	sub	r1, r2, r3
	str	r0, [sp, #0x28]
	ldr	r7, [sp]
	cmp	r7, #0
	beq	.L11	@cond_branch
	ldrh	r0, [r5, #0x18]
	add	r0, r0, r7
	mov	r2, sl
	ldrb	r3, [r0]
	sub	r2, r2, r3
	mov	r8, r2
	ldr	r0, [sp, #0x24]
	ADD r0, r8
	add	r0, r1, r0
	ldr	r7, [sp, #0xc]
	cmp	r0, r7
	bhi	.L17	@cond_branch
	b	.L13
.L15:
	.align	2, 0
.L14:
	.4byte	0x7fff
.L11:
	ldr	r0, [sp, #0x24]
	ADD r0, sl
	add	r0, r1, r0
	ldr	r1, [sp, #0xc]
	cmp	r0, r1
	bhi	.L17	@cond_branch
.L13:
	sub	r2, r4, #1
	mov	r8, r2
	cmp	r4, #0
	beq	.L17	@cond_branch
	b	.L18
.L17:
	cmp	r4, #0
	beq	.L19	@cond_branch
	ldr	r3, [sp, #0x10]
	cmp	r3, #0
	beq	.L20	@cond_branch
	ldr	r3, [r3]
	b	.L22
.L20:
	ldr	r3, [r5]
	b	.L22
.L19:
	add	r3, r5, #0
.L22:
	mov	r1, #0x0
	mov	r0, #0x3
	mov	r7, sp
	ldrh	r7, [r7, #0x20]
	and	r0, r0, r7
	cmp	r0, #0x1
	beq	.L23	@cond_branch
	cmp	r0, #0x1
	ble	.L26	@cond_branch
	cmp	r0, #0x2
	beq	.L25	@cond_branch
	b	.L26
.L23:
	ldr	r0, .L29
	ldrh	r1, [r3, #0x1e]
	and	r0, r0, r1
	mov	r2, r9
	sub	r1, r0, r2
	ldr	r7, [sp, #0x28]
	ldrb	r7, [r7]
	lsl	r7, r7, #0x18
	asr	r7, r7, #0x18
	str	r7, [sp, #0x28]
	ldr	r0, [sp]
	cmp	r0, #0
	beq	.L27	@cond_branch
	ldrh	r2, [r3, #0x18]
	add	r2, r2, r0
	mov	r7, sl
	ldrb	r0, [r2]
	sub	r7, r7, r0
	mov	r8, r7
	ldr	r0, [sp, #0x28]
	ADD r0, r8
	b	.L28
.L30:
	.align	2, 0
.L29:
	.4byte	0x7fff
.L27:
	ldr	r0, [sp, #0x28]
	ADD r0, sl
.L28:
	add	r1, r1, r0
	lsl	r0, r1, #0x8
	b	.L31
.L25:
	ldr	r0, .L34
	ldrh	r1, [r3, #0x1e]
	and	r0, r0, r1
	mov	r2, r9
	sub	r1, r0, r2
	ldr	r7, [sp, #0x28]
	ldrb	r7, [r7]
	lsl	r7, r7, #0x18
	asr	r7, r7, #0x18
	str	r7, [sp, #0x28]
	ldr	r0, [sp]
	cmp	r0, #0
	beq	.L32	@cond_branch
	ldrh	r2, [r3, #0x18]
	add	r2, r2, r0
	mov	r7, sl
	ldrb	r0, [r2]
	sub	r7, r7, r0
	mov	r8, r7
	ldr	r0, [sp, #0x28]
	ADD r0, r8
	b	.L33
.L35:
	.align	2, 0
.L34:
	.4byte	0x7fff
.L32:
	ldr	r0, [sp, #0x28]
	ADD r0, sl
.L33:
	add	r1, r1, r0
	mov	r0, #0x2
	NEG	r0, r0
	and	r1, r1, r0
	lsl	r0, r1, #0x7
.L31:
	NEG	r1, r0
.L26:
	mov	r2, r9
	lsl	r0, r2, #0x8
	sub	r1, r1, r0
	ldr	r7, [sp, #0x14]
	add	r0, r1, #0
	mul	r0, r0, r7
	asr	r0, r0, #0x8
	ldr	r2, [sp, #0x4]
	add	r1, r2, r0
	ldr	r3, [r3, #0x4]
	sub	r7, r4, #1
	mov	r8, r7
	mov	r0, ip
	add	r0, r0, #0x2a
	str	r0, [sp, #0x20]
	cmp	r6, r3
	beq	.L36	@cond_branch
	ldr	r2, .L40
.L37:
	add	r0, r2, #0
	ldrh	r7, [r6, #0x1e]
	and	r0, r0, r7
	lsl	r0, r0, #0x8
	ldr	r7, [sp, #0x14]
	mul	r0, r0, r7
	asr	r0, r0, #0x8
	add	r0, r1, r0
	str	r0, [r6, #0x8]
	ldr	r0, [sp, #0x8]
	str	r0, [r6, #0xc]
	ldr	r6, [r6, #0x4]
	cmp	r6, r3
	bne	.L37	@cond_branch
.L36:
	cmp	r3, #0
	beq	.L38	@cond_branch
	ldr	r1, .L40
	ldrh	r3, [r3, #0x1e]
	and	r3, r3, r1
	mov	r9, r3
	b	.L39
.L41:
	.align	2, 0
.L40:
	.4byte	0x7fff
.L38:
	mov	r2, #0x0
	mov	r9, r2
.L39:
	mov	r3, #0x0
	str	r3, [sp, #0x10]
	ldr	r7, [sp, #0x20]
	mov	r0, #0x0
	ldsb	r0, [r7, r0]
	lsl	r0, r0, #0x8
	ldr	r1, [sp, #0x8]
	add	r1, r1, r0
	str	r1, [sp, #0x8]
	ldr	r2, [sp, #0x18]
	add	r2, r2, r0
	str	r2, [sp, #0x18]
	mov	r3, ip
	ldrb	r0, [r3, #0xf]
	add	r0, r0, #0x1
	strb	r0, [r3, #0xf]
	ldrh	r0, [r3, #0x8]
	mov	r7, sp
	strh	r0, [r7, #0x20]
.L18:
	ldr	r5, [r5, #0x4]
	add	r0, r4, #0
	mov	r4, r8
	cmp	r0, #0
	beq	.L42	@cond_branch
	b	.L43
.L42:
	mov	r1, ip
	ldr	r4, [r1, #0x1c]
	ldr	r5, [sp, #0x1c]
	mov	r0, #0x30
	mov	r2, sp
	ldrh	r2, [r2, #0x20]
	and	r0, r0, r2
	cmp	r0, #0x10
	beq	.L44	@cond_branch
	cmp	r0, #0x10
	bgt	.L46	@cond_branch
	cmp	r0, #0
	bne	.L46	@cond_branch
	b	.L48
.L44:
	ldr	r3, [sp, #0x18]
	asr	r3, r3, #0x1
	str	r3, [sp, #0x18]
.L46:
	ldr	r7, [sp, #0x18]
	cmp	r7, #0
	beq	.L48	@cond_branch
	b	.L49
.L50:
	ldr	r0, [r5, #0xc]
	ldr	r1, [sp, #0x18]
	sub	r0, r0, r1
	str	r0, [r5, #0xc]
	ldr	r5, [r5, #0x4]
.L49:
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	bne	.L50	@cond_branch
.L48:
	add	sp, sp, #0x2c
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_806123C

.align 2, 0 @ Don't pad with nop.
