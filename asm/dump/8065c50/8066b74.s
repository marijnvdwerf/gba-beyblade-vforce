	.include "asm/common.inc"

	thumb_func_start sub_8066B74
sub_8066B74:
	push	{lr}
	add	sp, sp, #0xffffffec
	str	r0, [sp, #0x10]
	add	r0, sp, #0x10
	mov	r1, sp
	bl	sub_80663B0
	mov	r1, #0x0
	ldr	r0, [sp]
	cmp	r0, #0x2
	bne	.L1	@cond_branch
	mov	r1, #0x1
.L1:
	cmp	r1, #0
	bne	.L4	@cond_branch
	mov	r1, #0x0
	cmp	r0, #0x1
	bhi	.L3	@cond_branch
	mov	r1, #0x1
.L3:
	cmp	r1, #0
	bne	.L4	@cond_branch
	mov	r1, #0x0
	cmp	r0, #0x4
	bne	.L5	@cond_branch
	mov	r1, #0x1
.L5:
	cmp	r1, #0
	beq	.L6	@cond_branch
.L13:
	ldr	r0, [sp, #0x4]
	ldr	r1, .L9
	cmp	r0, #0
	beq	.L14	@cond_branch
	add	r1, r1, #0x1
	b	.L14
.L10:
	.align	2, 0
.L9:
	.4byte	0x7fffffff
.L6:
	ldr	r1, [sp, #0x8]
	cmp	r1, #0
	bge	.L11	@cond_branch
.L4:
	mov	r0, #0x0
	b	.L12
.L11:
	cmp	r1, #0x1e
	bgt	.L13	@cond_branch
	mov	r0, #0x1e
	sub	r0, r0, r1
	ldr	r1, [sp, #0xc]
	LSR	r1, r0
	ldr	r0, [sp, #0x4]
	cmp	r0, #0
	beq	.L14	@cond_branch
	NEG	r1, r1
.L14:
	add	r0, r1, #0
.L12:
	add	sp, sp, #0x14
	pop	{pc}
	thumb_func_end sub_8066B74

.align 2, 0 @ Don't pad with nop.
