	.include "asm/common.inc"

	thumb_func_start sub_8060E8C
sub_8060E8C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r5, r0, #0
	lsl	r1, r1, #0x10
	lsr	r7, r1, #0x10
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	mov	r8, r2
	lsl	r3, r3, #0x18
	lsr	r6, r3, #0x18
	mov	r1, #0x0
	cmp	r6, #0
	bne	.L8060EB6	@cond_branch
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	cmp	r7, r0
	bne	.L8060EB6	@cond_branch
	cmp	r8, r7
	bne	.L8060EB6	@cond_branch
	mov	r1, #0x1
.L8060EB6:
	cmp	r5, #0
	beq	.L8060ECE	@cond_branch
	ldrb	r0, [r5, #0x19]
	cmp	r0, #0
	bne	.L8060F56	@cond_branch
	cmp	r1, #0
	beq	.L8060EDC	@cond_branch
	add	r0, r5, #0
	bl	sub_8060B38
.L8060ECA:
	mov	r0, #0x0
	b	.L8060F56
.L8060ECE:
	cmp	r1, #0
	bne	.L8060ECA	@cond_branch
	bl	sub_8060B0C
	add	r5, r0, #0
	cmp	r5, #0
	beq	.L8060ECA	@cond_branch
.L8060EDC:
	strh	r7, [r5, #0x14]
	mov	r0, r8
	strh	r0, [r5, #0x16]
	strb	r6, [r5, #0x18]
	cmp	r6, #0
	beq	.L8060F3C	@cond_branch
	ldr	r1, .L8060F34
	add	r0, r6, #0
	add	r0, r0, #0x40
	lsl	r0, r0, #0x1
	add	r0, r0, r1
	mov	r2, #0x0
	ldsh	r4, [r0, r2]
	ldr	r3, .L8060F34 + 4
	lsl	r0, r7, #0x1
	add	r0, r0, r3
	mov	r7, #0x0
	ldsh	r2, [r0, r7]
	add	r0, r4, #0
	mul	r0, r0, r2
	asr	r0, r0, #0x8
	strh	r0, [r5, #0xc]
	lsl	r0, r6, #0x1
	add	r0, r0, r1
	mov	r6, #0x0
	ldsh	r1, [r0, r6]
	add	r0, r1, #0
	mul	r0, r0, r2
	asr	r0, r0, #0x8
	strh	r0, [r5, #0xe]
	NEG	r1, r1
	mov	r7, r8
	lsl	r0, r7, #0x1
	add	r0, r0, r3
	mov	r3, #0x0
	ldsh	r2, [r0, r3]
	add	r0, r1, #0
	mul	r0, r0, r2
	asr	r0, r0, #0x8
	strh	r0, [r5, #0x10]
	add	r0, r4, #0
	mul	r0, r0, r2
	asr	r0, r0, #0x8
	b	.L8060F52
.L8060F34:
	.align	2, 0

	.4byte	Unk_874CC3C
	.4byte	Unk_872CC3C
.L8060F3C:
	ldr	r1, .L8060F60
	lsl	r0, r7, #0x1
	add	r0, r0, r1
	ldrh	r0, [r0]
	strh	r0, [r5, #0xc]
	strh	r6, [r5, #0xe]
	strh	r6, [r5, #0x10]
	mov	r6, r8
	lsl	r0, r6, #0x1
	add	r0, r0, r1
	ldrh	r0, [r0]
.L8060F52:
	strh	r0, [r5, #0x12]
	add	r0, r5, #0
.L8060F56:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L8060F60:
	.align	2, 0

	.4byte	Unk_872CC3C
	thumb_func_end sub_8060E8C

.align 2, 0 @ Don't pad with nop.
