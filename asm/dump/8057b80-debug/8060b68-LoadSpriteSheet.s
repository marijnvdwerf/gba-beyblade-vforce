	.include "asm/common.inc"

	thumb_func_start LoadSpriteSheet
LoadSpriteSheet:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	r7, r0, #0
	mov	ip, r1
	ldr	r6, [sp, #0x20]
	ldr	r0, [sp, #0x24]
	mov	r9, r0
	ldr	r4, [sp, #0x28]
	ldr	r0, [sp, #0x2c]
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	sl, r0
	ldrb	r1, [r1, #0x7]
	mov	r0, ip
	ldrb	r5, [r0, #0xc]
	str	r0, [r7, #0x2c]
	strh	r4, [r7, #0x1c]
	str	r2, [r7, #0x8]
	str	r3, [r7, #0xc]
	lsl	r1, r1, #0x18
	asr	r1, r1, #0x18
	mov	r8, r1
	mov	r3, #0x3
	and	r1, r1, r3
	lsl	r1, r1, #0xe
	MVN	r0, r5
	mov	r2, #0x1
	and	r0, r0, r2
	lsl	r0, r0, #0xd
	orr	r1, r1, r0
	and	r6, r6, r3
	lsl	r6, r6, #0xa
	mov	r0, #0x80
	lsl	r0, r0, #0x5
	orr	r6, r6, r0
	orr	r1, r1, r6
	mov	r0, #0xc
	mov	r2, r8
	and	r0, r0, r2
	lsl	r0, r0, #0x1c
	orr	r1, r1, r0
	and	r4, r4, r3
	lsl	r4, r4, #0x1c
	orr	r1, r1, r4
	str	r1, [r7, #0x10]
	lsr	r5, r5, #0x1
	mov	r0, #0xf
	and	r5, r5, r0
	lsl	r5, r5, #0xc
	mov	r0, r9
	and	r0, r0, r3
	lsl	r0, r0, #0xa
	orr	r5, r5, r0
	strh	r5, [r7, #0x14]
	mov	r1, ip
	ldr	r0, [r1, #0x1c]
	cmp	r0, #0
	bne	.L1	@cond_branch
	mov	r2, ip
	ldr	r0, [r2, #0x10]
.L1:
	ADD r0, ip
	str	r0, [r7, #0x28]
	mov	r1, ip
	ldrb	r0, [r1, #0x6]
	mov	r1, #0x0
	strh	r0, [r7, #0x16]
	mov	r2, sl
	strh	r2, [r7, #0x18]
	ldr	r0, .L2
	strh	r0, [r7, #0x1a]
	strh	r1, [r7, #0x1c]
	strh	r1, [r7, #0x20]
	mov	r0, #0x1
	NEG	r0, r0
	str	r0, [r7, #0x24]
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0xffff
	thumb_func_end LoadSpriteSheet

.align 2, 0 @ Don't pad with nop.
