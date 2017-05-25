	.include "asm/common.inc"

	thumb_func_start sub_80663B0
sub_80663B0:
	push	{r4, lr}
	add	r3, r1, #0
	ldr	r0, [r0]
	lsl	r1, r0, #0x9
	lsr	r2, r1, #0x9
	lsl	r1, r0, #0x1
	lsr	r1, r1, #0x18
	lsr	r0, r0, #0x1f
	str	r0, [r3, #0x4]
	cmp	r1, #0
	bne	.L1	@cond_branch
	cmp	r2, #0
	bne	.L2	@cond_branch
	mov	r0, #0x2
	str	r0, [r3]
	b	.L13
.L2:
	add	r4, r1, #0
	sub	r4, r4, #0x7e
	str	r4, [r3, #0x8]
	lsl	r2, r2, #0x7
	mov	r0, #0x3
	str	r0, [r3]
	ldr	r1, .L7
	cmp	r2, r1
	bhi	.L6	@cond_branch
	add	r0, r4, #0
.L5:
	lsl	r2, r2, #0x1
	sub	r0, r0, #0x1
	cmp	r2, r1
	bls	.L5	@cond_branch
	str	r0, [r3, #0x8]
	b	.L6
.L8:
	.align	2, 0
.L7:
	.4byte	0x3fffffff
.L1:
	cmp	r1, #0xff
	bne	.L9	@cond_branch
	cmp	r2, #0
	bne	.L10	@cond_branch
	mov	r0, #0x4
	str	r0, [r3]
	b	.L13
.L10:
	mov	r0, #0x80
	lsl	r0, r0, #0xd
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L12	@cond_branch
	mov	r0, #0x1
.L12:
	str	r0, [r3]
.L6:
	str	r2, [r3, #0xc]
	b	.L13
.L9:
	add	r0, r1, #0
	sub	r0, r0, #0x7f
	str	r0, [r3, #0x8]
	mov	r0, #0x3
	str	r0, [r3]
	lsl	r0, r2, #0x7
	mov	r1, #0x80
	lsl	r1, r1, #0x17
	orr	r0, r0, r1
	str	r0, [r3, #0xc]
.L13:
	pop	{r4, pc}
	thumb_func_end sub_80663B0

.align 2, 0 @ Don't pad with nop.
