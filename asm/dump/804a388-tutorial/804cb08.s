	.include "asm/common.inc"

	thumb_func_start sub_804CB08
sub_804CB08:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff0
	add	r5, r0, #0
	ldr	r1, .L10
	add	r0, r5, r1
	ldrh	r4, [r0]
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	str	r2, [sp, #0x4]
	mov	r3, #0x82
	lsl	r3, r3, #0x2
	add	r0, r5, r3
	ldr	r1, [r0]
	ldr	r0, .L10 + 4
	cmp	r1, r0
	bgt	.L1	@cond_branch
	ldr	r6, .L10 + 8
	add	r6, r1, r6
	str	r6, [sp, #0x4]
	cmp	r6, #0
	bge	.L2	@cond_branch
	mov	r0, #0x0
	str	r0, [sp, #0x4]
.L2:
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	ldr	r1, [sp, #0x4]
	cmp	r1, r0
	ble	.L3	@cond_branch
	str	r0, [sp, #0x4]
.L3:
	ldr	r2, [sp, #0x4]
	add	r0, r4, #0
	mul	r0, r0, r2
	asr	r4, r0, #0x8
.L1:
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	add	r0, r5, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L4	@cond_branch
	b	.L62
.L4:
	mov	r1, #0x80
	lsl	r1, r1, #0x6
	add	r0, r5, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L6	@cond_branch
	b	.L62
.L6:
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	add	r0, r5, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8	@cond_branch
	ldr	r0, .L10 + 12
	ldrh	r0, [r0]
	mov	r8, r0
	ldr	r0, .L10 + 16
	b	.L9
.L11:
	.align	2, 0
.L10:
	.4byte	0x22a
	.4byte	0x1ff
	.4byte	0xffffff00
	.4byte	0x3005ca0
	.4byte	0x3005da0
.L8:
	add	r0, r5, #0
	bl	RiderAI_804C8F0
	mov	r3, #0xe2
	lsl	r3, r3, #0x1
	add	r0, r5, r3
	ldrh	r0, [r0]
	mov	r8, r0
	mov	r6, #0xe4
	lsl	r6, r6, #0x1
	add	r0, r5, r6
.L9:
	ldrh	r0, [r0]
	mov	r9, r0
	add	r0, r5, #0
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L12	@cond_branch
	b	.L13
.L12:
	mov	r0, #0x0
	mov	sl, r0
	mov	r1, #0x0
	str	r1, [sp, #0x8]
	mov	r2, #0x0
	str	r2, [sp, #0xc]
	mov	r6, #0x0
	mov	r7, #0x0
	mov	r0, #0x1
	mov	r3, r9
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L16	@cond_branch
	ldr	r1, .L20
	add	r0, r5, r1
	ldrh	r0, [r0]
	cmp	r0, #0
	bne	.L16	@cond_branch
	mov	r2, #0x82
	lsl	r2, r2, #0x2
	add	r0, r5, r2
	ldr	r1, [r0]
	ldr	r0, .L20 + 4
	cmp	r1, r0
	ble	.L16	@cond_branch
	mov	r3, #0x1
	mov	sl, r3
.L16:
	mov	r0, #0x20
	mov	r1, r8
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L19	@cond_branch
	mov	r2, sl
	cmp	r2, #0
	beq	.L18	@cond_branch
	ldr	r0, .L20 + 8
	add	r6, r6, r0
	str	r0, [sp, #0x8]
	ldr	r3, .L20
	add	r1, r5, r3
	mov	r0, #0x3c
	strh	r0, [r1]
	b	.L19
.L21:
	.align	2, 0
.L20:
	.4byte	0x22e
	.4byte	0x1ff
	.4byte	0xfffffe34
.L18:
	sub	r6, r6, r4
.L19:
	mov	r0, #0x10
	mov	r1, r8
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L24	@cond_branch
	mov	r2, sl
	cmp	r2, #0
	beq	.L23	@cond_branch
	mov	r0, #0xe6
	lsl	r0, r0, #0x1
	add	r6, r6, r0
	str	r0, [sp, #0x8]
	ldr	r3, .L25
	add	r1, r5, r3
	mov	r0, #0x3c
	strh	r0, [r1]
	b	.L24
.L26:
	.align	2, 0
.L25:
	.4byte	0x22e
.L23:
	add	r6, r6, r4
.L24:
	mov	r0, #0x40
	mov	r1, r8
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L29	@cond_branch
	mov	r2, sl
	cmp	r2, #0
	beq	.L28	@cond_branch
	mov	r0, #0xe6
	lsl	r0, r0, #0x1
	add	r7, r7, r0
	str	r0, [sp, #0xc]
	ldr	r3, .L30
	add	r1, r5, r3
	mov	r0, #0x3c
	strh	r0, [r1]
	b	.L29
.L31:
	.align	2, 0
.L30:
	.4byte	0x22e
.L28:
	add	r7, r7, r4
.L29:
	mov	r0, #0x80
	mov	r1, r8
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L34	@cond_branch
	mov	r2, sl
	cmp	r2, #0
	beq	.L33	@cond_branch
	ldr	r0, .L35
	add	r7, r7, r0
	str	r0, [sp, #0xc]
	ldr	r3, .L35 + 4
	add	r1, r5, r3
	mov	r0, #0x3c
	strh	r0, [r1]
	b	.L34
.L36:
	.align	2, 0
.L35:
	.4byte	0xfffffe34
	.4byte	0x22e
.L33:
	sub	r7, r7, r4
.L34:
	ldr	r0, .L40
	ldr	r0, [r0]
	ldr	r1, .L40 + 4
	add	r0, r0, r1
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L38	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	add	r0, r5, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L38	@cond_branch
	ldr	r0, .L40 + 8
	add	r1, r0, #0
	add	r1, r1, #0xc0
	mov	r2, #0x0
	ldsh	r4, [r1, r2]
	add	r0, r0, #0x40
	mov	r1, #0x0
	ldsh	r3, [r0, r1]
	add	r1, r6, #0
	mul	r1, r1, r4
	add	r0, r7, #0
	mul	r0, r0, r3
	sub	r1, r1, r0
	asr	r1, r1, #0x8
	ldr	r0, [r5, #0x40]
	add	r0, r0, r1
	str	r0, [r5, #0x40]
	add	r1, r6, #0
	mul	r1, r1, r3
	add	r0, r7, #0
	mul	r0, r0, r4
	add	r1, r1, r0
	asr	r1, r1, #0x8
	ldr	r0, [r5, #0x44]
	add	r0, r0, r1
	str	r0, [r5, #0x44]
	ldr	r6, [sp, #0x8]
	add	r2, r6, #0
	mul	r2, r2, r4
	ldr	r1, [sp, #0xc]
	add	r0, r1, #0
	mul	r0, r0, r3
	sub	r2, r2, r0
	add	r0, r6, #0
	mul	r0, r0, r3
	add	r3, r1, #0
	add	r1, r3, #0
	mul	r1, r1, r4
	add	r0, r0, r1
	asr	r2, r2, #0x8
	str	r2, [sp, #0x8]
	asr	r0, r0, #0x8
	str	r0, [sp, #0xc]
	b	.L39
.L41:
	.align	2, 0
.L40:
	.4byte	0x3000f48
	.4byte	0xc68
	.4byte	0x874cc3c
.L38:
	ldr	r0, [r5, #0x40]
	add	r0, r0, r6
	str	r0, [r5, #0x40]
	ldr	r0, [r5, #0x44]
	add	r0, r0, r7
	str	r0, [r5, #0x44]
.L39:
	mov	r6, sl
	cmp	r6, #0
	beq	.L43	@cond_branch
	ldr	r1, .L52
	add	r0, r5, r1
	ldrh	r0, [r0]
	cmp	r0, #0
	beq	.L43	@cond_branch
	ldr	r3, [sp, #0x8]
	lsl	r2, r3, #0x2
	ldr	r6, [sp, #0xc]
	NEG	r3, r6
	lsl	r3, r3, #0x2
	mov	r0, #0x0
	str	r0, [sp]
	mov	r1, #0x0
	bl	sub_805582C
	ldr	r0, .L52 + 4
	ldr	r0, [r0]
	ldr	r1, .L52 + 8
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r1, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L44	@cond_branch
	mov	r2, #0x82
	lsl	r2, r2, #0x2
	add	r1, r5, r2
	ldr	r0, [r1]
	sub	r0, r0, #0xf0
	str	r0, [r1]
.L44:
	mov	r0, #0x13
	bl	sub_804ABFC
.L43:
	mov	r0, #0x2
	mov	r3, r9
	and	r3, r3, r0
	cmp	r3, #0
	beq	.L46	@cond_branch
	mov	r6, #0x8c
	lsl	r6, r6, #0x2
	add	r1, r5, r6
	ldrh	r0, [r1]
	cmp	r0, #0
	bne	.L46	@cond_branch
	mov	r0, #0x10
	strh	r0, [r1]
.L46:
	mov	r0, #0x2
	mov	r1, r8
	and	r1, r1, r0
	cmp	r1, #0
	bne	.L47	@cond_branch
	mov	r2, #0x8c
	lsl	r2, r2, #0x2
	add	r0, r5, r2
	ldrh	r0, [r0]
	cmp	r0, #0
	beq	.L49	@cond_branch
.L47:
	mov	r3, #0x82
	lsl	r3, r3, #0x2
	add	r0, r5, r3
	ldr	r1, [r0]
	ldr	r0, .L52 + 12
	cmp	r1, r0
	ble	.L49	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0xc
	add	r0, r5, #0
	bl	SetRiderFlag
	mov	r6, #0x8c
	lsl	r6, r6, #0x2
	add	r1, r5, r6
	ldrh	r0, [r1]
	cmp	r0, #0
	beq	.L50	@cond_branch
	sub	r0, r0, #0x1
	strh	r0, [r1]
.L50:
	add	r0, r5, #0
	add	r0, r0, #0x52
	mov	r1, #0x16
	strh	r1, [r0]
	add	r2, r5, #0
	add	r2, r2, #0x50
	strh	r1, [r2]
	add	r7, r0, #0
	add	r6, r2, #0
	b	.L51
.L53:
	.align	2, 0
.L52:
	.4byte	0x22e
	.4byte	0x3000f48
	.4byte	0xc64
	.4byte	0x1ff
.L49:
	mov	r1, #0x80
	lsl	r1, r1, #0xc
	add	r0, r5, #0
	bl	UnsetRiderFlag
	add	r2, r5, #0
	add	r2, r2, #0x52
	mov	r0, #0x5
	strh	r0, [r2]
	add	r1, r5, #0
	add	r1, r1, #0x50
	strh	r0, [r1]
	add	r7, r2, #0
	add	r6, r1, #0
.L51:
	mov	r4, #0x80
	lsl	r4, r4, #0xc
	add	r0, r5, #0
	add	r1, r4, #0
	bl	sub_804E440
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L56	@cond_branch
	add	r0, r5, #0
	add	r1, r4, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L55	@cond_branch
	mov	r0, #0x7
	mov	r1, #0x0
	mov	r2, #0x0
	bl	sub_8055734
	b	.L56
.L55:
	bl	sub_805589C
.L56:
	bl	sub_804A504
	cmp	r0, #0
	beq	.L57	@cond_branch
	mov	r0, #0x24
	strh	r0, [r7]
	strh	r0, [r6]
.L57:
	mov	r1, #0x82
	lsl	r1, r1, #0x2
	add	r0, r5, r1
	ldr	r1, [r0]
	asr	r0, r1, #0x2
	mov	r2, #0xaa
	lsl	r2, r2, #0x1
	add	r4, r0, r2
	ldr	r0, .L60
	cmp	r1, r0
	bgt	.L62	@cond_branch
	ldr	r3, .L60 + 4
	mov	r6, #0xfe
	lsl	r6, r6, #0x1
	add	r2, r5, r6
	ldr	r0, [r2]
	mul	r0, r0, r4
	asr	r0, r0, #0x8
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x17
	add	r0, r0, r3
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	add	r0, r0, #0x1f
	asr	r0, r0, #0x6
	ldr	r6, [sp, #0x4]
	add	r1, r0, #0
	mul	r1, r1, r6
	asr	r1, r1, #0x8
	ldr	r0, [r5, #0x40]
	sub	r0, r0, r1
	str	r0, [r5, #0x40]
	ldr	r0, [r2]
	mul	r0, r0, r4
	asr	r0, r0, #0x8
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x17
	add	r0, r0, #0x80
	add	r0, r0, r3
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	add	r0, r0, #0x1f
	asr	r0, r0, #0x6
	add	r1, r0, #0
	mul	r1, r1, r6
	asr	r1, r1, #0x8
	ldr	r0, [r5, #0x44]
	add	r0, r0, r1
	str	r0, [r5, #0x44]
	b	.L62
.L61:
	.align	2, 0
.L60:
	.4byte	0x8ff
	.4byte	0x874cc3c
.L13:
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	add	r0, r5, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L62	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0x52
	mov	r1, #0x5
	strh	r1, [r0]
	sub	r0, r0, #0x2
	strh	r1, [r0]
.L62:
	add	sp, sp, #0x10
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804CB08

.align 2, 0 @ Don't pad with nop.
