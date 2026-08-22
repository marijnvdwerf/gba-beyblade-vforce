	.include "asm/common.inc"

	thumb_func_start sub_80490F8
sub_80490F8:
	push	{r4, r5, lr}
	add	r5, r0, #0
	ldr	r4, .L8049154
	ldr	r1, [r4]
	cmp	r1, r5
	beq	.L804914C	@cond_branch
	ldr	r0, [r4, #0x4]
	cmp	r0, r5
	beq	.L804914C	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	beq	.L8049126	@cond_branch
	mov	r0, #0x3
	bl	sub_8049344
	mov	r0, #0x3
	mov	r1, #0x1
	bl	sub_80490CC
	ldr	r1, .L8049154 + 4
	mov	r0, #0x1
	strb	r0, [r1]
.L8049126:
	add	r2, r4, #0
	add	r2, r2, #0x7c
	ldrb	r0, [r2]
	add	r1, r0, #0
	cmp	r1, #0xe
	bhi	.L8049146	@cond_branch
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
.L8049146:
	str	r5, [r4, #0x4]
	bl	sub_80495C4
.L804914C:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L8049152:
	.align	2, 0
.L8049154:
	.4byte	_unk3000650
	.4byte	_unk3000BFC
	thumb_func_end sub_80490F8

.align 2, 0 @ Don't pad with nop.
