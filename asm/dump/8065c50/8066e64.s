	.include "asm/common.inc"

	thumb_func_start sub_8066E64
sub_8066E64:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff4
	add	r3, r0, #0
	add	r4, r1, #0
	mov	sl, r2
	mov	r0, #0x0
	ldr	r2, [r3]
	cmp	r2, #0x1
	bhi	.L1	@cond_branch
	mov	r0, #0x1
.L1:
	cmp	r0, #0
	beq	.L2	@cond_branch
.L19:
	add	r0, r3, #0
	b	.L23
.L2:
	mov	r1, #0x0
	ldr	r0, [r4]
	cmp	r0, #0x1
	bhi	.L4	@cond_branch
	mov	r1, #0x1
.L4:
	cmp	r1, #0
	bne	.L15	@cond_branch
	mov	r1, #0x0
	cmp	r2, #0x4
	bne	.L6	@cond_branch
	mov	r1, #0x1
.L6:
	cmp	r1, #0
	beq	.L7	@cond_branch
	mov	r1, #0x0
	cmp	r0, #0x4
	bne	.L8	@cond_branch
	mov	r1, #0x1
.L8:
	cmp	r1, #0
	beq	.L19	@cond_branch
	ldr	r1, [r3, #0x4]
	ldr	r0, [r4, #0x4]
	cmp	r1, r0
	beq	.L19	@cond_branch
	ldr	r0, .L12
	b	.L23
.L13:
	.align	2, 0
.L12:
	.4byte	0x3000dc8
.L7:
	mov	r1, #0x0
	cmp	r0, #0x4
	bne	.L14	@cond_branch
	mov	r1, #0x1
.L14:
	cmp	r1, #0
	bne	.L15	@cond_branch
	mov	r1, #0x0
	cmp	r0, #0x2
	bne	.L16	@cond_branch
	mov	r1, #0x1
.L16:
	cmp	r1, #0
	beq	.L17	@cond_branch
	mov	r0, #0x0
	cmp	r2, #0x2
	bne	.L18	@cond_branch
	mov	r0, #0x1
.L18:
	cmp	r0, #0
	beq	.L19	@cond_branch
	mov	r1, sl
	add	r0, r3, #0
	ldmia	r0!, {r2, r5, r6}
	stmia	r1!, {r2, r5, r6}
	ldmia	r0!, {r2, r5}
	stmia	r1!, {r2, r5}
	ldr	r0, [r3, #0x4]
	ldr	r1, [r4, #0x4]
	and	r0, r0, r1
	mov	r6, sl
	str	r0, [r6, #0x4]
	b	.L44
.L17:
	mov	r1, #0x0
	ldr	r0, [r3]
	cmp	r0, #0x2
	bne	.L21	@cond_branch
	mov	r1, #0x1
.L21:
	cmp	r1, #0
	beq	.L22	@cond_branch
.L15:
	add	r0, r4, #0
	b	.L23
.L22:
	ldr	r0, [r3, #0x8]
	mov	r9, r0
	ldr	r1, [r4, #0x8]
	mov	r8, r1
	ldr	r6, [r3, #0xc]
	ldr	r7, [r3, #0x10]
	ldr	r0, [r4, #0xc]
	ldr	r1, [r4, #0x10]
	str	r0, [sp]
	str	r1, [sp, #0x4]
	mov	r1, r9
	mov	r2, r8
	sub	r0, r1, r2
	cmp	r0, #0
	bge	.L24	@cond_branch
	NEG	r0, r0
.L24:
	cmp	r0, #0x3f
	bgt	.L25	@cond_branch
	ldr	r3, [r3, #0x4]
	mov	ip, r3
	ldr	r4, [r4, #0x4]
	str	r4, [sp, #0x8]
	cmp	r9, r8
	ble	.L26	@cond_branch
	mov	r3, r9
	mov	r4, r8
	sub	r3, r3, r4
	mov	r8, r3
.L27:
	mov	r5, #0x1
	NEG	r5, r5
	ADD r8, r5
	ldr	r2, [sp]
	mov	r0, #0x1
	and	r2, r2, r0
	mov	r3, #0x0
	ldr	r1, [sp, #0x4]
	lsl	r5, r1, #0x1f
	ldr	r0, [sp]
	lsr	r4, r0, #0x1
	add	r0, r5, #0
	orr	r0, r0, r4
	add	r4, r1, #0
	lsr	r1, r4, #0x1
	add	r5, r2, #0
	orr	r5, r5, r0
	str	r5, [sp]
	add	r4, r3, #0
	orr	r4, r4, r1
	str	r4, [sp, #0x4]
	mov	r5, r8
	cmp	r5, #0
	bne	.L27	@cond_branch
	mov	r8, r9
.L26:
	cmp	r8, r9
	ble	.L30	@cond_branch
	mov	r0, r8
	mov	r1, r9
	sub	r0, r0, r1
	mov	r9, r0
.L29:
	mov	r2, #0x1
	NEG	r2, r2
	ADD r9, r2
	mov	r2, #0x1
	and	r2, r2, r6
	mov	r3, #0x0
	lsl	r5, r7, #0x1f
	lsr	r4, r6, #0x1
	add	r0, r5, #0
	orr	r0, r0, r4
	lsr	r1, r7, #0x1
	add	r6, r2, #0
	orr	r6, r6, r0
	add	r7, r3, #0
	orr	r7, r7, r1
	mov	r3, r9
	cmp	r3, #0
	bne	.L29	@cond_branch
	mov	r9, r8
	b	.L30
.L25:
	cmp	r9, r8
	ble	.L31	@cond_branch
	mov	r0, #0x0
	mov	r1, #0x0
	str	r0, [sp]
	str	r1, [sp, #0x4]
	b	.L32
.L31:
	mov	r9, r8
	mov	r6, #0x0
	mov	r7, #0x0
.L32:
	ldr	r3, [r3, #0x4]
	mov	ip, r3
	ldr	r4, [r4, #0x4]
	str	r4, [sp, #0x8]
.L30:
	ldr	r1, [sp, #0x8]
	cmp	ip, r1
	beq	.L33	@cond_branch
	mov	r2, ip
	cmp	r2, #0
	beq	.L34	@cond_branch
	add	r1, r7, #0
	add	r0, r6, #0
	bl	sub_8067A14
	add	r3, r1, #0
	add	r2, r0, #0
	ldr	r4, [sp]
	ldr	r5, [sp, #0x4]
	add	r2, r2, r4
	ADC	r3, r5
	b	.L35
.L34:
	add	r3, r7, #0
	add	r2, r6, #0
	ldr	r0, [sp]
	ldr	r1, [sp, #0x4]
	sub	r2, r2, r0
	SBC	r3, r1
.L35:
	cmp	r3, #0
	blt	.L36	@cond_branch
	mov	r0, #0x0
	mov	r1, sl
	str	r0, [r1, #0x4]
	mov	r4, r9
	str	r4, [r1, #0x8]
	mov	r5, sl
	str	r2, [r5, #0xc]
	str	r3, [r5, #0x10]
	b	.L37
.L36:
	mov	r0, #0x1
	mov	r6, sl
	str	r0, [r6, #0x4]
	mov	r0, r9
	str	r0, [r6, #0x8]
	add	r1, r3, #0
	add	r0, r2, #0
	bl	sub_8067A14
	mov	r2, sl
	str	r0, [r2, #0xc]
	str	r1, [r2, #0x10]
.L37:
	mov	r4, sl
	ldr	r2, [r4, #0xc]
	ldr	r3, [r4, #0x10]
	mov	r0, #0x1
	NEG	r0, r0
	asr	r1, r0, #0x1f
.L41:
	add	r2, r2, r0
	ADC	r3, r1
	ldr	r0, .L42
	cmp	r3, r0
	bhi	.L40	@cond_branch
	cmp	r3, r0
	bne	.L39	@cond_branch
	mov	r0, #0x2
	NEG	r0, r0
	cmp	r2, r0
	bhi	.L40	@cond_branch
.L39:
	mov	r5, sl
	ldr	r0, [r5, #0xc]
	ldr	r1, [r5, #0x10]
	lsr	r3, r0, #0x1f
	lsl	r2, r1, #0x1
	add	r1, r3, #0
	orr	r1, r1, r2
	lsl	r0, r0, #0x1
	mov	r6, sl
	str	r0, [r6, #0xc]
	str	r1, [r6, #0x10]
	ldr	r2, [r6, #0x8]
	sub	r2, r2, #0x1
	str	r2, [r6, #0x8]
	mov	r2, #0x1
	NEG	r2, r2
	asr	r3, r2, #0x1f
	b	.L41
.L43:
	.align	2, 0
.L42:
	.4byte	0xfffffff
.L33:
	mov	r0, ip
	mov	r1, sl
	str	r0, [r1, #0x4]
	mov	r2, r9
	str	r2, [r1, #0x8]
	ldr	r3, [sp]
	ldr	r4, [sp, #0x4]
	add	r6, r6, r3
	ADC	r7, r4
	mov	r4, sl
	str	r6, [r4, #0xc]
	str	r7, [r4, #0x10]
.L40:
	mov	r0, #0x3
	mov	r5, sl
	str	r0, [r5]
	ldr	r1, [r5, #0x10]
	ldr	r0, .L45
	cmp	r1, r0
	bls	.L44	@cond_branch
	ldr	r4, [r5, #0xc]
	ldr	r5, [r5, #0x10]
	mov	r2, #0x1
	add	r0, r4, #0
	and	r0, r0, r2
	mov	r1, #0x0
	lsl	r6, r5, #0x1f
	mov	r8, r6
	lsr	r6, r4, #0x1
	mov	r2, r8
	orr	r2, r2, r6
	lsr	r3, r5, #0x1
	orr	r0, r0, r2
	orr	r1, r1, r3
	mov	r2, sl
	str	r0, [r2, #0xc]
	str	r1, [r2, #0x10]
	ldr	r0, [r2, #0x8]
	add	r0, r0, #0x1
	str	r0, [r2, #0x8]
.L44:
	mov	r0, sl
.L23:
	add	sp, sp, #0xc
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7, pc}
.L46:
	.align	2, 0
.L45:
	.4byte	0x1fffffff
	thumb_func_end sub_8066E64

.align 2, 0 @ Don't pad with nop.
