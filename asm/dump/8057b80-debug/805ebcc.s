	.include "asm/common.inc"

	thumb_func_start sub_805EBCC
sub_805EBCC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff4
	add	r7, r0, #0
	bl	nullsub_12
	add	r6, r0, #0
	mov	r1, #0x89
	lsl	r1, r1, #0x2
	add	r0, r7, r1
	ldr	r4, [r0]
	add	r0, r4, #0
	mov	r1, sp
	bl	sub_8058754
	ldrb	r3, [r4, #0x10]
	lsr	r1, r3, #0x1
	mov	r0, #0xa0
	sub	r0, r0, r1
	lsl	r0, r0, #0x8
	ldr	r3, [r6, #0x40]
	add	r0, r3, r0
	ldr	r2, [sp]
	sub	r2, r2, r0
	asr	r2, r2, #0x2
	str	r2, [r6, #0x14]
	add	r0, r4, #0
	add	r0, r0, #0xa2
	mov	r5, #0x0
	ldsh	r0, [r0, r5]
	add	r0, r0, #0x50
	ldrb	r4, [r4, #0x11]
	lsr	r1, r4, #0x1
	sub	r0, r0, r1
	lsl	r0, r0, #0x8
	ldr	r1, [r6, #0x44]
	add	r1, r1, r0
	ldr	r0, [sp, #0x4]
	sub	r0, r0, r1
	asr	r0, r0, #0x2
	str	r0, [r6, #0x18]
	add	r2, r3, r2
	mov	r0, #0xd7
	lsl	r0, r0, #0x2
	add	r0, r0, r7
	mov	r8, r0
	ldrh	r1, [r0]
	cmp	r2, r1
	bge	.L1	@cond_branch
	NEG	r0, r3
	str	r0, [r6, #0x14]
.L1:
	ldr	r3, [r6, #0x44]
	ldr	r0, [r6, #0x18]
	add	r0, r3, r0
	add	r1, r3, #0
	cmp	r0, #0
	bge	.L2	@cond_branch
	NEG	r0, r1
	str	r0, [r6, #0x18]
.L2:
	ldr	r4, [r6, #0x40]
	ldr	r1, [r6, #0x14]
	add	r1, r4, r1
	ldr	r0, [r6]
	lsl	r2, r0, #0xb
	mov	r5, #0xd8
	lsl	r5, r5, #0x2
	add	r0, r7, r5
	ldrh	r0, [r0]
	lsl	r0, r0, #0x8
	sub	r0, r2, r0
	cmp	r1, r0
	ble	.L3	@cond_branch
	mov	r1, #0xf0
	lsl	r1, r1, #0x8
	add	r0, r4, r1
	sub	r0, r2, r0
	str	r0, [r6, #0x14]
.L3:
	ldr	r0, [r6, #0x18]
	add	r0, r3, r0
	ldr	r1, [r6, #0x4]
	lsl	r2, r1, #0xb
	ldr	r4, .L12
	add	r1, r2, r4
	cmp	r0, r1
	ble	.L4	@cond_branch
	mov	r5, #0xa0
	lsl	r5, r5, #0x8
	add	r0, r3, r5
	sub	r0, r2, r0
	str	r0, [r6, #0x18]
.L4:
	mov	r1, #0x0
	mov	r0, #0x88
	lsl	r0, r0, #0x2
	add	r0, r0, r7
	mov	r9, r0
.L11:
	mov	r3, r9
	ldr	r4, [r3]
	lsl	r1, r1, #0x10
	asr	r2, r1, #0x10
	lsl	r0, r2, #0x1
	add	r0, r0, r2
	lsl	r3, r0, #0x3
	add	r0, r4, #0
	add	r0, r0, #0x14
	add	r0, r0, r3
	ldr	r0, [r0]
	mov	ip, r1
	cmp	r0, #0
	beq	.L10	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x28
	add	r0, r0, r3
	ldrh	r3, [r0]
	lsl	r0, r2, #0x4
	add	r0, r0, r2
	lsl	r0, r0, #0x3
	add	r4, r7, r0
	cmp	r4, r6
	beq	.L10	@cond_branch
	lsl	r3, r3, #0x10
	asr	r3, r3, #0x10
	ldr	r2, [r6, #0x14]
	add	r0, r2, #0
	mul	r0, r0, r3
	asr	r0, r0, #0x5
	add	r2, r2, r0
	str	r2, [r4, #0x14]
	ldr	r1, [r6, #0x18]
	add	r0, r1, #0
	mul	r0, r0, r3
	asr	r0, r0, #0x5
	add	r1, r1, r0
	str	r1, [r4, #0x18]
	ldr	r3, [r4, #0x40]
	add	r2, r3, r2
	add	r0, r3, #0
	mov	r5, r8
	ldrh	r5, [r5]
	cmp	r2, r5
	bge	.L7	@cond_branch
	NEG	r0, r0
	str	r0, [r4, #0x14]
.L7:
	ldr	r5, [r4, #0x44]
	ldr	r0, [r4, #0x18]
	add	r0, r5, r0
	add	r1, r5, #0
	cmp	r0, #0
	bge	.L8	@cond_branch
	NEG	r0, r1
	str	r0, [r4, #0x18]
.L8:
	ldr	r1, [r4, #0x14]
	add	r1, r1, r3
	mov	sl, r1
	ldr	r0, [r4]
	lsl	r2, r0, #0xb
	mov	r1, #0xd8
	lsl	r1, r1, #0x2
	add	r0, r7, r1
	ldrh	r0, [r0]
	lsl	r0, r0, #0x8
	sub	r0, r2, r0
	cmp	sl, r0
	ble	.L9	@cond_branch
	mov	r1, #0xf0
	lsl	r1, r1, #0x8
	add	r0, r3, r1
	sub	r0, r2, r0
	str	r0, [r4, #0x14]
.L9:
	ldr	r0, [r4, #0x18]
	add	r0, r5, r0
	ldr	r1, [r4, #0x4]
	lsl	r2, r1, #0xb
	ldr	r3, .L12
	add	r1, r2, r3
	cmp	r0, r1
	ble	.L10	@cond_branch
	mov	r1, #0xa0
	lsl	r1, r1, #0x8
	add	r0, r5, r1
	sub	r0, r2, r0
	str	r0, [r4, #0x18]
.L10:
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	ADD r0, ip
	lsr	r1, r0, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0x3
	ble	.L11	@cond_branch
	add	sp, sp, #0xc
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L13:
	.align	2, 0
.L12:
	.4byte	0xffff6000
	thumb_func_end sub_805EBCC

.align 2, 0 @ Don't pad with nop.
