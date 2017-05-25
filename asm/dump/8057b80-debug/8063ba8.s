	.include "asm/common.inc"

	thumb_func_start sub_8063BA8
sub_8063BA8:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	mov	ip, r0
	mov	r0, #0x1
	mov	r8, r0
	mov	r1, ip
	add	r1, r1, #0xb4
	mov	r0, #0x0
	str	r0, [r1]
	mov	r2, ip
	strb	r0, [r2, #0x12]
	add	r2, r2, #0xbf
	strb	r0, [r2]
	mov	r5, ip
	add	r5, r5, #0x1c
	mov	r9, r0
	add	r4, r1, #0
	ldr	r6, .L9
.L32:
	mov	r7, ip
	ldr	r0, [r7]
	ldrb	r3, [r0]
	cmp	r3, #0x3b
	bgt	.L1	@cond_branch
	cmp	r3, #0x3a
	bge	.L26	@cond_branch
	cmp	r3, #0x20
	beq	.L24	@cond_branch
	cmp	r3, #0x20
	bgt	.L4	@cond_branch
	cmp	r3, #0xa
	bgt	.L5	@cond_branch
	cmp	r3, #0x9
	bge	.L24	@cond_branch
	cmp	r3, #0
	beq	.L24	@cond_branch
	b	.L29
.L10:
	.align	2, 0
.L9:
	.4byte	0x807d980
.L5:
	cmp	r3, #0xc
	beq	.L24	@cond_branch
	b	.L29
.L4:
	cmp	r3, #0x26
	beq	.L26	@cond_branch
	cmp	r3, #0x26
	bgt	.L14	@cond_branch
	cmp	r3, #0x21
	beq	.L26	@cond_branch
	b	.L29
.L14:
	cmp	r3, #0x2f
	bgt	.L29	@cond_branch
	cmp	r3, #0x2a
	blt	.L29	@cond_branch
	b	.L26
.L1:
	cmp	r3, #0x3f
	beq	.L26	@cond_branch
	cmp	r3, #0x3f
	bgt	.L21	@cond_branch
	cmp	r3, #0x3d
	beq	.L26	@cond_branch
	add	r0, r0, #0x1
	mov	r1, ip
	str	r0, [r1]
	b	.L23
.L21:
	cmp	r3, #0x7b
	beq	.L24	@cond_branch
	cmp	r3, #0x7b
	bgt	.L25	@cond_branch
	cmp	r3, #0x5c
	beq	.L26	@cond_branch
	b	.L29
.L25:
	cmp	r3, #0xff
	bgt	.L29	@cond_branch
	cmp	r3, #0xfe
	blt	.L29	@cond_branch
.L24:
	mov	r2, ip
	ldrb	r2, [r2, #0x12]
	add	r0, r2, r5
	mov	r6, r9
	strb	r6, [r0]
	b	.L31
.L26:
	mov	r2, ip
	add	r2, r2, #0xc1
	add	r1, r3, r6
	mov	r7, ip
	ldr	r0, [r7, #0x8]
	ldrb	r1, [r1]
	add	r0, r1, r0
	ldrb	r2, [r2]
	ldrb	r0, [r0]
	sub	r1, r2, r0
	ldrb	r0, [r7, #0xd]
	add	r1, r0, r1
	lsl	r1, r1, #0x8
	ldr	r0, [r4]
	add	r0, r0, r1
	str	r0, [r4]
	ldrb	r0, [r7, #0x12]
	add	r1, r0, #1
	strb	r1, [r7, #0x12]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	add	r0, r5, r0
	strb	r3, [r0]
	ldrb	r1, [r7, #0x12]
	add	r0, r1, r5
	mov	r2, r9
	strb	r2, [r0]
	ldr	r0, [r7]
	add	r0, r0, #0x1
	str	r0, [r7]
	b	.L31
.L29:
	mov	r2, ip
	add	r2, r2, #0xc1
	add	r1, r3, r6
	mov	r7, ip
	ldr	r0, [r7, #0x8]
	ldrb	r1, [r1]
	add	r0, r1, r0
	ldrb	r2, [r2]
	ldrb	r0, [r0]
	sub	r1, r2, r0
	ldrb	r0, [r7, #0xd]
	add	r1, r0, r1
	lsl	r1, r1, #0x8
	ldr	r0, [r4]
	add	r0, r0, r1
	str	r0, [r4]
	ldrb	r0, [r7, #0x12]
	add	r1, r0, #1
	strb	r1, [r7, #0x12]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	add	r0, r5, r0
	strb	r3, [r0]
	ldr	r0, [r7]
	add	r0, r0, #0x1
	str	r0, [r7]
.L23:
	mov	r1, r8
	cmp	r1, #0
	bne	.L32	@cond_branch
.L31:
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8063BA8

.align 2, 0 @ Don't pad with nop.
