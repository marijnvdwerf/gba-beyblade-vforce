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
	ldr	r6, .L8063BF4
.L8063BD0:
	mov	r7, ip
	ldr	r0, [r7]
	ldrb	r3, [r0]
	cmp	r3, #0x3b
	bgt	.L8063C16	@cond_branch
	cmp	r3, #0x3a
	bge	.L8063C4C	@cond_branch
	cmp	r3, #0x20
	beq	.L8063C40	@cond_branch
	cmp	r3, #0x20
	bgt	.L8063BFE	@cond_branch
	cmp	r3, #0xa
	bgt	.L8063BF8	@cond_branch
	cmp	r3, #0x9
	bge	.L8063C40	@cond_branch
	cmp	r3, #0
	beq	.L8063C40	@cond_branch
	b	.L8063C8A
.L8063BF4:
	.align	2, 0

	.4byte	byte_807D980
.L8063BF8:
	cmp	r3, #0xc
	beq	.L8063C40	@cond_branch
	b	.L8063C8A
.L8063BFE:
	cmp	r3, #0x26
	beq	.L8063C4C	@cond_branch
	cmp	r3, #0x26
	bgt	.L8063C0C	@cond_branch
	cmp	r3, #0x21
	beq	.L8063C4C	@cond_branch
	b	.L8063C8A
.L8063C0C:
	cmp	r3, #0x2f
	bgt	.L8063C8A	@cond_branch
	cmp	r3, #0x2a
	blt	.L8063C8A	@cond_branch
	b	.L8063C4C
.L8063C16:
	cmp	r3, #0x3f
	beq	.L8063C4C	@cond_branch
	cmp	r3, #0x3f
	bgt	.L8063C2A	@cond_branch
	cmp	r3, #0x3d
	beq	.L8063C4C	@cond_branch
	add	r0, r0, #0x1
	mov	r1, ip
	str	r0, [r1]
	b	.L8063CBE
.L8063C2A:
	cmp	r3, #0x7b
	beq	.L8063C40	@cond_branch
	cmp	r3, #0x7b
	bgt	.L8063C38	@cond_branch
	cmp	r3, #0x5c
	beq	.L8063C4C	@cond_branch
	b	.L8063C8A
.L8063C38:
	cmp	r3, #0xff
	bgt	.L8063C8A	@cond_branch
	cmp	r3, #0xfe
	blt	.L8063C8A	@cond_branch
.L8063C40:
	mov	r2, ip
	ldrb	r2, [r2, #0x12]
	add	r0, r2, r5
	mov	r6, r9
	strb	r6, [r0]
	b	.L8063CC4
.L8063C4C:
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
	b	.L8063CC4
.L8063C8A:
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
.L8063CBE:
	mov	r1, r8
	cmp	r1, #0
	bne	.L8063BD0	@cond_branch
.L8063CC4:
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8063BA8

.align 2, 0 @ Don't pad with nop.
