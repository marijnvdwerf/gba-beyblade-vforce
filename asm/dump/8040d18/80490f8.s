	.include "asm/common.inc"

	thumb_func_start sub_80490F8
sub_80490F8:
	push	{r4, r5, lr}
	add	r5, r0, #0
	ldr	r4, .L5
	ldr	r1, [r4]
	cmp	r1, r5
	beq	.L2	@cond_branch
	ldr	r0, [r4, #0x4]
	cmp	r0, r5
	beq	.L2	@cond_branch
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	beq	.L3	@cond_branch
	mov	r0, #0x3
	bl	sub_8049344
	mov	r0, #0x3
	mov	r1, #0x1
	bl	sub_80490CC
	ldr	r1, .L5 + 4
	mov	r0, #0x1
	strb	r0, [r1]
.L3:
	add	r2, r4, #0
	add	r2, r2, #0x7c
	ldrb	r0, [r2]
	add	r1, r0, #0
	cmp	r1, #0xe
	bhi	.L4	@cond_branch
	add	r0, r0, #0x1
	strb	r0, [r2]
	lsl	r0, r1, #0x2
	add	r1, r4, #0
	add	r1, r1, #0x14
	add	r0, r0, r1
	ldr	r1, [r4, #0x4]
	str	r1, [r0]
	ldr	r0, [r4]
	str	r0, [r4, #0x8]
.L4:
	str	r5, [r4, #0x4]
	bl	sub_80495C4
.L2:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L6:
	.align	2, 0
.L5:
	.4byte	0x3000650
	.4byte	0x3000bfc
	thumb_func_end sub_80490F8

.align 2, 0 @ Don't pad with nop.
