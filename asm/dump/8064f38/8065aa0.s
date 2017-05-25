	.include "asm/common.inc"

	thumb_func_start sub_8065AA0
sub_8065AA0:
	push	{r4, r5, lr}
	add	sp, sp, #0xffffff5c
	add	r5, r1, #0
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	ldr	r0, .L3
	ldr	r0, [r0]
	ldrh	r0, [r0, #0x4]
	cmp	r4, r0
	bcc	.L1	@cond_branch
	ldr	r0, .L3 + 4
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3005e9c
	.4byte	0x80ff
.L1:
	ldr	r0, .L8
	ldr	r0, [r0]
	ldrb	r0, [r0, #0x8]
	lsl	r0, r0, #0x1
	mov	r1, sp
	add	r3, r0, r1
	add	r3, r3, #0x84
	mov	r0, #0x0
	strh	r0, [r3]
	sub	r3, r3, #0x2
	mov	r1, #0x0
.L6:
	ldrh	r2, [r5]
	add	r5, r5, #0x2
	mov	r0, #0x0
.L5:
	strh	r2, [r3]
	sub	r3, r3, #0x2
	lsr	r2, r2, #0x1
	add	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0xf
	bls	.L5	@cond_branch
	add	r0, r1, #1
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	cmp	r1, #0x3
	bls	.L6	@cond_branch
	mov	r1, #0x0
	ldr	r0, .L8
	add	r2, r0, #0
	ldr	r0, [r0]
	b	.L7
.L9:
	.align	2, 0
.L8:
	.4byte	0x3005e9c
.L10:
	strh	r4, [r3]
	sub	r3, r3, #0x2
	lsr	r4, r4, #0x1
	add	r0, r1, #1
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	ldr	r0, [r2]
.L7:
	ldrb	r0, [r0, #0x8]
	cmp	r1, r0
	bcc	.L10	@cond_branch
	mov	r0, #0x0
	strh	r0, [r3]
	sub	r3, r3, #0x2
	mov	r0, #0x1
	strh	r0, [r3]
	mov	r1, #0xd0
	lsl	r1, r1, #0x14
	ldr	r0, .L14
	ldr	r0, [r0]
	ldrb	r2, [r0, #0x8]
	add	r2, r2, #0x43
	mov	r0, sp
	bl	DMA3Copy
	ldr	r0, .L14 + 4
	bl	sub_80658A4
	mov	r4, #0x0
	mov	r1, #0xd0
	lsl	r1, r1, #0x14
	mov	r3, #0x1
	ldr	r2, .L14 + 8
.L12:
	ldrh	r0, [r1]
	and	r0, r0, r3
	cmp	r0, #0
	bne	.L13	@cond_branch
	ldrb	r0, [r2]
	cmp	r0, #0
	beq	.L12	@cond_branch
	ldrh	r0, [r1]
	mov	r1, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L13	@cond_branch
	ldr	r4, .L14 + 12
.L13:
	bl	sub_806592C
	add	r0, r4, #0
.L2:
	add	sp, sp, #0xa4
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.L15:
	.align	2, 0
.L14:
	.4byte	0x3005e9c
	.4byte	0x8756894
	.4byte	0x3000dac
	.4byte	0xc001
	thumb_func_end sub_8065AA0

.align 2, 0 @ Don't pad with nop.
