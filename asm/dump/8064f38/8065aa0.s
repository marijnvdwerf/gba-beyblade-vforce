	.include "asm/common.inc"

	thumb_func_start sub_8065AA0
sub_8065AA0:
	push	{r4, r5, lr}
	add	sp, sp, #0xffffff5c
	add	r5, r1, #0
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	ldr	r0, .L8065AB8
	ldr	r0, [r0]
	ldrh	r0, [r0, #0x4]
	cmp	r4, r0
	bcc	.L8065AC0	@cond_branch
	ldr	r0, .L8065AB8 + 4
	b	.L8065B64
.L8065AB8:
	.align	2, 0

	.4byte	0x3005e9c
	.4byte	0x80ff
.L8065AC0:
	ldr	r0, .L8065B00
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
.L8065AD6:
	ldrh	r2, [r5]
	add	r5, r5, #0x2
	mov	r0, #0x0
.L8065ADC:
	strh	r2, [r3]
	sub	r3, r3, #0x2
	lsr	r2, r2, #0x1
	add	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0xf
	bls	.L8065ADC	@cond_branch
	add	r0, r1, #1
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	cmp	r1, #0x3
	bls	.L8065AD6	@cond_branch
	mov	r1, #0x0
	ldr	r0, .L8065B00
	add	r2, r0, #0
	ldr	r0, [r0]
	b	.L8065B12
.L8065B00:
	.align	2, 0

	.4byte	0x3005e9c
.L8065B04:
	strh	r4, [r3]
	sub	r3, r3, #0x2
	lsr	r4, r4, #0x1
	add	r0, r1, #1
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	ldr	r0, [r2]
.L8065B12:
	ldrb	r0, [r0, #0x8]
	cmp	r1, r0
	bcc	.L8065B04	@cond_branch
	mov	r0, #0x0
	strh	r0, [r3]
	sub	r3, r3, #0x2
	mov	r0, #0x1
	strh	r0, [r3]
	mov	r1, #0xd0
	lsl	r1, r1, #0x14
	ldr	r0, .L8065B6C
	ldr	r0, [r0]
	ldrb	r2, [r0, #0x8]
	add	r2, r2, #0x43
	mov	r0, sp
	bl	DMA3Copy
	ldr	r0, .L8065B6C + 4
	bl	sub_80658A4
	mov	r4, #0x0
	mov	r1, #0xd0
	lsl	r1, r1, #0x14
	mov	r3, #0x1
	ldr	r2, .L8065B6C + 8
.L8065B44:
	ldrh	r0, [r1]
	and	r0, r0, r3
	cmp	r0, #0
	bne	.L8065B5E	@cond_branch
	ldrb	r0, [r2]
	cmp	r0, #0
	beq	.L8065B44	@cond_branch
	ldrh	r0, [r1]
	mov	r1, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8065B5E	@cond_branch
	ldr	r4, .L8065B6C + 12
.L8065B5E:
	bl	sub_806592C
	add	r0, r4, #0
.L8065B64:
	add	sp, sp, #0xa4
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.L8065B6C:
	.align	2, 0

	.4byte	0x3005e9c
	.4byte	0x8756894
	.4byte	0x3000dac
	.4byte	0xc001
	thumb_func_end sub_8065AA0

.align 2, 0 @ Don't pad with nop.
