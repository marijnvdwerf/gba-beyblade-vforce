	.include "asm/common.inc"

	thumb_func_start sub_80659F0
sub_80659F0:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xffffff78
	add	r5, r1, #0
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	ldr	r0, .L3
	ldr	r0, [r0]
	ldrh	r0, [r0, #0x4]
	cmp	r3, r0
	bcc	.L1	@cond_branch
	ldr	r0, .L3 + 4
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3005e9c
	.4byte	0x80ff
.L1:
	ldr	r0, .L9
	add	r6, r0, #0
	ldr	r0, [r0]
	ldrb	r1, [r0, #0x8]
	lsl	r0, r1, #0x1
	mov	r4, sp
	add	r2, r0, r4
	add	r2, r2, #0x2
	mov	r4, #0x0
	cmp	r4, r1
	bcs	.L5	@cond_branch
.L6:
	strh	r3, [r2]
	sub	r2, r2, #0x2
	lsr	r3, r3, #0x1
	add	r0, r4, #1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	ldr	r0, [r6]
	ldrb	r0, [r0, #0x8]
	cmp	r4, r0
	bcc	.L6	@cond_branch
.L5:
	mov	r0, #0x1
	strh	r0, [r2]
	sub	r2, r2, #0x2
	strh	r0, [r2]
	mov	r4, #0xd0
	lsl	r4, r4, #0x14
	ldr	r0, .L9
	ldr	r0, [r0]
	ldrb	r2, [r0, #0x8]
	add	r2, r2, #0x3
	mov	r0, sp
	add	r1, r4, #0
	bl	DMA3Copy
	add	r0, r4, #0
	mov	r1, sp
	mov	r2, #0x44
	bl	DMA3Copy
	add	r2, sp, #0x8
	add	r5, r5, #0x6
	mov	r4, #0x0
	mov	r6, #0x1
.L8:
	mov	r1, #0x0
	mov	r3, #0x0
.L7:
	lsl	r1, r1, #0x11
	ldrh	r0, [r2]
	and	r0, r0, r6
	lsr	r1, r1, #0x10
	orr	r1, r1, r0
	add	r2, r2, #0x2
	add	r0, r3, #1
	lsl	r0, r0, #0x18
	lsr	r3, r0, #0x18
	cmp	r3, #0xf
	bls	.L7	@cond_branch
	strh	r1, [r5]
	sub	r5, r5, #0x2
	add	r0, r4, #1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0x3
	bls	.L8	@cond_branch
	mov	r0, #0x0
.L2:
	add	sp, sp, #0x88
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L10:
	.align	2, 0
.L9:
	.4byte	0x3005e9c
	thumb_func_end sub_80659F0

.align 2, 0 @ Don't pad with nop.
