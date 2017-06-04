	.include "asm/common.inc"

	thumb_func_start sub_80522D4
sub_80522D4:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffb8
	add	r6, r0, #0
	mov	sl, r1
	mov	r0, sl
	bl	nullsub_12
	mov	r9, r0
	ldr	r0, .L3
	mov	r8, r0
	ldr	r7, [r0]
	add	r4, sp, #0x30
	add	r5, sp, #0x3c
	add	r0, r5, #0
	mov	r1, #0x0
	mov	r2, #0xc
	bl	memset
	mov	r1, #0xd0
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	ldr	r0, [r0]
	str	r0, [sp, #0x3c]
	mov	r2, #0xd2
	lsl	r2, r2, #0x1
	add	r0, r7, r2
	ldr	r0, [r0]
	str	r0, [sp, #0x40]
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0xc
	bl	memcpy
	add	r0, r6, #0
	mov	r1, sp
	bl	sub_8058754
	add	r3, sp, #0xc
	ldr	r1, [sp, #0x30]
	ldr	r0, [r4, #0x4]
	sub	r0, r1, r0
	str	r0, [sp, #0xc]
	ldr	r0, [r4, #0x4]
	add	r1, r1, r0
	asr	r1, r1, #0x1
	str	r1, [r3, #0x4]
	add	r4, sp, #0x18
	ldr	r0, [sp, #0xc]
	lsl	r1, r0, #0x3
	add	r1, r1, r0
	lsl	r1, r1, #0x1
	mov	r0, #0xf0
	lsl	r0, r0, #0x7
	sub	r0, r0, r1
	str	r0, [sp, #0x18]
	add	r0, r6, #0
	add	r0, r0, #0xa2
	mov	r2, #0x0
	ldsh	r1, [r0, r2]
	add	r1, r1, #0x50
	ldrb	r6, [r6, #0x11]
	lsr	r0, r6, #0x1
	sub	r1, r1, r0
	lsl	r1, r1, #0x8
	ldr	r2, [r3, #0x4]
	lsl	r0, r2, #0x3
	add	r0, r0, r2
	lsl	r0, r0, #0x1
	sub	r1, r1, r0
	str	r1, [r4, #0x4]
	mov	r0, r9
	ldr	r1, [r0, #0x40]
	ldr	r0, [sp, #0x18]
	add	r1, r1, r0
	ldr	r0, [sp]
	sub	r0, r0, r1
	str	r0, [sp, #0xc]
	mov	r1, r8
	ldr	r0, [r1]
	ldr	r2, .L3 + 4
	add	r0, r0, r2
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r1, r9
	ldr	r0, [r1, #0x44]
	ldr	r1, [r4, #0x4]
	add	r0, r0, r1
	ldr	r2, .L3 + 8
	add	r0, r0, r2
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000fb0
	.4byte	0xb53
	.4byte	0xffff8000
.L1:
	mov	r1, r9
	ldr	r0, [r1, #0x44]
	ldr	r1, [r4, #0x4]
	add	r0, r0, r1
.L2:
	ldr	r1, [sp, #0x4]
	sub	r1, r1, r0
	str	r1, [r3, #0x4]
	ldr	r0, .L19
	ldr	r1, [r0]
	ldr	r2, .L19 + 4
	add	r4, r1, r2
	ldrb	r1, [r4]
	add	r5, r0, #0
	cmp	r1, #0
	beq	.L8	@cond_branch
	ldr	r0, [sp, #0xc]
	ldr	r2, .L19 + 8
	add	r0, r0, r2
	ldr	r1, .L19 + 12
	cmp	r0, r1
	bhi	.L8	@cond_branch
	ldr	r1, [r3, #0x4]
	cmp	r1, r2
	bgt	.L8	@cond_branch
	ldr	r0, .L19 + 16
	cmp	r1, r0
	ble	.L8	@cond_branch
	mov	r1, #0x0
	strb	r1, [r4]
	mov	r0, #0x89
	lsl	r0, r0, #0x2
	ADD r0, sl
	str	r1, [r0]
.L8:
	ldr	r0, [sp, #0xc]
	cmp	r0, #0
	bge	.L9	@cond_branch
	NEG	r0, r0
.L9:
	str	r0, [sp, #0x24]
	ldr	r0, [r3, #0x4]
	cmp	r0, #0
	bge	.L10	@cond_branch
	NEG	r0, r0
.L10:
	str	r0, [sp, #0x28]
	ldr	r0, [sp, #0xc]
	add	r4, r0, #0
	cmp	r0, #0
	bge	.L11	@cond_branch
	NEG	r0, r0
.L11:
	ldr	r1, [r3, #0x4]
	cmp	r1, #0
	bge	.L12	@cond_branch
	NEG	r1, r1
.L12:
	mov	r2, #0x90
	lsl	r2, r2, #0x7
	cmp	r0, r2
	ble	.L13	@cond_branch
	add	r0, r2, #0
.L13:
	cmp	r1, r2
	ble	.L14	@cond_branch
	add	r1, r2, #0
.L14:
	cmp	r4, #0
	bge	.L15	@cond_branch
	NEG	r0, r0
.L15:
	str	r0, [sp, #0xc]
	ldr	r0, [r3, #0x4]
	cmp	r0, #0
	bge	.L16	@cond_branch
	NEG	r1, r1
.L16:
	str	r1, [r3, #0x4]
	ldr	r1, [r5]
	mov	r2, #0xb5
	lsl	r2, r2, #0x4
	add	r0, r1, r2
	mov	r2, #0x1
	ldrb	r0, [r0]
	and	r2, r2, r0
	cmp	r2, #0
	beq	.L17	@cond_branch
	ldr	r0, .L19 + 20
	add	r1, r1, r0
	ldr	r0, [sp, #0xc]
	ldrb	r1, [r1]
	mul	r0, r0, r1
	asr	r0, r0, #0x9
	mov	r1, r9
	str	r0, [r1, #0x14]
	b	.L18
.L20:
	.align	2, 0
.L19:
	.4byte	0x3000fb0
	.4byte	0xb53
	.4byte	0x1ff
	.4byte	0x3fe
	.4byte	0xfffffe00
	.4byte	0xb51
.L17:
	mov	r0, r9
	str	r2, [r0, #0x14]
.L18:
	ldr	r2, [r5]
	mov	r0, #0xb5
	lsl	r0, r0, #0x4
	add	r1, r2, r0
	mov	r0, #0x2
	ldrb	r1, [r1]
	and	r0, r0, r1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0
	beq	.L21	@cond_branch
	ldr	r0, .L23
	add	r1, r2, r0
	ldr	r0, [r3, #0x4]
	ldrb	r1, [r1]
	mul	r0, r0, r1
	asr	r0, r0, #0x9
	mov	r1, r9
	str	r0, [r1, #0x18]
	b	.L22
.L24:
	.align	2, 0
.L23:
	.4byte	0xb52
.L21:
	mov	r2, r9
	str	r0, [r2, #0x18]
.L22:
	mov	r1, #0x0
	mov	r6, #0x88
	lsl	r6, r6, #0x2
	ADD r6, sl
.L27:
	ldr	r4, [r6]
	lsl	r1, r1, #0x10
	asr	r3, r1, #0x10
	lsl	r0, r3, #0x1
	add	r0, r0, r3
	lsl	r2, r0, #0x3
	add	r0, r4, #0
	add	r0, r0, #0x14
	add	r0, r0, r2
	ldr	r0, [r0]
	add	r5, r1, #0
	cmp	r0, #0
	beq	.L26	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x28
	add	r0, r0, r2
	ldrh	r2, [r0]
	lsl	r0, r3, #0x4
	add	r0, r0, r3
	lsl	r0, r0, #0x3
	mov	r1, sl
	add	r3, r1, r0
	cmp	r3, r9
	beq	.L26	@cond_branch
	lsl	r2, r2, #0x10
	asr	r2, r2, #0x10
	mov	r0, r9
	ldr	r1, [r0, #0x14]
	add	r0, r1, #0
	mul	r0, r0, r2
	asr	r0, r0, #0x5
	add	r1, r1, r0
	str	r1, [r3, #0x14]
	mov	r0, r9
	ldr	r1, [r0, #0x18]
	add	r0, r1, #0
	mul	r0, r0, r2
	asr	r0, r0, #0x5
	add	r1, r1, r0
	str	r1, [r3, #0x18]
.L26:
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	add	r0, r5, r1
	lsr	r1, r0, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0x3
	ble	.L27	@cond_branch
	add	sp, sp, #0x48
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80522D4

.align 2, 0 @ Don't pad with nop.
