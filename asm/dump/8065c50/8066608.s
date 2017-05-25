	.include "asm/common.inc"

	thumb_func_start sub_8066608
sub_8066608:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xffffffc8
	str	r0, [sp, #0x30]
	str	r1, [sp, #0x34]
	add	r0, sp, #0x30
	mov	r1, sp
	bl	sub_80663B0
	add	r0, sp, #0x34
	add	r4, sp, #0x10
	add	r1, r4, #0
	bl	sub_80663B0
	mov	r7, sp
	add	r0, sp, #0x20
	mov	r8, r0
	mov	r0, #0x0
	ldr	r1, [sp]
	mov	r9, r8
	cmp	r1, #0x1
	bhi	.L1	@cond_branch
	mov	r0, #0x1
.L1:
	cmp	r0, #0
	bne	.L10	@cond_branch
	mov	r2, #0x0
	ldr	r0, [sp, #0x10]
	cmp	r0, #0x1
	bhi	.L3	@cond_branch
	mov	r2, #0x1
.L3:
	cmp	r2, #0
	beq	.L4	@cond_branch
	ldr	r0, [sp, #0x4]
	b	.L5
.L4:
	mov	r2, #0x0
	cmp	r1, #0x4
	bne	.L6	@cond_branch
	mov	r2, #0x1
.L6:
	cmp	r2, #0
	beq	.L7	@cond_branch
	mov	r1, #0x0
	cmp	r0, #0x2
	bne	.L8	@cond_branch
	mov	r1, #0x1
.L8:
	cmp	r1, #0
	bne	.L9	@cond_branch
	b	.L10
.L7:
	mov	r2, #0x0
	cmp	r0, #0x4
	bne	.L11	@cond_branch
	mov	r2, #0x1
.L11:
	cmp	r2, #0
	beq	.L12	@cond_branch
	mov	r0, #0x0
	cmp	r1, #0x2
	bne	.L13	@cond_branch
	mov	r0, #0x1
.L13:
	cmp	r0, #0
	beq	.L14	@cond_branch
.L9:
	ldr	r0, .L16
	b	.L23
.L17:
	.align	2, 0
.L16:
	.4byte	0x3000db8
.L12:
	mov	r2, #0x0
	cmp	r1, #0x2
	bne	.L18	@cond_branch
	mov	r2, #0x1
.L18:
	cmp	r2, #0
	beq	.L19	@cond_branch
.L10:
	ldr	r0, [sp, #0x4]
	ldr	r1, [sp, #0x14]
	EOR	r0, r1
	NEG	r1, r0
	orr	r1, r1, r0
	lsr	r1, r1, #0x1f
	str	r1, [sp, #0x4]
	mov	r0, sp
	b	.L23
.L19:
	mov	r1, #0x0
	cmp	r0, #0x2
	bne	.L21	@cond_branch
	mov	r1, #0x1
.L21:
	cmp	r1, #0
	beq	.L22	@cond_branch
.L14:
	ldr	r0, [r7, #0x4]
.L5:
	ldr	r1, [sp, #0x14]
	EOR	r0, r1
	NEG	r1, r0
	orr	r1, r1, r0
	lsr	r1, r1, #0x1f
	str	r1, [sp, #0x14]
	add	r0, r4, #0
	b	.L23
.L22:
	ldr	r0, [r7, #0xc]
	mov	r1, #0x0
	ldr	r2, [sp, #0x1c]
	mov	r3, #0x0
	bl	sub_8066150
	add	r2, r1, #0
	add	r5, r2, #0
	add	r6, r0, #0
	ldr	r4, [r7, #0x8]
	ldr	r0, [sp, #0x18]
	add	r4, r4, r0
	str	r4, [sp, #0x28]
	ldr	r1, [r7, #0x4]
	ldr	r0, [sp, #0x14]
	EOR	r1, r0
	NEG	r0, r1
	orr	r0, r0, r1
	lsr	r0, r0, #0x1f
	str	r0, [sp, #0x24]
	add	r4, r4, #0x2
	str	r4, [sp, #0x28]
	cmp	r2, #0
	bge	.L24	@cond_branch
	mov	r2, #0x1
	mov	r1, #0x80
	lsl	r1, r1, #0x18
.L26:
	add	r4, r4, #0x1
	add	r0, r5, #0
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L25	@cond_branch
	lsr	r6, r6, #0x1
	orr	r6, r6, r1
.L25:
	lsr	r5, r5, #0x1
	cmp	r5, #0
	blt	.L26	@cond_branch
	str	r4, [sp, #0x28]
.L24:
	ldr	r0, .L33
	cmp	r5, r0
	bhi	.L27	@cond_branch
	mov	r4, #0x80
	lsl	r4, r4, #0x18
	mov	r3, #0x1
	add	r2, r0, #0
	ldr	r1, [sp, #0x28]
.L29:
	sub	r1, r1, #0x1
	lsl	r5, r5, #0x1
	add	r0, r6, #0
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L28	@cond_branch
	orr	r5, r5, r3
.L28:
	lsl	r6, r6, #0x1
	cmp	r5, r2
	bls	.L29	@cond_branch
	str	r1, [sp, #0x28]
.L27:
	mov	r0, #0x7f
	and	r0, r0, r5
	cmp	r0, #0x40
	bne	.L32	@cond_branch
	mov	r0, #0x80
	and	r0, r0, r5
	cmp	r0, #0
	bne	.L31	@cond_branch
	cmp	r6, #0
	beq	.L32	@cond_branch
.L31:
	add	r5, r5, #0x40
.L32:
	str	r5, [sp, #0x2c]
	mov	r0, #0x3
	mov	r1, r8
	str	r0, [r1]
	mov	r0, r9
.L23:
	bl	sub_80662F8
	add	sp, sp, #0x38
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7, pc}
.L34:
	.align	2, 0
.L33:
	.4byte	0x3fffffff
	thumb_func_end sub_8066608

.align 2, 0 @ Don't pad with nop.
