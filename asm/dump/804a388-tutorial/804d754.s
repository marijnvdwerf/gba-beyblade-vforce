	.include "asm/common.inc"

	thumb_func_start sub_804D754
sub_804D754:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r5, r0, #0
	ldr	r6, [r5]
	mov	r1, #0x81
	lsl	r1, r1, #0x2
	add	r0, r5, r1
	mov	r2, #0x0
	ldsh	r3, [r0, r2]
	add	r1, r1, #0x2
	add	r0, r5, r1
	mov	r1, #0x0
	ldsh	r2, [r0, r1]
	mov	r8, r2
	mov	r2, #0x0
	mov	r7, #0x1
	NEG	r7, r7
	ldr	r1, [r5, #0x48]
	cmp	r1, #0xc
	ble	.L1	@cond_branch
	mov	r2, #0x1
	b	.L3
.L1:
	mov	r0, #0xc
	NEG	r0, r0
	cmp	r1, r0
	bge	.L3	@cond_branch
	mov	r2, #0x2
.L3:
	ldr	r1, [r5, #0x4c]
	cmp	r1, #0xc
	ble	.L4	@cond_branch
	mov	r0, #0x4
	b	.L5
.L4:
	mov	r0, #0xc
	NEG	r0, r0
	cmp	r1, r0
	bge	.L6	@cond_branch
	mov	r0, #0x8
.L5:
	orr	r2, r2, r0
.L6:
	sub	r0, r2, #1
	cmp	r0, #0x9
	bhi	.L27	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, .L9
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L10:
	.align	2, 0
.L9:
	.4byte	.L8
.L8:
	.4byte	.L11
	.4byte	.L12
	.4byte	.L27
	.4byte	.L14
	.4byte	.L15
	.4byte	.L16
	.4byte	.L27
	.4byte	.L18
	.4byte	.L19
	.4byte	.L20
.L11:
	mov	r7, #0x2
	b	.L27
.L15:
	mov	r7, #0x1
	b	.L27
.L19:
	mov	r7, #0x3
	b	.L27
.L12:
	mov	r7, #0x6
	b	.L27
.L20:
	mov	r7, #0x5
	b	.L27
.L16:
	mov	r7, #0x7
	b	.L27
.L14:
	mov	r7, #0x0
	b	.L27
.L18:
	mov	r7, #0x4
.L27:
	mov	r4, #0x0
	mov	r2, #0x82
	lsl	r2, r2, #0x2
	add	r0, r5, r2
	ldr	r1, [r0]
	ldr	r0, .L39
	cmp	r1, r0
	bgt	.L28	@cond_branch
	mov	r4, #0x1
.L28:
	ldr	r0, .L39 + 4
	cmp	r1, r0
	bgt	.L29	@cond_branch
	mov	r4, #0x2
.L29:
	ldr	r0, .L39 + 8
	cmp	r1, r0
	bgt	.L30	@cond_branch
	mov	r4, #0x3
.L30:
	cmp	r1, #0xff
	bgt	.L31	@cond_branch
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	sub	r0, r0, r1
	asr	r0, r0, #0x1
	strh	r0, [r6, #0x36]
	mov	r4, #0x4
.L31:
	cmp	r4, r3
	beq	.L32	@cond_branch
	cmp	r4, #0x1
	bls	.L33	@cond_branch
	mov	r0, #0x80
	lsl	r0, r0, #0x3
	cmp	r4, r0
	bne	.L34	@cond_branch
.L33:
	mov	r0, #0x1
	NEG	r0, r0
.L34:
	add	r1, r6, #0
	add	r1, r1, #0x31
	mov	r0, #0x0
	strb	r0, [r1]
	add	r2, r4, #0
	add	r0, r6, #0
	add	r1, r2, #0
	bl	actor_80580C0
	mov	r1, #0x81
	lsl	r1, r1, #0x2
	add	r0, r5, r1
	strh	r4, [r0]
	ldr	r2, .L39 + 12
	add	r1, r5, r2
	ldr	r0, .L39 + 16
	strh	r0, [r1]
.L32:
	cmp	r4, #0x1
	bhi	.L38	@cond_branch
	cmp	r7, r8
	beq	.L38	@cond_branch
	cmp	r7, #0
	blt	.L37	@cond_branch
	add	r1, r6, #0
	add	r1, r1, #0x31
	mov	r0, #0x0
	strb	r0, [r1]
	lsl	r2, r7, #0x10
	lsr	r2, r2, #0x10
	add	r0, r6, #0
	mov	r1, #0x5
	mov	r3, #0x0
	bl	sub_8058390
	ldr	r1, .L39 + 12
	add	r0, r5, r1
	strh	r7, [r0]
	b	.L38
.L40:
	.align	2, 0
.L39:
	.4byte	0x8ff
	.4byte	0x3ff
	.4byte	0x1ff
	.4byte	0x206
	.4byte	0xffff
.L37:
	add	r1, r6, #0
	add	r1, r1, #0x31
	mov	r0, #0x0
	strb	r0, [r1]
	add	r0, r6, #0
	add	r1, r4, #0
	add	r2, r4, #0
	bl	actor_80580C0
	mov	r2, #0x81
	lsl	r2, r2, #0x2
	add	r0, r5, r2
	strh	r4, [r0]
	ldr	r0, .L41
	add	r1, r5, r0
	ldr	r0, .L41 + 4
	strh	r0, [r1]
.L38:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L42:
	.align	2, 0
.L41:
	.4byte	0x206
	.4byte	0xffff
	thumb_func_end sub_804D754

.align 2, 0 @ Don't pad with nop.
