	.include "asm/common.inc"

	thumb_func_start sub_8059B00
sub_8059B00:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff8
	lsl	r0, r0, #0x18
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	lsr	r4, r0, #0x18
	str	r4, [sp, #0x4]
	mov	r4, #0xfe
	lsl	r4, r4, #0x18
	add	r0, r0, r4
	lsr	r0, r0, #0x18
	cmp	r0, #0x2
	bhi	.L1	@cond_branch
	ldr	r7, .L2
	lsl	r5, r0, #0x1
	add	r5, r5, r0
	lsl	r5, r5, #0x3
	add	r4, r5, r7
	strh	r2, [r4, #0x2]
	strh	r3, [r4, #0x4]
	strb	r1, [r4]
	add	r0, r1, #0
	add	r0, r0, #0x40
	lsl	r0, r0, #0x1
	ldr	r1, .L2 + 4
	add	r0, r0, r1
	mov	r2, #0x0
	ldsh	r0, [r0, r2]
	ldr	r3, .L2 + 8
	mov	r9, r3
	ldrh	r2, [r4, #0x2]
	lsl	r1, r2, #0x1
	ADD r1, r9
	mov	r3, #0x0
	ldsh	r1, [r1, r3]
	bl	sub_8059FA0
	add	r1, r7, #0
	add	r1, r1, #0x8
	add	r1, r1, r5
	mov	sl, r1
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	str	r0, [r1]
	ldrb	r1, [r4]
	lsl	r0, r1, #0x1
	ldr	r2, .L2 + 4
	add	r0, r0, r2
	mov	r3, #0x0
	ldsh	r0, [r0, r3]
	ldrh	r2, [r4, #0x2]
	lsl	r1, r2, #0x1
	ADD r1, r9
	mov	r3, #0x0
	ldsh	r1, [r1, r3]
	bl	sub_8059FA0
	mov	r1, #0xc
	add	r1, r1, r7
	mov	r8, r1
	ADD r8, r5
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	mov	r2, r8
	str	r0, [r2]
	ldrb	r3, [r4]
	lsl	r0, r3, #0x1
	ldr	r1, .L2 + 4
	add	r0, r0, r1
	ldrh	r0, [r0]
	NEG	r0, r0
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	ldrh	r2, [r4, #0x4]
	lsl	r1, r2, #0x1
	ADD r1, r9
	mov	r3, #0x0
	ldsh	r1, [r1, r3]
	bl	sub_8059FA0
	add	r6, r7, #0
	add	r6, r6, #0x10
	add	r6, r5, r6
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	str	r0, [r6]
	ldrb	r0, [r4]
	add	r0, r0, #0x40
	lsl	r0, r0, #0x1
	ldr	r1, .L2 + 4
	add	r0, r0, r1
	mov	r2, #0x0
	ldsh	r0, [r0, r2]
	ldrh	r4, [r4, #0x4]
	lsl	r1, r4, #0x1
	ADD r1, r9
	mov	r3, #0x0
	ldsh	r1, [r1, r3]
	bl	sub_8059FA0
	add	r1, r7, #0
	add	r1, r1, #0x14
	add	r5, r5, r1
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	str	r0, [r5]
	mov	r4, sl
	mov	r2, #0x0
	ldsh	r1, [r4, r2]
	mov	r3, r8
	mov	r4, #0x0
	ldsh	r2, [r3, r4]
	mov	r4, #0x0
	ldsh	r3, [r6, r4]
	str	r0, [sp]
	ldr	r0, [sp, #0x4]
	bl	SetLayerTransform
.L1:
	add	sp, sp, #0x8
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
	.4byte	0x3000d00
	.4byte	0x874cc3c
	.4byte	0x872cc3c
	thumb_func_end sub_8059B00

.align 2, 0 @ Don't pad with nop.
