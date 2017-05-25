	.include "asm/common.inc"

	thumb_func_start sub_806785C
sub_806785C:
	push	{r4, r5, lr}
	add	sp, sp, #0xffffffec
	add	r2, r0, #0
	mov	r0, #0x3
	str	r0, [sp]
	lsr	r1, r2, #0x1f
	str	r1, [sp, #0x4]
	cmp	r2, #0
	bne	.L1	@cond_branch
	mov	r0, #0x2
	str	r0, [sp]
	b	.L9
.L1:
	mov	r0, #0x3c
	str	r0, [sp, #0x8]
	cmp	r1, #0
	beq	.L3	@cond_branch
	mov	r0, #0x80
	lsl	r0, r0, #0x18
	cmp	r2, r0
	bne	.L4	@cond_branch
	ldr	r1, .L6 + 4
	ldr	r0, .L6
	b	.L5
.L7:
	.align	2, 0
.L6:
	.4byte	0xc1e00000
	.4byte	0x0
.L4:
	NEG	r0, r2
	asr	r1, r0, #0x1f
	b	.L8
.L3:
	add	r0, r2, #0
	asr	r1, r2, #0x1f
.L8:
	str	r0, [sp, #0xc]
	str	r1, [sp, #0x10]
	ldr	r0, [sp, #0x10]
	ldr	r1, .L11
	cmp	r0, r1
	bhi	.L9	@cond_branch
	add	r5, r1, #0
	ldr	r4, [sp, #0x8]
.L10:
	ldr	r0, [sp, #0xc]
	ldr	r1, [sp, #0x10]
	lsr	r3, r0, #0x1f
	lsl	r2, r1, #0x1
	add	r1, r3, #0
	orr	r1, r1, r2
	lsl	r0, r0, #0x1
	str	r0, [sp, #0xc]
	str	r1, [sp, #0x10]
	sub	r4, r4, #0x1
	ldr	r0, [sp, #0x10]
	cmp	r0, r5
	bls	.L10	@cond_branch
	str	r4, [sp, #0x8]
.L9:
	mov	r0, sp
	bl	sub_8066C44
.L5:
	add	sp, sp, #0x14
	pop	{r4, r5, pc}
.L12:
	.align	2, 0
.L11:
	.4byte	0xfffffff
	thumb_func_end sub_806785C

.align 2, 0 @ Don't pad with nop.
