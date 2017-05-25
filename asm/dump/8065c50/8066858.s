	.include "asm/common.inc"

	thumb_func_start sub_8066858
sub_8066858:
	push	{r4, lr}
	add	r4, r0, #0
	mov	r0, #0x0
	ldr	r2, [r4]
	cmp	r2, #0x1
	bhi	.L1	@cond_branch
	mov	r0, #0x1
.L1:
	cmp	r0, #0
	bne	.L2	@cond_branch
	mov	r0, #0x0
	ldr	r3, [r1]
	cmp	r3, #0x1
	bhi	.L3	@cond_branch
	mov	r0, #0x1
.L3:
	cmp	r0, #0
	beq	.L4	@cond_branch
.L2:
	mov	r0, #0x1
	b	.L33
.L4:
	mov	r0, #0x0
	cmp	r2, #0x4
	bne	.L6	@cond_branch
	mov	r0, #0x1
.L6:
	cmp	r0, #0
	beq	.L9	@cond_branch
	mov	r0, #0x0
	cmp	r3, #0x4
	bne	.L8	@cond_branch
	mov	r0, #0x1
.L8:
	cmp	r0, #0
	beq	.L9	@cond_branch
	ldr	r0, [r1, #0x4]
	ldr	r1, [r4, #0x4]
	sub	r0, r0, r1
	b	.L33
.L9:
	mov	r2, #0x0
	ldr	r0, [r4]
	cmp	r0, #0x4
	bne	.L11	@cond_branch
	mov	r2, #0x1
.L11:
	cmp	r2, #0
	bne	.L12	@cond_branch
	mov	r2, #0x0
	cmp	r3, #0x4
	bne	.L13	@cond_branch
	mov	r2, #0x1
.L13:
	cmp	r2, #0
	beq	.L14	@cond_branch
.L22:
	ldr	r0, [r1, #0x4]
	mov	r1, #0x1
	NEG	r1, r1
	cmp	r0, #0
	beq	.L25	@cond_branch
	mov	r1, #0x1
	b	.L25
.L14:
	mov	r2, #0x0
	cmp	r0, #0x2
	bne	.L17	@cond_branch
	mov	r2, #0x1
.L17:
	cmp	r2, #0
	beq	.L18	@cond_branch
	mov	r2, #0x0
	cmp	r3, #0x2
	bne	.L19	@cond_branch
	mov	r2, #0x1
.L19:
	cmp	r2, #0
	bne	.L20	@cond_branch
.L18:
	mov	r2, #0x0
	cmp	r0, #0x2
	bne	.L21	@cond_branch
	mov	r2, #0x1
.L21:
	cmp	r2, #0
	bne	.L22	@cond_branch
	mov	r0, #0x0
	cmp	r3, #0x2
	bne	.L23	@cond_branch
	mov	r0, #0x1
.L23:
	cmp	r0, #0
	beq	.L24	@cond_branch
.L12:
	ldr	r0, [r4, #0x4]
	mov	r1, #0x1
	cmp	r0, #0
	beq	.L25	@cond_branch
	sub	r1, r1, #0x2
.L25:
	add	r0, r1, #0
	b	.L33
.L24:
	ldr	r3, [r4, #0x4]
	ldr	r0, [r1, #0x4]
	cmp	r3, r0
	beq	.L27	@cond_branch
.L34:
	mov	r0, #0x1
	cmp	r3, #0
	beq	.L33	@cond_branch
	sub	r0, r0, #0x2
	b	.L33
.L27:
	ldr	r2, [r4, #0x8]
	ldr	r0, [r1, #0x8]
	cmp	r2, r0
	bgt	.L34	@cond_branch
	cmp	r2, r0
	bge	.L31	@cond_branch
.L35:
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r3, #0
	beq	.L33	@cond_branch
	mov	r0, #0x1
	b	.L33
.L31:
	ldr	r0, [r4, #0xc]
	ldr	r1, [r1, #0xc]
	cmp	r0, r1
	bhi	.L34	@cond_branch
	cmp	r0, r1
	bcc	.L35	@cond_branch
.L20:
	mov	r0, #0x0
.L33:
	pop	{r4, pc}
	thumb_func_end sub_8066858

.align 2, 0 @ Don't pad with nop.
