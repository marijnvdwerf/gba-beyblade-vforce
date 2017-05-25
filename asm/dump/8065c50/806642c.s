	.include "asm/common.inc"

	thumb_func_start sub_806642C
sub_806642C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r6, r0, #0
	add	r7, r1, #0
	add	r5, r2, #0
	mov	r0, #0x0
	ldr	r2, [r6]
	cmp	r2, #0x1
	bhi	.L1	@cond_branch
	mov	r0, #0x1
.L1:
	cmp	r0, #0
	beq	.L2	@cond_branch
.L19:
	add	r0, r6, #0
	b	.L23
.L2:
	mov	r1, #0x0
	ldr	r0, [r7]
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
	ldr	r1, [r6, #0x4]
	ldr	r0, [r7, #0x4]
	cmp	r1, r0
	beq	.L19	@cond_branch
	ldr	r0, .L12
	b	.L23
.L13:
	.align	2, 0
.L12:
	.4byte	0x3000db8
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
	add	r1, r5, #0
	add	r0, r6, #0
	ldmia	r0!, {r2, r3, r4}
	stmia	r1!, {r2, r3, r4}
	ldr	r0, [r0]
	str	r0, [r1]
	ldr	r0, [r6, #0x4]
	ldr	r1, [r7, #0x4]
	and	r0, r0, r1
	str	r0, [r5, #0x4]
	b	.L43
.L17:
	mov	r1, #0x0
	ldr	r0, [r6]
	cmp	r0, #0x2
	bne	.L21	@cond_branch
	mov	r1, #0x1
.L21:
	cmp	r1, #0
	beq	.L22	@cond_branch
.L15:
	add	r0, r7, #0
	b	.L23
.L22:
	ldr	r1, [r6, #0x8]
	ldr	r3, [r7, #0x8]
	ldr	r2, [r6, #0xc]
	ldr	r4, [r7, #0xc]
	sub	r0, r1, r3
	cmp	r0, #0
	bge	.L24	@cond_branch
	NEG	r0, r0
.L24:
	cmp	r0, #0x1f
	bgt	.L25	@cond_branch
	ldr	r6, [r6, #0x4]
	ldr	r7, [r7, #0x4]
	mov	r8, r7
	cmp	r1, r3
	ble	.L26	@cond_branch
	mov	r7, #0x1
	mov	ip, r7
	sub	r3, r1, r3
.L27:
	sub	r3, r3, #0x1
	add	r0, r4, #0
	mov	r7, ip
	and	r0, r0, r7
	lsr	r4, r4, #0x1
	orr	r4, r4, r0
	cmp	r3, #0
	bne	.L27	@cond_branch
	add	r3, r1, #0
.L26:
	cmp	r3, r1
	ble	.L30	@cond_branch
	mov	r0, #0x1
	mov	ip, r0
	sub	r1, r3, r1
.L29:
	sub	r1, r1, #0x1
	add	r0, r2, #0
	mov	r7, ip
	and	r0, r0, r7
	lsr	r2, r2, #0x1
	orr	r2, r2, r0
	cmp	r1, #0
	bne	.L29	@cond_branch
	add	r1, r3, #0
	b	.L30
.L25:
	cmp	r1, r3
	ble	.L31	@cond_branch
	mov	r4, #0x0
	b	.L32
.L31:
	add	r1, r3, #0
	mov	r2, #0x0
.L32:
	ldr	r6, [r6, #0x4]
	ldr	r7, [r7, #0x4]
	mov	r8, r7
.L30:
	cmp	r6, r8
	beq	.L33	@cond_branch
	cmp	r6, #0
	beq	.L34	@cond_branch
	sub	r3, r4, r2
	b	.L35
.L34:
	sub	r3, r2, r4
.L35:
	cmp	r3, #0
	blt	.L36	@cond_branch
	mov	r0, #0x0
	str	r0, [r5, #0x4]
	str	r1, [r5, #0x8]
	str	r3, [r5, #0xc]
	b	.L37
.L36:
	mov	r0, #0x1
	str	r0, [r5, #0x4]
	str	r1, [r5, #0x8]
	NEG	r0, r3
	str	r0, [r5, #0xc]
.L37:
	ldr	r1, [r5, #0xc]
	sub	r0, r1, #1
	ldr	r2, .L41
	cmp	r0, r2
	bhi	.L40	@cond_branch
.L39:
	lsl	r0, r1, #0x1
	str	r0, [r5, #0xc]
	ldr	r1, [r5, #0x8]
	sub	r1, r1, #0x1
	str	r1, [r5, #0x8]
	add	r1, r0, #0
	sub	r0, r1, #1
	cmp	r0, r2
	bls	.L39	@cond_branch
	b	.L40
.L42:
	.align	2, 0
.L41:
	.4byte	0x3ffffffe
.L33:
	str	r6, [r5, #0x4]
	str	r1, [r5, #0x8]
	add	r0, r2, r4
	str	r0, [r5, #0xc]
.L40:
	mov	r0, #0x3
	str	r0, [r5]
	ldr	r1, [r5, #0xc]
	cmp	r1, #0
	bge	.L43	@cond_branch
	mov	r0, #0x1
	and	r0, r0, r1
	lsr	r1, r1, #0x1
	orr	r0, r0, r1
	str	r0, [r5, #0xc]
	ldr	r0, [r5, #0x8]
	add	r0, r0, #0x1
	str	r0, [r5, #0x8]
.L43:
	add	r0, r5, #0
.L23:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7, pc}
	thumb_func_end sub_806642C

.align 2, 0 @ Don't pad with nop.
