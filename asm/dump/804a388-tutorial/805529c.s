	.include "asm/common.inc"

	thumb_func_start sub_805529C
sub_805529C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	ldr	r4, .L4
	ldr	r0, [r4]
	ldr	r1, .L4 + 4
	add	r7, r0, r1
	mov	r1, #0x28
	ldsh	r0, [r7, r1]
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldr	r1, .L4 + 8
	ldr	r0, .L4 + 12
	ldr	r0, [r0]
	lsr	r0, r0, #0x4
	lsl	r0, r0, #0x1d
	lsr	r0, r0, #0x17
	add	r0, r0, r1
	ldrh	r0, [r0]
	lsl	r0, r0, #0x10
	asr	r6, r0, #0x17
	str	r6, [r7, #0x2c]
	NEG	r0, r6
	str	r0, [r7, #0x30]
	mov	sl, r4
	ldr	r0, .L4 + 16
	mov	r9, r0
	mov	r1, #0x2
	mov	r8, r1
.L2:
	mov	r0, sl
	ldr	r4, [r0]
	ADD r4, r9
	add	r5, r4, #0
	add	r5, r5, #0x5e
	ldrb	r0, [r5]
	bl	GetBGLayerHOffsetPtr
	ldr	r1, [r4, #0x40]
	asr	r1, r1, #0x8
	add	r1, r1, r6
	strh	r1, [r0]
	ldrb	r0, [r5]
	bl	GetBGLayerVOffsetPtr
	ldr	r1, [r4, #0x44]
	asr	r1, r1, #0x8
	sub	r1, r1, r6
	strh	r1, [r0]
	mov	r1, #0x88
	ADD r9, r1
	mov	r0, #0x1
	NEG	r0, r0
	ADD r8, r0
	mov	r1, r8
	cmp	r1, #0
	bge	.L2	@cond_branch
	ldrh	r0, [r7, #0x28]
	sub	r0, r0, #0x1
	strh	r0, [r7, #0x28]
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x3000fb0
	.4byte	0x1084
	.4byte	0x874cc3c
	.4byte	0x3000e30
	.4byte	0x434
.L1:
	str	r0, [r7, #0x2c]
	str	r0, [r7, #0x30]
.L3:
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805529C

.align 2, 0 @ Don't pad with nop.
