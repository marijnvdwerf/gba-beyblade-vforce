	.include "asm/common.inc"

	thumb_func_start RiderAI_804C8F0
RiderAI_804C8F0:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xffffffe8
	add	r7, r0, #0
	mov	r1, #0xe2
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	ldrh	r0, [r0]
	mov	r8, r0
	mov	r6, #0x0
	mov	r1, #0x80
	lsl	r1, r1, #0x12
	add	r0, r7, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldr	r2, .L4
	add	r0, r7, r2
	ldrb	r0, [r0]
	add	r0, r0, #0x10
	mov	r1, #0xff
	and	r0, r0, r1
	lsr	r0, r0, #0x5
	cmp	r0, #0x7
	bls	.L2	@cond_branch
	b	.L47
.L2:
	lsl	r0, r0, #0x2
	ldr	r1, .L4 + 4
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L5:
	.align	2, 0
.L4:
	.4byte	0x1c3
	.4byte	.L6
.L6:
	.4byte	.L7
	.4byte	.L8
	.4byte	.L9
	.4byte	.L10
	.4byte	.L11
	.4byte	.L12
	.4byte	.L13
	.4byte	.L14
.L7:
	mov	r6, #0x20
	b	.L47
.L8:
	mov	r6, #0x60
	b	.L47
.L9:
	mov	r6, #0x40
	b	.L47
.L10:
	mov	r6, #0x50
	b	.L47
.L11:
	mov	r6, #0x10
	b	.L47
.L12:
	mov	r6, #0x90
	b	.L47
.L13:
	mov	r6, #0x80
	b	.L47
.L14:
	mov	r6, #0xa0
	b	.L47
.L1:
	add	r0, r7, #0
	mov	r1, #0x1
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L23	@cond_branch
	add	r0, r7, #0
	mov	r1, #0x40
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L25	@cond_branch
.L23:
	mov	r3, #0x83
	lsl	r3, r3, #0x2
	add	r0, r7, r3
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L25	@cond_branch
	ldr	r2, [r0]
	ldr	r3, [r7]
	ldr	r0, [r2, #0x4]
	ldr	r1, [r3, #0x4]
	sub	r0, r0, r1
	asr	r0, r0, #0x2
	ldr	r1, [r7, #0x40]
	sub	r4, r0, r1
	ldr	r0, [r2, #0x8]
	ldr	r1, [r3, #0x8]
	sub	r0, r0, r1
	asr	r0, r0, #0x2
	ldr	r1, [r7, #0x44]
	sub	r5, r0, r1
	add	r0, r7, #0
	mov	r1, #0x40
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L26	@cond_branch
	NEG	r4, r4
	NEG	r5, r5
.L26:
	cmp	r4, #0
	ble	.L27	@cond_branch
	mov	r6, #0x10
	b	.L29
.L27:
	cmp	r4, #0
	bge	.L29	@cond_branch
	mov	r6, #0x20
.L29:
	cmp	r5, #0
	ble	.L30	@cond_branch
	mov	r0, #0x80
	orr	r6, r6, r0
	b	.L32
.L30:
	cmp	r5, #0
	bge	.L32	@cond_branch
	mov	r0, #0x40
	orr	r6, r6, r0
	lsl	r0, r6, #0x10
	lsr	r6, r0, #0x10
.L32:
	ldr	r0, .L35
	add	r1, r7, r0
	ldrh	r0, [r1]
	sub	r0, r0, #0x1
	strh	r0, [r1]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bne	.L47	@cond_branch
	add	r0, r7, #0
	mov	r1, #0x41
	bl	UnsetRiderFlag
	b	.L47
.L36:
	.align	2, 0
.L35:
	.4byte	0x21e
.L25:
	ldr	r0, .L40
	ldr	r0, [r0]
	ldr	r1, .L40 + 4
	add	r2, r0, r1
	mov	r3, #0x85
	lsl	r3, r3, #0x2
	add	r0, r7, r3
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L47	@cond_branch
	mov	r1, #0x86
	lsl	r1, r1, #0x2
	add	r0, r7, r1
	mov	r3, #0x0
	ldsh	r1, [r0, r3]
	mov	r3, #0x89
	lsl	r3, r3, #0x2
	add	r0, r7, r3
	ldr	r3, [r0]
	asr	r3, r3, #0x8
	add	r0, r2, #0
	mov	r2, sp
	bl	sub_805DFD4
	ldr	r0, [sp]
	lsl	r0, r0, #0x5
	ldr	r2, [r7]
	ldr	r1, [r2, #0x4]
	sub	r0, r0, r1
	asr	r3, r0, #0x2
	ldr	r0, [sp, #0x4]
	lsl	r0, r0, #0x5
	ldr	r1, [r2, #0x8]
	sub	r0, r0, r1
	asr	r1, r0, #0x2
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	cmp	r3, r0
	ble	.L38	@cond_branch
	mov	r0, #0x10
	b	.L39
.L41:
	.align	2, 0
.L40:
	.4byte	0x3000fb0
	.4byte	0x65c
.L38:
	ldr	r0, .L45
	cmp	r3, r0
	bge	.L42	@cond_branch
	mov	r0, #0x20
.L39:
	orr	r6, r6, r0
	lsl	r0, r6, #0x10
	lsr	r6, r0, #0x10
.L42:
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	cmp	r1, r0
	ble	.L43	@cond_branch
	mov	r0, #0x80
	b	.L44
.L46:
	.align	2, 0
.L45:
	.4byte	0xffffff00
.L43:
	ldr	r0, .L50
	cmp	r1, r0
	bge	.L47	@cond_branch
	mov	r0, #0x40
.L44:
	orr	r6, r6, r0
	lsl	r0, r6, #0x10
	lsr	r6, r0, #0x10
.L47:
	add	r0, r7, #0
	mov	r1, #0x40
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L49	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x12
	add	r0, r7, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L49	@cond_branch
	mov	r0, #0x88
	lsl	r0, r0, #0x2
	add	r1, r7, r0
	mov	r0, #0x0
	strh	r0, [r1]
	add	r0, r7, #0
	mov	r1, #0x40
	bl	UnsetRiderFlag
.L49:
	mov	r1, #0xe2
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	strh	r6, [r0]
	mov	r2, r8
	BIC	r6, r2
	mov	r3, #0xe4
	lsl	r3, r3, #0x1
	add	r1, r7, r3
	strh	r6, [r1]
	ldrh	r0, [r0]
	BIC	r2, r0
	mov	r1, #0xe3
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	strh	r2, [r0]
	mov	r1, #0x80
	lsl	r1, r1, #0x12
	add	r0, r7, #0
	bl	UnsetRiderFlag
	add	sp, sp, #0x18
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L51:
	.align	2, 0
.L50:
	.4byte	0xffffff00
	thumb_func_end RiderAI_804C8F0

.align 2, 0 @ Don't pad with nop.
