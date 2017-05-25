	.include "asm/common.inc"

	thumb_func_start sub_8066B14
sub_8066B14:
	push	{lr}
	add	sp, sp, #0xfffffff0
	add	r1, r0, #0
	mov	r0, #0x3
	str	r0, [sp]
	lsr	r2, r1, #0x1f
	str	r2, [sp, #0x4]
	cmp	r1, #0
	bne	.L1	@cond_branch
	mov	r0, #0x2
	str	r0, [sp]
	b	.L9
.L1:
	mov	r0, #0x1e
	str	r0, [sp, #0x8]
	cmp	r2, #0
	beq	.L3	@cond_branch
	mov	r0, #0x80
	lsl	r0, r0, #0x18
	cmp	r1, r0
	bne	.L4	@cond_branch
	ldr	r0, .L6
	b	.L5
.L7:
	.align	2, 0
.L6:
	.4byte	0xcf000000
.L4:
	NEG	r0, r1
	str	r0, [sp, #0xc]
	b	.L8
.L3:
	str	r1, [sp, #0xc]
.L8:
	ldr	r2, [sp, #0xc]
	ldr	r3, .L11
	cmp	r2, r3
	bhi	.L9	@cond_branch
	ldr	r1, [sp, #0x8]
.L10:
	lsl	r0, r2, #0x1
	sub	r1, r1, #0x1
	add	r2, r0, #0
	cmp	r0, r3
	bls	.L10	@cond_branch
	str	r1, [sp, #0x8]
	str	r0, [sp, #0xc]
.L9:
	mov	r0, sp
	bl	sub_80662F8
.L5:
	add	sp, sp, #0x10
	pop	{pc}
.L12:
	.align	2, 0
.L11:
	.4byte	0x3fffffff
	thumb_func_end sub_8066B14

.align 2, 0 @ Don't pad with nop.
