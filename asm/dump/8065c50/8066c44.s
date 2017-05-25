	.include "asm/common.inc"

	thumb_func_start sub_8066C44
sub_8066C44:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff8
	add	r1, r0, #0
	ldr	r4, [r1, #0xc]
	ldr	r5, [r1, #0x10]
	ldr	r7, [r1, #0x4]
	mov	r6, #0x0
	mov	r2, #0x0
	ldr	r0, [r1]
	cmp	r0, #0x1
	bhi	.L1	@cond_branch
	mov	r2, #0x1
.L1:
	cmp	r2, #0
	beq	.L2	@cond_branch
	ldr	r6, .L4
	ldr	r2, .L4 + 4
	ldr	r3, .L4 + 8
	add	r0, r4, #0
	add	r1, r5, #0
	orr	r1, r1, r3
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x7ff
	.4byte	0x0
	.4byte	0x80000
.L2:
	mov	r2, #0x0
	cmp	r0, #0x4
	bne	.L6	@cond_branch
	mov	r2, #0x1
.L6:
	cmp	r2, #0
	bne	.L7	@cond_branch
	mov	r2, #0x0
	cmp	r0, #0x2
	bne	.L8	@cond_branch
	mov	r2, #0x1
.L8:
	cmp	r2, #0
	beq	.L9	@cond_branch
	mov	r4, #0x0
	mov	r5, #0x0
	b	.L19
.L9:
	add	r0, r5, #0
	orr	r0, r0, r4
	cmp	r0, #0
	beq	.L19	@cond_branch
	ldr	r2, [r1, #0x8]
	ldr	r0, .L15
	cmp	r2, r0
	bge	.L12	@cond_branch
	sub	r2, r0, r2
	cmp	r2, #0x38
	ble	.L13	@cond_branch
	mov	r4, #0x0
	mov	r5, #0x0
	b	.L28
.L16:
	.align	2, 0
.L15:
	.4byte	0xfffffc02
.L13:
	add	r1, r5, #0
	add	r0, r4, #0
	bl	sub_80679E0
	add	r5, r1, #0
	add	r4, r0, #0
	b	.L28
.L12:
	ldr	r0, .L20
	cmp	r2, r0
	ble	.L18	@cond_branch
.L7:
	ldr	r6, .L20 + 4
	mov	r4, #0x0
	mov	r5, #0x0
	b	.L19
.L21:
	.align	2, 0
.L20:
	.4byte	0x3ff
	.4byte	0x7ff
.L18:
	ldr	r0, .L26
	add	r6, r2, r0
	mov	r0, #0xff
	add	r1, r4, #0
	and	r1, r1, r0
	mov	r2, #0x0
	cmp	r1, #0x80
	bne	.L23	@cond_branch
	cmp	r2, #0
	bne	.L23	@cond_branch
	add	r0, r0, #0x1
	add	r1, r4, #0
	and	r1, r1, r0
	add	r0, r2, #0
	orr	r0, r0, r1
	cmp	r0, #0
	beq	.L24	@cond_branch
	mov	r0, #0x80
	mov	r1, #0x0
	b	.L25
.L27:
	.align	2, 0
.L26:
	.4byte	0x3ff
.L23:
	mov	r0, #0x7f
	mov	r1, #0x0
.L25:
	add	r4, r4, r0
	ADC	r5, r1
.L24:
	ldr	r0, .L29
	cmp	r5, r0
	bls	.L28	@cond_branch
	lsl	r3, r5, #0x1f
	lsr	r2, r4, #0x1
	add	r0, r3, #0
	orr	r0, r0, r2
	lsr	r1, r5, #0x1
	add	r5, r1, #0
	add	r4, r0, #0
	add	r6, r6, #0x1
.L28:
	lsl	r3, r5, #0x18
	lsr	r2, r4, #0x8
	add	r0, r3, #0
	orr	r0, r0, r2
	lsr	r1, r5, #0x8
.L3:
	add	r5, r1, #0
	add	r4, r0, #0
.L19:
	str	r4, [sp]
	ldr	r2, .L29 + 4
	and	r2, r2, r5
	ldr	r0, [sp, #0x4]
	ldr	r1, .L29 + 8
	and	r0, r0, r1
	orr	r0, r0, r2
	str	r0, [sp, #0x4]
	mov	r2, sp
	ldr	r1, .L29 + 12
	add	r0, r1, #0
	and	r6, r6, r0
	lsl	r1, r6, #0x4
	ldr	r0, .L29 + 16
	ldrh	r3, [r2, #0x6]
	and	r0, r0, r3
	orr	r0, r0, r1
	strh	r0, [r2, #0x6]
	lsl	r1, r7, #0x7
	mov	r0, #0x7f
	ldrb	r3, [r2, #0x7]
	and	r0, r0, r3
	orr	r0, r0, r1
	strb	r0, [r2, #0x7]
	ldr	r1, [sp]
	ldr	r0, [sp, #0x4]
	str	r0, [sp]
	str	r1, [sp, #0x4]
	ldr	r0, [sp]
	ldr	r1, [sp, #0x4]
	add	sp, sp, #0x8
	pop	{r4, r5, r6, r7, pc}
.L30:
	.align	2, 0
.L29:
	.4byte	0x1fffffff
	.4byte	0xfffff
	.4byte	0xfff00000
	.4byte	0x7ff
	.4byte	0xffff800f
	thumb_func_end sub_8066C44

.align 2, 0 @ Don't pad with nop.
